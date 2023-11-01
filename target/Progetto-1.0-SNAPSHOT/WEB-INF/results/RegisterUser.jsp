<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="ParteCSS/styleSito.css">
    <link rel="stylesheet" type="text/css" href="ParteCSS/Registrazione.css">
    <title>Registrazione</title>
    <% String x=" ";
        if(request.getAttribute("controllo")!=null)
        {
            x="Email già presente!";
        }%>
    <script>
        function validateRegistrazione(){
            var email = document.getElementById('email').value;
            var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if((emailRGX.test(email)==false)){
                alert("Formato email non valido!");
                return false;
            }

            var passwordRGX=/^[a-zA-Z0-9!@?]*$/;
            var password = document.getElementById('passwordEmail').value;
            if((passwordRGX.test(password))==false){
                alert("Caratteri password non validi!");
                return false;
            }
            if((password.length<8 ||password.length>30 ))
            {
                alert("Dimensione password non valida!");
                return false;
            }

            var nomeRGX=/^[a-zA-Z' ']*$/;
            var nome=document.getElementById('nome').value;

            if((nomeRGX.test(nome))==false){
                alert("Nome non valido!");
                return false;
            }

            var cognomeRGX=/^[a-zA-Z' ']*$/;
            var cognome=document.getElementById('cognome').value;
            if((cognomeRGX.test(cognome))==false){
                alert("Cognome non valido!");
                return false;
            }

            var dataRGX=/^[0-9'/']*$/;
            var data=document.getElementById('datadiNascita').value;
            if((dataRGX.test(data))==false){
                alert("Formato data errato!");
                return false;
            }

            var numeroTelefono=document.getElementById('numeroTelefono').value;
            var numeroTelefonoRGX = /^[0-9]*$/;
            if((numeroTelefonoRGX.test(numeroTelefono)) == false){
                alert("Formato del numero di telefono errato!");
                return false;
            }
            if(numeroTelefono.length!=10)
            {
                alert("Dimensione del numero di telefono errata!");
                return false;
            }


            var codiceFiscale=document.getElementById('codiceFiscale').value;
            var codiceFiscaleRGX=/^[A-Z0-9]*$/;
            if((codiceFiscaleRGX.test(codiceFiscale))==false){
                alert("Codice fiscale non valido!");
                return false;
            }
            if(codiceFiscale.length != 16){
                alert("Dimensione del codice fiscale errata!");
                return false;
            }

            var citta=document.getElementById('citta').value;
            var cittaRGX=/^[A-Za-zìòàèéù' ']*$/;
            if((cittaRGX.test(citta))==false)
            {
                alert("Nome citta' errato!");
                return false;
            }

            var cap=document.getElementById('cap').value;
            var capRGX= /^[0-9]*$/;
            if((capRGX.test(cap))==false){
                alert("Formato del cap errato!");
                return false
            }
            if(cap.length!=5){
                alert("Dimensione cap errato");
                return false;
            }

            var provincia = document.getElementById('provincia').value;
            var provinciaRGX = /^[A-Z]*$/;
            if((provinciaRGX.test(provincia)) == false){
                alert("La provincia inserita non e' corretta");
                return false;
            }
            if(provincia.length != 2){
                alert("La provincia non rispetta la lunghezza richiesta");
                return false;
            }

            var nazione = document.getElementById('nazione').value;
            var nazioneRGX=/^[A-Za-z]*$/;
            if((nazioneRGX.test(nazione ))==false)
            {
                alert("Nome nazione errato!");
                return false;
            }

            return true;
        }

    </script>
</head>
<body>
<a href="/Progetto_war/HomePage"><img src="immagini/logosito.png" class="sfondo"> </a>
<form method="post" action="RegistrazioneServlet">
    <table>
        <tr>
            <th>
                <label for="nome">Inserisci il nome</label><br>
                <input type="text" placeholder="Mario" name="nome" id="nome" required><br>
                <label for="cognome">Inserisci il cognome</label><br>
                <input type="text" placeholder="Rossi" name="cognome" id="cognome" required><br>
                <label for="codiceFiscale">Inserisci il codice fiscale</label><br>
                <input type="text" name="codiceFiscale" id="codiceFiscale" pattern="[A-Z0-9]{16}" required
                       title="Il codice fiscale deve avere lunghezza pari a 16 e deve contenere numeri e lettere maiuscole"><br>
                <label for="datadiNascita">Inserisci la data di nascita</label><br>
                <input type="text" placeholder="GG/MM/AAAA" id="datadiNascita" name="datadiNascita" required><br>
                <label for="email">Inserisci l'email</label><br>
                <input type="email" placeholder="prova@esempio.it" name="email" id="email" required><br>
                <label for="passwordEmail">Inserisci la password</label><br>
                <input type="password" placeholder="Esempio2!" name="passwordEmail" id="passwordEmail" required ><br>
            </th>
            <th>
                <label for="numeroTelefono">Inserisci il numero di cellulare</label><br>
                <input type="tel"  id="numeroTelefono" name="numeroTelefono" required><br>
                <label for="via">Inserisci la via</label><br>
                <input type="text" placeholder="Via Esempio 10" id="via" name="via" required><br>
                <label for="citta">Inserisci la citta'</label><br>
                <input type="text" id="citta" name="citta" required><br>
                <label for="cap">Inserisci il cap</label><br>
                <input type="text" id="cap" name="cap"><br>
                <label for="provincia">Inserisci la provincia</label><br>
                <input type="text" id="provincia" name="provincia" pattern="[A-Z]{2}"
                       title="Inserire due caratteri in maiuscolo per la rappresentazione della provincia"><br>
                <label for="nazione">Inserisci la nazione</label><br>
                <input type="text" placeholder="Italia" id="nazione" name="nazione"><br>
            </th>
        </tr>
    </table>
    <button onclick="return(validateRegistrazione())" type="submit" class="cart">Registrati</button>
    <p style="color: red; text-align: center"><%=x%></p>
</form>
<br>

</body>
</html>


