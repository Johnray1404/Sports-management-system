const { CloudinaryStorage } = require("multer-storage-cloudinary");
const multer = require("multer");
const cloudinary = require("./cloudinary"); // your cloudinary config

// Storage for event image
const eventStorage = new CloudinaryStorage({
  cloudinary,
  params: {
    folder: "adminEvents",
    allowed_formats: ["jpg", "jpeg", "png"],
    public_id: (req, file) => {
      return "event_" + Date.now(); // rename format
    },
  },
});

const eventUpload = multer({ storage: eventStorage });

// Storage for appointment form (PDF)
const appointmentStorage = new CloudinaryStorage({
  cloudinary,
  params: {
    folder: "adminAppointmentForms",
    allowed_formats: ["pdf"],
    public_id: (req, file) => {
      return "appointment_" + Date.now();
    },
  },
});

const appointmentUpload = multer({ storage: appointmentStorage });

// Combined upload
const combinedUpload = multer().fields([
  { name: "image", maxCount: 1 },
  { name: "appointmentForm", maxCount: 1 },
]);

module.exports = {
  eventUpload: eventUpload.single("image"),
  appointmentUpload: appointmentUpload.single("appointmentForm"),
  combinedUpload,
};
