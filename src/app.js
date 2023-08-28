//Importa o Express framework
const express = require('express');
//Cria uma instância do express e a associa à constante chamada "app"
const app = express();
//Importa o módulo "path", que é utilizado para tratar caminhos de arquivos e diretórios
const path = require('path');

const PORT = 3000;

//Associa uma rota a um determinado caminho de pasta. Importante para o index.html conseguir requisitar os arquivos de que precisa
app.use('/assets', express.static(path.join(__dirname, '../assets')));
app.use('/src', express.static(path.join(__dirname, '../src')));

//Inicia o servidor e faz com que ele esteja escutando na porta definida na constante PORT
app.listen(PORT, function(){
    console.log(`API rodando na porta ${PORT}`);
});

//Define que a rota "/" deve retornar o arquivo index.html
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '.', '../index.html'));
});