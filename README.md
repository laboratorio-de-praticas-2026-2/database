# Portal Contábil

O **Portal Contábil** é uma plataforma digital voltada à gestão contábil, fiscal e tributária de pessoas físicas e jurídicas.

A proposta é reunir, em um único ambiente, a consulta de obrigações, a solicitação de serviços e a comunicação entre clientes e o escritório de contabilidade.

Projeto acadêmico desenvolvido pelas turmas da **FATEC Registro**, no **Laboratório de Práticas 2026/2**.

> **Projeto em desenvolvimento.** Os recursos apresentados abaixo descrevem o escopo da plataforma e estão sendo implementados gradualmente.

---

## Funcionalidades

### Catálogo de serviços

Vitrine pública com informações sobre os serviços oferecidos pelo escritório, como:

* Abertura de empresa;
* Contabilidade mensal;
* Folha de pagamento;
* Declaração de Imposto de Renda.

### Portal do cliente

Cadastro de pessoas físicas e jurídicas, autenticação e acesso às solicitações, aos documentos e ao andamento dos serviços vinculados ao cliente.

### Obrigações fiscais

Consulta de guias, valores, vencimentos e situação das obrigações, incluindo:

* DAS;
* DARF;
* INSS;
* FGTS;
* Imposto de Renda.

As informações são apresentadas conforme os dados disponibilizados no sistema.

### Atendimento

Recursos destinados à comunicação entre clientes e o escritório, incluindo:

* Agendamento de reuniões;
* Informações de contato;
* Chat para atendimento.

### Painel administrativo

Gerenciamento de:

* Serviços;
* Descrições;
* Honorários;
* Anúncios;
* Perfis de usuários.

Os serviços ativos cadastrados no painel administrativo alimentam a vitrine pública da plataforma.

### Indicadores e relatórios

Dashboard com métricas relacionadas à operação, além de recursos como:

* Geração de relatórios;
* Geração de recibos em PDF;
* Simuladores de tributos;
* Simuladores de parcelamentos.

### Conteúdo e notificações

A plataforma também poderá disponibilizar:

* Blog;
* Perguntas frequentes;
* Mapa de parceiros;
* Alertas de vencimentos;
* Recomendações de serviços conforme o perfil do cliente.

---

## Arquitetura

A aplicação é organizada em repositórios separados:

| Componente     | Responsabilidade                             | Repositório |
| -------------- | -------------------------------------------- | ----------- |
| Frontend       | Interface web, navegação e consumo da API.   | `front-end` |
| Backend        | API, regras de negócio e controle de acesso. | `back-end`  |
| Banco de dados | Estrutura e configuração da persistência.    | `database`  |

O frontend se comunica com a API, que processa as requisições e realiza as operações no banco de dados.

A aplicação é dividida em três áreas principais:

* **Vitrine pública:** apresenta o catálogo de serviços;
* **Portal do cliente:** reúne informações individuais de cada cliente;
* **Painel administrativo:** permite gerenciar os dados e recursos da plataforma.

---

## Tecnologias

### Frontend

