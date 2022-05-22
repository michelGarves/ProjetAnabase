<?php
Class Facture{
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
    public function newFacture($numCongressiste, $dateFacture, $montant ){
        $sql = "INSERT INTO facture (NUM_CONGRESSISTE, DATE_FACTURE, CODE_REGLEMENT, MONTANT_FACTURE) 
				VALUES (?,?,0,?)";
		
		$req = $this->conn->prepare( $sql );
		
		$req->bindValue(1, $numCongressiste);
		$req->bindValue(2, $dateFacture);
		$req->bindValue(3, $montant);
		$req->execute();
    }

    public function getAllFacture(){
		$req = $this->conn->prepare("SELECT * FROM facture");
		$req->execute();

		return $req->fetchAll(PDO::FETCH_OBJ);

    }

    public function getFacturesRégléesOuNonRéglées($CODE_REGLEMENT){
		$req = $this->conn->prepare("select * FROM facture WHERE CODE_REGLEMENT = ?");
		$req->bindValue(1, $CODE_REGLEMENT);
		$req->execute();

		return $req->fetchAll(PDO::FETCH_OBJ);
    }

    public function getFacturesNonRéglées(){
		$req = $this->conn->prepare("SELECT * FROM facture WHERE CODE_REGLEMENT = 0");
		$req->execute();

		return $req->fetchAll(PDO::FETCH_OBJ);
    }

	public function getMontant($numCongressiste){

		$montantActivite = $this->conn->prepare("SELECT SUM(PRIX_ACTIVITE) AS prixActivite FROM activite WHERE NUM_ACTIVITE IN 
												(SELECT NUM_ACTIVITE FROM rel_1 WHERE NUM_CONGRESSISTE = ?)");
		$montantActivite->bindValue(1, $numCongressiste);
		$montantActivite->execute();
		$activite = $montantActivite->fetch(PDO::FETCH_OBJ);

		$montantSession = $this->conn->prepare("SELECT SUM(PRIX_SESSION) AS prixSessions FROM session WHERE NUM_SESSION IN 
											   (SELECT NUM_SESSION FROM participation_session WHERE NUM_CONGRESSISTE = ?)");
		$montantSession->bindValue(1, $numCongressiste);
		$montantSession->execute();
		$session = $montantSession->fetch(PDO::FETCH_OBJ);
		
		$montantHotel = $this->conn->prepare("SELECT (PRIX_PARTICIPANT + PRIX_SUPPL) AS prixHotel FROM hotel WHERE NUM_HOTEL
											=(SELECT NUM_HOTEL from congressiste WHERE NUM_CONGRESSISTE = ?)");

		$montantHotel->bindValue(1,$numCongressiste);
		$montantHotel->execute();
		$hotel = $montantHotel->fetch(PDO::FETCH_OBJ);
		$montantTotal = array();
		$montantTotal = $activite->prixActivite + $hotel->prixHotel + $session->prixSessions;

		return $montantTotal;
	}


	public function getActivité(){
		$req = $this->conn->prepare("SELECT NUM_ACTIVITE, NOM_ACTIVITE FROM activite");
		$req->execute();

		foreach($req as $act){
			$tableau[] = $act;
		}
		return $tableau;

		
		return $req->fetchAll(PDO::FETCH_OBJ);
	}

	public function getCongressistes(){

		$req = $this->conn->prepare("SELECT NUM_CONGRESSISTE, NOM_CONGRESSISTE, PRENOM_CONGRESSISTE FROM congressiste");
		$req->execute();

		return $req->fetchAll(PDO::FETCH_OBJ);

	}

	public function getUneFacture($numCongressiste){

		$req = $this->conn->prepare("SELECT * FROM facture WHERE NUM_CONGRESSISTE = ? ");
		$req->bindvalue(1, $numCongressiste);
		$req->execute();
		return $req->fetchAll(PDO::FETCH_OBJ);
	}
	
	public function getNomPrenomCongre($num){
		$req = $this->conn->prepare("SELECT NOM_CONGRESSISTE, PRENOM_CONGRESSISTE FROM congressiste WHERE NUM_CONGRESSISTE = ?");
		$req->bindValue(1, $num);
		$req->execute();

		return $req->fetch(PDO::FETCH_OBJ);
	}
	
}

?>