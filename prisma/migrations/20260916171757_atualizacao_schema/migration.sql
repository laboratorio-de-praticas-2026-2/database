/*
  Warnings:

  - You are about to drop the column `deleted_at` on the `banner` table. All the data in the column will be lost.
  - You are about to drop the column `deleted_at` on the `blog` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `documento_solicitacao` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `emails_enviados` table. All the data in the column will be lost.
  - You are about to drop the column `deleted_at` on the `emails_enviados` table. All the data in the column will be lost.
  - You are about to drop the column `deleted_at` on the `faq` table. All the data in the column will be lost.
  - You are about to drop the column `deleted_at` on the `interacao_usuario` table. All the data in the column will be lost.
  - You are about to drop the column `descricao` on the `interacao_usuario` table. All the data in the column will be lost.
  - You are about to drop the column `tipo` on the `interacao_usuario` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `interacao_usuario` table. All the data in the column will be lost.
  - You are about to drop the column `deleted_at` on the `obrigacao_empresa` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `obrigacao_empresa` table. All the data in the column will be lost.
  - You are about to drop the column `deleted_at` on the `obrigacao_servico` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `obrigacao_servico` table. All the data in the column will be lost.
  - You are about to alter the column `latitude` on the `parceiro` table. The data in that column could be lost. The data in that column will be cast from `VarChar(20)` to `Decimal(10,8)`.
  - You are about to alter the column `longitude` on the `parceiro` table. The data in that column could be lost. The data in that column will be cast from `VarChar(20)` to `Decimal(11,8)`.
  - You are about to drop the column `deleted_at` on the `publicidade` table. All the data in the column will be lost.
  - You are about to drop the column `dados` on the `relatorio` table. All the data in the column will be lost.
  - You are about to drop the column `deleted_at` on the `relatorio` table. All the data in the column will be lost.
  - You are about to drop the column `tipo` on the `relatorio` table. All the data in the column will be lost.
  - You are about to drop the column `titulo` on the `relatorio` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `solicitacao` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `usuario` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[cnpj]` on the table `empresa` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cpf_cnpj]` on the table `usuario` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `categoria_blog` to the `interacao_usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `data_interacao` to the `interacao_usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `categoria` to the `relatorio` table without a default value. This is not possible if the table is not empty.
  - Added the required column `data_geracao` to the `relatorio` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome` to the `relatorio` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url_documento_hash` to the `relatorio` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `empresa` DROP FOREIGN KEY `empresa_usuario_id_fkey`;

-- DropForeignKey
ALTER TABLE `obrigacao_empresa` DROP FOREIGN KEY `obrigacao_empresa_id_empresa_fkey`;

-- DropForeignKey
ALTER TABLE `obrigacao_empresa` DROP FOREIGN KEY `obrigacao_empresa_id_obrigacao_fkey`;

-- DropIndex
DROP INDEX `empresa_usuario_id_fkey` ON `empresa`;

-- DropIndex
DROP INDEX `obrigacao_empresa_id_empresa_fkey` ON `obrigacao_empresa`;

-- AlterTable
ALTER TABLE `banner` DROP COLUMN `deleted_at`;

-- AlterTable
ALTER TABLE `blog` DROP COLUMN `deleted_at`,
    ADD COLUMN `categoria` ENUM('Legislacao', 'ImpostoDeRenda', 'ObrigacoesAcessorias', 'FolhaDePagamento', 'SimplesNacional') NULL,
    ADD COLUMN `olho_do_texto` VARCHAR(255) NULL;

-- AlterTable
ALTER TABLE `documento_solicitacao` DROP COLUMN `created_at`,
    MODIFY `data_upload` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `emails_enviados` DROP COLUMN `created_at`,
    DROP COLUMN `deleted_at`;

-- AlterTable
ALTER TABLE `faq` DROP COLUMN `deleted_at`;

-- AlterTable
ALTER TABLE `interacao_usuario` DROP COLUMN `deleted_at`,
    DROP COLUMN `descricao`,
    DROP COLUMN `tipo`,
    DROP COLUMN `updated_at`,
    ADD COLUMN `categoria_blog` ENUM('Legislacao', 'ImpostoDeRenda', 'ObrigacoesAcessorias', 'FolhaDePagamento', 'SimplesNacional') NOT NULL,
    ADD COLUMN `data_interacao` DATE NOT NULL;

-- AlterTable
ALTER TABLE `obrigacao_empresa` DROP COLUMN `deleted_at`,
    DROP COLUMN `updated_at`;

-- AlterTable
ALTER TABLE `obrigacao_servico` DROP COLUMN `deleted_at`,
    DROP COLUMN `updated_at`;

-- AlterTable
ALTER TABLE `parceiro` MODIFY `latitude` DECIMAL(10, 8) NULL,
    MODIFY `longitude` DECIMAL(11, 8) NULL;

-- AlterTable
ALTER TABLE `publicidade` DROP COLUMN `deleted_at`;

-- AlterTable
ALTER TABLE `relatorio` DROP COLUMN `dados`,
    DROP COLUMN `deleted_at`,
    DROP COLUMN `tipo`,
    DROP COLUMN `titulo`,
    ADD COLUMN `categoria` ENUM('relatorio_completo', 'performance_financeira', 'desempenho_operacional', 'performance_servicos', 'gestao_solicitacoes', 'gestao_documentos', 'gestao_empresas', 'base_clientes', 'analise_eficiencia', 'funil_conversao', 'gargalos_operacionais') NOT NULL,
    ADD COLUMN `data_geracao` DATE NOT NULL,
    ADD COLUMN `descricao` TEXT NULL,
    ADD COLUMN `nome` VARCHAR(150) NOT NULL,
    ADD COLUMN `periodo_fim` DATE NULL,
    ADD COLUMN `periodo_inicio` DATE NULL,
    ADD COLUMN `url_documento_hash` VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE `servico` ADD COLUMN `exige_empresa` BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE `solicitacao` DROP COLUMN `created_at`;

-- AlterTable
ALTER TABLE `usuario` DROP COLUMN `created_at`;

-- CreateIndex
CREATE UNIQUE INDEX `empresa_cnpj_key` ON `empresa`(`cnpj`);

-- CreateIndex
CREATE UNIQUE INDEX `usuario_cpf_cnpj_key` ON `usuario`(`cpf_cnpj`);

-- AddForeignKey
ALTER TABLE `empresa` ADD CONSTRAINT `empresa_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `obrigacao_empresa` ADD CONSTRAINT `obrigacao_empresa_id_obrigacao_fkey` FOREIGN KEY (`id_obrigacao`) REFERENCES `obrigacao`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `obrigacao_empresa` ADD CONSTRAINT `obrigacao_empresa_id_empresa_fkey` FOREIGN KEY (`id_empresa`) REFERENCES `empresa`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
