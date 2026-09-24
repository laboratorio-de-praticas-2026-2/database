-- AlterTable
ALTER TABLE `relatorio` ADD COLUMN `status` ENUM('pendente', 'gerado', 'falha') NOT NULL DEFAULT 'pendente',
    MODIFY `data_geracao` DATE NULL,
    MODIFY `url_documento_hash` VARCHAR(255) NULL;
