-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Máquina: localhost:3306
-- Data de Criação: 23-Mar-2016 às 23:48
-- Versão do servidor: 5.5.48-cll
-- versão do PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_clients`
--

CREATE TABLE IF NOT EXISTS `ip_clients` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_date_created` datetime NOT NULL,
  `client_date_modified` datetime NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `client_address_1` varchar(100) DEFAULT '',
  `client_address_2` varchar(100) DEFAULT '',
  `client_city` varchar(45) DEFAULT '',
  `client_state` varchar(35) DEFAULT '',
  `client_zip` varchar(15) DEFAULT '',
  `client_country` varchar(35) DEFAULT '',
  `client_phone` varchar(20) DEFAULT '',
  `client_fax` varchar(20) DEFAULT '',
  `client_mobile` varchar(20) DEFAULT '',
  `client_email` varchar(100) DEFAULT '',
  `client_web` varchar(100) DEFAULT '',
  `client_vat_id` varchar(100) NOT NULL DEFAULT '',
  `client_tax_code` varchar(100) NOT NULL DEFAULT '',
  `client_active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`client_id`),
  KEY `client_active` (`client_active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_client_custom`
--

CREATE TABLE IF NOT EXISTS `ip_client_custom` (
  `client_custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`client_custom_id`),
  KEY `client_id` (`client_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_client_notes`
--

CREATE TABLE IF NOT EXISTS `ip_client_notes` (
  `client_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `client_note_date` date NOT NULL,
  `client_note` longtext NOT NULL,
  PRIMARY KEY (`client_note_id`),
  KEY `client_id` (`client_id`,`client_note_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_custom_fields`
--

CREATE TABLE IF NOT EXISTS `ip_custom_fields` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_table` varchar(35) NOT NULL,
  `custom_field_label` varchar(64) NOT NULL,
  `custom_field_column` varchar(64) NOT NULL,
  PRIMARY KEY (`custom_field_id`),
  KEY `custom_field_table` (`custom_field_table`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_email_templates`
--

CREATE TABLE IF NOT EXISTS `ip_email_templates` (
  `email_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_template_title` varchar(255) NOT NULL,
  `email_template_type` varchar(255) DEFAULT NULL,
  `email_template_body` longtext NOT NULL,
  `email_template_subject` varchar(255) DEFAULT NULL,
  `email_template_from_name` varchar(255) DEFAULT NULL,
  `email_template_from_email` varchar(255) DEFAULT NULL,
  `email_template_cc` varchar(255) DEFAULT NULL,
  `email_template_bcc` varchar(255) DEFAULT NULL,
  `email_template_pdf_template` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email_template_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `ip_email_templates`
--

INSERT INTO `ip_email_templates` (`email_template_id`, `email_template_title`, `email_template_type`, `email_template_body`, `email_template_subject`, `email_template_from_name`, `email_template_from_email`, `email_template_cc`, `email_template_bcc`, `email_template_pdf_template`) VALUES
(1, 'EltonDEV - Orçamento', 'quote', 'Olá <b>{{{client_name}}}</b>! Tudo bem?\n\nSegue os detalhes do orçamento <b>#{{{quote_number}}}</b>.\n\n<b>Data:</b> {{{quote_date_created}}}\n<b>Total do Orçamento:</b> {{{quote_total}}}\n<b>Seu Orçamento expira em:</b> {{{quote_date_expires}}}\n\nPara maiores detalhes e aprovação imediata de seu orçamento basta acessar: {{{quote_guest_url}}}\n\n--\n<font size="2" face="tahoma, sans-serif" color="#666666"><b>MY LENGTHS</b></font>\n\n <font face="tahoma, sans-serif" > <font size="1" >MY NAME IS</font><font size="1" >: </font> <font size="2" color="#0b5394"><b>Elton Ap Pereira</b></font></font>\n <font face="tahoma, sans-serif"><font >I AM: </font></font><font color="#444444" face="tahoma, sans-serif">Web Developer / WordPress / Mobile / E-commerce</font><span > </span>\n <font face="tahoma, sans-serif"><font size="1" >TALK TO ME? THESE ARE MY NUMBERS</font><font size="1" >: </font><font color="#444444">14 9 9734.0738 - 14 9 8155.3708</font></font>\n <span >MY BLOG: </span><span ><a href="http://eltondev.com.br" target="_blank">eltondev.com.br</a> </span>', 'Orçamento #{{{quote_number}}}', '{{{user_name}}} - {{{user_company}}}', '{{{user_email}}}', '', '', 'blue'),
(3, 'Fatura', 'invoice', '<font face="tahoma, sans-serif" color="#666666">Olá<b> {{{client_name}}}</b>! Tudo bem?</font>\n\n<font face="tahoma, sans-serif" color="#666666" size="3">Segue os detalhes da Fatura <b>#{{{invoice_number}}}</b>.</font>\n<br>\n<font face="tahoma, sans-serif" color="#444444"><b>Data:</b><font face="tahoma, sans-serif" color="#666666"> {{{invoice_date_created}}}</font>\n<font face="tahoma, sans-serif" color="#444444"><b>Total da Fatura:</b <font face="tahoma, sans-serif" color="#666666"> {{{invoice_total}}}</font>\n<font face="tahoma, sans-serif" color="444444"><b>Vencimento:</b></font> <font face="tahoma, sans-serif" color="666666">{{{invoice_date_due}}}</font>\n\n<font face="tahoma, sans-serif" color="#444444" size="3">Opções de Pagamento</font>\n\n<font face="tahoma, sans-serif" color="#666666"><b>1 - Transferência Bancária</b></font>\n<br>\n<font face="tahoma, sans-serif" color="#444444"><b>Nome:</b> <font face="tahoma, sans-serif" color="#666666">{{{invoice_custom_nome}}}</font>\n<font face="tahoma, sans-serif" color="#444444"><b>CPF:</b> <font face="tahoma, sans-serif" color="#666666">{{{invoice_custom_cpf}}}</font>\n<font face="tahoma, sans-serif" color="#444444"><b>Banco:</b> <font face="tahoma, sans-serif" color="#666666">{{{invoice_custom_banco}}}</font>\n<font face="tahoma, sans-serif" color="#444444"><b>Agência:</b></font> <font face="tahoma, sans-serif" color="#666666">{{{invoice_custom_agencia}}}</font>\n<font face="tahoma, sans-serif" color="#444444"><b>Conta:</b></font> <font face="tahoma, sans-serif" color="#666666">{{{invoice_custom_conta}}}</font>\n<font face="tahoma, sans-serif" color="#444444"><b>Operação:</b></font> <font face="tahoma, sans-serif" color"#666666">{{{invoice_custom_operacao}}}</font>\n\n<font face="tahoma, sans-serif" color="#444444" size="3"><b>Observações:</b></font>\n<font face="tahoma, sans-serif" color="#666666">{{{invoice_terms}}}</font>\n\n<font face="tahoma, sans-serif" color="#444444">Para maiores detalhes acesse:</font> {{{invoice_guest_url}}}\n\n--\n<font size="2" face="tahoma, sans-serif" color="#666666"><b>MY LENGTHS</b></font>\n\n <font face="tahoma, sans-serif" > <font size="1" >MY NAME IS</font><font size="1" >: </font> <font size="2" color="#0b5394"><b>Elton Ap Pereira</b></font></font>\n <font face="tahoma, sans-serif"><font >I AM: </font></font><font color="#444444" face="tahoma, sans-serif">Web Developer / WordPress / Mobile / E-commerce</font><span > </span>\n <font face="tahoma, sans-serif"><font size="1" >TALK TO ME? THESE ARE MY NUMBERS</font><font size="1" >: </font><font color="#444444">14 9 9734.0738 - 14 9 8155.3708</font></font>\n <span >MY BLOG: </span><span ><a href="http://eltondev.com.br" target="_blank">eltondev.com.br</a> </span>', 'Fatura #{{{invoice_number}}}', '{{{user_name}}} - {{{user_company}}}', '{{{user_email}}}', '', '', 'blue');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_families`
--

CREATE TABLE IF NOT EXISTS `ip_families` (
  `family_id` int(11) NOT NULL AUTO_INCREMENT,
  `family_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`family_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `ip_families`
--

INSERT INTO `ip_families` (`family_id`, `family_name`) VALUES
(5, 'WordPress');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_imports`
--

CREATE TABLE IF NOT EXISTS `ip_imports` (
  `import_id` int(11) NOT NULL AUTO_INCREMENT,
  `import_date` datetime NOT NULL,
  PRIMARY KEY (`import_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_import_details`
--

CREATE TABLE IF NOT EXISTS `ip_import_details` (
  `import_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL,
  `import_lang_key` varchar(35) NOT NULL,
  `import_table_name` varchar(35) NOT NULL,
  `import_record_id` int(11) NOT NULL,
  PRIMARY KEY (`import_detail_id`),
  KEY `import_id` (`import_id`,`import_record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_invoices`
--

CREATE TABLE IF NOT EXISTS `ip_invoices` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_group_id` int(11) NOT NULL,
  `invoice_status_id` tinyint(2) NOT NULL DEFAULT '1',
  `is_read_only` tinyint(1) DEFAULT NULL,
  `invoice_date_created` date NOT NULL,
  `invoice_date_modified` datetime NOT NULL,
  `invoice_date_due` date NOT NULL,
  `invoice_number` varchar(20) NOT NULL,
  `invoice_terms` longtext NOT NULL,
  `invoice_url_key` char(32) NOT NULL,
  `creditinvoice_parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `invoice_url_key` (`invoice_url_key`),
  KEY `user_id` (`user_id`,`client_id`,`invoice_group_id`,`invoice_date_created`,`invoice_date_due`,`invoice_number`),
  KEY `invoice_status_id` (`invoice_status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_invoices_recurring`
--

CREATE TABLE IF NOT EXISTS `ip_invoices_recurring` (
  `invoice_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `recur_start_date` date NOT NULL,
  `recur_end_date` date NOT NULL,
  `recur_frequency` char(2) NOT NULL,
  `recur_next_date` date NOT NULL,
  PRIMARY KEY (`invoice_recurring_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `ip_invoices_recurring`
--

INSERT INTO `ip_invoices_recurring` (`invoice_recurring_id`, `invoice_id`, `recur_start_date`, `recur_end_date`, `recur_frequency`, `recur_next_date`) VALUES
(1, 3, '2015-05-15', '2015-08-15', '1M', '2015-05-15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_invoice_amounts`
--

CREATE TABLE IF NOT EXISTS `ip_invoice_amounts` (
  `invoice_amount_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `invoice_sign` enum('1','-1') NOT NULL DEFAULT '1',
  `invoice_item_subtotal` decimal(20,2) DEFAULT NULL,
  `invoice_item_tax_total` decimal(20,2) DEFAULT NULL,
  `invoice_tax_total` decimal(20,2) DEFAULT NULL,
  `invoice_total` decimal(20,2) DEFAULT NULL,
  `invoice_paid` decimal(20,2) DEFAULT NULL,
  `invoice_balance` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`invoice_amount_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `invoice_paid` (`invoice_paid`,`invoice_balance`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_invoice_custom`
--

CREATE TABLE IF NOT EXISTS `ip_invoice_custom` (
  `invoice_custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`invoice_custom_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_invoice_groups`
--

CREATE TABLE IF NOT EXISTS `ip_invoice_groups` (
  `invoice_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_group_name` varchar(50) NOT NULL DEFAULT '',
  `invoice_group_identifier_format` varchar(255) NOT NULL,
  `invoice_group_next_id` int(11) NOT NULL,
  `invoice_group_left_pad` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`invoice_group_id`),
  KEY `invoice_group_next_id` (`invoice_group_next_id`),
  KEY `invoice_group_left_pad` (`invoice_group_left_pad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `ip_invoice_groups`
--

INSERT INTO `ip_invoice_groups` (`invoice_group_id`, `invoice_group_name`, `invoice_group_identifier_format`, `invoice_group_next_id`, `invoice_group_left_pad`) VALUES
(3, 'Fatura', 'FAT{{{id}}}.{{{day}}}.{{{month}}}.{{{year}}}', 13, 0),
(4, 'Orçamento', 'ORC{{{id}}}.{{{day}}}.{{{month}}}.{{{year}}}', 14, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_invoice_items`
--

CREATE TABLE IF NOT EXISTS `ip_invoice_items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `item_tax_rate_id` int(11) NOT NULL DEFAULT '0',
  `item_date_added` date NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_description` longtext NOT NULL,
  `item_quantity` decimal(10,2) NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `item_order` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `invoice_id` (`invoice_id`,`item_tax_rate_id`,`item_date_added`,`item_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_invoice_item_amounts`
--

CREATE TABLE IF NOT EXISTS `ip_invoice_item_amounts` (
  `item_amount_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_subtotal` decimal(10,2) NOT NULL,
  `item_tax_total` decimal(10,2) NOT NULL,
  `item_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`item_amount_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_invoice_tax_rates`
--

CREATE TABLE IF NOT EXISTS `ip_invoice_tax_rates` (
  `invoice_tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `include_item_tax` int(1) NOT NULL DEFAULT '0',
  `invoice_tax_rate_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`invoice_tax_rate_id`),
  KEY `invoice_id` (`invoice_id`,`tax_rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_item_lookups`
--

CREATE TABLE IF NOT EXISTS `ip_item_lookups` (
  `item_lookup_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL DEFAULT '',
  `item_description` longtext NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`item_lookup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_merchant_responses`
--

CREATE TABLE IF NOT EXISTS `ip_merchant_responses` (
  `merchant_response_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `merchant_response_date` date NOT NULL,
  `merchant_response_driver` varchar(35) NOT NULL,
  `merchant_response` varchar(255) NOT NULL,
  `merchant_response_reference` varchar(255) NOT NULL,
  PRIMARY KEY (`merchant_response_id`),
  KEY `merchant_response_date` (`merchant_response_date`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_payments`
--

CREATE TABLE IF NOT EXISTS `ip_payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL DEFAULT '0',
  `payment_date` date NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_note` longtext NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `payment_amount` (`payment_amount`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_payment_custom`
--

CREATE TABLE IF NOT EXISTS `ip_payment_custom` (
  `payment_custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_custom_id`),
  KEY `payment_id` (`payment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_payment_methods`
--

CREATE TABLE IF NOT EXISTS `ip_payment_methods` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(35) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `ip_payment_methods`
--

INSERT INTO `ip_payment_methods` (`payment_method_id`, `payment_method_name`) VALUES
(1, 'Depósito '),
(2, 'Cartão de Crédito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_products`
--

CREATE TABLE IF NOT EXISTS `ip_products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL,
  `product_sku` varchar(15) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_description` longtext NOT NULL,
  `product_price` float(10,2) NOT NULL,
  `purchase_price` float(10,2) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_quotes`
--

CREATE TABLE IF NOT EXISTS `ip_quotes` (
  `quote_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_group_id` int(11) NOT NULL,
  `quote_status_id` tinyint(2) NOT NULL DEFAULT '1',
  `quote_date_created` date NOT NULL,
  `quote_date_modified` datetime NOT NULL,
  `quote_date_expires` date NOT NULL,
  `quote_number` varchar(20) NOT NULL,
  `quote_url_key` char(32) NOT NULL,
  PRIMARY KEY (`quote_id`),
  KEY `user_id` (`user_id`,`client_id`,`invoice_group_id`,`quote_date_created`,`quote_date_expires`,`quote_number`),
  KEY `invoice_id` (`invoice_id`),
  KEY `quote_status_id` (`quote_status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_quote_amounts`
--

CREATE TABLE IF NOT EXISTS `ip_quote_amounts` (
  `quote_amount_id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `quote_item_subtotal` decimal(20,2) DEFAULT NULL,
  `quote_item_tax_total` decimal(20,2) DEFAULT NULL,
  `quote_tax_total` decimal(20,2) DEFAULT NULL,
  `quote_total` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`quote_amount_id`),
  KEY `quote_id` (`quote_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_quote_custom`
--

CREATE TABLE IF NOT EXISTS `ip_quote_custom` (
  `quote_custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  PRIMARY KEY (`quote_custom_id`),
  KEY `quote_id` (`quote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_quote_items`
--

CREATE TABLE IF NOT EXISTS `ip_quote_items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `item_tax_rate_id` int(11) NOT NULL,
  `item_date_added` date NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_description` longtext NOT NULL,
  `item_quantity` decimal(10,2) NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `item_order` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `quote_id` (`quote_id`,`item_date_added`,`item_order`),
  KEY `item_tax_rate_id` (`item_tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_quote_item_amounts`
--

CREATE TABLE IF NOT EXISTS `ip_quote_item_amounts` (
  `item_amount_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `item_tax_total` decimal(10,2) NOT NULL,
  `item_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`item_amount_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_quote_tax_rates`
--

CREATE TABLE IF NOT EXISTS `ip_quote_tax_rates` (
  `quote_tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `include_item_tax` int(1) NOT NULL DEFAULT '0',
  `quote_tax_rate_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`quote_tax_rate_id`),
  KEY `quote_id` (`quote_id`),
  KEY `tax_rate_id` (`tax_rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_settings`
--

CREATE TABLE IF NOT EXISTS `ip_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(50) NOT NULL,
  `setting_value` longtext NOT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `setting_key` (`setting_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Extraindo dados da tabela `ip_settings`
--

INSERT INTO `ip_settings` (`setting_id`, `setting_key`, `setting_value`) VALUES
(19, 'default_language', 'Portuguese, Brazilian'),
(20, 'date_format', 'd/m/Y'),
(21, 'currency_symbol', 'R$'),
(22, 'currency_symbol_placement', 'before'),
(23, 'invoices_due_after', '30'),
(24, 'quotes_expire_after', '5'),
(25, 'default_invoice_group', '3'),
(26, 'default_quote_group', '4'),
(27, 'thousands_separator', '.'),
(28, 'decimal_point', ','),
(29, 'cron_key', 'eVh0I6CDPbyDT2BO'),
(30, 'tax_rate_decimal_places', '2'),
(31, 'pdf_invoice_template', 'blue'),
(32, 'pdf_invoice_template_paid', 'default-paid'),
(33, 'pdf_invoice_template_overdue', 'default-overdue'),
(34, 'pdf_quote_template', 'blue'),
(35, 'public_invoice_template', 'default'),
(36, 'public_quote_template', 'default'),
(37, 'disable_sidebar', '1'),
(38, 'read_only_toggle', 'viewed'),
(39, 'first_day_of_week', '1'),
(40, 'default_country', 'BR'),
(41, 'quote_overview_period', 'this-month'),
(42, 'invoice_overview_period', 'this-month'),
(43, 'custom_title', 'EltonDEV - Orçamentos'),
(44, 'monospace_amounts', '0'),
(45, 'default_invoice_terms', ''),
(46, 'automatic_email_on_recur', '1'),
(47, 'mark_invoices_sent_pdf', '0'),
(48, 'email_invoice_template', '3'),
(49, 'email_invoice_template_paid', ''),
(50, 'email_invoice_template_overdue', ''),
(51, 'pdf_invoice_footer', 'ELTON APARECIDO PEREIRA<br>\nCPF: 391.161.908-83<br>\nEndereço: Rua Joaquim Antonio Siqueira, 201<br>\nBairro: Três Marias - CEP: 18708-060<br>\nTel: 14 3733.3466<br>\nE-mail: eltondeveloper@gmail.com<br>\nBlog: eltondev.com.br<br>'),
(52, 'mark_quotes_sent_pdf', '0'),
(53, 'email_quote_template', '1'),
(54, 'default_invoice_tax_rate', ''),
(55, 'default_include_item_tax', ''),
(56, 'default_item_tax_rate', ''),
(57, 'email_send_method', 'phpmail'),
(58, 'smtp_server_address', ''),
(59, 'smtp_authentication', '0'),
(60, 'smtp_username', ''),
(61, 'smtp_port', ''),
(62, 'smtp_security', ''),
(63, 'merchant_enabled', '0'),
(64, 'merchant_driver', 'paypal_express'),
(65, 'merchant_test_mode', '0'),
(66, 'merchant_username', 'eltondeveloper@gmail.com'),
(67, 'merchant_signature', ''),
(68, 'merchant_currency_code', 'USD'),
(69, 'online_payment_method', '2'),
(70, 'merchant_password', '2afM735Q+h0LTJEgFJtGMpRdq8puiWoAxisgjbF+bkukCxwJCirt2t5+m21o/Rf05p2J3a8p6qaj1J2+rWQ9cQ==');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_tax_rates`
--

CREATE TABLE IF NOT EXISTS `ip_tax_rates` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_rate_name` varchar(60) NOT NULL,
  `tax_rate_percent` decimal(5,2) NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_users`
--

CREATE TABLE IF NOT EXISTS `ip_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(1) NOT NULL DEFAULT '0',
  `user_active` tinyint(1) DEFAULT '1',
  `user_date_created` datetime NOT NULL,
  `user_date_modified` datetime NOT NULL,
  `user_name` varchar(100) DEFAULT '',
  `user_company` varchar(100) DEFAULT '',
  `user_address_1` varchar(100) DEFAULT '',
  `user_address_2` varchar(100) DEFAULT '',
  `user_city` varchar(45) DEFAULT '',
  `user_state` varchar(35) DEFAULT '',
  `user_zip` varchar(15) DEFAULT '',
  `user_country` varchar(35) DEFAULT '',
  `user_phone` varchar(20) DEFAULT '',
  `user_fax` varchar(20) DEFAULT '',
  `user_mobile` varchar(20) DEFAULT '',
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(60) NOT NULL,
  `user_web` varchar(100) DEFAULT '',
  `user_vat_id` varchar(100) NOT NULL DEFAULT '',
  `user_tax_code` varchar(100) NOT NULL DEFAULT '',
  `user_psalt` char(22) NOT NULL,
  `user_passwordreset_token` varchar(100) DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `ip_users`
--

INSERT INTO `ip_users` (`user_id`, `user_type`, `user_active`, `user_date_created`, `user_date_modified`, `user_name`, `user_company`, `user_address_1`, `user_address_2`, `user_city`, `user_state`, `user_zip`, `user_country`, `user_phone`, `user_fax`, `user_mobile`, `user_email`, `user_password`, `user_web`, `user_vat_id`, `user_tax_code`, `user_psalt`, `user_passwordreset_token`) VALUES
(1, 1, 1, '2015-04-10 14:12:54', '2016-01-07 11:31:44', 'EltonDEV', 'EltonDEV', '', '', '', '', '', 'BR', '', '', '', 'eltondeveloper@gmail.com', '$2a$10$4db89dff8b9eb76dc20faeBZRm//YW9ZmSY4UNkbTIfm5X80kfvie', '', '', '', '4db89dff8b9eb76dc20faf', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_user_clients`
--

CREATE TABLE IF NOT EXISTS `ip_user_clients` (
  `user_client_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`user_client_id`),
  KEY `user_id` (`user_id`,`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_user_custom`
--

CREATE TABLE IF NOT EXISTS `ip_user_custom` (
  `user_custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_custom_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `ip_user_custom`
--

INSERT INTO `ip_user_custom` (`user_custom_id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_versions`
--

CREATE TABLE IF NOT EXISTS `ip_versions` (
  `version_id` int(11) NOT NULL AUTO_INCREMENT,
  `version_date_applied` varchar(14) NOT NULL,
  `version_file` varchar(45) NOT NULL,
  `version_sql_errors` int(2) NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `version_date_applied` (`version_date_applied`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `ip_versions`
--

INSERT INTO `ip_versions` (`version_id`, `version_date_applied`, `version_file`, `version_sql_errors`) VALUES
(1, '1428685792', '000_1.0.0.sql', 0),
(2, '1428685809', '001_1.0.1.sql', 0),
(3, '1428685809', '002_1.0.2.sql', 0),
(4, '1428685809', '003_1.1.0.sql', 0),
(5, '1428685809', '004_1.1.1.sql', 0),
(6, '1428685809', '005_1.1.2.sql', 0),
(7, '1428685809', '006_1.2.0.sql', 0),
(8, '1428685809', '007_1.2.1.sql', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
