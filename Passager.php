<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>IUT-NFC Covoit</title>
  <link href="styletabp.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap" rel="stylesheet">
</head>
<body>
  <h1>
  Bienvenue sur le site de l'IUT-NFC Covoit
  </h1>
  <br>
  <p class="ahref">
    <a href="Conducteur.php">Conducteur</a>
    <a href="Passager.php">Passager</a>
  </p>
  <>
      <?php
        $dbhost = "localhost";
      	$dbuser = "root";
      	$dbpass = "root";
      	$dbname = "SAE23";

        // Create connection
        $conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);

        $emailPassager = $_COOKIE["email"];

        echo '<p class="account">';
        echo 'Votre Compte :';
        echo '<br>';
        echo '<b>';echo $_COOKIE['email'];echo '</b>';
        echo '</p>';

        if(!empty($_GET['idtrajetvalide'])) {
          $idtrajettemp =$_GET['idtrajetvalide'];
          
          $conn->query("SELECT @Npassager := Passager.N°passager FROM Passager WHERE Passager.Email = '$emailPassager';");

          $test_validation = $conn->query("SELECT Appareillement.N°passager FROM Appareillement 
            WHERE Appareillement.N°passager = @Npassager
            AND Appareillement.N°trajet = '$idtrajettemp';");

          if ($test_validation->num_rows == 0) {
            $conn->query("INSERT INTO `Appareillement` (`N°passager`, `N°trajet`) VALUES (@Npassager, '$idtrajettemp');");
  
            $conn->query("UPDATE trajet
            SET trajet.placeDispo = trajet.PlaceDispo - 1
            WHERE trajet.N°trajet = '$idtrajettemp'
            AND trajet.placeDispo > 0;");
            header('Location: http://localhost/SAE/Passager.php');
          } else {
              $conn->query("DELETE FROM `Appareillement`
                WHERE Appareillement.N°passager = @Npassager
                AND Appareillement.N°trajet = '$idtrajettemp';");
  
              $conn->query("UPDATE trajet
              SET trajet.placeDispo = trajet.PlaceDispo + 1
              WHERE trajet.N°trajet = '$idtrajettemp'
              AND trajet.placeDispo > 0;");
              header('Location: http://localhost/SAE/Passager.php');
            }
          
        }

        echo '<div class="tableau1">';
        echo "<h2>Propositions de trajet</h2>";
        

        $sqlinfoRecuptraj = "SELECT Passager.N°passager, HoraireGroupe.date, HoraireGroupe.HeureDebut, HoraireGroupe.HeureFin
	      FROM Passager, PassagerGroupe, Groupe, HoraireGroupe
	      WHERE Passager.Email = '$emailPassager'
	      AND Passager.N°passager = PassagerGroupe.N°passager
	      AND PassagerGroupe.N°Groupe = Groupe.N°Groupe
	      AND Groupe.N°Groupe = HoraireGroupe.NumGroupe
	      HAVING HoraireGroupe.date BETWEEN CURRENT_DATE() AND ADDDATE(CURRENT_DATE(),INTERVAL 5 DAY);";

        $infotraj = $conn->query($sqlinfoRecuptraj);


        echo "<table><tr><th>N° de trajet</th><th>Conducteur</th><th>Véhicule</th><th>Date</th><th>Heure</th><th>Valider / Annuler</th></tr>";
        while($row = $infotraj->fetch_assoc()) {
          $heure = $row["HeureDebut"];
          $date = $row["date"];
          $aller = 1;
          $traj = $conn->query("SELECT Conducteur.Nom, Conducteur.email, Véhicule.Modèle, trajet.N°trajet, trajet.date, trajet.heure, trajet.aller
            FROM Conducteur, Véhicule, trajet
            WHERE Véhicule.N°conducteur = Conducteur.N°conducteur
            AND Conducteur.N°conducteur = trajet.N°conducteur
            AND Conducteur.email <> '$emailPassager'
            AND trajet.date = '$date'
            AND trajet.heure = '$heure'
            AND trajet.aller = '$aller'
            AND trajet.validé = 1
            AND trajet.placeDispo >= 0;");
          while ($row2 = $traj->fetch_assoc()){
            $trajet_a_transferer = $row2["N°trajet"];
           echo "<tr> <td>" . $row2["N°trajet"] . "</td> <td>" . $row2["email"] . "</td> <td>" . $row2["Modèle"] . "</td> <td>" .$row2["date"] . "</td> <td>" . $row2["heure"] . "</td><td>";
            echo "<form><input type='checkbox' name='idtrajetvalide' value=$trajet_a_transferer required><input type='submit' value='OK'></form>";
            echo"</td> </tr>";
          }
          $heure = $row["HeureFin"];
          $aller = 0;
          $traj = $conn->query("SELECT Conducteur.Nom, Conducteur.email, Véhicule.Modèle, trajet.N°trajet, trajet.date, trajet.heure, trajet.aller
            FROM Conducteur, Véhicule, trajet
            WHERE Véhicule.N°conducteur = Conducteur.N°conducteur
            AND Conducteur.N°conducteur = trajet.N°conducteur
            AND Conducteur.email <> '$emailPassager'
            AND trajet.date = '$date'
            AND trajet.heure = '$heure'
            AND trajet.aller = '$aller'
            AND trajet.validé = 1
            AND trajet.placeDispo >= 0;");
          while ($row2 = $traj->fetch_assoc()){
            $trajet_a_transferer = $row2["N°trajet"];
            echo "<tr> <td>" . $row2["N°trajet"] . "</td> <td>" . $row2["email"] . "</td> <td>" . $row2["Modèle"] . "</td> <td>" .$row2["date"] . "</td> <td>" . $row2["heure"] . "</td><td>";
            echo "<form><input type='checkbox' name='idtrajetvalide' value=$trajet_a_transferer required><input type='submit' value='OK'></form>";
            echo"</td> </tr>";
          }
        }
        
        echo '</table></div><div class="tableau2"><br><h2>Trajet validés</h2>';

        echo "<table><tr><th>N° de trajet</th> <th>Conducteur</th> <th>Véhicule</th> <th>Date</th> <th>Heure</th></tr>";
        $appareillage = $conn->query("SELECT Conducteur.Nom, Conducteur.Prenom, Conducteur.email, Véhicule.Modèle, trajet.N°trajet, trajet.date, trajet.heure, trajet.aller
            FROM Passager, Appareillement, trajet, Conducteur, Véhicule
            WHERE Véhicule.N°conducteur = Conducteur.N°conducteur
            AND Conducteur.N°conducteur = trajet.N°conducteur
            AND Conducteur.email <> '$emailPassager'
            AND trajet.N°trajet = Appareillement.N°trajet
            AND Appareillement.N°passager = Passager.N°passager
            AND Passager.Email = '$emailPassager';");

        while ($row2 = $appareillage->fetch_assoc()){
         echo "<tr> <td>" . $row2["N°trajet"] . "</td> <td>" . $row2["email"] . "</td> <td>" . $row2["Modèle"] . "</td> <td>" .$row2["date"] . "</td> <td>" . $row2["heure"] . "</td> </tr>";
        }
        echo "</table>";
        echo '</div>';
        // Close connection
        $conn->close();
      ?>
  <div id="background-wrap">
    <div class="x1">
        <div class="cloud"></div>
    </div>

    <div class="x2">
        <div class="cloud"></div>
    </div>

    <div class="x3">
        <div class="cloud"></div>
    </div>

    <div class="x4">
        <div class="cloud"></div>
    </div>

    <div class="x5">
        <div class="cloud"></div>
    </div>
</body>
</html>
