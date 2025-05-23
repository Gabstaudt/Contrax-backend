const express = require('express');
const router = express.Router();
const Contrato = require('../models/contrato.model');
const upload = require('../config/multer'); // ajuste se necessário

// Criar contrato com upload de arquivo
router.post('/', upload.single('arquivo'), async (req, res) => {
  try {
    console.log('Body:', req.body);
    console.log('File:', req.file);
console.log('📥 req.body:', req.body);
console.log('📎 req.file:', req.file);

   const novoContrato = await Contrato.create({
  nome: req.body.nome,                       // ✅ campo certo
  data_criacao: req.body.data_criacao || new Date(),
  data_vencimento: req.body.data_vencimento,
  valor: req.body.valor,
  status: req.body.status,
  arquivo_path: req.file?.path || null,
  empresaId: 1,            // substituir com JWT depois
  criadoPorId: 6           // substituir com JWT depois
});


    res.status(201).json(novoContrato);
  } catch (err) {
    console.error('Erro ao criar contrato:', err);
    res.status(500).json({ mensagem: 'Erro ao criar contrato', detalhes: err.message });
  }
});

module.exports = router;
