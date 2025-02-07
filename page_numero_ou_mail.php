<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
            padding: 50px;
        }
        .container {
            max-width: 400px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            width: 100%;
            padding: 15px;
            text-decoration: none;
            background: #007bff;
            color: white;
            font-size: 18px;
            border-radius: 5px;
            transition: 0.3s;
            cursor: pointer;
            border: none;
        }
        .btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>saisir Email ou Numéro</h1>
        <form action="login.php" method="POST">
            <div class="form-group">
                <label for="identifiant">Email ou Numéro de téléphone</label>
                <input type="text" id="identifiant" name="identifiant" required>
            </div>
            
            <button type="submit" class="btn">Envoyer</button>
        </form>
    </div>
</body>
</html>
