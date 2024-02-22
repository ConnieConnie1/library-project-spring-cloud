-- creo la tabella generi
CREATE TABLE IF NOT EXISTS GENRE (
    ID SERIAL PRIMARY KEY,
    GENRE VARCHAR(100) NOT NULL
);

-- creo tabella editore
CREATE TABLE IF NOT EXISTS PUBLISHER (
    ID SERIAL PRIMARY KEY,
    PUBLISHER_NAME VARCHAR(255),
    DESCRIPTION VARCHAR(3000)
);

-- creo la tabella autori
CREATE TABLE IF NOT EXISTS AUTHOR (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(100),
    SURNAME VARCHAR(100),
    GENRE_ID INTEGER,
    BIOGRAPHY VARCHAR(5000),
    FOREIGN KEY (GENRE_ID) REFERENCES GENRE(ID)
);



-- creo la tabella Book
CREATE TABLE IF NOT EXISTS BOOK (
    ID SERIAL PRIMARY KEY,
    AUTHOR_ID INTEGER,
    TITLE VARCHAR(300),
    GENRE_ID INTEGER,
    EDITION_DATE DATE,
    PRINT_DATE DATE,
    PUBLISHER_ID INTEGER,
    PRICE DECIMAL(10, 2),
    EAN VARCHAR(100) UNIQUE,
    PAGE_NUMBER INTEGER,
    SYNOPSIS VARCHAR(100000),
    RATING INTEGER CHECK (RATING >= 1 AND RATING <= 5),
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR(ID),
    FOREIGN KEY (GENRE_ID) REFERENCES GENRE(ID),
    FOREIGN KEY (PUBLISHER_ID) REFERENCES PUBLISHER(ID)
);

--creo la tabella catalogo
CREATE TABLE IF NOT EXISTS CATALOGUE (
    ID SERIAL PRIMARY KEY,
    ID_BOOK INTEGER REFERENCES BOOK(ID),
    NUM_OF_AVAILABLE_COPIES INTEGER,
    NUM_BOOKINGS INTEGER
);

-- creo la tabella utente
CREATE TABLE IF NOT EXISTS "REGISTERED_USERS" (
    ID SERIAL PRIMARY KEY,
    EMAIL VARCHAR(255),
    PASSWORD VARCHAR(255),
    DATE_OF_REGISTRATION DATE
);

CREATE TABLE IF NOT EXISTS "USERS" (
    ID SERIAL PRIMARY KEY,
    REGISTERED_USER_ID INTEGER,
    EMAIL VARCHAR(255),
    NAME VARCHAR(255),
    SURNAME VARCHAR(255),
    DATE_OF_BIRTH DATE,
    ADDRESS VARCHAR(255),
    ID_OF_PAST_ORDERS VARCHAR(255),
    ID_OF_CURRENT_ORDERS INTEGER
);


-- creo tabella ordini effettuati
CREATE TABLE IF NOT EXISTS ORDERS (
    ID SERIAL PRIMARY KEY,
    ORDER_NUMBER INTEGER,
    BOOK_ID INTEGER REFERENCES BOOK(ID),
    USERS_ID INTEGER REFERENCES "USERS"(ID),
    ADDRESS VARCHAR(255),
    BOOKING_DATE DATE,
    ORDER_TOTAL DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS BOOK_ORDERS (
    ID SERIAL PRIMARY KEY,
    ORDER_ID INTEGER,
    BOOK_ID INTEGER
);

-- Aggiunti FK
ALTER TABLE "BOOK_ORDERS"
ADD CONSTRAINT FK_ORDER_ID FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ID);

ALTER TABLE "BOOK_ORDERS"
ADD CONSTRAINT FK_BOOK_ID FOREIGN KEY (BOOK_ID) REFERENCES BOOK(ID);

ALTER TABLE "USERS"
ADD CONSTRAINT FK_ID_OF_PAST_ORDERS FOREIGN KEY (ID_OF_PAST_ORDERS) REFERENCES ORDERS(ID);

ALTER TABLE "USERS"
ADD CONSTRAINT FK_ID_OF_CURRENT_ORDERS FOREIGN KEY (ID_OF_CURRENT_ORDERS) REFERENCES ORDERS(ID);

ALTER TABLE "USERS"
ADD CONSTRAINT FK_REGISTERED_USER_ID FOREIGN KEY (REGISTERED_USER_ID) REFERENCES REGISTERED_USERS(ID);

-- popolo la tabella generi
INSERT INTO GENRE (GENRE) VALUES ('Fantascienza');
INSERT INTO GENRE (GENRE) VALUES ('Romanzo');
INSERT INTO GENRE (GENRE) VALUES ('Giallo');
INSERT INTO GENRE (GENRE) VALUES ('Thriller');
INSERT INTO GENRE (GENRE) VALUES ('Horror');
INSERT INTO GENRE (GENRE) VALUES ('Storico');
INSERT INTO GENRE (GENRE) VALUES ('Avventura');
INSERT INTO GENRE (GENRE) VALUES ('Biografia');
INSERT INTO GENRE (GENRE) VALUES ('Saggistica');
INSERT INTO GENRE (GENRE) VALUES ('Poesia');
INSERT INTO GENRE (GENRE) VALUES ('Fumetti');
INSERT INTO GENRE (GENRE) VALUES ('Narrativa');
INSERT INTO GENRE (GENRE) VALUES ('Stranieri');
INSERT INTO GENRE (GENRE) VALUES ('Hobby');
INSERT INTO GENRE (GENRE) VALUES ('Politica');
INSERT INTO GENRE (GENRE) VALUES ('Fantasy');
INSERT INTO GENRE (GENRE) VALUES ('Rosa');

