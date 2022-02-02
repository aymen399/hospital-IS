<?php  /** script d'ajouter nouveau patient **/
	include 'Pdatabase.php';
	if(isset($_POST['add_new_patient'])){
		extract($_POST);
		$nom = $_POST['nom'];
		$prenom =$_POST['prenom'];
		$sexe = $_POST['sexe'];
		$DNAISS_PAT = $_POST['DNAISS_PAT'];
		$TAILLE_PAT = $_POST['TAILLE_PAT'];
		$POIDS_PAT = $_POST['POIDS_PAT'];
		$ntel_pers = $_POST['ntel_pers'];
		$ntel_maison = $_POST['ntel_maison'];
		$ntel_travail = $_POST['ntel_travail'];

	    $query = " INSERT INTO patient (NOM_PAT, PRENOM_PAT, SEXE_PAT, DNAISS_PAT, TAILLE_PAT, POIDS_PAT, NTEL_PERS, NTEL_MAISON, NTEL_TRAVAIL) VALUES ('".$nom."' , '".$prenom."' , '".$sexe."' , '".$DNAISS_PAT."' , '".$TAILLE_PAT."', '".$POIDS_PAT."', '".$ntel_pers."', '".$ntel_maison."', '".$ntel_travail."') ";
	               
	    $sql=mysqli_query($conn,  $query); 
	    //echo "<h2 style='text-align : center ; color:green ;'>seccussfully project added</h2>";

	    header('Location: index.php');
		
              
    }
			               

?>