![Next.js](https://img.shields.io/badge/Next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white)

![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)

![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)

![Tailwind_CSS](https://img.shields.io/badge/Tailwind_CSS-0F172A?style=for-the-badge&logo=tailwindcss&logoColor=06B6D4)
\

### Backend

![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)

![NestJS](https://img.shields.io/badge/NestJS-E0234E?style=for-the-badge&logo=nestjs&logoColor=white)

![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)

API desenvolvida em NestJS, utilizando o adaptador Express.

### Banco de dados e design

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

![Figma](https://img.shields.io/badge/Figma-000000?style=for-the-badge&logo=figma&logoColor=F24E1E)

MySQL é o banco previsto no projeto. As instruções de configuração estão no repositório de banco de dados.


Qualidade de código

**Frontend**

* ESLint.

**Backend**

* Oxlint;
* Prettier;
* Vitest;
* Supertest.

---

## Requisitos

Para executar o projeto, é necessário possuir:

* Git;
* Node.js;
* npm;
* Banco de dados configurado para os recursos que dependem de persistência;
* Docker e Docker Compose, caso a configuração de ambiente utilizada exija containers.

Consulte as configurações de cada repositório para verificar a versão do Node.js adotada e os requisitos específicos de cada ambiente.

---

## Como executar

### 1. Clonar os repositórios

Em uma pasta de sua preferência, execute:

```bash
git clone https://github.com/laboratorio-de-praticas-2026-2/back-end.git
git clone https://github.com/laboratorio-de-praticas-2026-2/front-end.git
git clone https://github.com/laboratorio-de-praticas-2026-2/database.git
```

### 2. Configurar o ambiente

Configure o banco de dados conforme as instruções disponíveis no repositório `database`.

Nos repositórios da aplicação, utilize o arquivo `.env.example`, quando disponível, como referência para criar os arquivos de ambiente esperados pelo código.

A execução de funcionalidades integradas depende da configuração correta:

* Da API;
* Do banco de dados;
* Dos serviços externos utilizados por cada módulo.

### 3. Iniciar o backend

Em um terminal, acesse o repositório do backend:

```bash
cd back-end
npm install
npm run start:dev
```

### 4. Iniciar o frontend

Em outro terminal, acesse o repositório do frontend:

```bash
cd front-end
npm install
npm run dev
```

Acesse no navegador o endereço informado pelo servidor do frontend no terminal.

> Configure o frontend e o backend para utilizarem portas diferentes e ajuste o endereço da API consumida pelo frontend.
>
> Os comandos apresentados iniciam os servidores de desenvolvimento. A configuração do banco de dados e das integrações deve estar concluída para que os respectivos recursos funcionem corretamente.

---

## Variáveis de ambiente

As variáveis de ambiente devem seguir os nomes definidos no código e nos arquivos de exemplo de cada repositório.

Conforme as integrações implementadas, elas podem incluir:

* Conexão com o banco de dados;
* Porta do servidor;
* Endereço da API;
* Credenciais de serviços externos;
* Configurações de autenticação.

### Boas práticas

* Não versione senhas, tokens ou arquivos de ambiente que contenham segredos;
* Mantenha credenciais de banco de dados e autenticação no servidor;
* Utilize arquivos como `.env.example` apenas para documentar os nomes das variáveis necessárias;
* No Next.js, variáveis com o prefixo `NEXT_PUBLIC_` ficam disponíveis no navegador e devem ser utilizadas apenas para informações públicas.

---

## Testes e verificação

### Backend

Dentro do repositório `back-end`:

```bash
npm run lint
npm test
npm run build
```

Para executar os testes ponta a ponta, com o ambiente e a configuração de testes preparados:

```bash
npm run test:e2e
```

### Frontend

Dentro do repositório `front-end`:

```bash
npm run lint
npm run build
```

O frontend ainda não possui um script `test` definido no `package.json` consultado.

A validação da interface deve contemplar:

* Navegação;
* Responsividade;
* Integração com a API;
* Comportamento dos componentes;
* Tratamento de erros nas requisições.

---

## Links

* [Organização do projeto no GitHub](#)
* [Protótipo no Figma](#)
* [Código do frontend](https://github.com/laboratorio-de-praticas-2026-2/front-end)
* [Código do backend](https://github.com/laboratorio-de-praticas-2026-2/back-end)
* [Banco de dados](https://github.com/laboratorio-de-praticas-2026-2/database)

---

## Licença

A licença de distribuição do projeto ainda precisa ser formalizada.

Atualmente, o backend está identificado como `UNLICENSED` em seu arquivo `package.json`.
_________________________________________________________________________________________________________________________________________

# Banco de Dados do Projeto

## Fluxo de Desenvolvimento

### 1. Conectando ao Banco de Dados

- Como rodar o banco localmente pelo Docker Compose:

    a. **Baixar o Repositório:** Faça o clone (ou baixe) o repositório **database** para a sua máquina local.

    b. **Configurar Variáveis de Ambiente:** Na raiz do projeto, crie um arquivo chamado `.env`. Copie para dentro dele todos os dados que estão no arquivo de exemplo `.env.example`.

    c. **Subir o Banco de Dados:** Com o Docker em execução, rode o seguinte comando no terminal (na raiz do projeto):

    ```bash
    docker compose -f compose.dba.yml up -d
    ```

    d. **Conectar ao Banco de Dados:** Para visualizar e manipular os dados, utilize uma ferramenta cliente de banco de dados da sua preferência, como **HeidiSQL**, **DBeaver** ou **MySQL Workbench**. Utilize o host `localhost`, a porta `3306`, o usuário `root`, a senha `rootpassword` e o banco `lp_contabil_portal`.

    e. **Realizar Testes e Conferir o .env:** Após garantir que o banco e as migrations estão prontos, realize os testes necessários. O `.env` deste repositório deve conter:

```env
# BANCO LOCAL (CRIADO USANDO O COMPOSE DO REPOSITÓRIO DATABASE)
DATABASE_URL="mysql://root:rootpassword@127.0.0.1:3306/lp_contabil_portal"
```

## Regras de Governança
---

> Qualquer mudança necessária deve ser obrigatoriamente testada no banco LOCAL primeiro.
>
> Após a validação local, a alteração deve ser solicitada à equipe de Banco de Dados via Issue para aprovação. O banco de desenvolvimento nunca deve ser alterado estruturalmente por usuários comuns.

---

## Fluxo de Processo

### 1. Setup Inicial

```bash
# Clone o Projeto
git clone https://github.com/laboratorio-de-praticas-2026-2/database.git
cd database

# Configure as variáveis de ambiente
cp .env.example .env

# Inicie os serviços e aplique automaticamente as migrations existentes
docker compose -f compose.dba.yml up -d
```

No Windows (PowerShell ou CMD), utilize `copy .env.example .env` no lugar de `cp .env.example .env`.

### 2. Modificar Schema

Para criar novas migrations pela sua máquina, utilize Node.js 24 (conforme `.nvmrc`) e instale as dependências na raiz do projeto:

```bash
npm install
```

Edite o `prisma/schema.prisma` conforme necessário. Exemplo ilustrativo:

```prisma
model User {
  id    Int     @id @default(autoincrement())
  email String  @unique
  name  String
  // nova coluna:
  cpf   String  @unique
}
```

### 3. Gerar Migration

Com o banco local em execução:

```bash
npx prisma migrate dev --create-only --name descricao_da_alteracao --config ./prisma7.config.ts
```

Substitua `descricao_da_alteracao` por um nome descritivo para a migration.

**Analise** os arquivos `.sql` gerados em `prisma/migrations/`.

### 4. Executar Migration Local

```bash
npx prisma migrate dev --config ./prisma7.config.ts
npx prisma generate --config ./prisma7.config.ts
```

Teste e valide que nenhuma funcionalidade foi quebrada.

### 5. Submeter para Revisão
- Abra um PR para develop
- Após merge, a pipeline automática executa:
```
npx prisma migrate deploy
```
no ambiente de desenvolvimento
