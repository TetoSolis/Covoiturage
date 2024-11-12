-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 04 mai 2023 à 19:48
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `SAE23`
--

-- --------------------------------------------------------

--
-- Structure de la table `Appareillement`
--

CREATE TABLE `Appareillement` (
  `N°passager` int(11) NOT NULL,
  `N°trajet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Appareillement`
--

INSERT INTO `Appareillement` (`N°passager`, `N°trajet`) VALUES
(2160, 53);

-- --------------------------------------------------------

--
-- Structure de la table `Conducteur`
--

CREATE TABLE `Conducteur` (
  `N°conducteur` int(5) NOT NULL,
  `Nom` tinytext NOT NULL,
  `Prenom` tinytext NOT NULL,
  `Ville` tinytext NOT NULL,
  `email` tinytext NOT NULL,
  `Participation demandé` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Conducteur`
--

INSERT INTO `Conducteur` (`N°conducteur`, `Nom`, `Prenom`, `Ville`, `email`, `Participation demandé`) VALUES
(558, 'berrada', 'mehdi', 'nantes', 'mehdi.berrada@edu.univ-fcomte.fr', ''),
(559, 'redoute', 'maxime', 'valentigney', 'maxime.redoute@edu.univ-fcomte.fr', ''),
(560, 'toilha', 'eric', 'belfort', 'eric.toilha@edu.univ-fcomte.fr', ''),
(561, 'fouka', 'anisse', 'audincourt', 'anisse.fouka@edu.univ-fcomte.fr', ''),
(562, 'kut', 'suha', 'besancon', 'suha.kut@edu.univ-fcomte.fr', ''),
(563, 'ockandji', 'ardy', 'montbeliard', 'ardy.ockandji@edu.univ-fcomte.fr', ''),
(564, 'ronaldo', 'paulino', 'montbeliard', 'paulino.ronaldo@edu.univ-fcomte.fr', ''),
(565, 'fatih', 'kurul', 'montbeliard', 'kurul.fatih@edu.univ-fcomte.fr', ''),
(566, 'gambier', 'maxence', 'montbeliard', 'maxence.gambier@edu.univ-fcomte.fr', ''),
(567, 'aoussar', 'driss', 'grand-charmont', 'driss.aoussar@edu.univ-fcomte.fr', ''),
(568, 'dogan', 'eren', 'grand-charmont', 'eren.dogan@edu.univ-fcomte.fr', ''),
(569, 'dezzaz', 'yanis', 'orleans', 'yanis.dezzaz@edu.univ-fcomte.fr', ''),
(570, 'dakhouche', 'bilal', 'besancon', 'bilal.dakhouche@edu.univ-fcomte.fr', ''),
(571, 'gallay', 'dorian', 'rang', 'dorian.gallay@edu.univ-fcomte.fr', '');

-- --------------------------------------------------------

--
-- Structure de la table `ConducteurGroupe`
--

CREATE TABLE `ConducteurGroupe` (
  `N°conducteur` int(11) NOT NULL,
  `N°Groupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ConducteurGroupe`
--

INSERT INTO `ConducteurGroupe` (`N°conducteur`, `N°Groupe`) VALUES
(558, 1),
(559, 1),
(560, 2),
(561, 2),
(562, 4),
(563, 3),
(564, 4),
(565, 3),
(566, 1),
(567, 4),
(568, 1),
(569, 2),
(570, 4),
(571, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Groupe`
--

CREATE TABLE `Groupe` (
  `N°Groupe` int(3) NOT NULL,
  `Groupe` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Groupe`
--

INSERT INTO `Groupe` (`N°Groupe`, `Groupe`) VALUES
(1, 'GB1'),
(2, 'GB2'),
(3, 'LK1'),
(4, 'LK2');

-- --------------------------------------------------------

--
-- Structure de la table `HoraireGroupe`
--

CREATE TABLE `HoraireGroupe` (
  `NumGroupe` int(11) NOT NULL,
  `date` date NOT NULL,
  `HeureDebut` time NOT NULL,
  `HeureFin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `HoraireGroupe`
--

INSERT INTO `HoraireGroupe` (`NumGroupe`, `date`, `HeureDebut`, `HeureFin`) VALUES
(3, '2023-05-16', '00:09:30', '00:18:00'),
(3, '2023-05-23', '00:08:00', '00:18:00'),
(3, '2023-05-04', '00:08:00', '00:18:30'),
(3, '2023-05-26', '00:08:00', '00:18:00'),
(3, '2023-05-05', '00:08:00', '00:17:30'),
(3, '2023-05-12', '00:08:00', '00:18:00'),
(3, '2023-05-15', '00:08:30', '00:18:00'),
(3, '2023-05-11', '00:09:30', '00:16:30'),
(3, '2023-05-22', '00:08:00', '00:17:30'),
(3, '2023-05-30', '00:08:30', '00:16:30'),
(3, '2023-05-10', '00:08:30', '00:18:00'),
(3, '2023-05-02', '00:08:00', '00:18:00'),
(3, '2023-05-03', '00:08:00', '00:18:00'),
(3, '2023-05-17', '00:08:00', '00:15:00'),
(3, '2023-05-09', '00:08:00', '00:16:30'),
(3, '2023-05-24', '00:08:00', '00:18:00'),
(3, '2023-05-25', '00:13:30', '00:16:30'),
(3, '2023-05-31', '00:09:30', '00:12:30'),
(4, '2023-05-16', '00:09:30', '00:18:00'),
(4, '2023-05-17', '00:08:00', '00:18:00'),
(4, '2023-05-25', '00:08:00', '00:18:00'),
(4, '2023-05-30', '00:08:30', '00:18:00'),
(4, '2023-05-23', '00:08:00', '00:15:00'),
(4, '2023-05-09', '00:08:00', '00:18:00'),
(4, '2023-05-04', '00:08:00', '00:18:30'),
(4, '2023-05-26', '00:08:00', '00:18:00'),
(4, '2023-05-05', '00:08:00', '00:17:30'),
(4, '2023-05-12', '00:08:00', '00:18:00'),
(4, '2023-05-11', '00:09:30', '00:16:30'),
(4, '2023-05-22', '00:08:00', '00:17:30'),
(4, '2023-05-10', '00:08:30', '00:18:00'),
(4, '2023-05-15', '00:08:30', '00:18:00'),
(4, '2023-05-02', '00:08:00', '00:18:00'),
(4, '2023-05-03', '00:08:00', '00:18:00'),
(4, '2023-05-24', '00:08:00', '00:18:00'),
(1, '2023-05-04', '00:08:00', '00:20:00'),
(1, '2023-05-26', '00:08:00', '00:18:00'),
(1, '2023-05-12', '00:08:00', '00:18:00'),
(1, '2023-05-02', '00:08:00', '00:18:00'),
(1, '2023-05-23', '00:08:00', '00:18:00'),
(1, '2023-05-11', '00:08:00', '00:18:00'),
(1, '2023-05-30', '00:08:30', '00:18:00'),
(1, '2023-05-05', '00:08:00', '00:17:30'),
(1, '2023-05-17', '00:09:30', '00:15:00'),
(1, '2023-05-16', '00:08:00', '00:18:00'),
(1, '2023-05-03', '00:08:00', '00:18:00'),
(1, '2023-05-15', '00:08:30', '00:18:00'),
(1, '2023-05-10', '00:08:30', '00:16:30'),
(1, '2023-05-31', '00:08:00', '00:15:15'),
(1, '2023-05-24', '00:08:00', '00:16:30'),
(1, '2023-05-09', '00:08:00', '00:18:00'),
(1, '2023-05-22', '00:09:30', '00:17:30'),
(1, '2023-05-25', '00:09:30', '00:12:30'),
(2, '2023-05-04', '00:08:00', '00:20:00'),
(2, '2023-05-26', '00:08:00', '00:18:00'),
(2, '2023-05-12', '00:08:00', '00:18:00'),
(2, '2023-05-02', '00:08:00', '00:18:00'),
(2, '2023-05-11', '00:08:00', '00:18:00'),
(2, '2023-05-30', '00:08:30', '00:18:00'),
(2, '2023-05-22', '00:09:30', '00:17:30'),
(2, '2023-05-05', '00:08:00', '00:17:30'),
(2, '2023-05-16', '00:08:00', '00:18:00'),
(2, '2023-05-23', '00:08:00', '00:18:00'),
(2, '2023-05-03', '00:08:00', '00:18:00'),
(2, '2023-05-17', '00:13:30', '00:18:00'),
(2, '2023-05-15', '00:08:30', '00:18:00'),
(2, '2023-05-10', '00:08:30', '00:16:30'),
(2, '2023-05-09', '00:08:00', '00:18:00'),
(2, '2023-05-25', '00:09:30', '00:18:00'),
(2, '2023-05-24', '00:08:00', '00:16:30'),
(2, '2023-05-31', '00:08:00', '00:15:15');

-- --------------------------------------------------------

--
-- Structure de la table `Passager`
--

CREATE TABLE `Passager` (
  `N°passager` int(5) NOT NULL,
  `Nom` tinytext NOT NULL,
  `Prénom` tinytext NOT NULL,
  `Ville` tinytext NOT NULL,
  `Adresse` tinytext NOT NULL,
  `Email` tinytext NOT NULL,
  `Conducteur` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Passager`
--

INSERT INTO `Passager` (`N°passager`, `Nom`, `Prénom`, `Ville`, `Adresse`, `Email`, `Conducteur`) VALUES
(2160, 'berrada', 'mehdi', 'nantes', '15 rue de l\'ecole', 'mehdi.berrada@edu.univ-fcomte.fr', 1),
(2161, 'chevassu ', 'mateo', 'besancon', '17 rue de la retraite sentimentale', 'mateo.chevassu @edu.univ-fcomte.fr', 0),
(2162, 'cevik', 'altay', 'audincourt', '19 avenue jean jaures ', 'altay.cevik@edu.univ-fcomte.fr', 0),
(2163, 'redoute', 'maxime', 'valentigney', '25 rue des poirriers ', 'maxime.redoute@edu.univ-fcomte.fr', 1),
(2164, 'amghar', 'mourad', 'valentigney', '33 rue de la novie', 'mourad.amghar@edu.univ-fcomte.fr', 0),
(2165, 'benyahia', 'yanis', 'audincourt', '5 rue de la charboniere', 'yanis.benyahia@edu.univ-fcomte.fr', 0),
(2166, 'abouhnaik', 'chadi', 'montbeliard', '3 rue pierre donzelot', 'chadi.abouhnaik@edu.univ-fcomte.fr', 0),
(2167, 'toilha', 'eric', 'belfort', '5 rue de moscou', 'eric.toilha@edu.univ-fcomte.fr', 1),
(2168, 'harchaoui', 'sami', 'st loup sur semouse', '41 rue du breuil', 'sami.harchaoui@edu.univ-fcomte.fr', 0),
(2169, 'fouka', 'anisse', 'audincourt', '15 rue leo ferre', 'anisse.fouka@edu.univ-fcomte.fr', 1),
(2170, 'zerrar', 'yanis', 'montbeliard', '8 rue du buffon ', 'yanis.zerrar@edu.univ-fcomte.fr', 0),
(2171, 'hamdi', 'locqmen', 'audincourt', '101 avenue du 8 mai ', 'locqmen.hamdi@edu.univ-fcomte.fr', 0),
(2172, 'kut', 'suha', 'besancon', '50b rue mirabeau', 'suha.kut@edu.univ-fcomte.fr', 1),
(2173, 'kilic', 'fatih', 'valentigney', '111 rue des graviers', 'fatih.kilic@edu.univ-fcomte.fr', 0),
(2174, 'nabil', 'chaker', 'belfort', '20 boulevard analtole france', 'chaker.nabil@edu.univ-fcomte.fr', 0),
(2175, 'solis macedo', 'paul', 'le mesnil amelot', '1 bis rue de bosnier', 'paul.solis macedo@edu.univ-fcomte.fr', 0),
(2176, 'ockandji', 'ardy', 'montbeliard', '37 rue georges clemenceau', 'ardy.ockandji@edu.univ-fcomte.fr', 1),
(2177, 'tchitembo', 'richardy', 'belfort', '2 rue ernest duvillard', 'richardy.tchitembo@edu.univ-fcomte.fr', 0),
(2178, 'nganga', 'mario', 'montbeliard', '37 rue georges clemenceau', 'mario.nganga@edu.univ-fcomte.fr', 0),
(2179, 'ngoma', 'dorcasse', 'montbeliard', '37 rue georges clemenceau', 'dorcasse.ngoma@edu.univ-fcomte.fr', 0),
(2180, 'ronaldo', 'paulino', 'montbeliard', '37 rue georges clemenceau', 'paulino.ronaldo@edu.univ-fcomte.fr', 1),
(2181, 'fatih', 'kurul', 'montbeliard', '24 rue de audincourt', 'kurul.fatih@edu.univ-fcomte.fr', 1),
(2182, 'nicolas', 'rabergeau', 'montebeliard', '23 maurice ravel', 'rabergeau.nicolas@edu.univ-fcomte.fr', 0),
(2183, 'wittig', 'antonin', 'hericourt', '3 rue des avenues', 'antonin.wittig@edu.univ-fcomte.fr', 0),
(2184, 'lucas', 'antoine', 'arbois', '4 rue du chateau pecauld', 'antoine.lucas@edu.univ-fcomte.fr', 0),
(2185, 'prinzbach', 'lilian', 'meyenheim', '2 impasse des pommiers', 'lilian.prinzbach@edu.univ-fcomte.fr', 0),
(2186, 'gambier', 'maxence', 'montbeliard', '100 route d\'audincourt', 'maxence.gambier@edu.univ-fcomte.fr', 1),
(2187, 'aoussar', 'driss', 'grand-charmont', '4 allee du hainault', 'driss.aoussar@edu.univ-fcomte.fr', 1),
(2188, 'dogan', 'eren', 'grand-charmont', '4 rue de normandie', 'eren.dogan@edu.univ-fcomte.fr', 1),
(2189, 'marchand', 'theo', 'triel-sur-seine', '6 rue cadot ', 'theo.marchand@edu.univ-fcomte.fr', 0),
(2190, 'le gousse', 'adrien', 'viry-chatillon', '14 avenue de l\'aqueduc', 'adrien.le gousse@edu.univ-fcomte.fr', 0),
(2191, 'coudert', 'yoland', 'vichy', '8 avenue de france', 'yoland.coudert@edu.univ-fcomte.fr', 0),
(2192, 'thayaparan', 'ansuhan', 'giromagny', '38 faubourg de belfort', 'ansuhan.thayaparan@edu.univ-fcomte.fr', 0),
(2193, 'guesdon', 'mathis', 'besancon', '12 impasse le corbusier', 'mathis.guesdon@edu.univ-fcomte.fr', 0),
(2194, 'dezzaz', 'yanis', 'orleans', '3 rue du jardin dans l\'ile', 'yanis.dezzaz@edu.univ-fcomte.fr', 1),
(2195, 'bierme', 'julien', 'montbeliard', '23 rue maurice ravel', 'julien.bierme@edu.univ-fcomte.fr', 0),
(2196, 'beaudoux', 'timothee', 'montbeliard', '6 allee du thiergarten', 'timothee.beaudoux@edu.univ-fcomte.fr', 0),
(2197, 'greder', 'guillaume', 'montbeliard', '23 rue maurice ravel', 'guillaume.greder@edu.univ-fcomte.fr', 0),
(2198, 'paquelet', 'etienne', 'bourg-en-bresse', '250 chemin des murailles ', 'etienne.paquelet@edu.univ-fcomte.fr', 0),
(2199, 'dakhouche', 'bilal', 'besancon', '22 rue danton', 'bilal.dakhouche@edu.univ-fcomte.fr', 1),
(2200, 'knoepffler-pout', 'xavier', 'sermamagny', '16 rue de valdoie', 'xavier.knoepffler-pout@edu.univ-fcomte.fr', 0),
(2201, 'gallay', 'dorian', 'rang', '7 rue de la goulisse', 'dorian.gallay@edu.univ-fcomte.fr', 1);

-- --------------------------------------------------------

--
-- Structure de la table `PassagerGroupe`
--

CREATE TABLE `PassagerGroupe` (
  `N°passager` int(11) NOT NULL,
  `N°Groupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `PassagerGroupe`
--

INSERT INTO `PassagerGroupe` (`N°passager`, `N°Groupe`) VALUES
(2160, 1),
(2161, 1),
(2162, 1),
(2163, 1),
(2164, 4),
(2165, 1),
(2166, 2),
(2167, 2),
(2168, 1),
(2169, 2),
(2170, 2),
(2171, 2),
(2172, 4),
(2173, 1),
(2174, 2),
(2175, 4),
(2176, 3),
(2177, 1),
(2178, 1),
(2179, 3),
(2180, 4),
(2181, 3),
(2182, 4),
(2183, 4),
(2184, 2),
(2185, 3),
(2186, 1),
(2187, 4),
(2188, 1),
(2189, 2),
(2190, 2),
(2191, 1),
(2192, 3),
(2193, 3),
(2194, 2),
(2195, 2),
(2196, 4),
(2197, 1),
(2198, 2),
(2199, 4),
(2200, 1),
(2201, 1);

-- --------------------------------------------------------

--
-- Structure de la table `trajet`
--

CREATE TABLE `trajet` (
  `N°trajet` int(11) NOT NULL,
  `N°conducteur` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `aller` tinyint(1) NOT NULL,
  `placeDispo` int(11) NOT NULL,
  `validé` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `trajet`
--

INSERT INTO `trajet` (`N°trajet`, `N°conducteur`, `date`, `heure`, `aller`, `placeDispo`, `validé`) VALUES
(53, 558, '2023-05-04', '00:08:00', 1, 8, 1),
(54, 558, '2023-05-04', '00:20:00', 0, 1, 1),
(55, 558, '2023-05-05', '00:08:00', 1, 1, 1),
(56, 558, '2023-05-05', '00:17:30', 0, 1, 0),
(57, 558, '2023-05-09', '00:08:00', 1, 1, 0),
(58, 558, '2023-05-09', '00:18:00', 0, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `Véhicule`
--

CREATE TABLE `Véhicule` (
  `Immatriculation` tinytext NOT NULL,
  `N°conducteur` int(11) NOT NULL,
  `Modèle` tinytext NOT NULL,
  `nombrePlaces` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Véhicule`
--

INSERT INTO `Véhicule` (`Immatriculation`, `N°conducteur`, `Modèle`, `nombrePlaces`) VALUES
('ao-216-dr', 567, 'C5', 5),
('be-312-me', 558, 'C2', 2),
('da-686-bi', 570, 'C2', 2),
('de-662-ya', 569, 'C3', 4),
('do-657-er', 568, 'C4', 2),
('fa-260-ku', 565, 'C5', 4),
('fo-849-an', 561, 'C3', 2),
('ga-818-do', 571, 'C1', 2),
('ga-850-ma', 566, 'C2', 4),
('ku-738-su', 562, 'C4', 5),
('oc-659-ar', 563, 'C5', 5),
('re-773-ma', 559, 'C1', 4),
('ro-475-pa', 564, 'C4', 3),
('to-937-er', 560, 'C5', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Appareillement`
--
ALTER TABLE `Appareillement`
  ADD KEY `N°passager` (`N°passager`),
  ADD KEY `N°trajet` (`N°trajet`) USING BTREE;

--
-- Index pour la table `Conducteur`
--
ALTER TABLE `Conducteur`
  ADD PRIMARY KEY (`N°conducteur`);

--
-- Index pour la table `ConducteurGroupe`
--
ALTER TABLE `ConducteurGroupe`
  ADD KEY `N°conducteur` (`N°conducteur`),
  ADD KEY `N°Groupe` (`N°Groupe`);

--
-- Index pour la table `Groupe`
--
ALTER TABLE `Groupe`
  ADD PRIMARY KEY (`N°Groupe`);

--
-- Index pour la table `HoraireGroupe`
--
ALTER TABLE `HoraireGroupe`
  ADD KEY `NumGroupe` (`NumGroupe`) USING BTREE,
  ADD KEY `date` (`date`) USING BTREE;

--
-- Index pour la table `Passager`
--
ALTER TABLE `Passager`
  ADD PRIMARY KEY (`N°passager`,`Email`(20)) USING BTREE;

--
-- Index pour la table `PassagerGroupe`
--
ALTER TABLE `PassagerGroupe`
  ADD KEY `N°passager` (`N°passager`),
  ADD KEY `N°Groupe` (`N°Groupe`);

--
-- Index pour la table `trajet`
--
ALTER TABLE `trajet`
  ADD PRIMARY KEY (`N°trajet`),
  ADD KEY `N°conducteur` (`N°conducteur`);

--
-- Index pour la table `Véhicule`
--
ALTER TABLE `Véhicule`
  ADD PRIMARY KEY (`Immatriculation`(10)),
  ADD KEY `N°conducteur` (`N°conducteur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Conducteur`
--
ALTER TABLE `Conducteur`
  MODIFY `N°conducteur` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=572;

--
-- AUTO_INCREMENT pour la table `Groupe`
--
ALTER TABLE `Groupe`
  MODIFY `N°Groupe` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Passager`
--
ALTER TABLE `Passager`
  MODIFY `N°passager` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2202;

--
-- AUTO_INCREMENT pour la table `trajet`
--
ALTER TABLE `trajet`
  MODIFY `N°trajet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Appareillement`
--
ALTER TABLE `Appareillement`
  ADD CONSTRAINT `Appareillement_ibfk_2` FOREIGN KEY (`N°passager`) REFERENCES `Passager` (`N°passager`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Appareillement_ibfk_3` FOREIGN KEY (`N°trajet`) REFERENCES `trajet` (`N°trajet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ConducteurGroupe`
--
ALTER TABLE `ConducteurGroupe`
  ADD CONSTRAINT `ConducteurGroupe_ibfk_1` FOREIGN KEY (`N°Groupe`) REFERENCES `Groupe` (`N°Groupe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ConducteurGroupe_ibfk_2` FOREIGN KEY (`N°conducteur`) REFERENCES `Conducteur` (`N°conducteur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `HoraireGroupe`
--
ALTER TABLE `HoraireGroupe`
  ADD CONSTRAINT `HoraireGroupe_ibfk_1` FOREIGN KEY (`NumGroupe`) REFERENCES `Groupe` (`N°Groupe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `PassagerGroupe`
--
ALTER TABLE `PassagerGroupe`
  ADD CONSTRAINT `PassagerGroupe_ibfk_1` FOREIGN KEY (`N°passager`) REFERENCES `Passager` (`N°passager`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PassagerGroupe_ibfk_2` FOREIGN KEY (`N°Groupe`) REFERENCES `Groupe` (`N°Groupe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `trajet`
--
ALTER TABLE `trajet`
  ADD CONSTRAINT `trajet_ibfk_1` FOREIGN KEY (`N°conducteur`) REFERENCES `Conducteur` (`N°conducteur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Véhicule`
--
ALTER TABLE `Véhicule`
  ADD CONSTRAINT `Véhicule_ibfk_1` FOREIGN KEY (`N°conducteur`) REFERENCES `Conducteur` (`N°conducteur`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
