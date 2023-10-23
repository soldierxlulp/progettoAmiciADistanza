<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contatti</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="ParteCSS/Contatti.css">
    <script>
        $(document).ready(function(){
            $("#1").mouseenter(function () {
                $("#1").css("color","#b89068");
            });
            $("#1").mouseleave(function(){
                $("#1").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#2").mouseenter(function () {
                $("#2").css("color","#b89068");
            });
            $("#2").mouseleave(function(){
                $("#2").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#3").mouseenter(function () {
                $("#3").css("color","#b89068");
            });
            $("#3").mouseleave(function(){
                $("#3").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#4").mouseenter(function () {
                $("#4").css("color","#b89068");
            });
            $("#4").mouseleave(function(){
                $("#4").css("color", "black");
            });
        });

        $(document).ready(function(){
            $("#5").mouseenter(function () {
                $("#5").css("color","#b89068");
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
<body>
<header>
    <img src="immagini/logosito.png" alt="Amici a Distanza Logo" align="center">
</header>

<button class="cart" onclick="window.location.href='HomePage'">HomePage</button> <td><button id="chiSiamo" class="cart">Contatti</button></td>

<section id="about">
    <h2>Chi Siamo</h2>
    <p>"Amici a Distanza" è un e-commerce che offre un modo unico e coinvolgente di sostenere la conservazione degli animali in via di estinzione. La nostra missione è fornire un'opportunità concreta per contribuire alla protezione di specie preziose e aiutarle a sopravvivere nel loro habitat naturale.</p>
</section>

<section id="species">
    <h2>Le Specie</h2>
    <ol>
        <li>Orso Polare</li>
        <li>Koala</li>
        <li>Panda</li>
        <li>Tartaruga Marina</li>
        <li>Tigre</li>
    </ol>
</section>

<section id="adoptions">
    <h2>Tipi di Adozione</h2>
    <ul>
        <li>Adozione Singola: Adotta un singolo animale e contribuisci al suo benessere e alla sua protezione.</li>
        <li>Adozione Multipla: Adotta due animali di specie diverse e fai una differenza ancora più grande.</li>
    </ul>
</section>

<section id="merchandise">
    <h2>Gadget e Kit</h2>
    <ul>
        <li>Poster</li>
        <li>Peluche</li>
        <li>Tazze</li>
        <li>T-shirt</li>
    </ul>
    <p>Abbiamo fantastici <strong>Kit a Tema</strong> che includono un assortimento di gadget, uno per tipo, dedicati al tuo animale preferito.</p>
</section>

<section id="special-cases">
    <h2>Speciali Casi</h2>
    <p>Abbiamo una sezione speciale dedicata a animali con malattie particolari che necessitano di cure speciali. Qui, puoi contribuire donando per le loro cure e vedere il progresso nel raggiungimento dell'obiettivo.</p>
</section>

<section id="make-a-difference">
    <h2>Fai la Differenza Oggi</h2>
    <p>Unisciti a noi in questa importante missione per proteggere e preservare le specie in pericolo. Ogni adozione e ogni acquisto contribuisce direttamente alla conservazione degli animali e al loro habitat naturale.</p>
    <p>Insieme, possiamo fare la differenza. Diventa un Amico a Distanza oggi!</p>
</section>
<br>

    <table id="5">
        <tr>
            <th style="font-size: 2vw">Indirizzo</th>
            <th style="font-size: 2vw">Contatti Telefonici</th>
            <th style="font-size: 2vw">E-mail</th>
            <th style="font-size: 2vw">Orario</th>
        </tr>
        <tr>
            <th><p id="1">Via Giovanni II n. 132 <br> 84084 Fisciano (SA) <br> loc. campus </p></th>
            <th><p id="2">Cellulare:3477386676<br>Fisso:0813184751</p></th>
            <th><p id="3">amiciadistanza@uni.it</p></th>
            <th><p id="4">Lun - Ven 09:30 - 18:00 <br> Sabato 09:00 - 13:00 <br> Domenica chiuso</p></th>
        </tr>
    </table>

</body>
</html>
























