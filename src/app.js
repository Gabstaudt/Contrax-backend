const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/uploads', express.static('src/uploads'));

// Rotas
const empresaRoutes = require('./routes/empresa.routes');
app.use('/empresas', empresaRoutes);

module.exports = app;
