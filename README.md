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
