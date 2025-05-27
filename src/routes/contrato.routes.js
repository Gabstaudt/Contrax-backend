const express = require('express');
const router = express.Router();
const Contrato = require('../models/contrato.model');
const upload = require('../config/multer'); // ajuste se necessário
const ContratoPasta = require('../models/contratoPasta.model');


// Criar contrato com upload de arquivo
router.post('/', upload.single('arquivo'), async (req, res) => {
  try {
    const novoContrato = await Contrato.create({
      nome: req.body.nome,
      data_criacao: req.body.data_criacao || new Date(),
      data_vencimento: req.body.data_vencimento,
      valor: req.body.valor,
      status: req.body.status,
      arquivo_path: req.file?.path || null,
      empresaId: 1,
      criadoPorId: 6
    });

    // 👇 Verificar se foi enviada a pasta para associar
    if (req.body.pasta) {
      await ContratoPasta.create({
        ContratoId: novoContrato.id,
        PastaId: req.body.pasta
      });
    }

    res.status(201).json(novoContrato);
  } catch (err) {
    console.error('Erro ao criar contrato:', err);
    res.status(500).json({ mensagem: 'Erro ao criar contrato', detalhes: err.message });
  }
});

// GET /contratos – listar todos os contratos
router.get('/', async (req, res) => {
  try {
    const contratos = await Contrato.findAll({
      include: ['partes'] // incluir usuários se tiver relação
    });
    res.json(contratos);
  } catch (err) {
    console.error('Erro ao listar contratos:', err);
    res.status(500).json({ mensagem: 'Erro ao buscar contratos', erro: err.message });
  }
});


module.exports = router;
