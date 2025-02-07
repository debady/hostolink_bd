<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page d'Accueil</title>
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
        .btn {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 15px;
            text-decoration: none;
            background: #007bff;
            color: white;
            font-size: 18px;
            border-radius: 5px;
            transition: 0.3s;
        }
        .btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Bienvenue sur notre site</h1>
        <p>Choisissez une section :</p>
        <a href="page1.html" class="btn">Page 1</a>
        <a href="page2.html" class="btn">Page 2</a>
        <a href="page3.html" class="btn">Page 3</a>
        <a href="contact.html" class="btn">Contact</a>
    </div>
</body>
</html>
