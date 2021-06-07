CREATE TABLE `logement` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `surface_logement` int,
  `surface_terrain` int,
  `pieces` int,
  `ref_interne` varchar(255),
  `description` text,
  `prix` int,
  `bilan_energie` float,
  `bilan_ges` float,
  `commune_id` int
);

CREATE TABLE `commune` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `code_postal` varchar(255),
  `superficie` int,
  `population` int,
  `departement_id` int
);

CREATE TABLE `attachment_commune` (
  `commune_id` int,
  `attachement_id` int
);

CREATE TABLE `attachement` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `commune_id` int
);

CREATE TABLE `departement` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `code` int,
  `nom` varchar(255),
  `region_id` int
);

CREATE TABLE `region` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255)
);

CREATE TABLE `image` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `fichier` varchar(255),
  `logement_id` int,
  `legende` varchar(255),
  `is_main` bool
);

CREATE TABLE `logement_option` (
  `logement_id` int,
  `option_id` int
);

CREATE TABLE `option` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255)
);

ALTER TABLE `departement` ADD FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);

ALTER TABLE `departement` ADD FOREIGN KEY (`id`) REFERENCES `commune` (`departement_id`);

ALTER TABLE `attachment_commune` ADD FOREIGN KEY (`attachement_id`) REFERENCES `attachement` (`id`);

ALTER TABLE `commune` ADD FOREIGN KEY (`id`) REFERENCES `attachment_commune` (`commune_id`);

ALTER TABLE `commune` ADD FOREIGN KEY (`id`) REFERENCES `logement` (`commune_id`);

ALTER TABLE `image` ADD FOREIGN KEY (`logement_id`) REFERENCES `logement` (`id`);

ALTER TABLE `option` ADD FOREIGN KEY (`id`) REFERENCES `logement_option` (`option_id`);

ALTER TABLE `logement_option` ADD FOREIGN KEY (`logement_id`) REFERENCES `logement` (`id`);
