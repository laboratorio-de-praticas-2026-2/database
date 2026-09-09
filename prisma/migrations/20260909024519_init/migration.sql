-- CreateTable
CREATE TABLE `banner` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `url_imagem` VARCHAR(191) NULL,
    `descricao` VARCHAR(191) NULL,
    `ativo` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `blog` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `titulo` VARCHAR(150) NULL,
    `conteudo` TEXT NULL,
    `data_publicacao` DATE NULL,
    `url_imagem` VARCHAR(191) NULL,
    `ativo` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `obrigacao` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tipo` ENUM('servico', 'empresa') NOT NULL,
    `descricao` TEXT NULL,
    `valor` DECIMAL(10, 2) NOT NULL,
    `status` ENUM('pago', 'pendente') NOT NULL DEFAULT 'pendente',
    `competencia` DATE NULL,
    `vencimento` DATE NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emails_enviados` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_usuario` VARCHAR(255) NOT NULL,
    `email_usuario` VARCHAR(255) NOT NULL,
    `texto_digitado` TEXT NOT NULL,
    `data_envio` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `assunto` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `parceiro` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_fantasia` VARCHAR(100) NULL,
    `cnpj` VARCHAR(20) NULL,
    `telefone` VARCHAR(20) NULL,
    `email` VARCHAR(100) NULL,
    `endereco` VARCHAR(255) NULL,
    `cidade` VARCHAR(100) NULL,
    `estado` VARCHAR(2) NULL,
    `site` VARCHAR(100) NULL,
    `tipo` ENUM('banco', 'cartorio', 'receita_federal', 'junta_comercial', 'sindicato') NULL,
    `latitude` VARCHAR(20) NULL,
    `longitude` VARCHAR(20) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `faq` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `pergunta` TEXT NULL,
    `resposta` TEXT NULL,
    `status` BOOLEAN NOT NULL DEFAULT true,
    `categoria` ENUM('documentacao', 'tributos', 'obrigacoes_acessorias', 'folha_pagamento', 'frequentes') NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `publicidade` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `titulo` VARCHAR(150) NULL,
    `conteudo` TEXT NULL,
    `url_imagem` VARCHAR(191) NULL,
    `ativo` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `servico` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `descricao` TEXT NULL,
    `valor_base` DECIMAL(10, 2) NULL,
    `prazo_estimado_dias` INTEGER NULL,
    `ativo` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `senha` VARCHAR(255) NOT NULL,
    `nivel` ENUM('cliente', 'administrador') NOT NULL DEFAULT 'cliente',
    `cpf_cnpj` VARCHAR(20) NULL,
    `celular` VARCHAR(20) NULL,
    `data_cadastro` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `usuario_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `obrigacao_servico` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_obrigacao` INTEGER NOT NULL,
    `id_servico` INTEGER NOT NULL,

    UNIQUE INDEX `obrigacao_servico_id_obrigacao_key`(`id_obrigacao`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pagamento` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_obrigacao` INTEGER NOT NULL,
    `valor_total` DECIMAL(10, 2) NOT NULL,
    `qtd_parcelas` INTEGER NOT NULL,
    `tipo_pagamento` ENUM('avista', 'parcelado') NOT NULL,
    `metodo_pagamento` VARCHAR(100) NOT NULL,
    `taxa` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `pagamento_id_obrigacao_key`(`id_obrigacao`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `parcela` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_pagamento` INTEGER NOT NULL,
    `valor` DECIMAL(10, 2) NOT NULL,
    `numero_parcela` INTEGER NOT NULL,
    `status` ENUM('pago', 'atrasado', 'ativo') NOT NULL DEFAULT 'ativo',
    `vencimento` DATE NOT NULL,

    UNIQUE INDEX `parcela_id_pagamento_numero_parcela_key`(`id_pagamento`, `numero_parcela`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `empresa` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `usuario_id` INTEGER NOT NULL,
    `razao_social` VARCHAR(150) NOT NULL,
    `nome_fantasia` VARCHAR(150) NULL,
    `cnpj` VARCHAR(20) NOT NULL,
    `regime_tributario` ENUM('mei', 'simples_nacional', 'lucro_presumido', 'lucro_real') NOT NULL DEFAULT 'simples_nacional',
    `inscricao_estadual` VARCHAR(30) NULL,
    `inscricao_municipal` VARCHAR(30) NULL,
    `data_abertura` DATE NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `obrigacao_empresa` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_obrigacao` INTEGER NOT NULL,
    `id_empresa` INTEGER NOT NULL,

    UNIQUE INDEX `obrigacao_empresa_id_obrigacao_key`(`id_obrigacao`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `solicitacao` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `usuario_id` INTEGER NOT NULL,
    `empresa_id` INTEGER NULL,
    `servico_id` INTEGER NOT NULL,
    `status` ENUM('recebido', 'aguardando_pagamento', 'aguardando_documento', 'em_andamento', 'concluido', 'cancelado') NOT NULL DEFAULT 'recebido',
    `observacao_cliente` TEXT NULL,
    `observacao_admin` TEXT NULL,
    `data_solicitacao` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `data_conclusao` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `documento_solicitacao` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `solicitacao_id` INTEGER NOT NULL,
    `nome_hash` VARCHAR(191) NULL,
    `tipo_documento` VARCHAR(100) NULL,
    `status_validacao` ENUM('pendente', 'aprovado', 'rejeitado') NOT NULL DEFAULT 'pendente',
    `data_upload` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `obrigacao_servico` ADD CONSTRAINT `obrigacao_servico_id_obrigacao_fkey` FOREIGN KEY (`id_obrigacao`) REFERENCES `obrigacao`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `obrigacao_servico` ADD CONSTRAINT `obrigacao_servico_id_servico_fkey` FOREIGN KEY (`id_servico`) REFERENCES `servico`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pagamento` ADD CONSTRAINT `pagamento_id_obrigacao_fkey` FOREIGN KEY (`id_obrigacao`) REFERENCES `obrigacao`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `parcela` ADD CONSTRAINT `parcela_id_pagamento_fkey` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `empresa` ADD CONSTRAINT `empresa_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `obrigacao_empresa` ADD CONSTRAINT `obrigacao_empresa_id_obrigacao_fkey` FOREIGN KEY (`id_obrigacao`) REFERENCES `obrigacao`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `obrigacao_empresa` ADD CONSTRAINT `obrigacao_empresa_id_empresa_fkey` FOREIGN KEY (`id_empresa`) REFERENCES `empresa`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `solicitacao` ADD CONSTRAINT `solicitacao_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `solicitacao` ADD CONSTRAINT `solicitacao_empresa_id_fkey` FOREIGN KEY (`empresa_id`) REFERENCES `empresa`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `solicitacao` ADD CONSTRAINT `solicitacao_servico_id_fkey` FOREIGN KEY (`servico_id`) REFERENCES `servico`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `documento_solicitacao` ADD CONSTRAINT `documento_solicitacao_solicitacao_id_fkey` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
