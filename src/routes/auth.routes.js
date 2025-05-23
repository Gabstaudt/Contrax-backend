const express = require('express');
const router = express.Router();
const Usuario = require('../models/usuario.model');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

router.post('/login', async (req, res) => {
  const { email, senha } = req.body;

  try {
    const usuario = await Usuario.findOne({ where: { email } });
    if (!usuario) return res.status(404).json({ mensagem: 'Usuário não encontrado.' });
console.log('Senha digitada:', senha);
console.log('Hash no banco:', usuario.senha_hash);

    const senhaCorreta = await bcrypt.compare(senha, usuario.senha_hash);
    if (!senhaCorreta) return res.status(401).json({ mensagem: 'Senha incorreta.' });

    const token = jwt.sign({ id: usuario.id, tipo: usuario.tipo }, process.env.JWT_SECRET, { expiresIn: '1h' });

    res.json({ token, usuario });
  } catch (err) {
    res.status(500).json({ mensagem: 'Erro ao fazer login.', erro: err.message });
  }
});

module.exports = router;
