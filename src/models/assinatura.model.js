const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Contrato = require('./contrato.model');
const Usuario = require('./usuario.model');

const Assinatura = sequelize.define('Assinatura', {
  data_assinatura: { type: DataTypes.DATE },
  assinatura_digital: { type: DataTypes.TEXT }
}, {
  tableName: 'assinaturas',
  timestamps: true
});

Contrato.hasMany(Assinatura);
Usuario.hasMany(Assinatura);
Assinatura.belongsTo(Contrato);
Assinatura.belongsTo(Usuario);

module.exports = Assinatura;
