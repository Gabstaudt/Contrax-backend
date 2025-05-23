const express = require('express');
const router = express.Router();
const Notificacao = require('../models/notificacao.model');

router.post('/', async (req, res) => {
  try {
    const nova = await Notificacao.create(req.body);
    res.status(201).json(nova);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao criar notificação', detalhes: err.message });
  }
});

router.get('/', async (req, res) => {
  try {
    const lista = await Notificacao.findAll();
    res.json(lista);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao listar notificações', detalhes: err.message });
  }
});

module.exports = router;
