<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contatti</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="ParteCSS/Contatti.css">
    <link rel="stylesheet" type="text/css" href="ParteCSS/styleSito.css">
    <script>
        $(document).ready(function(){
            $("#1").mouseenter(function () {
                $("#1").css("color","white");
            });
            $("#1").mouseleave(function(){
                $("#1").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#2").mouseenter(function () {
                $("#2").css("color","white");
            });
            $("#2").mouseleave(function(){
                $("#2").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#3").mouseenter(function () {
                $("#3").css("color","white");
            });
            $("#3").mouseleave(function(){
                $("#3").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#4").mouseenter(function () {
                $("#4").css("color","white");
            });
            $("#4").mouseleave(function(){
                $("#4").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#5").mouseenter(function () {
                $("#5").css("color","white");
            });
            $("#5").mouseleave(function(){
                $("#5").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#5").css("display","none");
            $("#5").css("color","transparent");
        });

        $(document).ready(function(){
            $("#chiSiamo").click(function(){
                $("#5").slideToggle("slow");
                $("#5").css("color","black");
                $("#5").css("font-weight","bold");
            });
        });

    </script>
</head>
<a href="HomePage"><img src="immagini/logosito.png" class="sfondo logo"> </a>
<body>

<table>
    <tr>
        <th style="font-size: 2vw">Indirizzo:</th>
        <th style="font-size: 2vw">Contatti Telefonici:</th>
        <th style="font-size: 2vw">E-mail:</th>
        <th style="font-size: 2vw">Orario:</th>
    </tr>
    <tr>
        <th><p id="1">Via Giovanni Paolo II <br> 80080 Fisciano (SA) <br> loc. campus</p></th>
        <th><p id="2">Cellulare:3477386676<br>Fisso:0813184751</p></th>
        <th><p id="3">amiciadistanza@uni.it</p></th>
        <th><p id="4">Lun - Ven 09:30 - 18:00 <br> Sabato 09:00 - 13:00 <br> Domenica chiuso</p></th>
        <td><button id="chiSiamo" class="cart">Chi siamo</button></td>
        <td><button class="cart" onclick="window.location.href='HomePage'">HomePage</button></td>
    </tr>
</table>
<p id="5">"Amici a Distanza" è un e-commerce che offre un modo unico e coinvolgente di sostenere la conservazione degli animali in via di estinzione.
    <br>La nostra missione è fornire un'opportunità concreta per contribuire alla protezione di specie preziose e aiutarle a sopravvivere nel loro habitat naturale.
    <br>Unisciti a noi in questa importante missione per proteggere e preservare le specie in pericolo. Ogni adozione e ogni acquisto contribuisce direttamente alla conservazione degli animali e al loro habitat naturale.
    <br>Insieme, possiamo fare la differenza. Diventa un Amico a Distanza oggi!
</p>
</body>
<%@ include file="/ParteHTML/footer.jsp" %>
</html>
