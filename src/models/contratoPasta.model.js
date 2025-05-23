const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Contrato = require('./contrato.model');
const Pasta = require('./pasta.model');

const ContratoPasta = sequelize.define('ContratoPasta', {}, {
  tableName: 'contratos_pastas',
  timestamps: true
});

Contrato.belongsToMany(Pasta, { through: ContratoPasta });
Pasta.belongsToMany(Contrato, { through: ContratoPasta });

module.exports = ContratoPasta;
