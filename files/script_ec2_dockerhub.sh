#!/bin/bash

####Instruções de uso####

#Se a instância já tiver sido iniciada, copie o arquivo para a máquina e execute como um script:
#   sudo chmod +x script_ec2_docker.sh
#   ./script_ec2_docker.sh

#Se a instância ainda será criada, copie o script para janela "Advanced details > User data" na interface de configuração da instância.
#Neste caso, o docker já estará disponível após a inicialização da máquina e já terá sido baixada e estará em execução.
#Basta acessar o serviço da API diretamente pelo ip:9000 !

#Atualiza os pacotes e instala o docker
sudo yum update
sudo yum install docker -y

#Inicaliza o serviço do docker
sudo service docker start

#Baixa a imagem da API e a executa num container, mapeando a porta 9000 da instância com a 3000 da API (porta padrão do NodeJS)
sudo docker run -d -p 9000:3000 crobertocamilo/compass-aws-ml_sprint3-grupo3:latest

#Adiciona o usuário atual ao grupo Docker para que não seja necessário utilizar o comando sudo para executar comandos do Docker
sudo usermod -aG docker $USER

