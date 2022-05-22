<?php 
include "./vue/entete.html.php";
?>
<h2>Formulaire Hello</h2>
<div  class="form">
<form class="form_content" action="./?controleur=hello" method="POST">

<div class="container">
    <input type="text" name="nom" placeholder="Saisir un nom" value="<?= $c->post["nom"] ?>" /><br />
           
    <input type="submit" class="initbtn" name ="todo" value="Initialiser" />
	<input type="submit"  class="btn" name ="todo" value="Enregistrer" />



<?php
if ($c->message != "") { ?>
	<div class="alert success"> 
	  <?= $c->message ?>.
	</div>
<?php } ?>

<?php
if ($c->erreur != "") { ?>
	<div class="alert warning">
	   <?= $c->erreur ?>
	</div>
<?php } ?>

</div>
</div>
</form>

<div class="liste" style="padding-top:10px;">
<table class="zigzag">
  <thead>
    <tr>
      <th class="header">Id</th>
      <th class="header">Nom</th>
    </tr>
  </thead>
  <tbody>
<?php foreach ( $c->data["liste"] as $ligne ) { ?>
<tr>
	<td><?= $ligne->id;?></td>
	<td><?= $ligne->nom;?></td>
</tr>
<?php } ?>
</tbody>
</table>

</div>
<?php 
include "./vue/pied.html.php";
?>
