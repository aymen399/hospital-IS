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
	<link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="Bootstrap/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">

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
			<li>
				<a href="index.php">
					<i class='bx bxs-group' ></i>
					<span class="text">Patient</span>
				</a>
			</li>
			<li class="active">
				<a href="#">
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
							<a class="active" href="#">Admissions</a>
						</li>
					</ul>
				</div>
				
			</div>

			

			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Les patients non hébergés</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
						<thead>
							<tr>
								<th>Patient</th>
								<th>Lits disponibles</th>
								
							</tr>
						</thead>
						<tbody>
							<?php /** afficher les patients sans lits **/
					          
					                $req = "SELECT NOM_PAT, PRENOM_PAT, CODE_PAT FROM patient p 
					                			WHERE CODE_PAT NOT IN ( SELECT CODE_PAT from patient_lits WHERE DATE_DEB <= CURDATE() AND DATE_FIN >= CURDATE() ) ";
					        
					            /* excute the query */
					            $sql=mysqli_query($conn,$req);

					            $row  = mysqli_fetch_array($sql);
					            echo '<tr>';
					            
					            while ($row) {

					            	$indice_line = strval($row['CODE_PAT']);	
						            echo "<td><img src='image.jpeg'>".strval($row['NOM_PAT'])." ".strval($row['PRENOM_PAT'])."</td>
						          			<td><button type='submit' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal".$indice_line."'>lui Attribuer un lit
												</button></td>
						                </tr>";
						         
					           
					        ?>
					        
					        <!-- Modal d'attribuer un lit qu patient adéquat-->
							<div class="modal fade" id="exampleModal<?php echo $indice_line; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content" style="width: 800px; min-width: 500px">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">Voici les lits disponibles, choisissiez un:</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      	<form action="attribuer_lit.php" method="post">
								      <div class="modal-body">
								      	<input hidden name='code_pat' value="<?php echo $indice_line ?>">
								      	<select name="lit" id="lit" style='padding: 5px; width: 91%' class="form-control formControl">
								      	<?php 
						  					include 'Pdatabase.php';
	  									 	$req = "SELECT l.CODE_LITS as CODE_LITS, l.EMPLACEMENT_LIT as EMPLACEMENT_LIT, l.NUM_CHAMBRE as NUM_CHAMBRE, c.NUM_BATIMENT as NUM_BATIMENT, c.NUM_ETAGE as NUM_ETAGE, s.LIBELLE_SERVICE as LIBELLE_SERVICE FROM lits l, chambre c, service s
					                			WHERE l.NUM_CHAMBRE = c.NUM_CHAMBRE 
					                			AND c.CODE_SERVICE = s.CODE_SERVICE
					                			AND l.CODE_LITS NOT IN ( SELECT CODE_LITS from patient_lits WHERE DATE_DEB <= CURDATE() AND DATE_FIN >= CURDATE() )
					                			";
					        
								            /* excute the query */
								            $sql2=mysqli_query($conn,$req);

								            $row2  = mysqli_fetch_array($sql2);
								            
								          
								            while ($row2) {

								            
								              echo "<option value='".strval($row2['CODE_LITS'])."'>
								              		le lit à l'emplacement:".strval($row2['EMPLACEMENT_LIT']).", de la chambre:".strval($row2['NUM_CHAMBRE']).", dans la batiment:".strval($row2['NUM_BATIMENT']).", à l'étage:".strval($row2['NUM_ETAGE']).", du service:".strval($row2['LIBELLE_SERVICE'])."</option>";
								              $row2  = mysqli_fetch_array($sql2);
								          
								            }
								           
							        ?>
						  			</select><br/>
						  			<label for="daten">Jusqu'à:</label>
							    	<input class="form-control formControl" type="date" name="date_fin" style="width: 91%" required>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
								        <button type="submit" name="attribuer_lit" class="btn btn-primary">Confirmer</button>
								      </div>
								    </form>  
							    </div>
							  </div>
							</div>
							<!----------------------------------------->
							<<?php 
								$row  = mysqli_fetch_array($sql);
						          
					            }
							 ?>
							
						</tbody>
					</table>
				</div>
				<div class="todo">
					<div class="head">
						<h3>Les patients hébergés</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Patient</th>
								<th scope="col">Service hébergeant</th>
							</tr>
						</thead>
						<tbody>
							<?php /** afficher les patients avec lits **/
					          
					                $req = "SELECT NOM_PAT, PRENOM_PAT, LIBELLE_SERVICE  FROM lits l, chambre c, service s, patient_lits pl, patient p
					                			WHERE l.NUM_CHAMBRE = c.NUM_CHAMBRE 
					                			AND c.CODE_SERVICE = s.CODE_SERVICE
					                			AND pl.CODE_LITS = l.CODE_LITS
					                			AND pl.CODE_PAT = p.CODE_PAT
					                			AND p.CODE_PAT IN ( SELECT CODE_PAT from patient_lits WHERE DATE_DEB <= CURDATE() AND DATE_FIN >= CURDATE() ) ";
					          

					        
					            /* excute the query */
					            $sql=mysqli_query($conn,$req);

					            $row  = mysqli_fetch_array($sql);
					            echo '<tr>';
					            
					            while ($row) {

					            
					              echo "<td>".strval($row['NOM_PAT'])." ".strval($row['PRENOM_PAT'])."</td>
					          			<td>".strval($row['LIBELLE_SERVICE'])."</td>
					                  </tr>";
					              $row  = mysqli_fetch_array($sql);
					          
					            }
					           
					        ?>
					        
					      	
						</tbody>
					</table>
				</div>
			</div>
		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	

	<script src="script.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script type="text/javascript" src="Bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="Bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Bootstrap/js/parallax.js"></script>
<script type="text/javascript" src="Bootstrap/js/jquery.easypiechart.js"></script>
<script type="text/javascript" src="Bootstrap/js/typed.js"></script>
</body>
</html>