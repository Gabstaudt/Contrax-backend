const express = require('express');
const router = express.Router();
const Usuario = require('../models/usuario.model');
const bcrypt = require('bcryptjs');
const sequelize = require('../config/db');

// Sincroniza o banco de dados (recomendo rodar 1x e depois remover o sync)
// sequelize.sync({ alter: true })
//   .then(() => console.log('Banco sincronizado com sucesso'))
//   .catch(err => console.error('Erro ao sincronizar banco:', err));

// 📌 Criar usuário (com código da empresa e senha criptografada)
router.post('/', async (req, res) => {
  try {
    const { nome, email, senha, tipo, codigo } = req.body;

    // Verifica código da empresa
    if (codigo !== '13102003') {
      return res.status(400).json({ error: 'Código da empresa inválido' });
    }

    // Criptografar senha
    const senha_hash = await bcrypt.hash(senha, 10);

    // Cria o novo usuário
    const novoUsuario = await Usuario.create({ nome, email, senha_hash, tipo });

    res.status(201).json({
      mensagem: 'Usuário criado com sucesso',
      usuario: {
        id: novoUsuario.id,
        nome: novoUsuario.nome,
        email: novoUsuario.email,
        tipo: novoUsuario.tipo
      }
    });
  } catch (err) {
    console.error('Erro ao criar usuário:', err);
    res.status(500).json({ error: 'Erro ao criar usuário', detalhes: err.message });
  }
});

// 📌 Listar todos os usuários
router.get('/', async (req, res) => {
  try {
    const lista = await Usuario.findAll();
    res.status(200).json(lista);
  } catch (err) {
    console.error('Erro ao listar usuários:', err);
    res.status(500).json({ error: 'Erro ao listar', detalhes: err.message });
  }
});

// 📌 Buscar usuário por ID
router.get('/:id', async (req, res) => {
  try {
    const usuario = await Usuario.findByPk(req.params.id);
    if (!usuario) return res.status(404).json({ error: 'Usuário não encontrado' });
    res.json(usuario);
  } catch (err) {
    console.error('Erro ao buscar usuário:', err);
    res.status(500).json({ error: 'Erro ao buscar', detalhes: err.message });
  }
});

// 📌 Atualizar usuário por ID
router.put('/:id', async (req, res) => {
  try {
    const usuario = await Usuario.findByPk(req.params.id);
    if (!usuario) return res.status(404).json({ error: 'Usuário não encontrado' });

    await usuario.update(req.body);
    res.json({ mensagem: 'Usuário atualizado com sucesso', usuario });
  } catch (err) {
    console.error('Erro ao atualizar usuário:', err);
    res.status(500).json({ error: 'Erro ao atualizar', detalhes: err.message });
  }
});

// 📌 Deletar usuário por ID
router.delete('/:id', async (req, res) => {
  try {
    const usuario = await Usuario.findByPk(req.params.id);
    if (!usuario) return res.status(404).json({ error: 'Usuário não encontrado' });

    await usuario.destroy();
    res.status(204).send();
  } catch (err) {
    console.error('Erro ao deletar usuário:', err);
    res.status(500).json({ error: 'Erro ao deletar', detalhes: err.message });
  }
});

module.exports = router;
