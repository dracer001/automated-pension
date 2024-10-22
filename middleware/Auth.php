<?php 

/**
 * Authenticate model
 */
class Auth
{
	 
public static function authenticate($row)
{
    if(is_object($row)){
        $_SESSION['USER_DATA'] = $row;
    }
}

public static function signout()
{
    if(!empty($_SESSION['USER_DATA'])){
        unset($_SESSION['USER_DATA']); 
    }
}
 
public static function signed_in()
{
    if(!empty($_SESSION['USER_DATA']))
    {
        return true;
    }

    return false;
}

public static function is_admin()
{
    if(!empty($_SESSION['USER_DATA']))
    {
        if($_SESSION['USER_DATA']->user === 'admin'){
            return true;
        } 
    }

    return false;
}

public static function is_employee()
{
    if(!empty($_SESSION['USER_DATA']))
    {
        if($_SESSION['USER_DATA']->user === 'employee'){
            return true;
        } 
    }
    return false;
}

public static function getUser_id($key_id)
{
    if(!empty($_SESSION['USER_DATA']))
    {
        $user_id = $_SESSION['USER_DATA']->$key_id;
        return $user_id;   
    }

    return false;
} 

public static function getUserInfo(){  
    return $_SESSION['USER_DATA'];
}


	
}

 