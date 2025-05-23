const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Contrato = require('./contrato.model');

const IntegracaoAssinatura = sequelize.define('IntegracaoAssinatura', {
  plataforma: { type: DataTypes.STRING },
  id_externo: { type: DataTypes.STRING },
  status: { type: DataTypes.STRING }
}, {
  tableName: 'integracoes_assinatura',
  timestamps: true
});

Contrato.hasOne(IntegracaoAssinatura);
IntegracaoAssinatura.belongsTo(Contrato);

module.exports = IntegracaoAssinatura;
