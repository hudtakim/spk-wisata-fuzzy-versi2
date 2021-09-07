<?php

    session_start();
    unset($_SESSION['legitUser']);
    header('Location: login_form.html'); 

?>
