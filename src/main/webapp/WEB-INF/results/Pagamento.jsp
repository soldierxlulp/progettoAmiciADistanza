<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Metodo di pagamento</title>
    <link rel="stylesheet" type="text/css" href="ParteCSS/PagamentoProdotti.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>
        function confermaParametri(){
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
            alert("Pagamento effettuato con successo");
            return true;
        }
    </script>
</head>
<body>
<form method="post" action="DatiPagamentoServlet">
<table>
        <tr>
            <th>
                <label for="credenziali">Inserire nome e cognome del titolare</label><br>
                <input type="text"  name="credenziali" id="credenziali" required><br>
                <label for="NCarta"><b>Inserire il numero di carta</b></label><br>
                <input type="number" name="NCarta" id="NCarta" required><br>
                <label for="dataScadenza"><b>Inserire la data di scadenza</b></label><br>
                <input type="text" name="dataScadenza" id="dataScadenza" required><br>
                <label for="cvv"><b>Inserisci il CVV</b></label><br>
                <input type="number" name="cvv" id="cvv" required><br>
                <br>
            </th>
        </tr>
    <th>
        <button onclick="return confermaParametri()" type="submit" class="cart"><i class="fa fa-credit-card"></i></button>
        <button type="submit" class="cart" onclick="window.location.href='HomePage'"><i class="fa fa-home"></i></button>
    </th>
</table>
</form>
</body>
</html>
