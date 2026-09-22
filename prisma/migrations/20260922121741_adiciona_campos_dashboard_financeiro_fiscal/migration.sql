-- AlterTable
ALTER TABLE `obrigacao` ADD COLUMN `natureza_cobranca` VARCHAR(100) NULL;

-- AlterTable
ALTER TABLE `parcela` ADD COLUMN `data_pagamento` DATE NULL;
