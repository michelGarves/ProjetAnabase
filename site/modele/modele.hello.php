<?php
Class Modele_hello{
	private $conn;
	
	public function __construct(){
		$login = "root";
		$mdp = "";
		$bd = "anabase";
		$serveur = "localhost";

		try {
			$this->conn = new PDO("mysql:host=$serveur;dbname=$bd", $login, $mdp, 
			array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\'')); 
			$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		} catch (PDOException $e) {
			print "Erreur de connexion PDO ";
			die();
		}
	}
	
	public function getListeNom(){
		$req = $this->conn->prepare ("select * from hello");
		
		$req->execute();
		
		return $req->fetchAll(PDO::FETCH_OBJ);
	}
	
	public function insererNom( $nom ){
		$sql = "insert into hello values (NULL,?)";
		
		$req = $this->conn->prepare( $sql );
		
		$req->bindValue(1, $nom);
		$req->execute();
	}
}