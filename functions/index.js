const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.sendNotification = functions.https.onCall(async (data, context) => {
  const { token, title, body } = data;

  if (!token || !title || !body) {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "Missing required fields: token, title, body"
    );
  }

  const message = {
    notification: {
      title: title,
      body: body,
    },
    token: token,
  };

  try {
    const response = await admin.messaging().send(message);
    return { success: true, response: response };
  } catch (error) {
    console.error("Error sending notification:", error);
    throw new functions.https.HttpsError(
      "internal",
      "Failed to send notification"
    );
  }
});