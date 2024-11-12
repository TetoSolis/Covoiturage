<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>IUT-NFC Covoit</title>
  <link href="style.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap" rel="stylesheet">
</head>
<body>
    <div class="main">
  <p>
    Bienvenue sur le site de l'IUT-NFC Covoit
  </p>
    <?php
    if (!$_GET['email'] && !$_COOKIE['email']){
      echo '<form>';
      echo '<label class="label">trouver vos covoiturages</label>';
      echo '<br>';
      echo '<input placeholder="Votre E-mail" class="email" type="email" id="email" name="email" required>';
      echo '<br>';
      echo '<input class="submit" type="submit" value="valider">';
      echo '</form>';
  } 
  else {
    session_start();
    setcookie('email', $_GET["email"], time() + 6000);
      echo '<a href="Passager.php">Passager</a><a href="Conducteur.php">Conducteur</a>';
  }
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