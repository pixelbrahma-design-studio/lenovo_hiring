const moment = require("moment-timezone");
const functions = require("firebase-functions/v1");
const {initializeApp} = require("firebase-admin/app");
const admin = require("firebase-admin");
const Twilio = require("twilio");
require("dotenv").config();
const nodemailer = require("nodemailer");

// Initialize Firebase Admin
initializeApp();

const db = admin.firestore();

const client = new Twilio(
    process.env.TWILIO_ACCOUNT_SID,
    process.env.TWILIO_AUTH_TOKEN,
);

exports.sendWelcomeMessage = functions
    .runWith({timeoutSeconds: 540})
    .firestore
    .document("users/{userId}")
    .onCreate(async (snap, context) => {
      const userData = snap.data();
      const phoneNumber = userData.contactNumber;

      if (!phoneNumber) {
        console.error("Phone number not found in the user document!");
        return;
      }

      try {
        const message =
            `Welcome to Lenovo! We are excited to have you on board. Please check ${userData.email} and verify`;

        const formattedPhoneNumberForWhatsApp = `whatsapp:+91${phoneNumber}`;
        const formattedPhoneNumberForSMS = `+91${phoneNumber}`;

        // Send SMS message
        try {
          const sentSMSMessage = await client.messages.create({
            body: message,
            from: "+19785810811",
            to: formattedPhoneNumberForSMS,
          });

          console.log(
              `SMS sent to ${phoneNumber} (SID: ${sentSMSMessage.sid})`,
          );
        } catch (smsError) {
          console.error(`Error sending SMS: ${smsError.message}`);
        }

        // Send WhatsApp message
        try {
          const sentWhatsAppMessage = await client.messages.create({
            body: message,
            from: "whatsapp:+19785810811", // Twilio WhatsApp-enabled number
            to: formattedPhoneNumberForWhatsApp,
          });

          console.log(
              `WhatsApp message sent to ${phoneNumber} (SID: ${sentWhatsAppMessage.sid})`,
          );
        } catch (whatsAppError) {
          console.error(
              `Error sending WhatsApp message: ${whatsAppError.message}`,
          );
        }
      } catch (error) {
        console.error("Unexpected error occurred:", error.message);
        console.error(error.stack);
      }
    });

const transporter = nodemailer.createTransport({
  host: "smtp-relay.brevo.com",
  port: 587,
  auth: {
    user: process.env.BREVO_USER,
    pass: process.env.BREVO_PASS,
  },
});

// Cloud Function to handle user updates
exports.sendQuizDetails = functions
    .runWith({timeoutSeconds: 540})
    .firestore.document("users/{userId}")
    .onUpdate(async (change, context) => {
      const before = change.before.data();
      const after = change.after.data();

      // Check if emailVerified changed to true
      if (!before.emailVerified && after.emailVerified) {
        const email = after.email;
        const phoneNumber = after.contactNumber;

        try {
          // Fetch the latest quiz document based on createdAt
          const latestQuizSnapshot = await db
              .collection("quiz")
              .orderBy("createdAt", "desc") // Order by createdAt in descending order
              .limit(1) // Limit to the latest document
              .get();

          if (latestQuizSnapshot.empty) {
            console.error("No quiz document found!");
            return;
          }
          const quizDoc = latestQuizSnapshot.docs[0]; // Get the first document
          const {quizDate, startTime, endTime} = quizDoc.data();

          const formattedDate = moment(quizDate.toDate())
              .tz("Asia/Kolkata") // Set to the correct time zone
              .format("MMMM Do YYYY");

          const formattedStartTime = moment(startTime.toDate())
              .tz("Asia/Kolkata") // Set to the correct time zone
              .format("hh:mm A");

          const formattedEndTime = moment(endTime.toDate())
              .tz("Asia/Kolkata") // Set to the correct time zone
              .format("hh:mm A");

          // Email content
          const message = `Lenovo Quiz will start at ${formattedStartTime} and end at ${formattedEndTime} on ${formattedDate}. Visit the quiz here: https://lenovo-hiring.web.app/#/login`;

          const mailOptions = {
            from: "'Lenovo Hiring Quiz' <noreply@tempdevdomain.com>",
            to: email,
            subject: "Welcome to Lenovo Hiring Quiz!",
            text: message,
          };

          // Send email
          await transporter.sendMail(mailOptions);
          console.log(`Welcome email sent to ${email}`);
          // Send SMS
          if (phoneNumber) {
            const formattedPhoneNumberForSMS = `+91${phoneNumber}`;

            try {
              const smsResponse = await client.messages.create({
                body: message,
                from: "+19785810811", // Your Twilio number
                to: formattedPhoneNumberForSMS,
              });

              console.log(
                  `Quiz details SMS sent to ${phoneNumber} (SID: ${smsResponse.sid})`,
              );
            } catch (smsError) {
              console.error(`Error sending SMS: ${smsError.message}`);
            }
          } else {
            console.error("Phone number not found in the user document!");
          }
        } catch (error) {
          console.error("Error sending welcome email:", error.message);
          console.error(error.stack);
        }
      }
    });

