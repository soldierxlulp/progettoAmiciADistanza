drop database if exists amiciadistanza;
create database amiciadistanza;
use amiciadistanza;

CREATE TABLE Cliente(
                        email varchar(50) primary key,
                        passwordEmail varchar(100) not null,
                        nome varchar(30) not null,
                        cognome varchar(30) not null,
                        dataDiNascita char(10) not null,
                        numeroTelefono char(10) not null,
                        codiceFiscale char(16) not null,
                        via varchar(300) not null,
                        citta varchar(50) not null,
                        cap char(5) not null,
                        provincia char(2) not null,
                        nazione char(20) not null,
                        amministratore boolean
);

CREATE TABLE Prodotto(
                         idProdotto char(5) primary key,
                         nomeCategoria varchar(30),
                         nomeProd varchar(70) not null,
                         descrizione text not null,
                         prezzo double not null,
                         quantita int not null
);

CREATE TABLE Acquistare(
                           emailCliente char(50) references Cliente(email),
                           idProdotto char(5) references Prodotto(idProdotto),
                           quantitaAcquistata int
);

CREATE TABLE CartaDiCredito(
                               numeroCarta varchar(16) primary key,
                               nomeIntestatario varchar(30) not null,
                               dataScadenza char(10) not null,
                               CVV char(3) not null,
                               emailProprietario char(50) references Cliente(email)
);

INSERT INTO Cliente VALUES
                        ("admin@gmail.com",SHA1("admin001"),"Nome","Cognome","2023-01-01","1234567890","ABCDE25F67G160H","Indirizzo, civico","Città","12345","SA","Italia",1),
                        ("cliente1@gmail.com",SHA1("Cliente1"),"Vito","Bocchile","1999-12-02","1234567890","ABCDE25F67G160H","via Kennedy, 30","Fisciano","12345","SA","Italia",0),
                        ("cliente2@gmail.com",SHA1("Cliente2"),"Ilaria","Vitillo","1999-11-22","1234567890","ABCDE25F67G160H","via Monte, 3","Irpinia","12345","AV","Italia",0),
                        ("cliente3@gmail.com",SHA1("Cliente3"),"Alessia","Policastro","1998-07-17","1234567890","ABCDE25F67G160H","via Vico, 15","Salerno","12345","SA","Italia",0);