-- popolo la tabella degli editori
INSERT INTO PUBLISHER (PUBLISHER_NAME, DESCRIPTION) VALUES ('Feltrinelli', 'La casa editrice Giangiacomo Feltrinelli Editore è una delle principali realtà italiane nel settore editoriale, fondata nel 1954 a Milano.');
INSERT INTO PUBLISHER (PUBLISHER_NAME, DESCRIPTION) VALUES ('Adelphi', 'Adelphi è una casa editrice italiana fondata nel 1962 da Roberto Calasso, specializzata in classici della letteratura e opere di saggistica e narrativa.');
INSERT INTO PUBLISHER (PUBLISHER_NAME, DESCRIPTION) VALUES ('Laterza', 'La casa editrice Laterza, fondata nel 1901 a Bari, è una delle più antiche e prestigiose case editrici italiane, specializzata in pubblicazioni di saggistica e manualistica.');
INSERT INTO PUBLISHER (PUBLISHER_NAME, DESCRIPTION) VALUES ('Einaudi', 'La casa editrice Giulio Einaudi Editore è stata fondata nel 1933 a Torino da Giulio Einaudi, noto per la pubblicazione di importanti opere della letteratura e della saggistica.');
INSERT INTO PUBLISHER (PUBLISHER_NAME, DESCRIPTION) VALUES ('Mondadori', 'Arnoldo Mondadori Editore è una casa editrice italiana fondata nel 1907 a Milano, tra le più grandi e influenti del panorama editoriale italiano, con un ampio catalogo che spazia dalla narrativa alla saggistica, passando per la divulgazione.');
INSERT INTO PUBLISHER (PUBLISHER_NAME, DESCRIPTION) VALUES ('Rizzoli', 'La casa editrice Rizzoli è stata fondata nel 1927 a Milano, è una delle case editrici più importanti in Italia, con un vasto catalogo che comprende narrativa, saggistica e opere di vario genere.');
INSERT INTO PUBLISHER (PUBLISHER_NAME, DESCRIPTION) VALUES ('Garzanti', 'La casa editrice Garzanti è stata fondata nel 1882 a Milano, è una delle più antiche e prestigiose case editrici italiane, con una produzione che spazia dalla narrativa alla saggistica.');
INSERT INTO PUBLISHER (PUBLISHER_NAME, DESCRIPTION) VALUES ('Giunti', 'La casa editrice Giunti è stata fondata nel 1841 a Firenze, è una delle più antiche case editrici italiane, con un catalogo che comprende narrativa, saggistica, manualistica e opere per infanzia.');
INSERT INTO PUBLISHER (PUBLISHER_NAME, DESCRIPTION) VALUES ('Bompiani', 'La casa editrice Bompiani è stata fondata nel 1929 a Milano da Valentino Bompiani, è nota per la pubblicazione di importanti opere della letteratura italiana e internazionale.');
INSERT INTO PUBLISHER (PUBLISHER_NAME, DESCRIPTION) VALUES ('Sellerio', 'Sellerio Editore è una casa editrice italiana fondata nel 1969 a Palermo da Elvira Sellerio, è specializzata nella pubblicazione di opere della letteratura italiana e siciliana, oltre che di romanzi gialli.');

-- Stephen King
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Stephen', 'King', 5, 'Stephen King è uno dei più celebri autori di romanzi horror, thriller e fantasy.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (1, 'Holly', 4, '2023-01-01', '2023-01-01', 5, 21.99, '9780553103540', 138, 'Quando Penny Dahl chiama la agenzia Finders Keepers nella speranza che possano aiutarla a ritrovare la sua figlia scomparsa, Holly Gibney è restia ad accettare il caso. Il suo socio, Pete, ha il Covid. Sua madre, con cui ha sempre avuto una relazione complicata, è appena morta. E Holly dovrebbe essere in ferie. Ma qualcosa nella voce della signora Dahl che le impedisce di dirle di no. A pochi isolati di distanza dal punto in cui è scomparsa Bonnie Dahl, vivono Rodney ed Emily Harris. Sono il ritratto della rispettabilità borghese: ottuagenari, sposati da una vita, professori universitari emeriti. Ma nello scantinato della loro casetta ordinata e piena di libri nascondono un orrendo segreto, che potrebbe avere a che fare con la scomparsa di Bonnie. È quasi impossibile smascherare il loro piano criminale: i due vecchietti sono scaltri, sono pazienti. E sono spietati. Holly dovrà fare appello a tutto il suo talento per superare in velocità e astuzia i due professori e le loro menti perversamente contorte.', 4);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (1, 'IT', 5, '1986-09-15', '1986-09-15', 5, 17.96, '9788868365622', 1216, 'A Derry, una piccola cittadina del Maine, l''autunno si è annunciato con una pioggia torrenziale. Per un bambino come George Denbrough, ben coperto dal suo impermeabile giallo, il più grande divertimento è seguire la barchetta di carta che gli ha costruito il fratello maggiore Bill. Ma la pioggia è fitta e George rischia di perdere il suo giocattolo, che infatti si infila in un canale di scolo lungo il marciapiede. Cercare di recuperarlo è l''ultimo gesto del bambino: una creatura spaventosa travestita da clown gli strappa un braccio, uccidendolo. A combattere It, il mostro misterioso che prende la forma delle nostre peggiori paure, rimangono Bill e il gruppo di amici con i quali ha fondato il Club dei Perdenti, sette ragazzini capaci di immaginare un mondo senza mostri. Ma It è un nemico implacabile, e per sconfiggerlo i ragazzi devono affrontare prove durissime e rischiare la loro stessa vita. E se l''estate successiva, che li ritrova giovani adulti, sembra quella della sconfitta di It, i Perdenti sanno di dover fare una promessa: qualunque cosa succeda, torneranno a Derry per combattere ancora. It, considerato una pietra miliare della letteratura americana, è un romanzo di bambini che diventano adulti e di adulti che devono tornare bambini, affrontando le loro paure nell''unico modo possibile: uniti da un''incrollabile amicizia.', 4);

