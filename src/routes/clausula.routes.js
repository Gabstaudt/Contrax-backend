const express = require('express');
const router = express.Router();
const Clausula = require('../models/clausula.model');

router.post('/', async (req, res) => {
  try {
    const nova = await Clausula.create(req.body);
    res.status(201).json(nova);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao criar cláusula', detalhes: err.message });
  }
});

router.get('/', async (req, res) => {
  try {
    const lista = await Clausula.findAll();
    res.json(lista);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao listar cláusulas', detalhes: err.message });
  }
});

module.exports = router;
