<?php 
session_start();
include"functions.php";

if($_SESSION['legitUser'] != 'qwerty'){
    die(header("location: 404.html"));
}

?>

<?php
 $dbhost = "localhost";
 $dbuser = "root";
 $pass = "";
 $db = "input_form";
 $konek = mysqli_connect($dbhost, $dbuser, $pass, $db ) or die ("gagal masuk database");
?>

 <!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Sistem Pendukung Keputusan</title>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>

<style type="text/css">
	#home{
		text-align: center;
		background-size: cover;
	}
	p{
		font-size: 20px;
	}
	
	input[type="reset"]{
	margin-bottom: 28px;
	width: 120px;
	height: 32px;
	background: #F44336;
	border: none;
	border-radius: 2px;
	color: #fff;
	font-family: sans-serif;
	text-transform: uppercase;
	transition: 0.2s ease;
	cursor: pointer;
	}
	input[type="submit"]{
	margin-bottom: 28px;
	width: 120px;
	height: 32px;
	background: #39f436;
	border: none;
	border-radius: 2px;
	color: #fff;
	font-family: sans-serif;
	text-transform: uppercase;
	transition: 0.2s ease;
	cursor: pointer;
	}
	font2{
		font-size: 17px;
		padding-left: 50px;
	}

	h1{
		text-shadow: 5px 2px blue;
	}
	a { color: inherit; }
	a:hover { color: inherit; } 

</style>
<?php
    $result = mysqli_query($conn, "SELECT DISTINCT warna_bg FROM setting_tampilan");
    $row = $result->fetch_row();
    $value = $row[0] ?? false;
?>
<body style="background: <?=$value?>;">
<?php
    $result = mysqli_query($conn, "SELECT DISTINCT link_gambar FROM setting_tampilan");
    $row = $result->fetch_row();
    $value = $row[0] ?? false;
?>
<div class="jumbotron" id='home' mb-0 style="background-image:url(<?=$value?>)">
    <div style="margin-top:60px;margin-bottom:20px;">
			<h1 class="text-light shadow-lg"><a href="index.php">Sistem Pendukung Keputusan</a></h1>
			<?php
				$result = mysqli_query($conn, "SELECT DISTINCT nama_wilayah FROM setting_tampilan");
				$row = $result->fetch_row();
				$value = $row[0] ?? false;
			?>
			<p class="h3 text-light shadow-lg" style="text-shadow: 2px 2px red;">Pemilihan Objek Pariwisata <?=$value?></p>
</div>
	</div>
  

  <nav class="navbar navbar-expand-md navbar-dark bg-dark mt-0 fixed-top">
    <div class="container">
    <a href="index.php" class="navbar-brand">SPK Wisata</a>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
        <div class="navbar-nav">
            <a href="#" class="nav-item nav-link active"></a>
            <a href="index.php" class="nav-item nav-link">Sistem Rekomendasi</a>
            <?php
            if(isset($_SESSION['legitUser'])){
              echo '<a href="admin.php" class="nav-item nav-link">Pengaturan</a>';
            }
            ?> 
        </div>
        <?php
      if(isset($_SESSION['legitUser'])){
      
      echo '<div class="navbar-nav"><a href="logout.php" class="nav-item nav-link">Logout</a></div>';
      }else{
      
        echo '<div class="navbar-nav"><a href="login_form.html" class="nav-item nav-link">Login Admin</a></div>';
   
      }
      ?>   
    </div>
</div>
</nav>
	<div class='container mt-5'>
		<p align="center"><b>Ini adalah laman khusus admin</b></p>
        		<message>
			Berikut adalah previlege admin :
        </message>
		
		<div class="main-menu mt-5">
            <a href="data_lokasi_wisata.php"><button type="button" class="btn btn-info btn-lg btn-block mt-4 mb-4">Pengaturan Data Lokasi Wisata</button></a>
            <a href="admin_page.php"><button type="button" class="btn btn-info btn-lg btn-block mt-4 mb-4">Pengaturan Kriteria SPK</button></a>
			<a href="pengaturan_tampilan.php"><button type="button" class="btn btn-info btn-lg btn-block mt-4 mb-5">Pengaturan Tampilan Web</button></a>
		</div>
 
        <table class="table">
            <thead>
                <tr>
                    <th>Nomer</th>
                    <th>No Identitas</th>
                    <th>Username</th>
                    <th>Nama Lengkap</th>
                    <th>Password</th>
                    <th>Tanggal</th>
                    <th>Jenis Kelamin</th>
                    <th>Alamat</th>
                </tr>
            </thead>
            <tbody>
            <?php 
                $result = mysqli_query($konek, "SELECT * FROM input_tabel");
                $num=1;
                while($data = mysqli_fetch_array($result)): ?>
                <tr>
                    <td><?=$num?></td>
                    <td><?=$data['No_Identitas']?></td>
                    <td><?=$data['User_Name']?></td>
                    <td><?=$data['Nama_Lengkap']?></td>
                    <td><?=$data['Password']?></td>
                    <td><?=$data['Tanggal']?></td>
                    <td><?=$data['Jenis_Kelamin']?></td>
                    <td><?=$data['Alamat']?></td>
                </tr>
                <?php $num++ ;endwhile;?>
            </tbody>
        </table>


	</div>
</body>
</html>