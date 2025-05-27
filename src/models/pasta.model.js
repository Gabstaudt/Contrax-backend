const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Empresa = require('./empresa.model');
const Contrato = require('./contrato.model');

const Pasta = sequelize.define('Pasta', {
  titulo: { type: DataTypes.STRING, allowNull: false },
  descricao: { type: DataTypes.STRING }
}, {
  tableName: 'pastas',
  timestamps: true
});


Pasta.hasMany(Contrato, { as: 'contratos', foreignKey: 'pastaId' });
Contrato.belongsTo(Pasta, { as: 'pasta', foreignKey: 'pastaId' });




module.exports = Pasta;
