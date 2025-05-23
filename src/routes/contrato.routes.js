const express = require('express');
const router = express.Router();
const Usuario = require('../models/usuario.model');

router.post('/', async (req, res) => {
  try {
    const novo = await Usuario.create(req.body);
    res.status(201).json(novo);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao criar usuário', detalhes: err.message });
  }
});

router.get('/', async (req, res) => {
  try {
    const lista = await Usuario.findAll();
    res.json(lista);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao listar usuários', detalhes: err.message });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const item = await Usuario.findByPk(req.params.id);
    if (!item) return res.status(404).json({ error: 'Usuário não encontrado' });
    res.json(item);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao buscar usuário', detalhes: err.message });
  }
});

router.put('/:id', async (req, res) => {
  try {
    const item = await Usuario.findByPk(req.params.id);
    if (!item) return res.status(404).json({ error: 'Usuário não encontrado' });
    await item.update(req.body);
    res.json(item);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao atualizar usuário', detalhes: err.message });
  }
});

router.delete('/:id', async (req, res) => {
  try {
    const item = await Usuario.findByPk(req.params.id);
    if (!item) return res.status(404).json({ error: 'Usuário não encontrado' });
    await item.destroy();
    res.status(204).send();
  } catch (err) {
    res.status(500).json({ error: 'Erro ao deletar usuário', detalhes: err.message });
  }
});

module.exports = router;
