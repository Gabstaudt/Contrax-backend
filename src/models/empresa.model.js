const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Empresa = sequelize.define('Empresa', {
  nome: { type: DataTypes.STRING, allowNull: false },
  cnpj: { type: DataTypes.STRING, allowNull: false },  
  email_admin_responsavel: { type: DataTypes.STRING }
}, {
  tableName: 'empresas',
  timestamps: true
});

module.exports = Empresa;
