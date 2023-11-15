<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Prodotto" %>
<%@ include file="/ParteHTML/navBarAmministratore.jsp" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="ParteCSS/paginaProdotto.css">
    <link rel="stylesheet" type="text/css" href="ParteCSS/navBarAmministratore.css">
    <link rel="stylesheet" type="text/css" href="ParteCSS/CategorieProdotti.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <% Prodotto prodottoModifica = (Prodotto) request.getAttribute("prodottoModifica");
        String val = prodottoModifica.getIdProdotto().substring(3);
        int y = Integer.parseInt(val);
        String directory = "immagini/" + prodottoModifica.getIdProdotto() + ".jpg";
        if(y>54)
        {
            directory = "immagini/fotoNonDisponibile.jpg";
        }
    %>
    <title><%=prodottoModifica.getNomeProd()%>
    </title>
    <style>
        .box-container .box .image img{

            width: 500px;height: 500px;
            border-style: solid;
            border-width: 2px;
            filter:drop-shadow(0 3px 5px rgba(0,0,0,.7));
        }


        .dropdown button{
            width: 100%;
        }
        .box-container{
            max-width: 500px;
            margin-top: 5%;
            margin-right: auto;
            margin-left: auto;
            float: none;
        }
    </style>

    <script>

        function validatePQ(){
            var quantita=document.getElementById("quantitaTotale").value;
            var prezzo=document.getElementById("nuovoPrezzo").value;

            if(quantita==="" && prezzo==="")
            {
                console.log("ciao");
                alert("Errore quantità e prezzo devono avere un valore!");
                return false;
            }
            else if(quantita!=null && prezzo==null)
            {
                var quantitaRGX=/^[0-9]*$/;
            }
            else if(prezzo!=null && quantita==null)
            {
                var prezzoRGX=/^[0-9.]*$/;
            }
            else if(quantita!=null && prezzo!=null)
            {
                var quantitaRGX=/^[0-9]*$/;
                var prezzoRGX=/^[0-9.]*$/;
            }

            if(quantitaRGX.test(quantita)==false){
                alert("Errore nel definire la nuova quantità");
                return false;
            }
            if(prezzoRGX.test(prezzo)==false){
                alert("Errore nel definire il nuovo valore del prezzo");
                return false;
            }
            return true;
        }

    </script>
    <style>
        @media screen and (max-width: 1100px) {
            .topnav a:not(:first-child), .dropdown .dropbtn {
                display: none;
            }
            .topnav a.icon {
                float: right;
                display: block;
            }
            .topnav .search-container{
                float: left;
            }
        }

        @media screen and (max-width: 1100px) {
            #tabella{
                left: 7%;
                top: 80%;
            }
            .topnav.responsive {position: relative;}
            .topnav.responsive .icon {
                position: absolute;
                right: 0;
                top: 0;
            }
            .topnav.responsive a {
                float: none;
                display: block;
                text-align: left;
            }
            .topnav.responsive .dropdown {float: none;}
            .topnav.responsive .dropdown-content {position: relative;}
            .topnav.responsive .dropdown .dropbtn {
                display: block;
                width: 100%;
                text-align: left;
            }
        }

        @media screen and (max-width: 500px) {
            #tabella{
                left: 7%;
                top: 70%;
            }
        }

    </style>
</head>
<body>
<div class="box-container-prodotto">
    <div class="box-prodotto">
        <h1><%=prodottoModifica.getNomeProd()%></h1>
        <div class="image">

            <center><img style="border-style: solid;border-width: 2px;" src="<%=directory%>"></center>
        </div>
        <center>
            <p><b>Quantità disponibile:<%=prodottoModifica.getQuantita()%></b></p>
            <p><b>Prezzo Attuale: <%=prodottoModifica.getPrezzo()%>€</b></p>
        </center>

    <table  id="tabella"  class="table-prodotto">
        <tr>
            <th>
                <% HttpSession sessionPrezzo= request.getSession();
                    sessionPrezzo.setAttribute("idModificaPrezzo",prodottoModifica);
                %>
                <h1><%=prodottoModifica.getNomeProd()%></h1>
            </th>
        </tr>
        <th>
            <form action="ModificaProdottiServletAmministratore">
                <label>Inserisci nuovo prezzo:</label>
                <input type="text" id="nuovoPrezzo" name="nuovoPrezzo">
              <br>  <label>Inserisci la quantità:</label>
                <input type="text" id="quantitaTotale" name="quantitaTotale">
                <button type="submit" onclick="return(validatePQ())" class="cart">Premi</button>
            </form>
            <tr>
                <th>
                    <label></label>
                    <button class="cart" onclick="window.location.href='RimuoviProdottoServlet'"><i class="fa fa-trash-o"></i></button>
                </th>
            </tr>
        </th>
        <tr>
            <td>
                <button class="cart" onclick="window.location.href='HomeServletAmministratore'"><i class="fa fa-home"></i></button>
            </td>
        </tr>
    </table>
    </div>
</div>
</body>
<%@ include file="/ParteHTML/footer.jsp" %>
</html>
