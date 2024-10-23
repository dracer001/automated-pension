<?php 
// require_once "../config.php";
/**
 * database class
 */
class Database
{ 
	protected $table = "";
	protected $allowedColumns;
	private function connectServer()
	{
	    $str = DBDRIVER.":host=".DBHOST;
	    return new PDO($str,DBUSER,DBPASS); 

	}

	private function connect()
	{
	    $str = DBDRIVER.":host=".DBHOST.";dbname=".DBNAME;
	    return new PDO($str,DBUSER,DBPASS); 

	}

	public function connect2()
	{
	    $con = new mysqli(DBHOST, DBUSER, DBPASS, DBNAME); 
        if ($con->connect_error) {
	         die("Connection failed: " .  $con->connect_error);
        } 
		return $con;
	}

	public function createDatabase()
	{
        
        try {
            $conn = $this->connectServer();
            // Set PDO error mode to exception
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
            // Path to your SQL file
            $sqlFile = ROOT.'/dracercorp.sql';
        
            // Read the file content
            $sqlContent = file_get_contents($sqlFile);
        
            // Execute the SQL script
            $conn->exec($sqlContent);
        
            return [
                "success" => true,
                "message" => "SQL SERVER INITIALIZED SUCCESSFULY"
            ];
        } catch (PDOException $e) {
            return [
                "success" => false,
                "error" => $e->getMessage()
            ];
        }   
	}


	public function query($query, $data = [], $type = 'object')
	{
		try {
			// Connect to the database
			$con = $this->connect();

			// Prepare the SQL query
			$stm = $con->prepare($query);
			if ($stm === false) {
				return [
					'success' => false,
					'error' => 'Failed to prepare the SQL statement.'
				];
			}

			// Execute the query with the provided data
			$check = $stm->execute($data);
			if ($check === false) {
				return [
					'success' => false,
					'error' => 'Failed to execute the SQL statement.'
				];
			}

			// Determine the fetch type
			$fetchType = ($type === 'object') ? PDO::FETCH_OBJ : PDO::FETCH_ASSOC;

			// Fetch all results
			$result = $stm->fetchAll($fetchType);
			if ($result === false) {
				return [
					'success' => false,
					'error' => 'Failed to fetch results.'
				];
			}

			// Return results if any
			return [
				'success' => true,
				'data' => $result
			];
		} catch (PDOException $e) {
			// Return error message for PDO exceptions
			return [
				'success' => false,
				'error' => 'Database error: ' . $e->getMessage()
			];
		} catch (Exception $e) {
			// Return error message for general exceptions
			return [
				'success' => false,
				'error' => 'An unexpected error occurred: ' . $e->getMessage()
			];
		}
	}

	public function all()
	{
		$query = "select * from ".$this->table;
		return $this->query($query);
	}

    public function insert($data)
	{

		//remove unwanted columns
		if(!empty($this->allowedColumns))
		{
			foreach ($data as $key => $value) {
				if(!in_array($key, $this->allowedColumns))
				{
					unset($data[$key]);
				}
			}
		}

		$keys = array_keys($data);

		$query = "insert into " . $this->table;
		$query .= " (".implode(",", $keys) .") values (:".implode(",:", $keys) .")";
		return $this->query($query,$data);

	}


    public function where($data)
	{

		$keys = array_keys($data);

		$query = "select * from ".$this->table." where ";

		foreach ($keys as $key) {
			$query .= $key . "=:" . $key . " && ";
		}
 
 		$query = trim($query,"&& ");
		return $this->query($query,$data);

	}


	public function update($id_name, $id, $data)
	{ 
		// Remove unwanted columns
		if (!empty($this->allowedColumns)) {
			foreach ($data as $key => $value) {
				if (!in_array($key, $this->allowedColumns)) {
					unset($data[$key]);
				}
			}
		}
	
		$keys = array_keys($data);
		$query = "UPDATE ".$this->table." SET ";
	
		foreach ($keys as $key) {
			$query .= $key ."=:" . $key . ","; 
		}
	
		$query = trim($query, ",");
		$query .= " WHERE $id_name = :$id_name";
	
		// Bind the id as well
		$data[$id_name] = $id;
	
		return $this->query($query, $data); 
	}

	public function delete($field, $id)
	{ 
		$query = "DELETE FROM `$this->table` WHERE `$field` = $id;";
		return $this->query($query); 
	}
	


}