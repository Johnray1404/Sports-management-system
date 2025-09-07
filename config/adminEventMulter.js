const { CloudinaryStorage } = require("multer-storage-cloudinary");
const multer = require("multer");
const cloudinary = require("./cloudinary");

// Storage for event image
const eventStorage = new CloudinaryStorage({
  cloudinary,
  params: {
    folder: "adminEvents",
    allowed_formats: ["jpg", "jpeg", "png"],
    public_id: () => "event_" + Date.now(),
  },
});

// Storage for appointment form (PDF)
const appointmentStorage = new CloudinaryStorage({
  cloudinary,
  params: {
    folder: "adminAppointmentForms",
    allowed_formats: ["pdf"],
    public_id: () => "appointment_" + Date.now(),
  },
});

// Create two multer instances
const eventUpload = multer({ storage: eventStorage });
const appointmentUpload = multer({ storage: appointmentStorage });

// ✅ Combined uploader with fields (use `.fields`)
const combinedUpload = multer({
  storage: new CloudinaryStorage({
    cloudinary,
    params: async (req, file) => {
      if (file.fieldname === "image") {
        return {
          folder: "adminEvents",
          allowed_formats: ["jpg", "jpeg", "png"],
          public_id: "event_" + Date.now(),
        };
      }
      if (file.fieldname === "appointmentForm") {
        return {
          folder: "adminAppointmentForms",
          allowed_formats: ["pdf"],
          public_id: "appointment_" + Date.now(),
        };
      }
      return null;
    },
  }),
}).fields([
  { name: "image", maxCount: 1 },
  { name: "appointmentForm", maxCount: 1 },
]);

module.exports = {
  eventUpload,
  appointmentUpload,
  combinedUpload,
};
