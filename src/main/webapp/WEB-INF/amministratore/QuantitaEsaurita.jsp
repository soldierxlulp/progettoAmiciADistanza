<%@ page import="Model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/ParteHTML/navBarAmministratore.jsp" %>
<html>
<head>
    <title>Prodotti esauriti</title>
    <%
        ArrayList<Prodotto> prodEsauriti = (ArrayList<Prodotto>) request.getAttribute("prodottiEsauriti");
    %>
   <link rel="stylesheet" type="text/css" href="ParteCSS/CategorieProdotti.css">
</head>
<body>
<div class="content">
<% if(prodEsauriti.size()==0){%>
    <h1>Nessun prodotto esaurito</h1>
<%}
    for (int i =0;i<prodEsauriti.size();i++) {
    String val = prodEsauriti.get(i).getIdProdotto().substring(3);
    int x = Integer.parseInt(val);
    String directory = "immagini/" + prodEsauriti.get(i).getIdProdotto() + ".jpg";
    if(x>40)
    {
        directory = "immagini/fotoNonDisponibile.jpg";
    }
%>
<div class="box-container">
    <div class="box">
        <div class="image">
            <a href="CercaProdottoPerModificaServlet?search=<%=prodEsauriti.get(i).getNomeProd()%>">
                <img src="<%=directory%>">
            </a>
        </div>
        <div class="info">
            <p><%=prodEsauriti.get(i).getNomeProd()%></p>
            <p>Prezzo:<%=prodEsauriti.get(i).getPrezzo()%></p>
            <p style="color: red">Prodotto Esaurito</p>
        </div>
    </div>
</div>
<%}%>
</div>
</body>
<%@ include file="/ParteHTML/footer.jsp" %>
</html>
