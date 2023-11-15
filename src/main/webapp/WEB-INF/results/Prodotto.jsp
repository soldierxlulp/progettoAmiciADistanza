<%@ page import="Model.Prodotto" %>
<%@ page import="Model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/ParteHTML/navBar.jsp" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="ParteCSS/paginaProdotto.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%
        Utente u = (Utente) session.getAttribute("Utente");
        Prodotto p = (Prodotto) request.getAttribute("prodotto");
        String val = p.getIdProdotto().substring(3);
        int y = Integer.parseInt(val);
        String directory = "immagini/" + p.getIdProdotto() + ".jpg";
        if(y>40)
        {
            directory = "immagini/fotoNonDisponibile.jpg";
        }
    %>
    <title><%=p.getNomeProd()%></title>
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

</head>
<body>

<div class="box-container-prodotto" >
    <div class="box-prodotto">
        <h1> <%=p.getNomeProd()%>
        </h1>
        <div class="image">
            <center><img src="<%=directory%>" style="width: 300px;height: 300px;"></center>
        </div>
        <div class="info">
            <p><%= p.getDescrizione() %>
            </p>
            <p>Quantità disponibile:<%=p.getQuantita()%>
            </p>

            <b><p>Le consegne sono previste per un limite dai 7 ai 30 giorni lavorativi</p></b>
        </div>
    </div>
    <table class="table-prodotto">
        <tr>
            <th>
                <h1> <%=p.getNomeProd()%>
                </h1>
                <h2><%=p.getPrezzo()%>€</h2>
            </th>
        </tr>
        <% if (p.getQuantita() == 0) {%>
        <th>
            <p style="color: red">Prodotto non disponibile</p>
        </th>
        <%} else {
            if(u==null){ %>
                <th>
                    <form action="CarrelloServlet">

                        <% if (p.getQuantita() == 0) {
                          %>
                        <%} else { %>
                        <label>Seleziona quantità:</label>
                        <select name="quantita" id="quantita">
                            <% for (int i = 1; i <= p.getQuantita(); i++) {
                                if (p.getQuantita() != 0) {%>
                            <option value="<%=i%>"><%=i%>
                            </option>
                            <%}%>
                            <%}%>
                        </select>
                        <button class="cart" type="submit"><i class="fa fa-shopping-cart"></i></button>
                      <%  }%>
                    </form>
                </th>
                <tr>
                    <th>
                    <form action="CarrelloVeloceServlet">
                        <% if (p.getQuantita() == 0) {
                        %>
                        <%} else { %>
                        <label>Seleziona quantità:</label>
                        <select name="quantita" id="quantita">
                            <% for (int i = 1; i <= p.getQuantita(); i++) {
                                if (p.getQuantita() != 0) {%>
                            <option value="<%=i%>"><%=i%>
                            </option>
                            <%}%>
                            <%}%>
                        </select>
                        <button class="cart" type="submit">Acquisto Veloce</button>
                        <%  }%>
                    </form>
                    </th>
                </tr>
            <%} else {%>
                <th>
                    <form action="CarrelloServlet">

                        <% if (p.getQuantita() == 0) {
                        %>
                        <%} else { %>
                        <label>Seleziona quantità:</label>
                        <select name="quantita" id="quantita">
                            <% for (int i = 1; i <= p.getQuantita(); i++) {
                                if (p.getQuantita() != 0) {%>
                            <option value="<%=i%>"><%=i%>
                            </option>
                            <%}%>
                            <%}%>
                        </select>
                        <button class="cart" type="submit"><i class="fa fa-shopping-cart"></i></button>
                        <%  }%>
                    </form>
                </th>
             <%}%>
        <%}%>
        <tr>
            <td>
                <a style="text-decoration: none; color: white; text-underline: none" href="HomePage"> <button class="cart"><i class="fa fa-home"></i></button></a>
            </td>
        </tr>
    </table>
</div>
</body>
<%@ include file="/ParteHTML/footer.jsp" %>
</html>