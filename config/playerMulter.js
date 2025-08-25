const multer = require('multer');
const path = require('path');

// Define the storage configuration for PSA, waiver, and med_cert
const PSAStorage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/uploads/player_PSA'); // Save PSA files in this folder
    },
    filename: (req, file, cb) => {
        const fileExtension = path.extname(file.originalname); // Get the file extension
        const fileName = `${Date.now()}${fileExtension}`; // Use timestamp as filename
        cb(null, fileName);
    }
});

const waiverStorage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/uploads/player_waiver'); // Save waiver files in this folder
    },
    filename: (req, file, cb) => {
        const fileExtension = path.extname(file.originalname);
        const fileName = `${Date.now()}${fileExtension}`;
        cb(null, fileName);
    }
});

const medCertStorage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/uploads/player_medCert'); // Save medCert files in this folder
    },
    filename: (req, file, cb) => {
        const fileExtension = path.extname(file.originalname);
        const fileName = `${Date.now()}${fileExtension}`;
        cb(null, fileName);
    }
});

// Define file filter (allowing images and PDFs)
const fileFilter = (req, file, cb) => {
    const allowedTypes = /jpeg|jpg|png|pdf/;  // Accepting image and pdf files
    const mimeType = allowedTypes.test(file.mimetype);
    if (mimeType) {
        cb(null, true);
    } else {
        cb(new Error('Only image and PDF files are allowed'), false);
    }
};

// Multer setup for each field (PSA, waiver, med_cert)
const uploadFiles = multer({
    fileFilter: fileFilter,
    limits: { fileSize: 10 * 1024 * 1024 },  // Limit the file size to 10 MB
}).fields([
    { name: 'PSA', maxCount: 1 },
    { name: 'waiver', maxCount: 1 },
    { name: 'med_cert', maxCount: 1 }
]);


//upload Profile
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/uploads/user_profiles/');
    },
    filename: (req, file, cb) => {
        const ext = path.extname(file.originalname);
        const filename = Date.now() + ext;
        cb(null, filename);
    }
});

const upload = multer({ storage: storage });

// Export the function to handle all file uploads
module.exports = { uploadFiles, upload };