-- Joel Dicker
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Joël', 'Dicker', 12, 'Joël Dicker è uno scrittore svizzero noto per i suoi romanzi di narrativa.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (2, 'Un animale selvaggio', 4, '2024-01-01', '2024-01-01', 4, 21.99, '9780747532743', 108, '2 luglio 2022, due ladri stanno per rapinare una importante gioielleria di Ginevra. Ma questo non sarà un colpo come tutti gli altri. Venti giorni prima, in un elegante sobborgo sulle rive del lago, Sophie Braun sta per festeggiare il suo quarantesimo compleanno. La vita le sorride, abita con il marito Arpad e i due figli in una magnifica villa al limitare del bosco. Sono entrambi ricchi, belli, felici. Ma il loro mondo idilliaco all’improvviso s’incrina. I segreti che Arpad custodisce cominciano a essere troppi perché possano restare nascosti per sempre. Il loro vicino, un poliziotto sposato dalla reputazione impeccabile, è ossessionato da quella coppia perfetta e da quella donna conturbante. La osserva, la ammira, la spia in ogni momento dell’intimità. Nel giorno del compleanno di Sophie, un uomo misterioso si presenta con un regalo che sconvolgerà la sua vita dorata. I fili che intrappolano queste vite portano lontano nel tempo, lontano da Ginevra e dalla villa elegante dei Braun, in un passato che insegue il presente e che Sophie e Arpad dovranno affrontare per risolvere un intrigo diabolico, dal quale nessuno uscirà indenne. Nemmeno il lettore.', 5);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (2, 'La verità sul caso Harry Quebert', 4, '2022-11-08', '2022-11-08', 3, 17.10, '9788834611852', 784, 'Estate 1975. Nola Kellergan, una ragazzina di 15 anni, scompare misteriosamente nella tranquilla cittadina di Aurora, New Hampshire. Le ricerche della polizia non danno alcun esito. Primavera 2008, New York. Marcus Goldman, giovane scrittore di successo, sta vivendo uno dei rischi del suo mestiere: è bloccato, non riesce a scrivere una sola riga del romanzo che da lì a poco dovrebbe consegnare al suo editore. Ma qualcosa di imprevisto accade nella sua vita: il suo amico e professore universitario Harry Quebert, uno degli scrittori più stimati d’America, viene accusato di avere ucciso la giovane Nola Kellergan. Il cadavere della ragazza viene infatti ritrovato nel giardino della villa dello scrittore, a Goose Cove, poco fuori Aurora, sulle rive dell’oceano. Convinto dell’innocenza di Harry Quebert, Marcus Goldman abbandona tutto e va nel New Hampshire per condurre la sua personale inchiesta. Marcus, dopo oltre trent’anni deve dare risposta a una domanda: chi ha ucciso Nola Kellergan? E, naturalmente, deve scrivere un romanzo di grande successo.', 3.5);

-- Alessandro Baricco

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Alessandro', 'Baricco', 11, 'Alessandro Baricco è uno scrittore italiano famoso per i suoi romanzi.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (3, 'Abel', 12, '2023-01-01', '2023-01-01', 1, 16.99, '9780060256654', 78, 'Ha ventisette anni, Abel, quando diventa leggenda. Ha messo fine a una rapina sparando simultaneamente con due pistole contro obiettivi diversi. Un colpo detto il Mistico, che pochi sono in grado di mettere a segno con la sua precisione. È lo sceriffo della cittadina di un Ovest immaginario ed è innamorato di Hallelujah Wood, una donna che ha addosso una specie di mistero, mani piccole e labbra orientali. Anche lei lo ama: ogni tanto parte senza che lui sappia dove va – “passiamo senza fermarci, è inteso così” –, ma torna sempre. La madre di Abel, invece, anni prima se n’è andata per non tornare mai più. Ha preso i quattro cavalli migliori e ha lasciato lui, i fratelli e la sorella al loro destino. Una bruja una volta gli ha detto: “Sarà molto doloroso, ma un giorno, Abel, te lo prometto, nascerai”. Alessandro Baricco dà vita a un romanzo che è una storia spirituale, sapienziale, e al tempo stesso un western dove la scrittura è geometrica e il racconto visionario.', 4);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (3, 'Oceano mare', 12, '2022-01-01', '2022-01-01', 1, 11.99, '9780060256651', 88, '"Oceano mare" racconta del naufragio di una fregata della marina francese, molto tempo fa, in un oceano. Gli uomini a bordo cercheranno di salvarsi su una zattera. Sul mare si incontreranno le vicende di strani personaggi. Come il professore Bartleboom che cerca di stabilire dove finisce il mare, o il pittore Plasson che dipinge solo con acqua marina, e tanti altri individui in cerca di sé, sospesi sul bordo, col destino segnato dal mare. E sul mare si affaccia anche la locanda Almayer, dove le tante storie confluiscono. Usando il mare come metafora esistenziale, Baricco narra dei suoi surreali personaggi, spaziando in vari registri stilistici.', 4);

