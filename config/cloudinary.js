// config/cloudinary.js
require('dotenv').config();
const cloudinary = require('cloudinary').v2;
const { CloudinaryStorage } = require('multer-storage-cloudinary');
const multer = require('multer');

// 🔹 Cloudinary configuration
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key:    process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
});

/**
 * Default storage for general admin uploads (images, videos, pdfs)
 */
const storage = new CloudinaryStorage({
  cloudinary,
  params: async (req, file) => {
    const mime = file.mimetype || '';
    let resource_type = 'image';
    if (mime.startsWith('video/')) resource_type = 'video';
    else if (mime.includes('pdf')) resource_type = 'raw';

    return {
      folder: 'sports-management',
      resource_type,
      public_id: `${Date.now()}-${file.originalname.replace(/\.[^/.]+$/, '')}`,
    };
  }
});

// 🔹 Multer middleware for admin uploads
const adminPostUpload = multer({
  storage,
  limits: { fileSize: 200 * 1024 * 1024 } // 200 MB max
});

/**
 * Separate storage for Coach Certificates (jpg, png, pdf allowed)
 */
const coachCertificateStorage = new CloudinaryStorage({
  cloudinary,
  params: async (req, file) => {
    const mime = file.mimetype || '';
    let resource_type = 'image';
    if (mime.startsWith('video/')) resource_type = 'video';
    else if (mime.includes('pdf')) resource_type = 'raw';

    return {
      folder: 'coach_certificates',
      resource_type,
      public_id: `coach_${Date.now()}-${file.originalname.replace(/\.[^/.]+$/, '')}`,
    };
  }
});

// 🔹 Multer middleware for coach certificates
const coachCertificateUpload = multer({
  storage: coachCertificateStorage,
  limits: { fileSize: 20 * 1024 * 1024 } // 20 MB max
});

module.exports = { cloudinary, adminPostUpload, coachCertificateUpload };
