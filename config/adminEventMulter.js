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

// Two separate multer instances
const eventUpload = multer({ storage: eventStorage });
const appointmentUpload = multer({ storage: appointmentStorage });

// ✅ Combined uploader with fields
const combinedUpload = (req, res, next) => {
  const uploadEvent = eventUpload.single("image");
  const uploadAppointment = appointmentUpload.single("appointmentForm");

  uploadEvent(req, res, function (err) {
    if (err) return next(err);

    uploadAppointment(req, res, function (err) {
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
