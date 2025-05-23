const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'src/uploads/');
  },
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    const name = path.basename(file.originalname, ext).replace(/\s/g, '_');
    cb(null, `${Date.now()}-${name}${ext}`);
  }
});

const upload = multer({ storage });
module.exports = upload;
