const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Empresa = require('./empresa.model');
const Usuario = require('./usuario.model');

const Contrato = sequelize.define('Contrato', {
  nome: {
    type: DataTypes.STRING,
    allowNull: false
  },
  data_criacao: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  data_vencimento: {
    type: DataTypes.DATE
  },
  valor: {
    type: DataTypes.DECIMAL(10, 2)
  },
  status: {
    type: DataTypes.STRING,
    defaultValue: 'ativo' // pode ser: ativo, vencido, cancelado, etc.
  },
  arquivo_path: {
    type: DataTypes.TEXT
  }
}, {
  tableName: 'contratos',
  timestamps: true
});

Empresa.hasMany(Contrato);
Contrato.belongsTo(Empresa);

Contrato.belongsTo(Usuario, { as: 'criado_por' });

module.exports = Contrato;
