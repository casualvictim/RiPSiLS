<?php
/**
 * Created by PhpStorm.
 * User: Hugo
 * Date: 10-11-2014
 * Time: 10:07
 */

session_start();
session_destroy();

header("Location: ../index.php");