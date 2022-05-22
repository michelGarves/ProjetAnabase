<?php 
include "./vue/entete.html.php";
if($c->uneFacture == 0){
?>
<a href="./?controleur=showFact&todo=allFac"><input type="button" class = "choixType" value="Toutes les factures"></a>
<a href="./?controleur=showFact&todo=factRéglées"><input type="button" class = "choixType" value="Factures réglées"></a>
<a href="./?controleur=showFact&todo=factNonRéglées"><input type="button" class = "choixType" value="Factures non réglées"></a>
<?php
if($c->type == 1){
    echo '<h3> Liste de toutes les factures : </h3></br> ';
}
else if($c->type == 2){
    echo '<h3> Liste des factures non réglées : </h3></br> ';
}
else if($c->type == 3){
    echo '<h3> Liste des factures réglées : </h3></br> ';
}


?>
<table>
    <tr>
        <th scope="col">Nom</th>
        <th scope="col">Prénom</th>
        <th scope="col">Montant</th>
        <th scope="col">Date</th>
        <?php 
        if($c->type == 1){
        echo "<th scope=\"col\">Règlement</th>";
        }
    ?>
        </tr>
    <?php 
    switch($c->type){
        case 1 :
        foreach($c->data['factures'] as $uneFac){
            $leCongre = $c->modele->getNomPrenomCongre($uneFac->NUM_CONGRESSISTE);
            
            ?>
            <tr> 
            <td><?= $leCongre->NOM_CONGRESSISTE ;?></td>
            <td><?= $leCongre->PRENOM_CONGRESSISTE ;?></td>
            <td><?= $uneFac->MONTANT_FACTURE;?></td>
            <td><?= $uneFac->DATE_FACTURE;?></td>
        
            <?php if($uneFac->CODE_REGLEMENT==0){
                    echo '<td>Non réglé</td> ';
                  }
                else{
                    echo '<td>Réglé</td>';
                }
                ?>
            <td><a href="./?controleur=showFact&todo=uneFact&congre=<?= $uneFac->NUM_CONGRESSISTE ?>"><input type="button" class = "detail" value="Voir le detail"></a></td>
            </tr>
            <?php    
        }
        break;
        case 2 :
            foreach($c->data['factures'] as $uneFac){
                $leCongre = $c->modele->getNomPrenomCongre($uneFac->NUM_CONGRESSISTE);
                
                ?>
                <tr>
                <td><?= $leCongre->NOM_CONGRESSISTE ;?></td>
                <td><?= $leCongre->PRENOM_CONGRESSISTE ;?></td>
                <td><?= $uneFac->MONTANT_FACTURE;?></td>
                <td><?= $uneFac->DATE_FACTURE;?></td>
                <td><a href="./?controleur=showFact&todo=uneFact&congre=<?= $uneFac->NUM_CONGRESSISTE ?>"><input type="button" class = "detail" value="Voir le detail"></a></td>
            </tr>
            <?php 
            }
            break;
            case 3 :
                foreach($c->data['factures'] as $uneFac){
                    $leCongre = $c->modele->getNomPrenomCongre($uneFac->NUM_CONGRESSISTE);
                    
                    ?>
                    <tr>
                    <td><?= $leCongre->NOM_CONGRESSISTE ;?></td>
                    <td><?= $leCongre->PRENOM_CONGRESSISTE ;?></td>
                    <td><?= $uneFac->MONTANT_FACTURE;?></td>
                    <td><?= $uneFac->DATE_FACTURE;?></td>
                    <td><a href="./?controleur=showFact&todo=uneFact&congre=<?= $uneFac->NUM_CONGRESSISTE ?>"><input type="button" class = "detail" value="Voir le detail"></a></td>
                </tr>
                <?php 
                }
                break;
    }
    ?>
</table>

<?php
}
else if($c->uneFacture == 1){
    ?>
    <a href="./?controleur=showFact&todo=allFac"><input type="button" class = "choixType" value="Revenir à toutes les factures"></a>
    <div class="Fact">
    <h3> Facture : </h3></br>
        <?php 
       
        
        foreach($c->data["detailFacture"] as $donnees){
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
include "./vue/pied.html.php";
?>