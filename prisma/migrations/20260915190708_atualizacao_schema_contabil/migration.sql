/*
  Warnings:

  - Added the required column `updated_at` to the `banner` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `blog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `documento_solicitacao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `emails_enviados` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `empresa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `faq` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `obrigacao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `obrigacao_empresa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_solicitacao` to the `obrigacao_servico` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `obrigacao_servico` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `pagamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `parceiro` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `parcela` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `publicidade` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `servico` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `solicitacao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `usuario` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `obrigacao_servico` DROP FOREIGN KEY `obrigacao_servico_id_obrigacao_fkey`;

-- DropForeignKey
ALTER TABLE `obrigacao_servico` DROP FOREIGN KEY `obrigacao_servico_id_servico_fkey`;

-- DropForeignKey
ALTER TABLE `pagamento` DROP FOREIGN KEY `pagamento_id_obrigacao_fkey`;

-- DropForeignKey
ALTER TABLE `parcela` DROP FOREIGN KEY `parcela_id_pagamento_fkey`;

-- DropForeignKey
ALTER TABLE `solicitacao` DROP FOREIGN KEY `solicitacao_empresa_id_fkey`;

-- DropForeignKey
ALTER TABLE `solicitacao` DROP FOREIGN KEY `solicitacao_usuario_id_fkey`;

-- DropIndex
DROP INDEX `obrigacao_servico_id_servico_fkey` ON `obrigacao_servico`;

-- DropIndex
DROP INDEX `solicitacao_empresa_id_fkey` ON `solicitacao`;

-- DropIndex
DROP INDEX `solicitacao_usuario_id_fkey` ON `solicitacao`;

-- AlterTable
ALTER TABLE `banner` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `blog` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `documento_solicitacao` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `emails_enviados` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `empresa` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `faq` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `obrigacao` ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `obrigacao_empresa` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `obrigacao_servico` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `id_solicitacao` INTEGER NOT NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `pagamento` ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `parceiro` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `parcela` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `publicidade` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `servico` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `solicitacao` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `usuario` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `deleted_at` DATETIME(3) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- CreateTable
CREATE TABLE `interacao_usuario` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `usuario_id` INTEGER NOT NULL,
    `descricao` TEXT NOT NULL,
    `tipo` VARCHAR(100) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,

    INDEX `interacao_usuario_usuario_id_idx`(`usuario_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `relatorio` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `titulo` VARCHAR(150) NOT NULL,
    `tipo` VARCHAR(100) NOT NULL,
    `dados` JSON NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE INDEX `obrigacao_servico_id_solicitacao_idx` ON `obrigacao_servico`(`id_solicitacao`);

-- AddForeignKey
ALTER TABLE `obrigacao_servico` ADD CONSTRAINT `obrigacao_servico_id_obrigacao_fkey` FOREIGN KEY (`id_obrigacao`) REFERENCES `obrigacao`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `obrigacao_servico` ADD CONSTRAINT `obrigacao_servico_id_servico_fkey` FOREIGN KEY (`id_servico`) REFERENCES `servico`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `obrigacao_servico` ADD CONSTRAINT `obrigacao_servico_id_solicitacao_fkey` FOREIGN KEY (`id_solicitacao`) REFERENCES `solicitacao`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pagamento` ADD CONSTRAINT `pagamento_id_obrigacao_fkey` FOREIGN KEY (`id_obrigacao`) REFERENCES `obrigacao`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `parcela` ADD CONSTRAINT `parcela_id_pagamento_fkey` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `solicitacao` ADD CONSTRAINT `solicitacao_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `solicitacao` ADD CONSTRAINT `solicitacao_empresa_id_fkey` FOREIGN KEY (`empresa_id`) REFERENCES `empresa`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `interacao_usuario` ADD CONSTRAINT `interacao_usuario_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
