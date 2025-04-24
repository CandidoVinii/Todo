# Projeto Ruby on Rails

Este documento explica como configurar, instalar e executar este projeto Ruby on Rails, incluindo como executar testes e iniciar o servidor de desenvolvimento.

## Requisitos do Sistema

Antes de começar, certifique-se de ter instalado:

* Ruby (recomendado 3.2.0 ou superior)
* Rails (recomendado 7.0.0 ou superior)
* Node.js (14.0.0 ou superior)
* Yarn ou npm
* PostgreSQL (ou o banco de dados configurado para seu projeto)

## Instalação

### 1. Clone o repositório

```bash
git clone git@github.com:CandidoVinii/Todo.git
cd seu-projeto
```

Ou acesse o manager atraves do link: [text](https://todo-u3wc.onrender.com)

### 2. Instale as dependências

```bash
# Instale as gems do Ruby
bundle install

# Instale as dependências do JavaScript
yarn install
# OU
npm install
```

### 3. Configure o banco de dados

```bash
# Crie o banco de dados
rails db:create

# Execute as migrações
rails db:migrate

```

### 4. Configure as variáveis de ambiente

Copie o arquivo de exemplo de variáveis de ambiente:

```bash
cp .env.example .env
```

Edite o arquivo `.env` com suas configurações locais.

## Executando com Docker Compose

Este projeto inclui configuração para Docker Compose, o que facilita a execução em qualquer ambiente.

### Pré-requisitos para Docker

* Docker (versão 20.10 ou superior)
* Docker Compose (versão 2.0 ou superior)

### Variáveis de ambiente para Docker

Crie um arquivo `.env` na raiz do projeto com o seguinte conteúdo:

```
RAILS_ENV=development
DB_NAME_DEV=todo_development
DB_USER_DEV=todolist
DB_PASSWORD_DEV=123456
DB_HOST_DEV=db
RAILS_MASTER_KEY=sua-master-key-aqui
```

### Construir e iniciar os containers

```bash
# Construir as imagens
docker-compose build

# Iniciar os serviços em segundo plano
docker-compose up -d

# Ver logs
docker-compose logs -f
```

### Executar comandos Rails no container

```bash
# Criar o banco de dados
docker-compose exec web rails db:create

# Executar migrações
docker-compose exec web rails db:migrate

# Executar seeds
docker-compose exec web rails db:seed

# Executar console Rails
docker-compose exec web rails console

# Executar testes
docker-compose exec web rails test
```

### Parar os containers

```bash
docker-compose down
```

### Remover volumes (dados do banco)

```bash
docker-compose down -v
```

## Executando o Servidor Localmente

Para iniciar o servidor de desenvolvimento:

```bash
# Versão básica
rails server
# OU versão abreviada
rails s
```

Por padrão, o servidor Rails será executado em http://localhost:3000

Para especificar uma porta diferente:

```bash
rails s -p 4000
```

## Executando Testes

Este projeto utiliza o framework de teste padrão do Rails.

### Executando todos os testes

```bash
rails test
```

### Executando testes específicos

```bash
# Executar testes
rails test

```

### Executando testes com output detalhado

```bash
rails test -v
```

## Comandos Rails Úteis

```bash
# Console do Rails
rails console
# OU versão abreviada
rails c

# Informações das rotas
rails routes

# Verificar o status das migrações
rails db:migrate:status

# Reverter a última migração
rails db:rollback
```

## Solução de Problemas Comuns

### Erro ao iniciar o servidor

Se você encontrar erros ao iniciar o servidor, tente:

```bash
# Limpar arquivos temporários
rails tmp:clear

# Atualizar dependências do bundle
bundle update

# Verificar versões incompatíveis
bundle exec rails about
```

### Problemas com o banco de dados

Se você encontrar erros relacionados ao banco de dados:

```bash
# Destruir banco de dados e recriar
rails db:drop db:create db:migrate

# Reiniciar ID sequences (PostgreSQL)
rails db:reset
```

### Problemas com Docker

Se você encontrar problemas com o Docker:

```bash
# Reiniciar os containers
docker-compose restart

# Reconstruir a imagem do container web
docker-compose build web

# Verificar logs de um serviço específico
docker-compose logs db
```