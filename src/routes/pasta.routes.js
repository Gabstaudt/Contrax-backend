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
      include: [
        {
          model: Contrato,
          as: 'contratos',
          attributes: []
        }
      ],
      attributes: {
        include: [
          [sequelize.fn('COUNT', sequelize.col('contratos.id')), 'contratoCount']
        ]
      },
      group: ['Pasta.id']
    });
    res.json(pastas);
  } catch (err) {
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
