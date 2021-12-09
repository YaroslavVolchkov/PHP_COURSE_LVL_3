<!DOCTYPE html>
<html lang="ru">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>shpp-library</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="library Sh++">
    <link rel="stylesheet" href="<?php $_SERVER['SERVER_NAME']?>/css/libs.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://<?php echo $_SERVER['SERVER_NAME']?>/css/style.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" crossorigin="anonymous"/>

    <link rel="shortcut icon" type="image/png" href="<?php $_SERVER['SERVER_NAME']?>/images/favicon.png">
    <style>
        .details {
            display: none;
        }
    </style>
</head>

<body data-gr-c-s-loaded="true" class="">

    <section id="header" class="header-wrapper">
        <?php echo $data['header'];?>
    </section>

    <section id="main" class="main-wrapper">
        <?php echo $data['content'];?>
    </section>

    <section id="footer" class="footer-wrapper">
        <?php echo $data['footer'];?>
    </section>

</body>
</html>