-- J.K Rowling

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('J.K.', 'Rowling', 1, 'J.K. Rowling è l''autrice della serie di romanzi Harry Potter, conosciuta in tutto il mondo.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (4, 'Harry Potter e la pietra filosofale.', 16, '2020-01-01', '2020-01-01', 5, 9.99, '9780060256652', 235, 'Tutto comincia da qui. Il primo capitolo di uno dei più grandi fenomeni letterari internazionali, il libro che ha fatto leggere milioni di ragazzi e ha unito genitori e figli nella scoperta di un universo fantastico che è già parte del immaginario collettivo. Edizione speciale con contenuti inediti: la mappa di Hogwarts, il glossario, curiosità sui fondatori di Hogwarts.', 5);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (4, 'Il richiamo del cuculo.', 4, '2020-01-16', '2020-01-16', 5, 16.06, '9788831004756', 560, 'Quando una top model, celebre e tormentata, precipita dal balcone del suo attico a Mayfair nessuno dubita che si tratti di un suicidio. L''unico a non crederci è suo fratello che decide di rivolgersi a Cormoran Strike per far luce sul caso. Strike è un reduce della guerra in Afghanistan, dove è stato ferito nel corpo e nello spirito, e la sua vita è nel caos. Il nuovo incarico gli dà un po''di respiro, ma a caro prezzo: più si immerge nel mondo complesso e spietato della modella, più la vicenda diventa oscura e densa di pericoli... Un romanzo di grande equilibrio narrativo e ad alta tensione, ambientato in una Londra ipnotica e ricca di seduzioni, dal chiasso di Soho, al lusso di Mayfair, ai gremiti pub dell''East End.', 5);

-- Isabel Allende

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Isabel', 'Allende', 2, 'Isabel Allende è una famosa scrittrice cilena conosciuta per i suoi romanzi.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (5, 'Il vento conosce il mio nome', 13, '2023-01-01', '2023-01-01', 1, 21.99, '9780060256653', 135, 'Vienna, 1938. Samuel Adler è un bambino ebreo di sei anni il cui padre scompare durante la Notte dei cristalli, quando la sua famiglia perde tutto. La madre, per salvarlo, lo mette su un treno che lo porterà dall’Austria all’Inghilterra. Per Samuel inizia così una nuova fase della sua lunga vita, sempre accompagnato dal suo fedele violino e dal peso dell’incertezza e della solitudine. Arizona, 2019. Anita Díaz, sette anni, sale su un altro treno con sua madre per sfuggire a un pericolo imminente nel Salvador e cercare rifugio negli Stati Uniti. Ma il loro arrivo coincide con la nuova politica di separazione famigliare, e Anita si ritrova sola e spaventata in un centro di accoglienza a Nogales. Lontana dai suoi affetti e senza certezze, si rifugia su Azabahar, una magica stella che esiste solo nella sua immaginazione. Nel frattempo Selena Durán, una giovane assistente sociale, chiede aiuto a un avvocato di successo nella speranza di rintracciare la madre di Anita. Intrecciando passato e presente, Il vento conosce il mio nome racconta la storia di due personaggi indimenticabili, entrambi alla ricerca di una famiglia.', 4);

-- Banana Yoshimoto
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Banana', 'Yoshimoto', 11, 'Banana Yoshimoto è una scrittrice giapponese nota per le sue opere di narrativa.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (6, 'Che significa diventare adulti?', 13, '2024-01-01', '2024-01-01', 1, 11.99, '9780060256655', 97, 'Che significa diventare adulti? Si deve studiare per forza? Che cos’è la normalità? Che succede quando si muore? A queste e altre domande Banana Yoshimoto cerca di rispondere in un piccolo saggio che, si augura, possa funzionare “un po’ come un amuleto” per aiutare i lettori di tutte le età a ritrovare serenità e speranza nei momenti più difficili.', 5);

-- Umberto Eco

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Umberto', 'Eco', 11, 'Umberto Eco è stato uno degli scrittori italiani più importanti del XX secolo.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (7, 'L''isola alla fine del mondo', 12, '2023-02-01', '2023-02-01', 2, 18.99, '9788804628524', 220, 'Un uomo naufraga su un’isola deserta dopo un incidente aereo. Lottando per sopravvivere, scopre che l''isola non è così disabitata come sembra, e che nasconde segreti che metteranno alla prova la sua forza e la sua sanità mentale.', 4);

-- Ken Follett

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Ken', 'Follett', 2, 'Ken Follett è uno scrittore britannico famoso per i suoi romanzi storici.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (8, 'I pilastri della terra', 2, '2016-05-23', '2016-05-23', 2, 17.58, '9788804666929', 1049, 'Mistery, storia d''amore, grande rievocazione storica: in quella che è un''opera tra le sue più ambiziose e acclamate, Ken Follett ci trasporta nell''Inghilterra medievale al tempo della costruzione di una cattedrale. Intreccio, azione e passioni si sviluppano così sullo sfondo di un''era ricca di intrighi e cospirazioni, pericoli e minacce, guerre civili, carestie, conflitti religiosi e lotte politiche. Con la stessa, infallibile suspense che caratterizza i suoi thriller, Follett ricrea un''epoca scomparsa e affascinante. Foreste, castelli e monasteri sono l''avvolgente paesaggio, mosso dai ritmi della vita quotidiana e dalla pressione di eventi storici e naturali, entro il quale per circa quarant''anni si confrontano e si scontrano le segrete aspirazioni e i sentimenti laceranti dei protagonisti – monaci, mercanti, artigiani, nobili, fanciulle misteriose -, vittime o pedine di avvenimenti che rimettono continuamente in discussione la costruzione della grande cattedrale. Un''appassionante storia di ambizione e tradimento, coraggio e dedizione, amore e vendetta, in cui si rivela tutta la sapienza narrativa di uno dei più amati scrittori contemporanei.', 5);

-- Paulo Coelho

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Paulo', 'Coelho', 11, 'Paulo Coelho è uno scrittore brasiliano conosciuto per il suo romanzo L''Alchimista.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (9, 'L''alchimista', 1, '2023-07-01', '2023-07-01', 5, 17.99, '9788804628555', 250, 'Un pastore spagnolo intraprende un viaggio per trovare un tesoro nascosto, ma lungo il cammino scopre che il vero tesoro è la conoscenza e la autorealizzazione.', 5);

--Haruki Murakami

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Haruki', 'Murakami', 11, 'Haruki Murakami è uno degli autori giapponesi contemporanei più celebri al mondo.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (10, '1Q84', 1, '2023-08-01', '2023-08-01', 5, 23.99, '9788804628562', 500, 'In un mondo parallelo in cui la realtà è distorta e minacciata da forze oscure, due persone si trovano intrappolate in una spirale di eventi che li porterà a confrontarsi con la verità e il destino.', 4);

-- Margaret Atwood

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Margaret', 'Atwood', 11, 'Margaret Atwood è una scrittrice canadese nota per i suoi romanzi distopici, come Il racconto dell''ancella.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (11, 'Il racconto dell''ancella', 12, '2019-06-27', '2019-06-27', 7, 15.96, '9788833312255', 400, 'In un mondo devastato dalle radiazioni atomiche, gli Stati Uniti sono divenuti uno Stato totalitario, basato sul controllo del corpo femminile. Difred, la donna che appartiene a Fred, ha solo un compito nella neonata Repubblica di Galaad: garantire una discendenza alla élite dominante. Il regime monoteocratico di questa società del futuro, infatti, è fondato sullo sfruttamento delle cosiddette ancelle, le uniche donne che dopo la catastrofe sono ancora in grado di procreare. Ma anche lo Stato più repressivo non riesce a schiacciare i desideri e da questo dipenderà la possibilità e, forse, il successo di una ribellione.', 4);

-- Elena Ferrante

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Elena', 'Ferrante', 11, 'Elena Ferrante è lo pseudonimo di una misteriosa scrittrice italiana, autrice della saga de L''amica geniale.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (12, 'L''amica geniale', 12, '2023-11-01', '2023-11-01', 8, 21.99, '9788804628593', 350, 'Il romanzo segue una amicizia tra due ragazze, Elena e Lila, nel quartiere povero di Napoli negli anni 50, esplorando le loro vite e i loro destini intrecciati.', 5);


-- Gabriel Marquez

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Gabriel', 'García Márquez', 11, 'Gabriel García Márquez è stato uno degli scrittori latinoamericani più importanti, autore di Cento anni di solitudine.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (13, 'Cento anni di solitudine', 11, '2023-09-01', '2023-09-01', 6, 26.99, '9788804628579', 400, 'Il romanzo narra la storia della famiglia Buendía nel paese immaginario di Macondo, attraverso generazioni segnate da amori proibiti, tragedie e maledizioni, creando un affresco magico e realistico allo stesso tempo.', 5);


-- Herman Hesse

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Herman', 'Hesse', 11, 'Herman Hesse è stato uno scrittore tedesco vincitore del Premio Nobel per la Letteratura nel 1946.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (14, 'Narciso e Boccadoro', 2, '2022-07-05', '2022-07-05', 9, 13.30, '9788804747062', 312, 'Nell''abbazia di Mariabronn arriva un giorno un nuovo allievo, Boccadoro. Suo padre desidera che lì completi gli studi e che lì rimanga consacrando la vita a Dio per espiare un misterioso peccato legato alla sua nascita. Tra gli antichi chiostri e le ampie sale del monastero, il biondo Boccadoro, sensuale e sognatore, si lega di profonda amicizia col giovane insegnante Narciso, l''erudito, il prodigio delle scienze e delle lettere.', 5);


-- Italo Calvino

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Italo', 'Calvino', 11, 'Italo Calvino è stato uno degli scrittori italiani più importanti del XX secolo.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (15, 'Il visconte dimezzato', 2, '2010-04-13', '2010-04-10', 10, 11.50, '9788804598909', 133, 'La bizzarra storia del visconte Medardo di Terralba che, colpito al petto da una cannonata turca, torna a casa diviso in due metà (una cattiva, malvagia, prepotente, ma dotata di inaspettate doti di umorismo e realismo, l''altra gentile, altruista, buona, o meglio "buonista").', 3);


-- Jorge Luis

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Jorge Luis', 'Borges', 11, 'Jorge Luis Borges è stato uno degli scrittori argentini più influenti del XX secolo.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (16, 'Finzioni', 12, '2015-02-25', '2015-02-25', 8, 11.40, '9788845929649', 186, 'L''esile volume di 146 pagine sfidava la nostra immaginazione di diciottenni innamorati delle visioni di Jim Morrison e di William Blake con una visionarietà ironicamente erudita, minuziosa fino a sembrare perversa e abbastanza vaga da spingerci a cercare di decifrarla come una lingua straniera. Ora Finzioni torna in una nuova e splendida versione italiana accresciuta dai tre racconti che Borges vi aggiunse ... E a percorrere di nuovo i sentieri biforcuti dell''argentino, a rileggere certi memorabili attacchi, ci si accorge non solo che il loro potere pacatamente incantatorio è immutato, ma in qualche modo si è ramificato, come in un racconto di Borges. Che cosa è successo? Solo che quasi tutta la letteratura degli ultimi quarant''anni, da Calvino a Pynchon a Molina a infiniti altri, si è confrontata o scontrata con l''universo onirico e lievemente delirante scaturito da Finzioni', 3);

-- Marguerite Duras

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Marguerite', 'Duras', 11, 'Marguerite Duras è stata una scrittrice francese nota per il suo stile sperimentale e poetico.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (17, 'L''amante', 17, '2015-01-17', '2015-01-17', 8, 9.40, '9788807885921', 123, 'La storia d''amore di una francese quindicenne con un giovane miliardario cinese, sullo sfondo di un ritratto di famiglia, nell''Indocina degli anni trenta. Racconto di lucidità struggente, di terribile e dolce bellezza, "L''amante" trasfigura e risolve integralmente in una scrittura spoglia e intensa, il complice gioco che la memoria e l''oblio ricalcano sulla trama della vita.', 4);


-- Agatha Christie

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Agatha', 'Christie', 3, 'Agatha Christie è stata una celebre scrittrice britannica di gialli.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (18, 'Dieci piccoli indiani', 4, '2012-06-19', '2012-06-19', 10, 9.50, '9788804616986', 229, 'Dieci persone estranee l''una all''altra sono state invitate a soggiornare in una splendida villa a Nigger Island, senza sapere il nome del generoso ospite. Eppure, chi per curiosità, chi per bisogno, chi per opportunità, hanno accettato l''invito. E ora sono lì, su quell''isola che sorge dal mare, simile a una gigantesca testa, che fa rabbrividire soltanto a vederla. Non hanno trovato il padrone di casa ad aspettarli. Ma hanno trovato una poesia incorniciata e appesa sopra il caminetto di ciascuna camera. E una voce inumana e penetrante che li accusa di essere tutti assassini. Per gli ospiti intrappolati è l''inizio di un interminabile incubo.', 5);


-- George Orwell

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('George', 'Orwell', 11, 'George Orwell è stato uno scrittore britannico autore di opere come 1984 e La fattoria degli animali.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (19, '1984', 1, '2023-12-01', '2023-12-01', 9, 18.99, '9788804628609', 320, 'In un mondo totalitario dominato dal Grande Fratello, il protagonista Winston Smith lotta per mantenere la sua libertà di pensiero e identità individuale.', 5);


-- Leo Tolstoj

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Leo', 'Tolstoj', 2, 'Lev Tolstoj è stato uno degli scrittori russi più famosi, autore di Guerra e pace e Anna Karenina.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (20, 'Anna Karenina', 12, '2013-06-05', '2013-06-05', 2, 12.35, '9788807900006', 1120, 'Anna Karenina sposa il ricco e influente Aleksej Karenin ma si innamora dell''affascinante ufficiale di cavalleria, il conte Vronskij. La loro relazione segreta scatena scandalo e tragedia, mentre altri personaggi affrontano le proprie sfide personali e morali in un mondo dominato da convenzioni sociali e tradizioni rigide.', 3);


-- Philip K. Dick

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Philip', 'K. Dick', 10, 'Philip K. Dick è stato uno degli autori più influenti nel campo della fantascienza, noto per opere come "Blade Runner" e "L Uomo nell Alto Castello".');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (21, 'Un oscuro scrutare', 9, '2019-11-21', '2019-11-21', 10, 24.90, '9788834738993', 304, 'Los Angeles, 1994: una droga misteriosa, la sostanza M, invade il mercato seminando follia e morte. La sua origine è ignota come la sua composizione e l''organizzazione che la diffonde. Bob Arctor, agente della sezione narcotici, si infiltra fra i tossici che ne fanno uso, per scoprire chi dirige le fila del traffico illegale: un abito speciale nasconde ai colleghi la sua identità e una sofisticata apparecchiatura elettronica gli consente addirittura di spiare sé stesso nella sua nuova condizione di drogato. Bob giungerà alla verità solo dopo essere sprofondato nel buio e nella disperazione della dipendenza. Un romanzo di straordinaria potenza emotiva, dedicato idealmente a quella generazione che dopo aver sognato un mondo diverso ha scoperto il baratro delle droghe, della dipendenza, dell''annullamento di sé. Canto del cigno di una generazione, «Un oscuro scrutare» è una vetta amara e lirica dell''opera di Philip K. Dick, e allo stesso tempo un romanzo sospeso tra giallo e fantascienza, ambientato in un futuro dominato dalla tecnologia e dalla manipolazione sociale.', 5);

-- Terry Pratchett

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Terry', 'Pratchett', 10, 'Terry Pratchett è stato uno scrittore britannico famoso per la serie di romanzi umoristici del "Mondo Disco".');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (22, 'Il colore della Magia', 7, '2016-06-30', '2016-06-30', 6, 14.16, '9788869187889', 224, 'In un mondo sorretto da quattro elefanti magici che poggiano sul guscio di una tartaruga gigante, comincia la più stramba, scatenata ed esplosiva delle avventure: il primo libro della saga di Mondo Disco, dove tutto ha inizio.', 4);

-- Arthur Doyle

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Arthur', 'Conan Doyle', 3, 'Sir Arthur Conan Doyle è stato uno scrittore scozzese noto per i suoi romanzi e racconti gialli, in particolare per il personaggio di Sherlock Holmes.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (23, 'Il mastino dei Baskerville', 4, '2016-01-15', '2016-01-15', 6, 14.16, '9788807901843', 251, 'Nebbia, brughiera, un cane maledetto con le fiamme dell''inferno negli occhi, una morte incomprensibile: il palcoscenico perfetto per Sherlock Holmes e per l''immancabile Watson. Un romanzo che tiene imprigionato il lettore in uno spazio narrativo che sta fra il giallo e il terrore. La morte in questione è quella di Sir Charles Baskerville, l''ultimo occupante di Baskerville Hall: che sia vera la leggenda che parla di un cane degli inferi, un mastino demoniaco che perseguita la famiglia Baskerville? Un perfetto meccanismo a orologeria, un vero e proprio manuale di investigazione. E, non ultimo, il manifesto della logica d''acciaio del più celebre investigatore della letteratura mondiale.', 4);

-- Dan Brown

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Dan', 'Brown', 4, 'Dan Brown è uno scrittore statunitense famoso per i suoi thriller, tra cui "Il Codice Da Vinci" e "Angeli e Demoni".');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (24, 'Il codice Da Vinci', 4, '2024-03-01', '2024-03-01', 10, 23.99, '9788804628630', 400, 'Un professore di simbologia religiosa e una criptologa indagano su una serie di omicidi collegati a un segreto millenario che potrebbe sconvolgere le fondamenta della cristianità.', 4);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (24, 'Angeli e demoni', 4, '2016-03-01', '2016-03-01', 10, 12.41, '9788804667247', 554, 'Marchiati a fuoco, prima di essere barbaramente uccisi ed esposti come monito per le strade di Roma. Questa è la sorte che toccava agli Illuminati, l''antica setta di scienziati perseguitata in secoli oscuri dalla Chiesa cattolica. Un rituale crudele, ben conosciuto da Robert Langdon, lo studioso di iconologia del "Codice da Vinci". Ma quando la storia si ripresenta, il fascino si trasforma in raccapriccio. Svegliato in piena notte e trasportato dagli Stati Uniti in Svizzera, Langdon è costretto a esaminare, nei laboratori del CERN di Ginevra, un cadavere orrendamente mutilato. Sul petto della vittima, impresso a fuoco, il terribile segno degli Illuminati: lo scienziato ucciso ha difeso fino all''ultimo il segreto di un''arma sperimentale rubata dagli assassini.', 4);

-- Michael Crichton

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Michael', 'Crichton', 5, 'Michael Crichton è stato uno scrittore e regista statunitense noto per i suoi romanzi di fantascienza e thriller, come "Jurassic Park" e "Il mondo perduto".');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (25, 'Jurassic Park', 5, '2018-03-25', '2018-03-25', 7, 22.35, '9788811602279', 492, 'In un''isola sperduta al largo del Costa Rica, il miliardario Hammond costruisce un gigantesco parco di attrazioni biologiche. Grazie all''ingegneria genetica, nel suo Jurassic Park rivivrà un intero ecosistema, compresi i terribili dinosauri carnivori: il gigantesco Tyrannosaurus Rex e i famelici Velociraptor. L''incubo che dominerà il romanzo nasce dal profondo della preistoria e si proietta su un presente dominato dalle arroganti certezze della scienza.', 5);


-- John Grisham

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('John', 'Grisham', 4, 'John Grisham è uno scrittore statunitense famoso per i suoi legal thriller, tra cui "Il Cliente" e "Il Fuggitivo".');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (26, 'Lo scambio', 4, '2023-11-07', '2023-11-07', 5, 21.38, '9788804763161', 312, 'New York, 2005. Mitch e Abby McDeere vivono a Manhattan. Socio del più grande studio legale del mondo lui, editor di libri di cucina lei, due figli piccoli, sembrerebbero una coppia di successo come altre, se non fosse per il loro incredibile passato. Mitch è infatti l''indimenticato protagonista de Il socio , il legal thriller campione di incassi che ha lanciato la straordinaria carriera di John Grisham. All''epoca giovane avvocato di belle speranze, Mitch aveva smascherato i crimini dello studio legale Bendini di Memphis presso il quale lavorava ed era riuscito a fuggire dagli Stati Uniti con Abby facendo perdere le sue tracce. Quindici anni dopo, Mitch è nel suo nuovo prestigioso ufficio al quarantottesimo piano di un grattacielo di Manhattan intento a guardare Battery Park dall''alto della sua nuova posizione. Ancora non sa che di lì a pochi giorni lo attende una sfida senza precedenti. Uno stimato socio romano gli chiede di aiutarlo in un delicato caso internazionale che vede coinvolto un importante cliente turco in Libia. Mitch parte immediatamente per Roma e, in poco tempo, si ritrova al centro di un sinistro complotto che ha implicazioni a livello mondiale e mette in pericolo i suoi colleghi e, soprattutto, la sua famiglia. Maestro nell''anticipare le mosse dei suoi avversari, questa volta non ha modo di nascondersi: la vita di una giovane donna è nelle sue mani.', 2);


-- Lovecraft

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('H.P.', 'Lovecraft', 5, 'H.P. Lovecraft è stato uno scrittore statunitense noto per i suoi racconti di orrore cosmico, che hanno influenzato il genere horror.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (27, 'Necronomicon', 5, '2017-10-10', '2017-10-10', 9, 24.70, '9788804682561', 630, 'Redatto nell’VIII secolo a Damasco da un pazzo yemenita, il «Necronomicon» contiene la storia dei Grandi Antichi e le parole per invocarli. È un libro maledetto, demoniaco. Soprattutto è un libro inventato dalla fervida fantasia di H.P. Lovecraft.', 5);


-- Charlse Dickens

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Charles', 'Dickens', 11, 'Charles Dickens è stato uno degli scrittori inglesi più importanti del XIX secolo, celebre per romanzi come "Oliver Twist" e "Grandi speranze".');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (28, 'Oliver Twist', 11, '2014-06-04', '2014-06-04', 1, 10.45, '9788807901546', 538, 'Racconta la storia di un giovane orfano, Oliver, cresciuto in un istituto per l''infanzia miserabile. Dopo una serie di avventure e incontri con personaggi pittoreschi, Oliver si trova coinvolto in una rete di ladri e criminali. Dopo molte peripezie, scopre le sue vere origini e trova finalmente una famiglia amorevole', 5);


-- Margaret Mitchell

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Margaret', 'Mitchell', 2, 'Margaret Mitchell è stata una scrittrice statunitense, autrice del celebre romanzo "Via col vento".');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (29, 'Via col Vento', 2, '2020-01-30', '2020-01-30', 1, 23.45, '9788854520264', 1194, 'La storia ruota attorno a Scarlett O''Hara, una giovane donna determinata a mantenere la sua piantagione di Tara e a preservare il suo stile di vita aristocratico. Attraverso le sue relazioni con uomini come Ashley Wilkes e Rhett Butler, Scarlett affronta sfide personali e sociali mentre lottano per sopravvivere ai cambiamenti che la guerra porta con sé. La trama è un intreccio di passioni, tradimenti, tragedie e redenzione, ambientata in un periodo tumultuoso della storia americana.', 4);


-- Tolkien

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('J.R.R.', 'Tolkien', 1, 'J.R.R. Tolkien è stato uno degli autori fantasy più celebri, noto per il suo epico romanzo Il signore degli anelli.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (30, 'Il signore degli anelli', 1, '2023-10-01', '2023-10-01', 7, 29.99, '9788804628586', 600, 'Un giovane hobbit di nome Frodo Baggins intraprende un epico viaggio per distruggere un potente anello e salvare il suo mondo dalla minaccia del Signore Oscuro Sauron.', 5);


-- Kafka

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Franz', 'Kafka', 12, 'Franz Kafka è stato uno scrittore boemo di lingua tedesca, noto per opere come Il processo e La metamorfosi.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (31, 'Il processo', 12, '2024-01-01', '2024-01-01', 10, 19.99, '9788804628616', 300, 'Il romanzo segue la storia di Josef K., che viene arrestato e processato da un sistema giudiziario oscuro e assurdo, senza mai sapere di che crimine è accusato.', 4);


-- Martin
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('George R.R.', 'Martin', 1, 'George R.R. Martin è uno scrittore statunitense famoso per la serie di romanzi Cronache del ghiaccio e del fuoco, che ha ispirato la serie televisiva Il Trono di Spade.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (32, 'Cronache del ghiaccio e del fuoco', 1, '2024-02-01', '2024-02-01', 6, 27.99, '9788804628623', 700, 'Un epica saga fantasy che segue le lotte per il potere tra famiglie nobili e le minacce di creature soprannaturali in un mondo simile all Europa medievale.', 5);


-- Umberto Eco

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Umberto', 'Eco', 11, 'Umberto Eco è stato uno degli scrittori italiani più importanti del XX secolo.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (33, 'Il nome della rosa', 3, '2024-04-01', '2024-04-01', 2, 22.99, '9788804628647', 500, 'Un frate domenicano e il suo allievo indagano su una serie di omicidi in un monastero medievale, affrontando misteri teologici e intrighi politici.', 5);


-- Suzanne Collins

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Suzanne', 'Collins', 2, 'Suzanne Collins è una scrittrice e sceneggiatrice statunitense, autrice della trilogia di romanzi Hunger Games.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (34, 'La ragazza di Fuoco', 2, '2024-05-01', '2024-05-01', 3, 21.99, '9788804628654', 350, 'Non puoi rifiutarti di partecipare agli Hunger Games. Una volta scelto, il tuo destino è scritto. Dovrai lottare fino all''ultimo, persino uccidere per farcela. Katniss ha vinto. Ma è davvero salva? Dopo la settantaquattresima edizione degli Hunger Games, l''implacabile reality show che si svolge a Panem ogni anno, lei e Peeta sono, miracolosamente, ancora vivi. Katniss dovrebbe sentirsi sollevata, perfino felice. Dopotutto, è riuscita a tornare dalla sua famiglia e dall''amico di sempre, Gale. Invece nulla va come Katniss vorrebbe',4);


-- Daniele Luttazzi

INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Daniele', 'Luttazzi', 11, 'Daniele Luttazzi è uno scrittore, comico e conduttore televisivo italiano.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (35, 'Lolito. Una parodia', 11, '2013-05-30', '2013-05-30', 4, 7.45, '9788861904583', 578, 'La storia segue il protagonista, un uomo eccentrico e narcisista di nome Bob, che si innamora ossessivamente di una ragazza adolescente di nome Lola. Bob, con il suo comportamento bizzarro e la sua ossessione per la gioventù, si imbarca in un viaggio folle e comico attraverso l''America mentre cerca di conquistare il cuore di Lola.',3);


-- Shakespeare
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('William', 'Shakespeare', 11, 'William Shakespeare è stato uno dei più grandi drammaturghi e poeti della letteratura mondiale, autore di opere come Romeo e Giulietta e Amleto.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (36, 'Romeo e Giulietta', 11, '2014-06-04', '2014-06-04', 4, 8.55, '9788807901379', 270 , '"Romeo e Giulietta" è una tragedia scritta da William Shakespeare che racconta la storia di due giovani amanti, Romeo Montecchi e Giulietta Capuleti, che appartengono a famiglie rivali a Verona. Nonostante l''odio tra le loro famiglie, i due si innamorano perdutamente e decidono di sposarsi segretamente con l''aiuto del frate Lorenzo. Tuttavia, una serie di sfortunate coincidenze e malintesi portano alla morte di entrambi i giovani amanti.',5);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (36, 'Amleto', 11, '2013-06-15', '2013-06-15', 7, 9.02, '9788807900426', 320, '"Amleto" è una tragedia scritta da William Shakespeare che narra la storia del principe danese Amleto, tormentato dal sospetto che suo zio, il re Claudio, abbia assassinato suo padre per sposare sua madre, Gertrude. Amleto è dilaniato tra il desiderio di vendetta e il dubbio, mentre cerca di scoprire la verità. La trama si sviluppa attraverso inganni, tradimenti e tragedie, culminando in un finale drammatico che vede la morte di quasi tutti i principali personaggi. "Amleto" esplora temi come la follia, il destino, la moralità e il potere.',4);

-- Zafon
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Carlos Ruiz', 'Zafòn', 4, 'Carlos Ruiz Zafón (Barcellona, 25 settembre 1964 – Los Angeles, 19 giugno 2020) è stato uno scrittore spagnolo.');

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (37, 'L''ombra del vento', 11, '2023-03-01', '2023-03-01', 2, 22.99, '9788804628500', 320, 'Un giovane ragazzo scopre un libro misterioso in una biblioteca segreta e si immerge in una avventura che svela oscuri segreti del suo passato familiare e della città di Barcellona.', 5);



INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(1,300,450);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(2,500,780);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(3,200,630);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(4,900,1250);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(5,800,1000);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(6,50,780);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(7,560,1500);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(8,760,2400);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(9,1770,3000);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(10,300,690);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(11,10,30);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(12,5,420);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(13,2,600);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(14,10,960);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(15,1,450);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(16,70,450);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(17,50,360);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(18,35,1000);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(19,28,100);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(20,44,540);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(21,63,250);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(22,79,390);
INSERT INTO CATALOGUE(ID_BOOK,NUM_OF_AVAILABLE_COPIES,NUM_BOOKINGS) VALUES(23,1,800);


INSERT INTO ORDERS (ORDER_NUMBER, BOOK_ID, ADDRESS, BOOKING_DATE, ORDER_TOTAL)
VALUES (123, 1, '123 Main St', '2024-02-15', 29.99);

INSERT INTO ORDERS (ORDER_NUMBER, BOOK_ID, ADDRESS, BOOKING_DATE, ORDER_TOTAL)
VALUES (456, 2, '456 Elm St', '2024-02-15', 39.99);

INSERT INTO ORDERS (ORDER_NUMBER, BOOK_ID, ADDRESS, BOOKING_DATE, ORDER_TOTAL)
VALUES (789, 3, '789 Oak St', '2024-02-15', 49.99);

INSERT INTO ORDERS (ORDER_NUMBER, BOOK_ID, ADDRESS, BOOKING_DATE, ORDER_TOTAL)
VALUES (1011, 4, '1011 Pine St', '2024-02-15', 59.99);

INSERT INTO ORDERS (ORDER_NUMBER, BOOK_ID, ADDRESS, BOOKING_DATE, ORDER_TOTAL)
VALUES (1213, 5, '1213 Maple St', '2024-02-15', 69.99);

INSERT INTO ORDERS (ORDER_NUMBER, BOOK_ID, ADDRESS, BOOKING_DATE, ORDER_TOTAL)
VALUES (1415, 6, '1415 Cedar St', '2024-02-15', 79.99);

INSERT INTO ORDERS (ORDER_NUMBER, BOOK_ID, ADDRESS, BOOKING_DATE, ORDER_TOTAL)
VALUES (1617, 7, '1617 Birch St', '2024-02-15', 89.99);

INSERT INTO ORDERS (ORDER_NUMBER, BOOK_ID, ADDRESS, BOOKING_DATE, ORDER_TOTAL)
VALUES (1819, 8, '1819 Pine St', '2024-02-15', 99.99);

INSERT INTO ORDERS (ORDER_NUMBER, BOOK_ID, ADDRESS, BOOKING_DATE, ORDER_TOTAL)
VALUES (2021, 9, '2021 Elm St', '2024-02-15', 109.99);

INSERT INTO ORDERS (ORDER_NUMBER, BOOK_ID, ADDRESS, BOOKING_DATE, ORDER_TOTAL)
VALUES (2223, 10, '2223 Oak St', '2024-02-15', 119.99);

