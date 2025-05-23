const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Empresa = require('./empresa.model');
const Usuario = require('./usuario.model');

const Contrato = sequelize.define('Contrato', {
  titulo: { type: DataTypes.STRING, allowNull: false },
  descricao: { type: DataTypes.TEXT },
  data_upload: { type: DataTypes.DATE, defaultValue: DataTypes.NOW },
  data_vencimento: { type: DataTypes.DATE },
  assinatura_status: { type: DataTypes.STRING },
  arquivo_path: { type: DataTypes.TEXT }
}, {
  tableName: 'contratos',
  timestamps: true
});

Empresa.hasMany(Contrato);
Contrato.belongsTo(Empresa);
Contrato.belongsTo(Usuario, { as: 'criado_por' });

module.exports = Contrato;
