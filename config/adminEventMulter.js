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

// Multer instances
const eventUpload = multer({ storage: eventStorage });
const appointmentUpload = multer({ storage: appointmentStorage });

// Combined uploader (use both storages)
const combinedUpload = (req, res, next) => {
  eventUpload.single("image")(req, res, function (err) {
    if (err) return next(err);
    appointmentUpload.single("appointmentForm")(req, res, function (err) {
      if (err) return next(err);
      next();
    });
  });
};

module.exports = {
  eventUpload: eventUpload.single("image"),
  appointmentUpload: appointmentUpload.single("appointmentForm"),
  combinedUpload,
};