// Cloud Function to handle user updates
exports.quizPublishMail = functions
    .runWith({timeoutSeconds: 540})
    .firestore.document("quiz/{quizId}")
    .onUpdate(async (change, context) => {
      const before = change.before.data();
      const after = change.after.data();

      // Check if isPublished changed to true
      if (!before.isPublished && after.isPublished) {
        try {
          // Fetch the latest quiz document based on createdAt
          const latestQuizSnapshot = await db
              .collection("quiz")
              .orderBy("createdAt", "desc") // Order by createdAt in descending order
              .limit(1) // Limit to the latest document
              .get();

          if (latestQuizSnapshot.empty) {
            console.error("No quiz document found!");
            return;
          }
          const quizDoc = latestQuizSnapshot.docs[0]; // Get the first document
          const {quizDate, startTime, endTime} = quizDoc.data();

          const formattedDate = moment(quizDate.toDate())
              .tz("Asia/Kolkata") // Set to the correct time zone
              .format("MMMM Do YYYY");

          const formattedStartTime = moment(startTime.toDate())
              .tz("Asia/Kolkata") // Set to the correct time zone
              .format("hh:mm A");

          const formattedEndTime = moment(endTime.toDate())
              .tz("Asia/Kolkata") // Set to the correct time zone
              .format("hh:mm A");

          const message = `Lenovo Quiz is live at ${formattedStartTime} and end at ${formattedEndTime} on ${formattedDate}. Visit the quiz here: https://lenovo-hiring.web.app/#/login`;

          // Fetch all users with role "user"
          const usersSnapshot = await db
              .collection("users")
              // .where("email", "==", "hareesh@pixelbrahma.com")
              .get();

          if (usersSnapshot.empty) {
            console.log("No users found with role 'user'.");
            return;
          }

          // Send email and SMS to each user
          const emailPromises = [];
          const smsPromises = [];

          usersSnapshot.forEach((doc) => {
            const {email, contactNumber} = doc.data();

            // Send email
            const mailOptions = {
              from: "'Lenovo Hiring Quiz' <noreply@tempdevdomain.com>",
              to: email,
              subject: "Welcome to Lenovo Hiring Quiz!",
              text: message,
            };

            emailPromises.push(
                transporter.sendMail(mailOptions)
                    .then(() => {
                      console.log(`Email sent to ${email}`);
                    })
                    .catch((error) => {
                      console.error(`Error sending email to ${email}:`, error.message);
                    }),
            );

            // Send SMS if phone number is available
            if (contactNumber) {
              const formattedPhoneNumberForSMS = `+91${contactNumber}`;

              smsPromises.push(
                  client.messages.create({
                    body: message,
                    from: "+19785810811", // Your Twilio number
                    to: formattedPhoneNumberForSMS,
                  })
                      .then((smsResponse) => {
                        console.log(
                            `SMS sent to ${contactNumber} (SID: ${smsResponse.sid})`,
                        );
                      })
                      .catch((smsError) => {
                        console.error(
                            `Error sending SMS to ${contactNumber}: ${smsError.message}`,
                        );
                      }),
              );
            } else {
              console.error(`Phone number not found for user: ${email}`);
            }
          });

          // Wait for all emails and SMS to be sent
          await Promise.all([...emailPromises, ...smsPromises]);
          console.log("All notifications sent.");
        } catch (error) {
          console.error("Error sending notifications:", error.message);
          console.error(error.stack);
        }
      }
    });
