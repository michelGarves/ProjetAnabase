<?php
include ("./modele/modele.hello.php");
Class Controleur_hello{
	// --- champs de base du controleur
	public $vue=""; //vue appelée par le controleur
	
	public $message = "";
	public $erreur = "";
	
	public $data; // le tableau des données de la vue
	
	public $m; // objet modele
	
	public $post; // renseigné par index
	
	// --- Constructeur
	public function __construct(){
		// déclarer la vue
		$this->vue = "hello";
		$this->modele = new Modele_hello();	
	}
	
	public function todo_initialiser(){
		$this->post["nom"] = "";
		$this->data["liste"] = $this->modele->getListeNom();
		$this->data["uneFacture"] = $this->modele->getUneFacture($this->post["btnChoix"]);
	}
	
	public function todo_enregistrer(){
		if ( $this->post["nom"] == "" ){
			$this->erreur = "Vous devez saisir un nom";
		}else{			
			//Enregistrer le nom dans la base de données ....
			$this->modele->insererNom( $this->post["nom"] );
			
			$this->message = $this->post["nom"]." a été enregistré";
					
			$this->post["nom"] = "";
		}
		
		$this->data["liste"] = $this->modele->getListeNom();
		
	}
}
?>