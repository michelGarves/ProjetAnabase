<?php
include "./modele/modele.facture.php";
Class Controleur_showFact{
    public $vue = ""; //vue appelée par le controleur
	
	public $message = "";
	public $erreur = "";
	
	public $data; // le tableau des données de la vue
	
	public $m; // objet modele
	
	public $post; // renseigné par index
	public $get;
    public $uneFacture;
    
	public $type; // 1 pour toutes les factures, 2 pour les factures réglées ou non réglées

	// --- Constructeur
	public function __construct(){
		// déclarer la vue
		$this->vue = "showFact";
		$this->modele = new Facture();	
	}
    public function todo_initialiser(){
        $this->liste = "ON";
		$this->data["factures"] = $this->modele->getAllFacture();
		$this->type = 1;
		$this->uneFacture = 0;

    }
    public function todo_allFac(){
		$this->data["factures"] = $this->modele->getAllFacture();
		$this->type = 1;
		$this->uneFacture = 0;
	}
    
    
    
	public function todo_factNonRéglées(){
        $this->data["factures"] = $this->modele->getFacturesRégléesOuNonRéglées(0);
		$this->type = 2;
		$this->uneFacture = 0;
    }

    public function todo_factRéglées(){
        $this->data["factures"] = $this->modele->getFacturesRégléesOuNonRéglées(1);
		$this->type = 3;
		$this->uneFacture = 0;
	}
	public function todo_uneFact(){
		$this->data["detailFacture"]=$this->modele->getUneFacture($this->get["congre"]);
		$this->uneFacture = 1;
	}

    
    
    
}
?>