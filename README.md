# Banco de Dados do Projeto

## Fluxo de Desenvolvimento

### 1. Conectando ao Banco de Dados

- Como rodar o banco localmente pelo docker compose:

    a. **Baixar o Repositório:** Faça o clone (ou baixe) o repositório do backend para a sua máquina local.

    b. **Configurar Variáveis de Ambiente:** Na raiz do projeto, crie um arquivo chamado `.env`. Copie para dentro dele todos os dados que estão no arquivo de exemplo `.env.example`.

    c. **Subir o Banco de Dados:** Para iniciar o banco de dados localmente, utilize o Docker. Rode o seguinte comando no terminal (na raiz do projeto):
    
    ```bash
    docker compose -f compose.dba.yml up -d
    ```

    d. **Conectar ao Banco de Dados:** Para visualizar e manipular os dados, utilize uma ferramenta cliente de banco de dados da sua preferência, como **HeidiSQL**, **DBeaver** ou **MySQL Workbench**.

    e. **Realizar Testes e Ajustar o .env:** Após garantir que o banco está rodando, realize os testes necessários. Altere o seu arquivo `.env` com as credenciais locais abaixo:

```env
# BANCO LOCAL (DEVE SER CRIADO USANDO O COMPOSE DO REPOSITORIO DATABASE) NÃO PRECISA DE ALTERAÇÃO

#DATABASE_HOST=localhost
#DATABASE_USERNAME=root
#DATABASE_PASSWORD=rootpassword
#DATABASE_DB=app_db
#DATABASE_PORT=3306
```

## Regras de Governança
---

> Qualquer mudança necessária deve ser obrigatoriamente testada no banco LOCAL primeiro.
> 
> Após a validação local, a alteração deve ser solicitada à equipe de Banco de Dados via Issue para aprovação. O banco de desenvolvimento nunca deve ser alterado estruturalmente por usuários comuns.

---

## Fluxo de Processo
### 1. Setup Inicial
```
# Clone o Projeto
git clone https://github.com/laboratorio-de-praticas-2026-2/database.git
cd <project-directory>

# Inicie os serviços
docker compose -f compose.dba.yml up -d

#Configure Variáveis de ambiente
cp .env.example .env
```

### 2. Modificar Schema
Edite o `schema.prisma` conforme necessário:
```
model User {
  id    Int     @id @default(autoincrement())
  email String  @unique
  name  String
  // nova coluna:
  cpf   String  @unique
}
```

### 3. Gerar Migration
``` 
npx prisma migrate dev --create-only
 ```
**Analise** os arquivos `.sql` gerados em `prisma/migratrions/`

### 4. Executar Migration Local
```
npx prisma migrate dev
```
Teste e valide que nenhuma funcionalidade foi quebrada.

### 5. Submeter para Revisão
- Abra um PR para develop
- Após merge, a pipeline automática executa:
```
npx prisma migrate deploy
```
no ambiente de desenvolvimento
