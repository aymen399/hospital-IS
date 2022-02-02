<?php
include 'Pdatabase.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<title>AdminHub</title>
</head>
<body>


	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='bx bxs-smile'></i>
			<span class="text">AdminHub</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="#">
					<i class='bx bxs-group' ></i>
					<span class="text">Patient</span>
				</a>
			</li>
			<li>
				<a href="services.php">
					<i class='bx bxs-bed' ></i>
					<span class="text">Admissions</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class='bx bxs-doughnut-chart' ></i>
					<span class="text">Statistiques</span>
				</a>
			</li>
		</ul>
		<ul class="side-menu">
			<li>
				<a href="#">
					<i class='bx bxs-cog' ></i>
					<span class="text">Settings</span>
				</a>
			</li>
			<li>
				<a href="#" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- SIDEBAR -->



	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<i class='bx bx-menu' ></i>
			<a href="#" class="nav-link">Categories</a>
			<form action="#">
				<div class="form-input">
					<input type="search" placeholder="Search...">
					<button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
				</div>
			</form>
			<input type="checkbox" id="switch-mode" hidden>
			<label for="switch-mode" class="switch-mode"></label>
			<a href="#" class="notification">
				<i class='bx bxs-bell' ></i>
				<span class="num">8</span>
			</a>
			<a href="#" class="profile">
				<img src="image.jpeg">
			</a>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Gestion SIH</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Gestion SIH</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							<a class="active" href="#">Patients</a>
						</li>
					</ul>
				</div>
				
			</div>

			

			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Les patients</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
						<thead>
							<tr>
								<th>Nom/Prénom</th>
								<th>Date de Naissance</th>
								<th>Taille/Poids</th>
							</tr>
						</thead>
						<tbody>
							<?php /** afficher les patients **/
					          
					                $req = "SELECT NOM_PAT, PRENOM_PAT, DNAISS_PAT, TAILLE_PAT, POIDS_PAT FROM patient";
					        
					            /* excute the query */
					            $sql=mysqli_query($conn,$req);

					            $row  = mysqli_fetch_array($sql);
					            echo '<tr>';
					            
					            while ($row) {

					            
					              echo "<td><img src='image.jpeg'>".strval($row['NOM_PAT'])." ".strval($row['PRENOM_PAT'])."</td>
					                    <td>".strval($row['DNAISS_PAT'])."</td>
					                    <td>".strval($row['TAILLE_PAT']).":".strval($row['POIDS_PAT'])."</td>
					                  </tr>";
					              $row  = mysqli_fetch_array($sql);
					          
					            }
					           
					        ?>
							
						</tbody>
					</table>
				</div>
				<div class="todo">
					<div class="signUp">
						<form action="add_patient.php" method="post">
						 	<div class="form-group" style=" grid-area: main; ">
							    <h4>Ajouter un nouveau Patient</h4>
							    <hr>
							    
							    <input class="form-control formControl" id="exampleFormControlInput1" type="text" placeholder="  Nom" name="nom"><br/>
							    <input class="form-control formControl" id="exampleFormControlInput1" type="text" placeholder="  Prénom" name="prenom"><br/>
							 	<div style=" color: black; float: right;" class="formControl">
								    <label for="sexe">Sexe:</label>
						  			<select name="sexe" id="sexe">
						  				<option value="homme">Homme</option>
	  									<option value="femme">Femme</option>
						  			</select><br/>
						  		</div>	
							    
							    <label for="daten">Date de naissance:</label>
							    <input class="form-control formControl" id="daten" type="date" style="display: inline;" name="DNAISS_PAT" required><br/>
							    <input style="margin-top: 8px;" class="form-control formControl" id="exampleFormControlInput1" placeholder="Entrer votre taille" id="number" type="number" name="TAILLE_PAT"><br/>
							    <input class="form-control formControl" id="exampleFormControlInput3" placeholder="Entrer votre poids" id="number" type="number" name="POIDS_PAT"><br/>
								<input class="form-control formControl" id="exampleFormControlInput4" placeholder="Entrer votre numéro de téléphone personnel" id="number" type="number" name="ntel_pers"><br/>
								<input class="form-control formControl" id="exampleFormControlInput5" placeholder="Entrer votre numéro de téléphone fixe" id="number" type="number" name="ntel_maison"><br/>
								<input class="form-control formControl" id="exampleFormControlInput6" placeholder="Entrer votre numéro de téléphone proffesionnel" id="number" type="number" name="ntel_travail">
							    
							    
							    <!--<p><a href="#" style="color:black">Conditions et confidentialité</a>.</p>-->

							    <div class="clearfix" style="display: flex; justify-content: flex-end;">
							      <button  type="reset" class="btn btn-secondary" style="margin-right: 30px; margin-top: 12px;">Annuler</button>
							      <button type="submit" class="btn btn-primary" name ="add_new_patient" style="margin-top: 12px;">Ajouter</button>
							    </div>
							</div>

						</form>
						
					</div>
				</div>
			</div>
		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	

	<script src="script.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>