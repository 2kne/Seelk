-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mer. 27 nov. 2019 à 17:04
-- Version du serveur :  10.1.37-MariaDB
-- Version de PHP :  7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `myapi`
--

-- --------------------------------------------------------

--
-- Structure de la table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('383acadd18bb5b26243c4dd5a0c2d363545d870a', '2019-11-27 16:49:58.708946', 1),
('d18ff77dadac668c6253a57c236033a752103741', '2019-11-27 13:42:24.083658', 4);

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Token', 7, 'add_token'),
(26, 'Can change Token', 7, 'change_token'),
(27, 'Can delete Token', 7, 'delete_token'),
(28, 'Can view Token', 7, 'view_token'),
(29, 'Can add profile', 8, 'add_profile'),
(30, 'Can change profile', 8, 'change_profile'),
(31, 'Can delete profile', 8, 'delete_profile'),
(32, 'Can view profile', 8, 'view_profile'),
(33, 'Can add coin', 9, 'add_coin'),
(34, 'Can change coin', 9, 'change_coin'),
(35, 'Can delete coin', 9, 'delete_coin'),
(36, 'Can view coin', 9, 'view_coin');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$mkMwpF0L01i6$Eni4UuWEaPZIK8WEDALTtv7rjalHkyWsUVkOqMYXEhk=', NULL, 1, '2kne', '', '', 'louis@gmail.com', 1, 1, '2019-11-21 14:55:19.941899'),
(2, 'pbkdf2_sha256$150000$eEPHehXSQtQj$uDTyl8Iq86d9dwD0zQ1O2z5A1wJpYEuuWqRAZUDQ0+Y=', NULL, 0, 'new_username', '', '', 'new_email', 0, 1, '2019-11-24 14:57:30.391730'),
(3, 'pbkdf2_sha256$150000$T2M5dqnNme7M$RmRmb6Lh2pYJxFHh0YzZdX9x9yZMQIrs/JgE03GucZg=', NULL, 0, '12346789', '', '', 'elodie@gmail.com', 0, 1, '2019-11-27 12:40:32.020989'),
(4, 'pbkdf2_sha256$150000$QXIbiSBVCafj$vvwSIoAnlBxvK/Urvel9eQ/25E7oNVYJU82LqyMfFy0=', NULL, 0, 'hugo', '', '', 'hugo@gmail.com', 0, 1, '2019-11-27 12:58:02.733669'),
(5, 'pbkdf2_sha256$150000$PZJYOn64c2Rf$9VV1H4YstMyENTAxMejFQBjFmpNwL3EN0bEQU+ssBn4=', NULL, 0, 'zizek', '', '', 'zizek@gmail.com', 0, 1, '2019-11-27 12:58:47.739029'),
(6, 'pbkdf2_sha256$150000$n5984LWY9ZIU$Fpy4h5oHHlcJYjQR6rW+vVIt4OwlSabGx/wTK9qtHwU=', NULL, 0, 'testt', '', '', 't@gmail.com', 0, 1, '2019-11-27 13:00:10.365607'),
(7, 'pbkdf2_sha256$150000$QfLkaI3AKPQi$FygFpi35zOXW2ekuPRHA4jbO92xH6QIR82Azx4t58/U=', NULL, 0, 'oj', '', '', 'g@gmail.com', 0, 1, '2019-11-27 13:03:40.590126');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `coin_alert_coin`
--

CREATE TABLE `coin_alert_coin` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `ctr` varchar(100) NOT NULL,
  `alert_type` int(11) NOT NULL,
  `value` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `sended` tinyint(1) NOT NULL,
  `comparate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `coin_alert_coin`
--

INSERT INTO `coin_alert_coin` (`id`, `id_user`, `ctr`, `alert_type`, `value`, `created_at`, `sended`, `comparate`) VALUES
(1, 2, 'PTX', 0, 100, '2019-11-25 14:20:57.853157', 0, 0),
(2, 2, 'OMGP', 1, 3232, '2019-11-25 14:46:25.539268', 0, 0),
(3, 1, 'Bitcoin', 0, 5000, '2019-11-25 14:56:16.583205', 0, 1),
(4, 2, 'Litecoin', 0, 200, '2019-11-27 15:38:43.397121', 0, 0),
(5, 2, 'PTX', 0, 1000, '2019-11-27 16:50:21.333720', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'authtoken', 'token'),
(9, 'coin_alert', 'coin'),
(5, 'contenttypes', 'contenttype'),
(8, 'core', 'profile'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-11-21 14:19:06.295226'),
(2, 'auth', '0001_initial', '2019-11-21 14:19:06.467042'),
(3, 'admin', '0001_initial', '2019-11-21 14:19:06.917463'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-11-21 14:19:07.004810'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-11-21 14:19:07.019766'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-11-21 14:19:07.091965'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-11-21 14:19:07.144962'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-11-21 14:19:07.200613'),
(9, 'auth', '0004_alter_user_username_opts', '2019-11-21 14:19:07.224029'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-11-21 14:19:07.257840'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-11-21 14:19:07.261487'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-11-21 14:19:07.273518'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-11-21 14:19:07.320131'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-11-21 14:19:07.375334'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-11-21 14:19:07.421480'),
(16, 'auth', '0011_update_proxy_permissions', '2019-11-21 14:19:07.433835'),
(17, 'sessions', '0001_initial', '2019-11-21 14:19:07.452306'),
(18, 'authtoken', '0001_initial', '2019-11-21 14:54:06.645674'),
(19, 'authtoken', '0002_auto_20160226_1747', '2019-11-21 14:54:06.730512'),
(20, 'coin_alert', '0001_initial', '2019-11-25 13:54:18.001216'),
(21, 'core', '0001_initial', '2019-11-25 13:54:18.050872'),
(22, 'coin_alert', '0002_coin_sended', '2019-11-26 17:29:18.907136'),
(23, 'core', '0002_delete_profile', '2019-11-26 17:29:18.944703'),
(24, 'coin_alert', '0003_auto_20191126_2029', '2019-11-26 20:29:16.903699'),
(25, 'coin_alert', '0004_coin_comparate', '2019-11-26 20:36:23.309961');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `coin_alert_coin`
--
ALTER TABLE `coin_alert_coin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `coin_alert_coin`
--
ALTER TABLE `coin_alert_coin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
