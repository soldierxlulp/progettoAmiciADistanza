<%@ page import="Model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/ParteHTML/navBarAmministratore.jsp" %>
<html>
<head>
    <%
        ArrayList<Prodotto> tuttiProdotti = (ArrayList<Prodotto>) request.getAttribute("CategorieProdotti");
    %>
    <link rel="stylesheet" type="text/css" href="ParteCSS/CategorieProdotti.css">

    <link rel="stylesheet" type="text/css" href="ParteCSS/navBarAmministratore.css">
    <title><%=request.getAttribute("Categoria")%></title>
</head>
<body>
<div class="content">
<% for (int i =0;i<tuttiProdotti.size();i++) {
    String val = tuttiProdotti.get(i).getIdProdotto().substring(3);
    int x = Integer.parseInt(val);
    String directory = "immagini/" + tuttiProdotti.get(i).getIdProdotto() + ".jpg";
    if(x>40)
    {
        directory = "immagini/fotoNonDisponibile.jpg";
    }
%>
<div class="box-container">
    <div class="box">
        <div class="image">
            <a href="CercaProdottoPerModificaServlet?search=<%=tuttiProdotti.get(i).getNomeProd()%>">
                <img src="<%=directory%>">
            </a>
        </div>
        <div class="info">
            <p><%=tuttiProdotti.get(i).getNomeProd()%></p>
            <p>Prezzo:<%=String.format("%.2f",tuttiProdotti.get(i).getPrezzo())%></p>
            <% if(tuttiProdotti.get(i).getQuantita()!=0)
            {%>
            <p>In magazzino:<%=tuttiProdotti.get(i).getQuantita()%></p>
            <%}
            else
            {%>
            <p style="color: red">Prodotto Esaurito</p>
            <%}%>
        </div>
    </div>
</div>
<%}%>
</div>
</body>
<%@ include file="/ParteHTML/footer.jsp" %>
</html>
