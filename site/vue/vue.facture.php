<?php 
include "./vue/entete.html.php";
    if($c->list=="ON"){
?>
<form method="POST" action="?controleur=facture&todo=uneFacture">
<select id="congre" div="listeCongre" name="numCongre">
    <?php
    foreach($c->data["listeCongre"] as $congre){
        ?>
        <option value=<?php echo $congre->NUM_CONGRESSISTE;?>><?php echo $congre->PRENOM_CONGRESSISTE, " ", $congre->NOM_CONGRESSISTE;?></option>
    <?php 
    } 
    ?>
</select>
<input  type="submit" name="btnChoix"  value="Afficher une facture"/>
</form>

<?php
}
if($todo=="uneFacture"){
    
    if(count($c->data["uneFacture"]) == 0){

        ?>
    <div class="noFact" >
        Il n'y a aucune facture pour ce congressiste.
    </br> <a href="./?controleur=facture&todo=createFac"> La créer </a>
    </div>
    <?php 
    }
    elseif(count($c->data["uneFacture"]) > 0){
        ?>
        <div class="Fact">
    <h3> Facture : </h3></br>
    
        <?php
        
        foreach($c->data["uneFacture"] as $donnees){
            ?>
        Numéro facture : <?= $donnees->NUM_FACTURE;?></br>
        Numéro congressiste : <?= $donnees->NUM_CONGRESSISTE;?></br>
        Date Facture : <?= $donnees->DATE_FACTURE;?></br>
        Code règlement : <?= $donnees->CODE_REGLEMENT;?></br>
        Montant facture : <?= $donnees->MONTANT_FACTURE;?></br>
        </div>
<?php
        }
    }
}
if($c->show == 1){
    echo "Données manquantes pour la création de la facture... <a href=\"./?controleur=facture\">Revenir à l'accueil</a>";
}
include "./vue/pied.html.php";
?>