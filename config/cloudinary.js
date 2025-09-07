// config/cloudinary.js
require('dotenv').config();
const cloudinary = require('cloudinary').v2;
const { CloudinaryStorage } = require('multer-storage-cloudinary');
const multer = require('multer');

cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key:    process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
});

// Storage: automatically pick resource type (image/video/raw for pdf)
const storage = new CloudinaryStorage({
  cloudinary,
  params: async (req, file) => {
    const mime = file.mimetype || '';
    let resource_type = 'image';
    if (mime.startsWith('video/')) resource_type = 'video';
    else if (mime === 'application/pdf' || mime === 'application/x-pdf') resource_type = 'raw';

    return {
      folder: 'sports-management',
      resource_type,
      public_id: `${Date.now()}-${file.originalname.replace(/\.[^/.]+$/, '')}`,
    };
  }
});

// Multer upload middleware
const adminPostUpload = multer({
  storage,
  limits: { fileSize: 200 * 1024 * 1024 } // 200 MB max
});

module.exports = { cloudinary, adminPostUpload };
