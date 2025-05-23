const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Contrato = require('./contrato.model');

const Clausula = sequelize.define('Clausula', {
  conteudo: { type: DataTypes.TEXT },
  tipo: { type: DataTypes.STRING }
}, {
  tableName: 'clausulas',
  timestamps: true
});

Contrato.hasMany(Clausula);
Clausula.belongsTo(Contrato);

module.exports = Clausula;
