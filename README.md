# Avaliação Sprint 3 - Programa de Bolsas Compass UOL / AWS e Univesp

Avaliação da terceira Sprint do Programa de bolsas Compass UOL para formação em machine learning para AWS.

***

## Objetivo 

Execução da API do projeto da [Sprint 2][sprint2] a partir de um containers Docker, dentro da AWS Cloud.

## Introdução:

O Projeto Sprint 3 compreende:

- A execução de uma API (conjunto de instruções e padrões de programação que servem para fornecer dados e informações relevantes de uma determinada aplicação), construída em NodeJS e Express a partir da aplicação da [Sprint-2](https://github.com/Compass-pb-aws-2023-Univesp/sprint-2-pb-aws-univesp);
- A criação de um container Docker (software usado para implantar aplicações dentro de containers virtuais) com a API;
- Sua disponibilização utilizando a AWS Cloud (provedor de soluções em nuvem com entrega sob demanda, oferecendo serviços integrados e otimizados) e sendo executada a partir do container gerado.


**Mas o que é e por quer utilizar o Docker para rodar a aplicação?**

Para o funcionamento de um aplicativo ou serviço em diferentes sistemas a melhor solução é a utilização das funcionalidades do Docker, e a razão é justamente devido ao seu propósito semelhante ao das maquinas virtuais porém com diferenças significativas,
pois o docker é capaz de oferecer aplicações a partir em containers, maior desempenho, e mais leve (pois ocupa menos espaço no armazenamento) e de rápida inicialização. 

**E por quer utilizar o docker na AWS Cloud?**

As vantagens de utilizar o Docker na AWS são diversas, e dentre elas está a facilidade de portabilidade pois o Docker permite o "empacotamento" da aplicação em containers podendo ser executável tanto em local quanto remotamente, em nuvem por exemplo. Isto torna mais fácil mover a aplicação para qualquer ambiente, simplificando seu gerenciamento. O Docker simplifica o gerenciamento de infraestrutura ao tratar cada container como uma unidade lógica, podendo ser gerenciada de acordo com o tipo de projeto, ou seja, pode-se facilmente atualizar, implantar ou remover containers de maneira consistente em toda sua infraestrutura. Em resumo o uso do Docker na AWS Cloud ajuda e simplifica todo o processo de construção, implementação e desenvolvimento de aplicativos.



## Descrição 

Projeto em desenvolvimento para exposição na web da [Sprint 2][sprint2] através do deploy de um container docker na AWS Cloud, a figura a seguir representa o fluxograma da infraestrutura proposta neste projeto:

<p align="center">
  <img src='https://user-images.githubusercontent.com/125395133/226207497-74f88742-5fe7-44e4-be5c-cee76300ceec.PNG' width='50%'>
</p>


## Passos para execução do projeto 

1. Conversão da aplicação HTML/JS (Validador de dados) desenvolvida nas Sprints anteriores numa API utilizando NodeJS e Express. O arquivo [package.json](https://github.com/Compass-pb-aws-2023-Univesp/sprint-3-pb-aws-univesp/blob/grupo-3/package.json), enquanto o arquivo principal da API é o [app.js](https://github.com/Compass-pb-aws-2023-Univesp/sprint-3-pb-aws-univesp/blob/grupo-3/scr/app.js), que carrega o index.html na rota "/";

2. Criação de uma imagem de container a partir das configurações do [Dockerfile](https://github.com/Compass-pb-aws-2023-Univesp/sprint-3-pb-aws-univesp/blob/grupo-3/Dockerfile)

3. Upload da imagem num repositório para imagens Docker (foram utilizadas duas alternativas, o repositório gratuito [Dockerhub](https://hub.docker.com/repository/docker/crobertocamilo/compass-aws-ml_sprint3-grupo3/general), e Amazon ECR, serviço da AWS para hospedar imagens);

4. Utilizando a infraestrutura da AWS, conforme detalhado a seguir.


## Ferramentas e Tecnologias Utilizadas

- Install Node.js incluso Node Package Manager
- Install Docker
- Install VS CODE (opcional)
- Projeto Sprint 2
- Acesso AWS Cloud (ECR, ECS)
- Conhecimento em Docker
- Conhecimento Node.JS
- Conhecimento JavaScript
- Conhecimento HTML


## Desenvolvimento - Método A: Deploy da API no Dockerhub e sua execução em instâncias EC2

A imagem da API foi hospedada num repositório do [**Dockerhub**](https://hub.docker.com/repository/docker/crobertocamilo/compass-aws-ml_sprint3-grupo3/general), que permite o deploy gratuito e público de imagens Docker. Desta forma, é possível realizar o download e execução de seu container simplesmente executando o comando **docker run** em qualquer máquina.

Para execução da aplicação em nuvem, é possível configurar um **instância EC2**, instalar o Docker e executar a aplicação. Estes passos podem ser feitos a partir deste [script](https://github.com/Compass-pb-aws-2023-Univesp/sprint-3-pb-aws-univesp/blob/grupo-3/files/script_ec2_dockerhub.sh), e uma vez que a máquina estiver online na AWS, a API já estará disponível em seu IP:9000

*Vantagens deste método:*
- implementação simples: a imagem pode ser baixada e executada de forma equivalente à qualquer imagem Docker;
- menor custo ao utilizar essencialmente só o serviço EC2.


## Desenvolvimento - Método B: Cluster ECS com deploy da API no ECR

A imagem Docker da API foi hospedada no serviço **ECR** da **AWS Cloud**. Um cluster **ECS** foi configurado para lançar instâncias **EC2** (máquinas virtuais) e executar a imagem da API.

O passo-a-passo do deploy da imagem da API, configuração acesso ao ECR, criação e configuração do cluster ECS é apresentado no [tutorial](https://github.com/Compass-pb-aws-2023-Univesp/sprint-3-pb-aws-univesp/blob/grupo-3/files/criacao_configuracao_cluster_ECS.pdf), disponibilizado neste repositório. Acesse a API: **http://44.202.222.131:9000/**

<p align="center">
<img src='/assets/tela_api.png' width='70%'>
</p>

*Vantagens deste método:*
- o serviço ECS garante a disponibilidade da aplicação, se a instância ficar indisponível, outra é automaticamente lançada;
- é possível configurar o aumento no número de máquinas oferecendo a aplicação (escalabilidade), para tratar picos de demanda;
- sigilo e segurança do código, pois está restrito ao ambiente da AWS Cloud.


## Dificuldades Encontradas ao longo do Projeto

Foram encontradas algumas dificuldades no processo de elaboração deste projeto/sprint. Algumas dificuldades vivenciadas por exemplo, foi a saída de um membro da equipe, familiaridade com a plataforma e criação de imagens no docker, documentação mais precisa no decorrer do projeto, naturalização com o sistema da amazon ECS, entre outras dificuldades não listadas.



## Equipe

| [<img src="https://avatars.githubusercontent.com/u/78061851?v=4" width=115><br><sub>Carlos Roberto</sub>](https://github.com/crobertocamilo) | [<img src="https://avatars.githubusercontent.com/u/81330043?v=4" width=115><br><sub>Bernardo Lima</sub>](https://github.com/belima93) | [<img src="https://avatars.githubusercontent.com/u/125395133?v=4" width=115><br><sub>Adila Mota</sub>](https://github.com/Adila02) |
| :---: | :---: | :---: |

Atribuições no projeto:

Todos participaram de todo o processo de desenvolvimento, mas o foco das atribuições foi:

- Adila: Elaboração do Readme e estudo sobre API e Docker
- Bernardo: Estudo e construção do cluster ECS, configurações de acesso e deploy no ECR (Método B)
- Carlos: Implementação da aplicação como API node, deploy no Dockerhub (Método A)


***

[sprint2]: <https://github.com/Compass-pb-aws-2023-Univesp/sprint-2-pb-aws-univesp/tree/main>

