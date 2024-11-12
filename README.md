Application de Chat - SAE 302

Description

Ce projet a été réalisé dans le cadre de la SAE 302 et consiste à développer une application de chat utilisant un serveur relais pour transmettre les messages entre clients. Le serveur et les clients sont implémentés en Java et utilisent le protocole UDP pour la transmission des données.

Auteurs :

    Yanis Dezzaz
    Guillaume Greder
    Mathis Guesdon

Fonctionnalités

    Connexion utilisateur avec login et mot de passe.
    Envoi et réception de messages entre utilisateurs.
    Gestion des amis (ajout via demande et réponse).
    Stockage des messages en attente sur le serveur.
    Historique des 10 derniers messages par contact sur le client.

Table des matières

    Installation
    Architecture
    Protocole applicatif
    Interface graphique
    Contributeurs

1. Installation
Prérequis

    Java 17 ou supérieur.
    Un environnement de développement (IntelliJ IDEA, Eclipse, ou ligne de commande avec javac).

Instructions

    Clonez ce dépôt :

git clone https://github.com/votre-utilisateur/votre-depot.git
cd votre-depot

Compilez les fichiers Java :

javac -d out src/*.java

Lancez le serveur :

java -cp out Server

Lancez les clients (dans des terminaux séparés) :

    java -cp out Client

2. Architecture

Le projet est divisé en plusieurs classes pour une meilleure modularité :

    Msg : Manipule les messages (contenu, date, etc.).
    Session : Gère les informations utilisateur côté serveur (amis, messages en attente, etc.).
    Chaussette : Interface pour l'envoi/réception de messages via UDP.
    ChaussetteClient : Surcouche pour simplifier les interactions côté client.
    ChaussetteEngine : Fournit des méthodes pour gérer les amis et les messages de manière transparente.

Relations des classes :

Server
└── Session
    └── Msg
Client
└── ChaussetteClient
    └── Chaussette
        └── Msg

3. Protocole applicatif

Le protocole utilise UDP et définit plusieurs types de requêtes :
Requête	Description	Format
NOTIFY	Signale une erreur ou boîte vide	NOTIFY,code
UPDATE	Récupère les messages en attente	UPDATE,mdp,login,code
SEND	Envoie un message ou une demande/réponse d'ami	SEND,mdp,from,to,date,content
FORWARD	Transmet les messages en attente d'un utilisateur	FORWARD,from,date,content

Exemple d'ajout d'ami :

    SEND avec content = /rqstFrd pour demander un ami.
    Le destinataire accepte via SEND avec content = /accptFrd.

4. Interface graphique

L'interface graphique a été créée avec Swing et comporte trois parties principales :

    Page de connexion : Saisie du login et mot de passe.
    Chat : Affichage des messages échangés.
    Page d’ajout d’amis : Gestion des demandes d'amis.

5. Contributeurs

    Yanis Dezzaz
    Guillaume Greder
    Mathis Guesdon

Licence : Ce projet est partagé sous licence MIT. Vous êtes libre de le modifier et de le redistribuer en respectant les termes de la licence.
🌟 N'hésitez pas à étoiler ce dépôt si vous trouvez ce projet utile !
