const express = require('express');
const router = express.Router();
const Assinatura = require('../models/assinatura.model');

router.post('/', async (req, res) => {
  try {
    const nova = await Assinatura.create(req.body);
    res.status(201).json(nova);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao criar assinatura', detalhes: err.message });
  }
});

router.get('/', async (req, res) => {
  try {
    const lista = await Assinatura.findAll();
    res.json(lista);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao listar assinaturas', detalhes: err.message });
  }
});

module.exports = router;
