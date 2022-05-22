<?php
include "./modele/modele.facture.php";
Class Controleur_facture{
    public $vue = ""; //vue appelée par le controleur
	
	public $message = "";
	public $erreur = "";
	
	public $data; // le tableau des données de la vue
	
	public $m; // objet modele
	
	public $post; // renseigné par index
    
    public $list;
    public $show;

	// --- Constructeur
	public function __construct(){
		// déclarer la vue
		$this->vue = "facture";
		$this->modele = new Facture();	
	}
    public function todo_initialiser(){
		$this->post["nom"] = "";
		$this->data["allFac"] = $this->modele->getAllFacture();
        $this->data["listeCongre"] = $this->modele->getCongressistes();
        $this->show = 0;
        $this->list = "ON";
    }
    
    public function todo_createFac(){ 

        if(!isset($this->post["numCongre"])){
            $this->erreur = "Veuillez spécifier un congressiste";
            return 0;
        }else{
            $numCongr = $this->post["numCongre"];
            $date = date(y-m-d);
            $montantTotal = $this->modele->getMontantTotal();
            $this->data["newFacture"] = $this->modele->newFacture($numCongr, $date, $montantTotal);
            return 1;  
        }
        if(count($this->data["newFacture"] == 0)){
            $this->show = 1;
           }
        else{
            $this->show = 0;
        }
        $this->list= "OFF";
    }

    public function todo_uneFacture(){
        $this->data["uneFacture"]=$this->modele->getUneFacture($this->post["numCongre"]);
        $this->liste="OFF";
    }
    
    
}
?>