insert INTO Prodotto values
                         ("SA001","AdozioneSingola","Orso Polare","Gli orsi polari, con la loro maestosa bellezza e la straordinaria adattabilità all'ambiente artico, sono simboli di forza e resistenza. Sono i predatori più grandi del Polo Nord e si sono adattati perfettamente a questo ambiente estremo, con il loro spesso mantello di pelo bianco e una struttura corporea robusta che li aiuta a sopravvivere nelle gelide temperature dell'Artico. Unisciti a noi nella missione di salvare gli orsi polari e il loro prezioso habitat. Adotta un orso polare oggi e fai la differenza nel futuro di questa specie iconica.",15.00,20),
                         ("SA002","AdozioneSingola","Koala","I koala sono creature affascinanti originarie dell'Australia, noti per la loro dolcezza e il loro amore per gli alberi di eucalipto. Con il loro aspetto rotondo e gli occhi curiosi, i koala hanno conquistato il cuore di persone in tutto il mondo. Unisciti a noi nella missione di proteggere i koala e le loro amate foreste di eucalipto. Adotta un koala oggi e fai la differenza nel futuro di questa specie iconica.",15.00,20),
                         ("SA003","AdozioneSingola","Panda","I panda giganti sono tesori viventi della Cina e rappresentano una delle specie più iconiche al mondo. Con il loro pelo bianco e nero e il loro aspetto dolce, i panda hanno un posto speciale nei cuori di molte persone. Unisciti a noi nella missione di salvaguardare i panda giganti e il loro prezioso habitat. Adotta un panda gigante oggi e fai la differenza nel futuro di questa specie iconica.",15.00,20),
                         ("SA004","AdozioneSingola","Tartaruga Marina","Le tartarughe marine sono creature maestose che popolano i nostri oceani da milioni di anni. Con le loro forme eleganti e le abitudini migratorie straordinarie, queste tartarughe sono simboli di resistenza e adattabilità in un mondo marino sempre più minacciato. Unisciti a noi nella missione di salvare le tartarughe marine e gli ecosistemi oceanici che chiamano casa. Adotta una tartaruga marina oggi e fai la differenza nel futuro di questa specie iconica.",15.00,20),
                         ("SA005","AdozioneSingola","Tigre","Le tigri sono tra le creature più magnifiche e maestose del regno animale. Con la loro potenza, agilità e bellezza ineguagliabile, le tigri sono simboli di forza e libertà, ma purtroppo, sono anche una specie gravemente minacciata. Unisciti a noi nella missione di salvare le tigri e gli ecosistemi terrestri che chiamano casa. Adotta una tigre oggi e fai la differenza nel futuro di questa specie iconica.",15.00,20),

                         ("MA001","Adozione Multipla","Pacchetto: Guardiani del Polo Nord (Orso polare - Foca dell'Artico)","Unisciti a noi nella missione di proteggere gli abitanti del Polo Nord con il nostro pacchetto: Guardiani del Polo Nord. Con l'adozione di un Orso Polare e di una Foca dell'Artico, stai contribuendo direttamente alla conservazione di queste icone dell'Artico e del loro prezioso habitat. Riceverai aggiornamenti regolari su entrambi gli animali, foto esclusive e altre ricompense personalizzate che ti permetteranno di seguire il tuo contributo alla loro protezione.",28.00,10),
                         ("MA002","Adozione Multipla","Pacchetto: Tesori dell'Australia (Koala - Tartaruga Marina)","Esplora la ricca diversità della fauna australiana con il nostro pacchetto: Tesori dell'Australia. Con l'adozione di un Koala e di una Tartaruga Marina, stai sostenendo gli sforzi per la protezione di queste specie uniche e dei loro preziosi habitat. Riceverai aggiornamenti regolari su entrambi gli animali, foto esclusive e altre ricompense personalizzate che ti permetteranno di seguire il tuo contributo alla loro protezione.",28.00,10),
                         ("MA003","Adozione Multipla","Pacchetto: Maestà della giungla (Tigre - Panda)","Entra in contatto con la maestà della natura con il nostro pacchetto: Maestà della Giungla. Con l'adozione di una Tigre e di un Panda Gigante, stai contribuendo a preservare alcune delle specie più iconiche della terra e a proteggere i loro preziosi ecosistemi. Riceverai aggiornamenti regolari su entrambi gli animali, foto esclusive e altre ricompense personalizzate che ti permetteranno di seguire il tuo contributo alla loro protezione.",28.00,10),
                         ("MA004","Adozione Multipla","Pacchetto: Sogno Artico (Orso polare - tartaruga marina)","Immergiti nell'atmosfera magica dell'Artico con il nostro pacchetto: Sogno Artico. Con l'adozione di un Orso Polare e di una Tartaruga Marina, stai contribuendo a preservare due delle creature più iconiche degli estremi del nostro pianeta. Riceverai aggiornamenti regolari su entrambi gli animali, foto esclusive e altre ricompense personalizzate che ti permetteranno di seguire il tuo contributo alla loro protezione.",28.00,10),
                         ("MA005","Adozione Multipla","Pacchetto: Riserva di Biodiversità (Koala - Tigre)","Esplora la diversità della vita selvatica con il nostro pacchetto: Riserva di Biodiversità. Con l'adozione di un Koala e di una Tigre, stai sostenendo la conservazione di due specie uniche e importanti in modi molto diversi. Riceverai aggiornamenti regolari su entrambi gli animali, foto esclusive e altre ricompense personalizzate che ti permetteranno di seguire il tuo contributo alla loro protezione.",28.00,10),

                         ("PE001","Peluche","Peluche Orso Polare", "Porta a casa il tuo nuovo amico, il peluche dell'orso polare, e abbraccia la magia dell'Artico ogni giorno! Realizzato con materiali morbidi e di alta qualità, questo peluche cattura la dolcezza e la maestosità di questi incredibili abitanti del Polo Nord. Ogni acquisto di questo peluche supporta direttamente i programmi di conservazione dedicati alla protezione degli orsi polari e del loro prezioso habitat. Con il tuo contributo, diventi parte di una missione globale per preservare questa specie iconica.", 10.00,30),
                         ("PE002","Peluche","Peluche Koala", "Porta a casa il tuo adorabile amico, il peluche del koala, e avvolgiti nella dolcezza di questa iconica creatura australiana! Realizzato con materiali di alta qualità, questo peluche cattura l'adorabile personalità di uno dei marsupiali più amati al mondo. Ogni acquisto di questo peluche sostiene direttamente i programmi di conservazione dedicati alla protezione dei koala e delle loro preziose foreste di eucalipto. Con il tuo contributo, diventi parte di una missione globale per preservare questa specie straordinaria.", 10.00,30),
                         ("PE003","Peluche","Peluche Panda", "Porta a casa il tuo tenero amico, il peluche del panda, e immergiti nella dolcezza e nella maestosità di questa iconica creatura asiatica! Realizzato con materiali di alta qualità, questo peluche cattura la grazia e l'adorabilità di uno degli animali più amati al mondo. Ogni acquisto di questo peluche contribuisce direttamente ai programmi di conservazione dedicati alla protezione dei panda e dei loro preziosi habitat. Con il tuo contributo, diventi parte di una missione globale per preservare questa specie straordinaria.", 10.00,30),
                         ("PE004","Peluche","Peluche Tartaruga Marina", "Porta a casa la magia degli oceani con il tuo nuovo amico, il peluche della tartaruga marina! Realizzato con materiali morbidi e di alta qualità, questo peluche cattura la grazia e la meraviglia di una delle creature più affascinanti degli abissi. Ogni acquisto di questo peluche sostiene direttamente i programmi di conservazione dedicati alla protezione delle tartarughe marine e dei loro preziosi habitat oceanici. Con il tuo contributo, diventi parte di una missione globale per preservare questa specie straordinaria.", 10.00,30),
                         ("PE005","Peluche","Peluche Tigre", "Porta a casa la maestosità della giungla con il tuo nuovo amico, il peluche della tigre! Realizzato con materiali di alta qualità, questo peluche cattura la potenza e la grazia di una delle creature più iconiche del regno animale. Ogni acquisto di questo peluche contribuisce direttamente ai programmi di conservazione dedicati alla protezione delle tigri e dei loro preziosi ecosistemi. Con il tuo contributo, diventi parte di una missione globale per preservare questa specie straordinaria.", 10.00,30),

                         ("ZA001","Tazza","Tazza Orso Polare","Aggiungi un tocco di maestosità artica alla tua routine con la tazza dell'Orso Polare. Realizzata con materiali di alta qualità, questa tazza presenta un design che cattura la grandezza e la bellezza di uno degli animali più iconici del Polo Nord. Ogni acquisto contribuisce direttamente ai programmi di conservazione dedicati alla protezione degli Orsi Polari e del loro prezioso habitat. Aggiungi un tocco di forza e impegno ambientale alla tua giornata con la tazza Orso Polare!",9.00,10),
                         ("ZA002","Tazza","Tazza Koala","Inizia la giornata con una tazza che cattura la dolcezza del Koala, uno degli animali più amati dell'Australia! Realizzata con materiali di alta qualità, questa tazza presenta un design adorabile che ti accompagnerà nelle tue colazioni e pause caffè. Ogni acquisto contribuisce direttamente ai programmi di conservazione dedicati alla protezione dei Koala e delle loro preziose foreste di eucalipto. Aggiungi un tocco di dolcezza a casa tua con la tazza Koala!",9.00,10),
                         ("ZA003","Tazza","Tazza Panda","Porta a casa un'icona di conservazione con la tazza del Panda! Realizzata con materiali di alta qualità, questa tazza presenta un design che cattura l'adorabilità di uno degli animali più amati al mondo. Ogni acquisto contribuisce direttamente ai programmi di conservazione dedicati alla protezione dei Panda e dei loro preziosi habitat. Aggiungi un tocco di dolcezza e impegno ambientale alla tua routine quotidiana con la tazza Panda!",9.00,10),
                         ("ZA004","Tazza","Tazza Tartaruga Marina","Porta un po' di magia degli oceani nella tua casa con la tazza della Tartaruga Marina. Realizzata con materiali di alta qualità, questa tazza presenta un design che cattura la grazia e la meraviglia di una delle creature più affascinanti degli abissi. Ogni acquisto contribuisce direttamente ai programmi di conservazione dedicati alla protezione delle Tartarughe Marine e dei loro preziosi habitat oceanici. Aggiungi un tocco di consapevolezza ambientale alla tua routine quotidiana con la tazza Tartaruga Marina!",9.00,10),
                         ("ZA005","Tazza","Tazza Tigre","Prendi una pausa con la tazza della Tigre e immergiti nella maestosità della giungla. Realizzata con materiali di alta qualità, questa tazza presenta un design che cattura la potenza e la grazia di una delle creature più iconiche del regno animale. Ogni acquisto contribuisce direttamente ai programmi di conservazione dedicati alla protezione delle Tigri e dei loro preziosi ecosistemi. Aggiungi un tocco di potenza e bellezza alla tua routine quotidiana con la tazza Tigre!",9.00,10),

                         ("OS001","Poster","Poster Orso Polare","Entra nell'atmosfera artica con il nostro poster dell'Orso Polare! Questa immagine straordinaria cattura la grandezza e la bellezza di uno degli animali più iconici del Polo Nord. Ogni acquisto di questo poster contribuisce direttamente ai programmi di conservazione dedicati alla protezione degli Orsi Polari e del loro prezioso habitat. Aggiungi un tocco di forza e impegno ambientale alle tue pareti con il poster Orso Polare! (Dimensioni: 50 x 70 cm)",5.00,15),
                         ("OS002","Poster","Poster Koala","Immergiti nell'atmosfera dell'Australia con il nostro poster del Koala! Questa splendida immagine cattura la dolcezza di uno degli animali più amati del continente australiano. Ogni acquisto di questo poster contribuisce direttamente ai programmi di conservazione dedicati alla protezione dei Koala e delle loro preziose foreste di eucalipto. Aggiungi un tocco di dolcezza e impegno ambientale alle tue pareti con il poster Koala! (Dimensioni: 50 x 70 cm)",5.00,15),
                         ("OS003","Poster","Poster Panda","Aggiungi un'icona di conservazione alle tue pareti con il nostro poster del Panda! Questa immagine affascinante cattura l'adorabilità di uno degli animali più amati al mondo. Ogni acquisto di questo poster contribuisce direttamente ai programmi di conservazione dedicati alla protezione dei Panda e dei loro preziosi habitat. Entra a far parte della missione globale per la conservazione con il poster Panda! (Dimensioni: 50 x 70 cm)",5.00,15),
                         ("OS004","Poster","Poster Tartaruga Marina","Porta la bellezza degli oceani nelle tue pareti con il nostro poster della Tartaruga Marina! Questa immagine affascinante cattura la grazia e la meraviglia di una delle creature più affascinanti degli abissi. Ogni acquisto di questo poster contribuisce direttamente ai programmi di conservazione dedicati alla protezione delle Tartarughe Marine e dei loro preziosi habitat oceanici. Aggiungi un tocco di consapevolezza ambientale alle tue pareti con il poster Tartaruga Marina! (Dimensioni: 50 x 70 cm)",5.00,15),
                         ("OS005","Poster","Poster Tigre","Porta un po' di maestosità nella tua casa con il nostro poster della Tigre! Questa immagine straordinaria cattura la potenza e la grazia di una delle creature più iconiche del regno animale. Ogni acquisto di questo poster contribuisce direttamente ai programmi di conservazione dedicati alla protezione delle Tigri e dei loro preziosi ecosistemi. Aggiungi un tocco di potenza e bellezza alle tue pareti con il poster Tigre! (Dimensioni: 50 x 70 cm)",5.00,15),

                         ("TS001","T-shirt","T-shirt Orso Polare","Porta un tocco di maestosità artica al tuo guardaroba con la nostra t-shirt dell'Orso Polare! Realizzata con materiali di alta qualità, questa maglietta presenta un design che cattura la grandezza e la bellezza di uno degli animali più iconici del Polo Nord. Ogni acquisto contribuisce direttamente ai programmi di conservazione dedicati alla protezione degli Orsi Polari e del loro prezioso habitat. Aggiungi un tocco di eleganza e impegno ambientale al tuo stile con la t-shirt Orso Polare! (Tutte le taglie disponibili)",12.00,30),
                         ("TS002","T-shirt","T-shirt Koala","Indossa la tua passione per la conservazione con la nostra t-shirt del Koala! Realizzata con materiali di alta qualità, questa maglietta presenta un design adorabile che ti permette di portare con te la dolcezza del Koala ovunque tu vada. Ogni acquisto contribuisce direttamente ai programmi di conservazione dedicati alla protezione dei Koala e delle loro preziose foreste di eucalipto. Aggiungi un tocco di dolcezza e impegno ambientale al tuo guardaroba con la t-shirt Koala! (Tutte le taglie disponibili)",12.00,30),
                         ("TS003","T-shirt","T-shirt Panda","Esibisci il tuo impegno per la conservazione con la nostra t-shirt del Panda! Realizzata con materiali di alta qualità, questa maglietta presenta un design che cattura l'adorabilità di uno degli animali più amati al mondo. Ogni acquisto contribuisce direttamente ai programmi di conservazione dedicati alla protezione dei Panda e dei loro preziosi habitat. Aggiungi un tocco di eleganza e impegno ambientale al tuo stile con la t-shirt Panda! (Tutte le taglie disponibili)",12.00,30),
                         ("TS004","T-shirt","T-shirt Tartaruga Marina","Indossa la bellezza degli oceani con la nostra t-shirt della Tartaruga Marina! Realizzata con materiali di alta qualità, questa maglietta presenta un design che cattura la grazia e la meraviglia di una delle creature più affascinanti degli abissi. Ogni acquisto contribuisce direttamente ai programmi di conservazione dedicati alla protezione delle Tartarughe Marine e dei loro preziosi habitat oceanici. Aggiungi un tocco di consapevolezza ambientale al tuo stile con la t-shirt Tartaruga Marina! (Tutte le taglie disponibili)",12.00,30),
                         ("TS005","T-shirt","T-shirt Tigre","Indossa la potenza della natura con la nostra t-shirt della Tigre! Realizzata con materiali di alta qualità, questa maglietta presenta un design che cattura la potenza e la grazia di una delle creature più iconiche del regno animale. Ogni acquisto contribuisce direttamente ai programmi di conservazione dedicati alla protezione delle Tigri e dei loro preziosi ecosistemi. Aggiungi un tocco di forza e bellezza al tuo guardaroba con la t-shirt Tigre! (Tutte le taglie disponibili)",12.00,30),

                         ("KT001","Kit","Kit Orso Polare","Esplora il regno dell'Artico con il nostro Kit Orso Polare, che offre un'esperienza completa dedicata a questo magnifico animale. Il kit include: Tazza, T-shirt, Poster e Peluche. Ogni elemento di questo kit è realizzato con materiali di alta qualità e contribuisce direttamente ai programmi di conservazione dedicati alla protezione degli Orsi Polari e del loro prezioso habitat.",40.00,20),
                         ("KT002","Kit","Kit Koala","Abbraccia la dolcezza dell'Australia con il nostro Kit Koala, che offre una collezione di prodotti dedicati a questo iconico marsupiale. Il kit include: Tazza, T-shirt, Poster e Peluche. Ogni elemento di questo kit è realizzato con materiali di alta qualità e contribuisce direttamente ai programmi di conservazione dedicati alla protezione degli Orsi Polari e del loro prezioso habitat.",40.00,20),
                         ("KT003","Kit","Kit Panda","Abbraccia l'adorabilità del panda con il nostro Kit Panda, una collezione completa di prodotti dedicati a questa iconica specie. Il kit include: Tazza, T-shirt, Poster e Peluche. Ogni elemento di questo kit è realizzato con materiali di alta qualità e contribuisce direttamente ai programmi di conservazione dedicati alla protezione dei panda e dei loro preziosi habitat.",40.00,20),
                         ("KT004","Kit","Kit Tartaruga Marina","Esplora le profondità degli oceani con il nostro Kit Tartaruga Marina, che offre una collezione di prodotti dedicati a questa straordinaria creatura. Il kit include: Tazza, T-shirt, Poster e Peluche. Ogni elemento di questo kit è realizzato con materiali di alta qualità e contribuisce direttamente ai programmi di conservazione dedicati alla protezione delle tartarughe marine e dei loro preziosi habitat oceanici.",40.00,20),
                         ("KT005","Kit","Kit Tigre","Rendi omaggio alla maestosità della tigre con il nostro Kit Tigre, una collezione completa di prodotti dedicati a questa iconica specie. Il kit include: Tazza, T-shirt, Poster e Peluche. Ogni elemento di questo kit è realizzato con materiali di alta qualità e contribuisce direttamente ai programmi di conservazione dedicati alla protezione delle tigri e dei loro preziosi ecosistemi.",40.00,20),

                         ("AL001","Special","Koala Gianfranco","Ciao amici degli animali! Vi presentiamo Gianfranco, il koala con la Sindrome dell'accento straniero che ha viaggiato così tanto che ora parla tutte le lingue... in modo un po' stravagante! Purtroppo, Gianfranco ha bisogno di un po' di aiuto per guarire e tornare a dirvi G'day mate! senza troppi intoppi. Con le vostre generose donazioni, possiamo fornire a Gianfranco tutte le cure di cui ha bisogno per tornare a essere il linguista peloso che amiamo. Contribuisci oggi e unisciti alla missione di guarigione di Gianfranco. Ricorda, più doni, più lingue strambe sentirai!",10.00,1),
                         ("AL002","Special","Panda Rosalinda","Ciao amici degli animali! Vi presentiamo Rosalinda, la panda più chic con l'argigia che ha portato un tocco di glamour nella foresta. Purtroppo, ultimamente i suoi passi da diva sono diventati un po' incerti. Aiutaci a riportare Rosalinda sul palcoscenico della vita panda! Con le vostre donazioni, possiamo fornirle tutto il supporto di cui ha bisogno per tornare a fare le capriole con eleganza. Contribuisci oggi e unisciti alla missione di riportare Rosalinda sotto i riflettori. Ricorda, ogni donazione è un passo più vicino a una Rosalinda brillante come sempre!",10.00,1),
                         ("AL003","Special","Tartaruga Marina Napoleone","Ciao amici degli animali! Conoscete Napoleone, la tartaruga marina che ama esplorare ma a volte si perde nella sua strada di casa? Ha un talento innato per l'avventura, ma a volte il senso dell'orientamento è un po'... shellosto! Vogliamo aiutare Napoleone a recuperare il suo percorso oceanico e garantirgli tutti gli strumenti necessari per continuare a esplorare in tutta sicurezza. Con il vostro sostegno, possiamo fornire a Napoleone l'assistenza di cui ha bisogno per ritrovare il suo cammino e vivere nuove avventure in modo sicuro. Contribuisci oggi e diventa parte della missione per aiutare Napoleone a trovare la strada di casa. Ogni donazione ci avvicina un passo più vicino a vedere Napoleone tornare in azione, pronto per nuove avventure e scoperte!",10.00,1),
                         ("AL004","Special","Orso Polare Tyron","Ciao amici degli animali! Conoscete Tyron, il nostro amato orso polare con un amore per l'avventura che a volte supera il senso del pericolo? Tyron ha una passione per l'esplorazione, ma sembra dimenticare di guardare dove mette gli zampini! Vogliamo aiutare Tyron a vivere la sua vita al massimo, fornendogli l'aiuto di cui ha bisogno per imparare a misurare meglio le sue avventure. Con il vostro sostegno, possiamo fornire a Tyron il supporto e gli strumenti necessari per vivere in modo sicuro e appagante. Contribuisci oggi e diventa parte della missione per aiutare Tyron a sperimentare la sua passione per l'avventura in modo responsabile e divertente. Ogni donazione ci avvicina un passo più vicino a vedere Tyron godersi la sua vita al massimo!",10.00,1),
                         ("AL005","Special","Tigre Beyoncé","Ciao amici degli animali! Conoscete Beyoncé, la tigre con un talento musicale unico? Pur essendo una ruggente artista, a volte il suo tono può risultare... un po' fuori dal coro! Vogliamo aiutare Beyoncé a trovare la sua nota giusta e guarire il suo cuore musicale. Con il vostro sostegno, possiamo fornirle le cure e il supporto di cui ha bisogno per esprimere la sua passione in modo armonioso. Contribuisci oggi e diventa parte della missione per mettere il tono giusto per Beyoncé. Ogni donazione ci avvicina un passo più vicino a vedere questa tigre condividere la sua musica con il mondo in modo straordinario!",10.00,1);
