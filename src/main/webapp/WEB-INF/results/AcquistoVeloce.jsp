<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="ParteCSS/styleSito.css">
  <link rel="stylesheet" type="text/css" href="ParteCSS/Registrazione.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Acquisto Veloce</title>
  <% String x=" ";
    if(request.getAttribute("controllo")!=null)
    {
      x="Email già presente!";
    }%>
  <script>
    function validateAcquisto(){
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

      var nomeRGX=/^[a-zA-Z' ']*$/;
      var nomeCognome =document.getElementById('credenziali').value;

      if((nomeRGX.test(nomeCognome))==false){
        alert("Nome e cognome non validi!");
        return false;
      }

      var numeroCarta =document.getElementById('NCarta').value;
      var numeroCartaRGX = /^[0-9]*$/;

      if((numeroCartaRGX.test(numeroCarta)) == false){
        alert("Formato del numero carta non valido!");
        return false;
      }
      if(numeroCarta.length != 16)
      {
        alert("Dimensione del numero di carta errato!");
        return false;
      }

      var dataRGX= /^[0-9'/']*$/;
      var dataScadenza = document.getElementById('dataScadenza').value;

      const [giorno,mese,anno] = dataScadenza.split("/");
      var dataScadenzaCarta=new Date(anno,mese,giorno);

      if(dataScadenzaCarta<(new Date())){
        alert("La carta di credito è scaduta");
        return false;
      }

      if((dataRGX.test(dataScadenza))==false){
        alert("Formato data errato!");
        return false;
      }

      var numeroCVV =document.getElementById('cvv').value;
      console.log(numeroCVV);
      var numeroCVVRGX = /^[0-9]*$/;

      if((numeroCVVRGX.test(numeroCVV)) == false){
        alert("Formato del numero cvv non valido!");
        return false;
      }
      if(numeroCVV.length != 3)
      {
        alert("Dimensione del numero cvv errato!");
        return false;
      }
      return true;
    }
  </script>
</head>
<body>
<p style="color: red; text-align: center"><%=x%></p>
<form method="post" action="DatiAcquistoVeloceServlet">
  <table>
    <tr>
      <th>
        <label for="nome">Inserisci il nome</label><br>
        <input type="text" placeholder="Mario" name="nome" id="nome" required>

        <label for="cognome">Inserisci il cognome</label><br>
        <input type="text" placeholder="Rossi" name="cognome" id="cognome" required>

        <label for="codiceFiscale">Inserisci il codice fiscale</label><br>
        <input type="text" name="codiceFiscale" id="codiceFiscale" pattern="[A-Z0-9]{16}" required
                 placeholder="Lunghezza pari a 16 e deve contenere numeri e lettere maiuscole">

        <label for="datadiNascita">Inserisci la data di nascita</label><br>
        <input type="text" placeholder="GG/MM/AAAA" id="datadiNascita" name="datadiNascita" required>

        <label for="email">Inserisci l'email</label><br>
        <input type="email" placeholder="prova@esempio.it" name="email" id="email" required>

        <label for="passwordEmail">Inserisci la password</label><br>
        <input type="password" placeholder="Esempio2!" name="passwordEmail" id="passwordEmail" required>
      </th>
      <th>
        <label for="numeroTelefono">Inserisci il numero di cellulare</label><br>
        <input type="tel"  placeholder="3214329993" id="numeroTelefono" name="numeroTelefono" required>

        <label for="via">Inserisci la via</label><br>
        <input type="text" placeholder="Via Esempio 10" id="via" name="via" required>

        <label for="citta">Inserisci la citta'</label><br>
        <input type="text" placeholder="Salerno" id="citta" name="citta" required>

        <label for="cap">Inserisci il cap</label><br>
        <input type="text" placeholder="88001" id="cap" name="cap">

        <label for="provincia">Inserisci la provincia</label><br>
        <input type="text" id="provincia" name="provincia" pattern="[A-Z]{2}"
                   placeholder="Due caratteri in maiuscolo (ex:SA)">

        <label for="nazione">Inserisci la nazione</label><br>
        <input type="text" placeholder="Italia" id="nazione" name="nazione">
      </th>
    </tr>
    <tr>
      <th>
        <label for="credenziali">Inserire nome e cognome del titolare</label><br>
        <input type="text" placeholder="Mario Rossi" name="credenziali" id="credenziali" required><br>

        <label for="NCarta">Inserire il numero di carta</label><br>
        <input type="number" name="NCarta" id="NCarta" required><br>
      </th>
      <th>
       <label for="dataScadenza">Inserire la data di scadenza</label><br>
        <input type="text" name="dataScadenza" id="dataScadenza" required><br>

        <label for="cvv"><b>Inserisci il CVV</b></label><br>
        <input type="number" name="cvv" id="cvv" required><br>
      </th>
    </tr>
  </table>

  <button onclick="return validateAcquisto()" type="submit" class="cart">Acquista</button>
  <button type="submit" class="cart" onclick="window.location.href='HomePage'"><i class="fa fa-home"></i></button>


</form>
<br>


</body>
</html>
