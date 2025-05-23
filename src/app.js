const express = require('express');
const cors = require('cors');
const app = express();

// Middlewares
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/uploads', express.static('src/uploads'));

// Banco de dados
const sequelize = require('./config/db');

// Models (importa todos para garantir que relações sejam registradas)
require('./models/empresa.model');
require('./models/usuario.model');
require('./models/contrato.model');
require('./models/pasta.model');
require('./models/assinatura.model');
require('./models/clausula.model');
require('./models/notificacao.model');
require('./models/integracaoAssinatura.model');
require('./models/contratoPasta.model');

// Testar conexão + sincronizar tabelas
sequelize.authenticate()
  .then(() => console.log(' Conectado ao MySQL com sucesso!'))
  .then(() => sequelize.sync({ alter: true }))
  .then(() => console.log(' Tabelas sincronizadas com sucesso!'))
  .catch((err) => console.error(' Erro ao configurar o banco:', err));

// Rotas
app.use('/empresas', require('./routes/empresa.routes'));
app.use('/usuarios', require('./routes/usuario.routes'));
app.use('/contratos', require('./routes/contrato.routes'));
app.use('/pastas', require('./routes/pasta.routes'));
app.use('/assinaturas', require('./routes/assinatura.routes'));
app.use('/clausulas', require('./routes/clausula.routes'));
app.use('/notificacoes', require('./routes/notificacao.routes'));
app.use('/auth', require('./routes/auth.routes'));


module.exports = app;
