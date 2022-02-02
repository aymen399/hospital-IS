<?php  /** script d'ajouter nouveau patient **/
	include 'Pdatabase.php';
	if(isset($_POST['attribuer_lit'])){
		extract($_POST);
		$code_pat = $_POST['code_pat'];
		$code_lit =$_POST['lit'];
		$date_fin =$_POST['date_fin'];
	

	    $query = " INSERT INTO patient_lits (CODE_LITS, CODE_PAT, DATE_DEB, DATE_FIN) VALUES ('".intval($code_lit)."', '".intval($code_pat)."', CURDATE(), '".$date_fin."'); ";
	               
	    $sql=mysqli_query($conn,  $query); 
	    //echo "<h2 style='text-align : center ; color:green ;'>seccussfully project added</h2>";

	    if($sql) {
	      echo "<script>console.log('OKKK');</script>";
	      header("Location:services.php");
	    }
	    else{
	    	echo "problemmmmmmmmmmmme";
	    }
		
              
    }
			               

?>