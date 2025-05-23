const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Empresa = require('./empresa.model');

const Pasta = sequelize.define('Pasta', {
  nome: { type: DataTypes.STRING }
}, {
  tableName: 'pastas',
  timestamps: true
});

Empresa.hasMany(Pasta);
Pasta.belongsTo(Empresa);

module.exports = Pasta;
