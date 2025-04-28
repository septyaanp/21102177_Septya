<?php
session_start();

// Cek jika user belum login, redirect ke halaman login
if (!isset($_SESSION['loggedin'])) {
    header("Location: login.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <h1>Selamat datang, <?php echo htmlspecialchars($_SESSION['username']); ?>!</h1>
    <p>Anda telah berhasil login.</p>
    <a href="logout.php">Logout</a>
</body>
</html>