const express = require('express');
const router = express.Router();
const Usuario = require('../models/usuario.model');

// Criar usuário
router.post('/', async (req, res) => {
  try {
    const novo = await Usuario.create(req.body);
    res.status(201).json(novo);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao criar', detalhes: err.message });
  }
});

// Listar todos
router.get('/', async (req, res) => {
  try {
    const lista = await Usuario.findAll();
    res.status(200).json(lista);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao listar', detalhes: err.message });
  }
});

// Buscar por ID
router.get('/:id', async (req, res) => {
  try {
    const item = await Usuario.findByPk(req.params.id);
    if (!item) return res.status(404).json({ error: 'Não encontrado' });
    res.json(item);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao buscar', detalhes: err.message });
  }
});

// Atualizar
router.put('/:id', async (req, res) => {
  try {
    const item = await Usuario.findByPk(req.params.id);
    if (!item) return res.status(404).json({ error: 'Não encontrado' });

    await item.update(req.body);
    res.json(item);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao atualizar', detalhes: err.message });
  }
});

// Deletar
router.delete('/:id', async (req, res) => {
  try {
    const item = await Usuario.findByPk(req.params.id);
    if (!item) return res.status(404).json({ error: 'Não encontrado' });

    await item.destroy();
    res.status(204).send();
  } catch (err) {
    res.status(500).json({ error: 'Erro ao deletar', detalhes: err.message });
  }
});

module.exports = router;
