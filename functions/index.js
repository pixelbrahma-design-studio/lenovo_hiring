const nodemailer = require("nodemailer");
const moment = require("moment");
const functions = require("firebase-functions/v1");
const {initializeApp} = require("firebase-admin/app");
const admin = require("firebase-admin");

// Initialize Firebase Admin
initializeApp();

const db = admin.firestore();

// Configure the SMTP transporter
const transporter = nodemailer.createTransport({
  host: "smtp.mailgun.org",
  port: 587,
  auth: {
    user: "noreply@tempdevdomain.com",
    pass: "57ff8a3f2e1d9e4fc197b46e4b182e0d-0920befd-8f7ed429",
  },
});

// Cloud Function to handle new user registration
exports.sendWelcomeEmail = functions.auth.user().onCreate(async (user) => {
  const email = user.email;

  try {
    const quizDoc =
        await db.collection("quiz").doc("7YDrBZLqzmksArc7xmhe").get();
    if (!quizDoc.exists) {
      console.error("Quiz document not found!");
      return;
    }

    const {quizDate, startTime, endTime} = quizDoc.data();

    const formattedDate = moment(quizDate.toDate()).format("MMMM Do YYYY");
    const formattedStartTime = moment(startTime.toDate()).format("hh:mm A");
    const formattedEndTime = moment(endTime.toDate()).format("hh:mm A");

    const message = `
      Quiz will start at ${formattedStartTime} and
      end at ${formattedEndTime} on ${formattedDate}.
      Visit the quiz platform here: https://lenovo-hiring.web.app/#/login
    `;

    const mailOptions = {
      from: "'Lenovo Hiring Quiz' <noreply@tempdevdomain.com>",
      to: email,
      subject: "Welcome to Lenovo Hiring Quiz!",
      text: message,
    };

    await transporter.sendMail(mailOptions);
    console.log(`Welcome email sent to ${email}`);
  } catch (error) {
    console.error("Error sending welcome email:", error.message);
    console.error(error.stack);
  }
});
