<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
            padding: 50px;
        }
        .container {
            max-width: 600px;
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
        input, select {
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
        <h1>Inscription</h1>
        <form action="register.php" method="POST" enctype="multipart/form-data">
        
            <div class="form-group">
                <label for="nom">Nom</label>
                <input type="text" id="nom" name="nom" required>
            </div>
            <div class="form-group">
                <label for="prenom">Prénom</label>
                <input type="text" id="prenom" name="prenom" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="telephone">Téléphone</label>
                <input type="tel" id="telephone" name="telephone" required>
            </div>
            <div class="form-group">
                <label for="pays">Pays</label>
                <select id="pays" name="pays" required>
                    <option value="">Sélectionnez votre pays</option>
                    <option value="France">Côte d'Ivoire</option>
                    <option value="Canada">Burkina Faso</option>
                    <option value="Belgique">Mali</option>
                    <option value="Suisse">Ghana</option>
                </select>
            </div>
            <div class="form-group">
                <label for="date_inscription">Date d'inscription</label>
                <input type="date" id="date_inscription" name="date_inscription" required>
            </div>
            <div class="form-group">
                <label for="photo_profile">Photo de Profil</label>
                <input type="file" id="photo_profile" name="photo_profile" accept="image/*" required>
            </div>
            <div class="form-group">
                <label for="mdp">Mot de passe</label>
                <input type="password" id="mdp" name="mdp" required>
            </div>
            <!-- <div class="form-group">
                <label for="confirm_mdp">Confirmer Mot de passe</label>
                <input type="password" id="confirm_mdp" name="confirm_mdp" required>
            </div> -->
            <button type="submit" class="btn">S'inscrire</button>
        </form>
    </div>
</body>
</html>
