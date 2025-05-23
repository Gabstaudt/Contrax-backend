const express = require('express');
const router = express.Router();
const Empresa = require('../models/empresa.model');

// criar empresa
router.post('/', async (req, res) => {
  try {
    const novaEmpresa = await Empresa.create(req.body);
    res.status(201).json(novaEmpresa);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao criar empresa', detalhes: error.message });
  }
});

// listar todas as empresas
router.get('/', async (req, res) => {
  try {
    const empresas = await Empresa.findAll();
    res.status(200).json(empresas);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao listar empresas', detalhes: error.message });
  }
});

module.exports = router;
