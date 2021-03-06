<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Westside Sneaker Store</title>
    <link rel="stylesheet" href="./modules_client/style/style.css">
    <link rel="shortcut icon" type="image/png" href="./admin/photo/logo.jpg" />
    <script src="https://kit.fontawesome.com/dbed6b6114.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" 
        integrity="sha384-tKLJeE1ALTUwtXlaGjJYM3sejfssWdAaWR2s97axw4xkiAdMzQjtOjgcyw0Y50KU" 
        crossorigin="anonymous">
</head>
<body>
    <?php
        session_start();
        // session_destroy();
        if(!isset($_SESSION['login'])){
            include './modules_client/header_login.php';
        } else {
            include './modules_client/header_loggedin.php';
        }
        include './modules_client/main.php';
		include './modules_client/footer.php';
	?>
</body>
</html>