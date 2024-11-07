# Change Data Capture (CDC) com Debezium, PostgreSQL e GCP Pub/Sub

Este repositório demonstra a captura de dados em tempo real (CDC) a partir de um banco de dados PostgreSQL, utilizando o **Debezium**. As mudanças capturadas nas tabelas são publicadas em tópicos separados no **Google Pub/Sub**. Esse modelo de arquitetura possibilita a integração de sistemas de forma reativa, permitindo que outros sistemas recebam atualizações imediatas quando dados são modificados na base.

## 📝 Objetivo do Repositório

O objetivo deste repositório é:

- Demonstrar o uso do **Debezium** para captura automática de alterações no banco de dados PostgreSQL.
- Publicar os eventos de alterações em **tópicos separados no Google Pub/Sub**, organizados por tabela.
- Facilitar a integração entre sistemas desacoplados, garantindo a atualização de sistemas downstream quando alterações ocorrem na base de dados fonte.

As tabelas monitoradas neste exemplo são:
- **clientes**: Tabela com dados básicos dos clientes.
- **clientes_enderecos**: Tabela com informações de endereços dos clientes.

## 🚀 Inicialização do Projeto

### 1. Pré-requisitos

Para rodar essa POC, você precisará:

- **Docker** e **Docker Compose** instalados.
- Arquivo de credenciais de uma conta de serviço do **Google Cloud** com permissões para o Pub/Sub.
- **Tópicos no Pub/Sub** chamados `clientes-poc-cdc` e `clientes-enderecos-poc-cdc`, criados no projeto do Google Cloud.

### 2. Estrutura do Repositório

A estrutura básica do repositório é a seguinte:

```plaintext
.
├── docker-compose.yml        # Configuração do Docker Compose para PostgreSQL e Debezium
├── init.sql                  # Script SQL para criação das tabelas
├── conf/
│   ├── service-account.json # Credenciais de autenticação para o Google Pub/Sub
└── README.md                 # Documentação do projeto
```
### 3. Configurações Necessárias
1 - Altere a propriedade `debezium.sink.pubsub.project.id` do arquivo que está em `conf/application.properties`, informando o projeto no GCP;  
2 - Crie os tópicos: `clientes-enderecos-cdc` e `clientes-cdc` no Google Pub/sub do seu projeto;  

### 3. Executando

    docker-compose up -d

### 4.Melhorias
É possível criar vários debezium-server para monitorar outras tabelas, ou apenas as necessárias.