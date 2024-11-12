<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>IUT-NFC Covoit</title>
  <link href="styletabc.css" rel="stylesheet">
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
  <?php
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass = "root";
    $dbname = "SAE23";
    // Create connection
    $conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);
    // Check connection
    if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
    }

    // Replace with the email address of the driver you want to query
    $emailConducteur = $_COOKIE['email'];

    echo '<p class="account">';
    echo 'Votre Compte :';
    echo '<br>';
    echo '<b>';echo $_COOKIE['email'];echo '</b>';
    echo '</p>';

    // Execute SQL query

    $testconducteur = "SELECT Conducteur.N°conducteur
      FROM Conducteur
      WHERE Conducteur.email = '$emailConducteur'";
    if ($conn->query($testconducteur)->num_rows == 0) {
      echo "<div class='tableau1'><br><h2>Vous n'êtes pas conducteur<br></h2></div>";
    } else {

        echo "<div class='tableau1'><br><h2>Trajet</h2><br>";

        if(!empty($_GET['idtrajetvalide'])) {
          $idtrajettemp = $_GET['idtrajetvalide'];
          $testvalide = $conn->query("SELECT trajet.validé FROM trajet WHERE trajet.N°trajet = '$idtrajettemp';");
          $ligne_de_validation = $testvalide->fetch_assoc();
          
          if ($ligne_de_validation["validé"] == '0') {
            $conn->query("UPDATE trajet SET trajet.validé = '1' WHERE trajet.N°trajet = '$idtrajettemp';");
            header('Location: http://localhost/SAE/Conducteur.php');
          } else {
              $conn->query("UPDATE trajet SET trajet.validé = '0' WHERE trajet.N°trajet = '$idtrajettemp';");
              header('Location: http://localhost/SAE/Conducteur.php');
            }
          
        }


        $sqlinfocreertraj = "SELECT Conducteur.N°conducteur, HoraireGroupe.date, HoraireGroupe.HeureDebut, HoraireGroupe.HeureFin, Véhicule.nombrePlaces
    	   FROM Conducteur, ConducteurGroupe, Groupe, HoraireGroupe, Véhicule
    	    WHERE Conducteur.email = '$emailConducteur'
    	    AND Conducteur.N°conducteur = ConducteurGroupe.N°conducteur
    	    AND Groupe.N°Groupe = ConducteurGroupe.N°Groupe
    	    AND Groupe.N°Groupe = HoraireGroupe.NumGroupe
    	    AND Conducteur.N°conducteur = Véhicule.N°conducteur
    	    HAVING HoraireGroupe.date BETWEEN CURRENT_DATE() AND ADDDATE(CURRENT_DATE(),INTERVAL 5 DAY);";


      $infotraj = $conn->query($sqlinfocreertraj);

          while($row = $infotraj->fetch_assoc()) {
            $Ncond = $row["N°conducteur"];
            $date = $row["date"];
            $heure = $row["HeureDebut"];
            $nbplaces = $row["nombrePlaces"] - 1;

            $trajet = "SELECT trajet.N°conducteur, trajet.date, trajet.Heure
            FROM trajet
            WHERE trajet.N°conducteur = '$Ncond'
            AND trajet.date = '$date'
            AND trajet.Heure = '$heure';";

            if ($conn->query($trajet)->num_rows == 0) {
              $aller = 1;
              $conn->query("INSERT INTO `trajet` (`N°trajet`, `N°conducteur`, `date`, `heure`, `aller`, `placeDispo`, `validé`) VALUES (NULL, '$Ncond' , '$date' , '$heure' , '$aller' , '$nbplaces' , '0');");
              
              $aller = 0;
              
              $heure = $row["HeureFin"];
              
              $conn->query("INSERT INTO `trajet` (`N°trajet`, `N°conducteur`, `date`, `heure`, `aller`, `placeDispo`, `validé`) VALUES (NULL, '$Ncond' , '$date' , '$heure' , '$aller' , '$nbplaces' , '0');");
            }


          }




          $sqltrajcond = "SELECT trajet.date, trajet.heure, trajet.N°trajet, trajet.validé
          FROM trajet, Conducteur
          WHERE Conducteur.N°conducteur = trajet.N°conducteur
          AND Conducteur.email = '$emailConducteur';";

        $result = $conn->query($sqltrajcond);

        // Display results
        if ($result->num_rows > 0) {
          echo "<table><tr><th>Numéro Trajet</th><th>Date</th><th>Heure</th><th>État de Validition</th><th>Valider / Annuler</th></tr>";
          // Output data of each row
          while($row = $result->fetch_assoc()) {
            $trajet_a_transferer = $row["N°trajet"];
            echo "<tr><td>" . $trajet_a_transferer . "</td><td>" .$row["date"]. "</td><td>" . $row["heure"]. "</td><td>";
            if($row["validé"] == 0){echo "Non";}else{echo"Oui";}
            echo"</td> <td>";
            echo "<form><input type='checkbox' name='idtrajetvalide' value=$trajet_a_transferer required><input type='submit' value='OK'></form>";
            echo"</td> </tr>";
          }
          echo "</table>";
        } else {
          echo "Aucun résultat";
        }
         echo '</div>'; 

        $infotraj = $conn->query($sqlinfocreertraj);
        echo "<div class='tableau1'><br><h2>Appareillement</h2><br>";
        echo "<table><tr><th>Numéro Trajet</th><th>Date</th><th>Heure</th><th>Passagers</th></tr>";
          while($row1 = $infotraj->fetch_assoc()) {
            $Ncond = $row1["N°conducteur"];
            $date = $row1["date"];
            $heure = $row1["HeureDebut"];

            $appareillement = $conn->query("SELECT trajet.N°trajet, trajet.date, trajet.heure, Passager.Email
              FROM trajet, Conducteur, Appareillement, Passager
              WHERE Conducteur.N°conducteur = trajet.N°conducteur
              AND Conducteur.email = '$emailConducteur'
              AND trajet.N°trajet = Appareillement.N°trajet
              AND Appareillement.N°passager = Passager.N°passager
              AND trajet.validé = '1'
              AND trajet.date = '$date'
              AND trajet.heure = '$heure';");
            

            while($row = $appareillement->fetch_assoc()) {
              echo "<tr><td>" . $row["N°trajet"] . "</td><td>" .$row["date"]. "</td><td>" . $row["heure"]. "</td><td>". $row["Email"]. "</td></tr>";
            }
            $heure = $row1["HeureFin"];

            $appareillement = $conn->query("SELECT trajet.N°trajet, trajet.date, trajet.heure, Passager.Email
              FROM trajet, Conducteur, Appareillement, Passager
              WHERE Conducteur.N°conducteur = trajet.N°conducteur
              AND Conducteur.email = '$emailConducteur'
              AND trajet.N°trajet = Appareillement.N°trajet
              AND Appareillement.N°passager = Passager.N°passager
              AND trajet.validé = '1'
              AND trajet.date = '$date'
              AND trajet.heure = '$heure';");
           
            while($row = $appareillement->fetch_assoc()) {
              echo "<tr><td>" . $row["N°trajet"] . "</td><td>" .$row["date"]. "</td><td>" . $row["heure"]. "</td><td>". $row["Email"]. "</td></tr>";
            }
          }
          echo "</table>";
          echo "</div>";
    }


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
