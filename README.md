# Contrax - Backend

API em Node.js para gerenciamento de contratos empresariais com upload de documentos, autenticação e controle de usuários.

_________________________________________________________________________________________________________________________________

# Requisitos
Node.js
MySQL Server (MySQL Workbench)

# Instalações e Confiurações
git clone https://github.com/Gabstaudt/Contrax-backend.git
cd contrax-backend

## Dependências
npm install

## Configurar o db
Crie um banco de dados no MySQL com o nome contrax e atualize no config/db.js

const sequelize = new Sequelize('contrax', 'usuario', 'senha', {
  host: 'localhost',
  dialect: 'mysql'
});

## Execução do backend
npm start

## Configurar a pasta de upload
Crie uma pasta "uploads" na raiz do projeto

## Rodar o front 
Abrir o index.html

## Variáveis de Ambiente
criar o arquivo .env

PORT=3000
DB_NAME=contrax
DB_USER=root
DB_PASSWORD= sua senha aqui
DB_HOST=localhost
DB_DIALECT=mysql
JWT_SECRET=chavealeatoria

