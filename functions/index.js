// const moment = require("moment");
const functions = require("firebase-functions/v1");
const {initializeApp} = require("firebase-admin/app");
// const admin = require("firebase-admin");
const Twilio = require("twilio");
require("dotenv").config();

// Initialize Firebase Admin
initializeApp();

// const db = admin.firestore();

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
            `Welcome to Lenovo! We are excited to have you on board.
            Please check ${userData.email} and verify`;

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
