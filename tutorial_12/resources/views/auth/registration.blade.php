<!DOCTYPE html>
<html>
<head>
    <title>Registrasi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .registration-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-table {
            width: 100%;
        }
        .form-table td {
            padding: 8px 0;
        }
        .form-label {
            width: 30%;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="registration-container">
            <h1 class="text-center mb-4">Registrasi</h1>
            
            @if(session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif

            <form method="POST" action="/register">
                @csrf
                <table class="form-table">
                    <tr>
                        <td class="form-label"><label for="name">Nama</label></td>
                        <td><input type="text" class="form-control" id="name" name="name" required></td>
                    </tr>
                    <tr>
                        <td class="form-label"><label for="email">Email</label></td>
                        <td><input type="email" class="form-control" id="email" name="email" required></td>
                    </tr>
                    <tr>
                        <td class="form-label"><label for="password">Password</label></td>
                        <td><input type="password" class="form-control" id="password" name="password" required></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center pt-3">
                            <button type="submit" class="btn btn-primary w-100">Register</button>
                        </td>
                    </tr>
                </table>
            </form>

            <p class="mt-3 text-center">Sudah punya akun? <a href="/login">Login</a></p>
        </div>
    </div>
</body>
</html>