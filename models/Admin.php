<?php
class Admin extends database
{ 
    protected $table = "admin";

    protected $allowedColumns = [
        'username',
        'email',
        'password',
        'role'	
    ];
}