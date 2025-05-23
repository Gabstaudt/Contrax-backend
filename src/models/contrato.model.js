const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Contrato = sequelize.define('Contrato', {
  nome: { type: DataTypes.STRING, allowNull: false },
  data_criacao: { type: DataTypes.DATE, defaultValue: DataTypes.NOW },
  data_vencimento: { type: DataTypes.DATE },
  valor: { type: DataTypes.DECIMAL(10, 2) },
  status: { type: DataTypes.STRING, defaultValue: 'ativo' },
  arquivo_path: { type: DataTypes.TEXT }
}, {
  tableName: 'contratos',
  timestamps: true
});

module.exports = Contrato;
