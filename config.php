<?php 


/****
* app info
*/
define('APP_NAME', 'DracerCorp');
define('APP_DESC', 'Pensioneers Payroll');
define('SECRET_KEY', 'Pa$$w0r>');

/****
* database config
*/
if($_SERVER['SERVER_NAME'] == 'localhost')
{
	//database config for local server
	define('DBHOST', 'localhost:3309');
	define('DBNAME', 'DracerCorp');
	define('DBUSER', 'root');
	define('DBPASS', 'root');
	define('DBDRIVER', 'mysql');

	//root path e.g localhost/
	define('ROOT', 'http://localhost/Pensioneers');
}else
{
	//database config for live server
	define('DBHOST', 'localhost:3309');
	define('DBNAME', 'DracerCorp');
	define('DBUSER', 'root');
	define('DBPASS', 'root');
	define('DBDRIVER', 'mysql');

	//root path e.g https://www.yourwebsite.com
	define('ROOT', 'http://192.168.142.184/Pensioneers');
}

