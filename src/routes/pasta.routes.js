const express = require('express');
const router = express.Router();
const Pasta = require('../models/pasta.model');
const Contrato = require('../models/contrato.model');
const sequelize = require('../config/db'); 


router.post('/', async (req, res) => {
  try {
    const nova = await Pasta.create(req.body);
    res.status(201).json(nova);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao criar pasta', detalhes: err.message });
  }
});


router.get('/', async (req, res) => {
  try {
    const pastas = await Pasta.findAll({
      include: [{
        model: Contrato,
        through: { attributes: [] }
      }]
    });

    const resultado = pastas.map(pasta => {
      const contratos = pasta.Contratos || [];
      const totalContratos = contratos.length;
      const ativos = contratos.filter(c => c.status === 'ativo').length;
      const aVencer = contratos.filter(c => {
        const hoje = new Date();
        const vencimento = new Date(c.data_vencimento);
        const diasRestantes = Math.ceil((vencimento - hoje) / (1000 * 60 * 60 * 24));
        return diasRestantes > 0 && diasRestantes <= 5;
      }).length;
      const vencidos = contratos.filter(c => {
        const hoje = new Date();
        const vencimento = new Date(c.data_vencimento);
        return vencimento < hoje;
      }).length;

      return {
        id: pasta.id,
        titulo: pasta.titulo,
        descricao: pasta.descricao,
        totalContratos,
        ativos,
        aVencer,
        vencidos
      };
    });

    res.json(resultado);
  } catch (err) {
    console.error('Erro ao listar pastas:', err);
    res.status(500).json({ error: 'Erro ao listar pastas', detalhes: err.message });
  }
});

router.put('/:id', async (req, res) => {
  try {
    const item = await Pasta.findByPk(req.params.id);
    if (!item) return res.status(404).json({ error: 'Pasta não encontrada' });
    await item.update(req.body);
    res.json(item);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao atualizar pasta', detalhes: err.message });
  }
});

router.delete('/:id', async (req, res) => {
  try {
    const item = await Pasta.findByPk(req.params.id);
    if (!item) return res.status(404).json({ error: 'Pasta não encontrada' });
    await item.destroy();
    res.status(204).send();
  } catch (err) {
    res.status(500).json({ error: 'Erro ao deletar pasta', detalhes: err.message });
  }
});

module.exports = router;
