-- AlterTable
ALTER TABLE `obrigacao` ADD COLUMN `natureza_cobranca` ENUM('mensalidade', 'servico_avulso', 'tributo') NULL;

-- AlterTable
ALTER TABLE `parcela` ADD COLUMN `data_pagamento` DATETIME(3) NULL;
