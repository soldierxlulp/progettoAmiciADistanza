<%@ page import="Model.Prodotto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="ParteCSS/styleSito.css">
    <link rel="stylesheet" type="text/css" href="ParteCSS/Login.css">
    <title>Utente</title>
    <% String x=" ";
    if(request.getAttribute("parametri")!=null)
    {
        x="Email o password errati!";
    }%>
</head>
<img src="immagini/logosito.png" class="sfondo">
<body>

<table>
    <form action="LoginServlet" method="post">
        <tr>
            <th>
                <label for="email">Inserisci l'email</label><br>
                <input type="email" placeholder="Inserisci l'email" name="Email" id="email" required><br>
                <label for="password"><b>Inserisci la password</b></label><br>
                <input type="password" placeholder="Inserisci la password" name="Password" id="password" required><br>
                <button onclick="confermaParametri()" type="submit" id="submit" class="cart">Login</button>
                <p style="color: red; text-align: center"><%=x%></p>
                <br>
            </th>
        </tr>
    </form>
    <th>
        <button type="submit" class="cart"><a style="text-decoration: none; color: white; text-underline: none" href="Registrazione">Registrati</a></button>
    </th>
</table>

<script>
    function confermaParametri() {
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;
        var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var resultEmail = emailRGX.test(email);
        var passwordRGX=/^[a-zA-Z0-9!@#$%^&*]*$/;
        var resultPassword=passwordRGX.test(password);

        if (password.length < 8) {
            alert("La password non rispetta il numero minimo di caratteri");
            return false;
        }

        if (resultEmail == false) {
            alert("L'email non rispecchia il formato corretto.Riprovare");
            return false;
        }

        if (resultPassword == false) {
            alert("La password non rispecchia il formato corretto.Riprovare");
            return false;
        }
        return true;
    }
</script>



</body>
</html>