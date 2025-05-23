const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Contrato = require('./contrato.model');
const Usuario = require('./usuario.model');

const ContratoPartes = sequelize.define('ContratoPartes', {}, {
  tableName: 'contrato_partes',
  timestamps: false
});

Contrato.belongsToMany(Usuario, { through: ContratoPartes, as: 'partes' });
Usuario.belongsToMany(Contrato, { through: ContratoPartes, as: 'contratos_participando' });

module.exports = ContratoPartes;
