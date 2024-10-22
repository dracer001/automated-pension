<?php
session_start();

require_once "config.php";

spl_autoload_register(function($class_name)
{
    // Define the possible directories where the class file could be
    $directories = [
        "models/",
        "middleware/",
        "controllers/",
        "controllers/admin/"
    ];

    // Loop through each directory and check if the class file exists
    foreach ($directories as $directory) {
        $file1 = $directory . $class_name . ".php";
        $file2 = "../" . $directory . $class_name . ".php";
        $file3 = "../../" . $directory . $class_name . ".php";
        if (file_exists($file1)) {
            require $file1;
            break;  // Exit the loop after finding the file
        }else if (file_exists($file2)) {
            require $file2;
            break;  // Exit the loop after finding the file
        }else if (file_exists($file3)) {
            require $file3;
            break;  // Exit the loop after finding the file
        }
    }
});


function redirect($link)
{
	header("Location: ". ROOT."/".$link);
	die;
}


function message($msg = '',$erase = false) 
{
	if(!empty($msg))
	{
		$_SESSION['message'] = $msg;
	}else{
		if(!empty($_SESSION['message']))
		{
			$msg = $_SESSION['message'];
			if($erase){
				unset($_SESSION['message']);  
			}
			return $msg;
		}
	}
	return false;
} 