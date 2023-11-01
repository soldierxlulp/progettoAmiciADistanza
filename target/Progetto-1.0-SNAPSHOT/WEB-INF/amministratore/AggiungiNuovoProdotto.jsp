<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Aggiunta nuovo prodotto</title>
    <link rel="stylesheet" type="text/css" href="ParteCSS/AggiuntaProdotto.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>
        function validateNewProduct(){
            var idProdotto=document.getElementById('idProdotto').value;
            var idProdottoRGX=/^[A-Z0-9]*$/;
            var nomeProdotto=document.getElementById('nomeProdotto').value;
            var nomeProdottoRGX=/^[a-zA-Z' ']*$/;
            var prezzo=document.getElementById('prezzo').value;
            var prezzoRGX=/^[0-9'.']*$/;
            var quantita=document.getElementById('quantita').value;
            var quantitaRGX=/^[0-9]*$/;
            var numProdotto=idProdotto.substring(3);
            console.log(numProdotto)
            if(numProdotto<=40){
                alert("Errore nella definizione del valore dell'ID");
                return false;
            }

            if(idProdottoRGX.test(idProdotto)==false){
                alert("Errore nella definizione dell'ID");
                return false;
            }

            if(nomeProdottoRGX.test(nomeProdotto)==false){
                alert("Errore nella definizione del nome");
                return false;
            }


            if(prezzoRGX.test(prezzo)==false){
                alert("Errore nella definizione del prezzo");
                return false;
            }

            if(quantitaRGX.test(quantita)==false){
                alert("Errore nella definizione della quantita");
                return false;
            }


            return true;

        }
    </script>
    <style>
        @media screen and (max-width: 1920px) {
            textarea{
                width: 80%;
            }
        }
        table {
            border: 3px solid saddlebrown;
            padding: 5px;
            border-collapse: collapse;
            margin-left: auto;
            margin-right: auto;
            margin-top: 5%;
            width: 50%;
            background-color: #f7dda4;
        }
    </style>
</head>
<body>
<form method="post" action="AggiuntaProdottoServlet">
    <table>
        <tr>
            <th class="inserimento1">
                <label>Id disponibili:</label><br>
                <label>SA-singola adozione, MA-multipla adozione, PE-peluche, ZA-tazza, OS-poster, TS-tshirt, KT-kit, AL-special </label><br>
                <label for="idProdotto">Inserisci l'id del prodotto:</label>
                <input type="text" name="idProdotto" id="idProdotto" required> <br>

                <label>Scegli la categoria del prodotto:</label>
                <select name="nomeCategoria">
                    <option id="AdozioneSingola"> Adozione Singola </option>
                    <option id="AdozioneMultipla"> Adozione Multipla </option>
                    <option id="Peluche"> Peluche </option>
                    <option id="Tazza"> Tazza</option>
                    <option id="Poster"> Poster </option>
                    <option id="Tshirt"> Tshirt </option>
                    <option id="Kit"> Kit </option>
                    <option id="Special"> Special </option>

                </select><br>
                <label for="nomeProdotto">Inserisci il nome del prodotto</label>
                <input type="text" name="nomeProdotto" id="nomeProdotto" required><br>
                <label for="descrizione">Inserisci la descrizione del prodotto:</label>
                <textarea type="text" name="descrizione" id="descrizione" rows="4" cols="80"></textarea><br>
                <label for="prezzo">Inserisci il prezzo</label>
                <input  type="text" name="prezzo" id="prezzo"><br>
                <label for="quantita">Inserisci la quantità</label>
                <input type="text" name="quantita" id="quantita"><br>
            </th>

        </tr>
    </table>
    <button onclick="return(validateNewProduct())" type="submit" class="cart"><i class="fa fa-cart-plus"></i></button>
    <button onclick="window.location.href='HomeServletAmministratore'" type="submit" class="cart"><i class="fa fa-home"></i></button>
</form>
</body>
</html>
