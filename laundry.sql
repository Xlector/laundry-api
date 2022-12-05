-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 05 déc. 2022 à 14:48
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;
--
-- Base de données : `laundry`
--

-- --------------------------------------------------------
--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `ID_Address` bigint(20) NOT NULL,
  `Address` text NOT NULL,
  `City` bigint(20) NOT NULL,
  `IsDefault` tinyint(1) NOT NULL,
  `Client` bigint(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Déchargement des données de la table `address`
--

-- --------------------------------------------------------
--
-- Structure de la table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Déchargement des données de la table `api_keys`
--

INSERT INTO `api_keys` (
    `id`,
    `name`,
    `key`,
    `active`,
    `created_at`,
    `updated_at`,
    `deleted_at`
  )
VALUES (
    1,
    'laundry-api',
    'FSWY0DPPTpNkDjzyTRyCXdm3QG8BdsVVpm0roEBm0prqKVfNIzlLcD9OTu3TEpa3',
    1,
    '2022-12-05 12:08:20',
    '2022-12-05 12:08:20',
    NULL
  );
-- --------------------------------------------------------
--
-- Structure de la table `api_key_access_events`
--

CREATE TABLE `api_key_access_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `api_key_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Déchargement des données de la table `api_key_access_events`
--

-- --------------------------------------------------------
--
-- Structure de la table `api_key_admin_events`
--

CREATE TABLE `api_key_admin_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `api_key_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Déchargement des données de la table `api_key_admin_events`
--

-- --------------------------------------------------------
--
-- Structure de la table `city`
--

CREATE TABLE `city` (
  `ID_city` bigint(20) NOT NULL,
  `CityName` varchar(50) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Déchargement des données de la table `city`
--

INSERT INTO `city` (
    `ID_city`,
    `CityName`,
    `updated_at`,
    `created_at`
  )
VALUES (1, 'Rabat', NULL, NULL),
  (2, 'Salé', NULL, NULL);
-- --------------------------------------------------------
--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `ID_client` bigint(20) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `BirthDate` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
--
-- Déchargement des données de la table `client`
--

-- --------------------------------------------------------
--
-- Structure de la table `clothes_pricing`
--

CREATE TABLE `clothes_pricing` (
  `ID_Clothes_Pricing` bigint(20) NOT NULL,
  `Clothes_Type` bigint(20) NOT NULL,
  `Service` bigint(20) NOT NULL,
  `Price` double NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Structure de la table `clothes_type`
--

CREATE TABLE `clothes_type` (
  `ID_Clothes` bigint(20) NOT NULL,
  `ClothesName` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES (1, '2014_10_12_000000_create_users_table', 1),
  (
    2,
    '2014_10_12_100000_create_password_resets_table',
    1
  ),
  (
    3,
    '2019_08_19_000000_create_failed_jobs_table',
    1
  ),
  (
    4,
    '2019_12_14_000001_create_personal_access_tokens_table',
    1
  ),
  (5, '2016_12_28_111110_create_api_keys_table', 2),
  (
    6,
    '2016_12_28_111111_create_api_key_access_events_table',
    2
  ),
  (
    7,
    '2016_12_28_111112_create_api_key_admin_events_table',
    2
  );
-- --------------------------------------------------------
--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `ID_order` bigint(20) NOT NULL,
  `Client` bigint(20) NOT NULL,
  `Status` bigint(20) NOT NULL,
  `Address_From` bigint(20) NOT NULL,
  `Address_To` bigint(20) NOT NULL,
  `Order_Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PickUp_Date` date NOT NULL,
  `DropOff_Date` date NOT NULL,
  `PickUp_Time_From` time NOT NULL,
  `PickUp_Time_TO` time NOT NULL,
  `DropOff_Time_FROM` time NOT NULL,
  `DropOff_Time_TO` time NOT NULL,
  `Total_All_Order_Details` double NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Structure de la table `order_detail`
--

CREATE TABLE `order_detail` (
  `ID_Order_Detail` bigint(20) NOT NULL,
  `Order` bigint(20) NOT NULL,
  `Clothes_Pricing` bigint(20) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Total_Quantity_Price` double NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Déchargement des données de la table `personal_access_tokens`
-- --------------------------------------------------------
--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `ID_Service` bigint(20) NOT NULL,
  `Category` bigint(20) NOT NULL,
  `ServiceName` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Structure de la table `service_category`
--

CREATE TABLE `service_category` (
  `ID_Service_Category` bigint(20) NOT NULL,
  `CategoryName` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Structure de la table `status`
--

CREATE TABLE `status` (
  `ID_Status` bigint(20) NOT NULL,
  `Status_label` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------
--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Déchargement des données de la table `users`
--

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
ADD PRIMARY KEY (`ID_Address`),
  ADD KEY `Client` (`Client`),
  ADD KEY `City` (`City`);
--
-- Index pour la table `api_keys`
--
ALTER TABLE `api_keys`
ADD PRIMARY KEY (`id`),
  ADD KEY `api_keys_name_index` (`name`),
  ADD KEY `api_keys_key_index` (`key`);
--
-- Index pour la table `api_key_access_events`
--
ALTER TABLE `api_key_access_events`
ADD PRIMARY KEY (`id`),
  ADD KEY `api_key_access_events_ip_address_index` (`ip_address`),
  ADD KEY `api_key_access_events_api_key_id_foreign` (`api_key_id`);
--
-- Index pour la table `api_key_admin_events`
--
ALTER TABLE `api_key_admin_events`
ADD PRIMARY KEY (`id`),
  ADD KEY `api_key_admin_events_ip_address_index` (`ip_address`),
  ADD KEY `api_key_admin_events_event_index` (`event`),
  ADD KEY `api_key_admin_events_api_key_id_foreign` (`api_key_id`);
--
-- Index pour la table `city`
--
ALTER TABLE `city`
ADD PRIMARY KEY (`ID_city`);
--
-- Index pour la table `client`
--
ALTER TABLE `client`
ADD PRIMARY KEY (`ID_client`),
  ADD UNIQUE KEY `ID_client` (`ID_client`);
--
-- Index pour la table `clothes_pricing`
--
ALTER TABLE `clothes_pricing`
ADD PRIMARY KEY (`ID_Clothes_Pricing`),
  ADD KEY `Service` (`Service`),
  ADD KEY `Clothes_Type` (`Clothes_Type`);
--
-- Index pour la table `clothes_type`
--
ALTER TABLE `clothes_type`
ADD PRIMARY KEY (`ID_Clothes`);
--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);
--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
ADD PRIMARY KEY (`id`);
--
-- Index pour la table `order`
--
ALTER TABLE `order`
ADD PRIMARY KEY (`ID_order`),
  ADD KEY `Client` (`Client`),
  ADD KEY `Status` (`Status`),
  ADD KEY `Address_From` (`Address_From`),
  ADD KEY `Address_To` (`Address_To`);
--
-- Index pour la table `order_detail`
--
ALTER TABLE `order_detail`
ADD PRIMARY KEY (`ID_Order_Detail`),
  ADD KEY `Order` (`Order`),
  ADD KEY `Clothes_Pricing` (`Clothes_Pricing`);
--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
ADD KEY `password_resets_email_index` (`email`);
--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`, `tokenable_id`);
--
-- Index pour la table `service`
--
ALTER TABLE `service`
ADD PRIMARY KEY (`ID_Service`),
  ADD KEY `Category` (`Category`);
--
-- Index pour la table `service_category`
--
ALTER TABLE `service_category`
ADD PRIMARY KEY (`ID_Service_Category`);
--
-- Index pour la table `status`
--
ALTER TABLE `status`
ADD PRIMARY KEY (`ID_Status`);
--
-- Index pour la table `users`
--
ALTER TABLE `users`
ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);
--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
MODIFY `ID_Address` bigint(20) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 11;
--
-- AUTO_INCREMENT pour la table `api_keys`
--
ALTER TABLE `api_keys`
MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 2;
--
-- AUTO_INCREMENT pour la table `api_key_access_events`
--
ALTER TABLE `api_key_access_events`
MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;
--
-- AUTO_INCREMENT pour la table `api_key_admin_events`
--
ALTER TABLE `api_key_admin_events`
MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 2;
--
-- AUTO_INCREMENT pour la table `city`
--
ALTER TABLE `city`
MODIFY `ID_city` bigint(20) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
MODIFY `ID_client` bigint(20) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 12;
--
-- AUTO_INCREMENT pour la table `clothes_pricing`
--
ALTER TABLE `clothes_pricing`
MODIFY `ID_Clothes_Pricing` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `clothes_type`
--
ALTER TABLE `clothes_type`
MODIFY `ID_Clothes` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 8;
--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
MODIFY `ID_order` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `order_detail`
--
ALTER TABLE `order_detail`
MODIFY `ID_Order_Detail` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 31;
--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
MODIFY `ID_Service` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `service_category`
--
ALTER TABLE `service_category`
MODIFY `ID_Service_Category` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `status`
--
ALTER TABLE `status`
MODIFY `ID_Status` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 35;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`Client`) REFERENCES `client` (`ID_client`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`City`) REFERENCES `city` (`ID_city`);
--
-- Contraintes pour la table `api_key_access_events`
--
ALTER TABLE `api_key_access_events`
ADD CONSTRAINT `api_key_access_events_api_key_id_foreign` FOREIGN KEY (`api_key_id`) REFERENCES `api_keys` (`id`);
--
-- Contraintes pour la table `api_key_admin_events`
--
ALTER TABLE `api_key_admin_events`
ADD CONSTRAINT `api_key_admin_events_api_key_id_foreign` FOREIGN KEY (`api_key_id`) REFERENCES `api_keys` (`id`);
--
-- Contraintes pour la table `clothes_pricing`
--
ALTER TABLE `clothes_pricing`
ADD CONSTRAINT `clothes_pricing_ibfk_1` FOREIGN KEY (`Service`) REFERENCES `service` (`ID_Service`),
  ADD CONSTRAINT `clothes_pricing_ibfk_2` FOREIGN KEY (`Clothes_Type`) REFERENCES `clothes_type` (`ID_Clothes`);
--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Client`) REFERENCES `client` (`ID_client`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Status`) REFERENCES `status` (`ID_Status`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`Address_From`) REFERENCES `address` (`ID_Address`),
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`Address_To`) REFERENCES `address` (`ID_Address`);
--
-- Contraintes pour la table `order_detail`
--
ALTER TABLE `order_detail`
ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`Order`) REFERENCES `order` (`ID_order`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`Clothes_Pricing`) REFERENCES `clothes_pricing` (`ID_Clothes_Pricing`);
--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`Category`) REFERENCES `service_category` (`ID_Service_Category`);
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;