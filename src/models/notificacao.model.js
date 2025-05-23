const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Usuario = require('./usuario.model');
const Contrato = require('./contrato.model');

const Notificacao = sequelize.define('Notificacao', {
  mensagem: { type: DataTypes.TEXT },
  tipo: { type: DataTypes.STRING },
  visualizado: { type: DataTypes.BOOLEAN, defaultValue: false },
  data: { type: DataTypes.DATE, defaultValue: DataTypes.NOW }
}, {
  tableName: 'notificacoes',
  timestamps: true
});

Usuario.hasMany(Notificacao);
Contrato.hasMany(Notificacao);
Notificacao.belongsTo(Usuario);
Notificacao.belongsTo(Contrato);

module.exports = Notificacao;
