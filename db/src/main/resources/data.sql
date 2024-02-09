-- creo la tabella generi
CREATE TABLE IF NOT EXISTS GENRE (
    ID SERIAL PRIMARY KEY,
    GENRE VARCHAR(100) NOT NULL
);

-- creo tabella editore
CREATE TABLE PUBLISHER (
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
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR(Id),
    FOREIGN KEY (GENRE_ID) REFERENCES GENRE(Id),
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
CREATE TABLE IF NOT EXISTS "USER" (
    ID SERIAL PRIMARY KEY,
    EMAIL VARCHAR(255),
    PASSWORD VARCHAR(255),
    DATE_OF_REGISTRATION DATE,
    PREFERRED_GENRES INTEGER REFERENCES GENRE(ID)
);



-- creo tabella ordini effettuati
CREATE TABLE IF NOT EXISTS ORDERS (
    ID SERIAL PRIMARY KEY,
    ORDER_NUMBER INTEGER,
    BOOK_ID INTEGER REFERENCES BOOK(ID),
    USER_ID INTEGER REFERENCES "USER"(ID),
    ADDRESS VARCHAR(255),
    BOOKING_DATE DATE,
    ORDER_TOTAL DECIMAL(10, 2)
);


ALTER TABLE "USER"
ADD COLUMN ID_OF_PAST_ORDERS INTEGER;

ALTER TABLE "USER"
ADD COLUMN ID_OF_CURRENT_ORDERS INTEGER;


-- Aggiunti FK
ALTER TABLE "USER"
ADD CONSTRAINT FK_ID_OF_PAST_ORDERS FOREIGN KEY (ID_OF_PAST_ORDERS) REFERENCES ORDERS(ID);

ALTER TABLE "USER"
ADD CONSTRAINT FK_ID_OF_CURRENT_ORDERS FOREIGN KEY (ID_OF_CURRENT_ORDERS) REFERENCES ORDERS(ID);


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

-- popola la tabella degli autori
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Stephen', 'King', 5, 'Stephen King è uno dei più celebri autori di romanzi horror, thriller e fantasy.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Joël', 'Dicker', 12, 'Joël Dicker è uno scrittore svizzero noto per i suoi romanzi di narrativa.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Alessandro', 'Baricco', 11, 'Alessandro Baricco è uno scrittore italiano famoso per i suoi romanzi.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('J.K.', 'Rowling', 1, 'J.K. Rowling è l''autrice della serie di romanzi Harry Potter, conosciuta in tutto il mondo.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Isabel', 'Allende', 2, 'Isabel Allende è una famosa scrittrice cilena conosciuta per i suoi romanzi.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Banana', 'Yoshimoto', 11, 'Banana Yoshimoto è una scrittrice giapponese nota per le sue opere di narrativa.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Umberto', 'Eco', 11, 'Umberto Eco è stato uno degli scrittori italiani più importanti del XX secolo.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Ken', 'Follett', 2, 'Ken Follett è uno scrittore britannico famoso per i suoi romanzi storici.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Paulo', 'Coelho', 11, 'Paulo Coelho è uno scrittore brasiliano conosciuto per il suo romanzo L''Alchimista.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Haruki', 'Murakami', 11, 'Haruki Murakami è uno degli autori giapponesi contemporanei più celebri al mondo.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Margaret', 'Atwood', 11, 'Margaret Atwood è una scrittrice canadese nota per i suoi romanzi distopici, come Il racconto dell''ancella.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Elena', 'Ferrante', 11, 'Elena Ferrante è lo pseudonimo di una misteriosa scrittrice italiana, autrice della saga de L''amica geniale.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Gabriel', 'García Márquez', 11, 'Gabriel García Márquez è stato uno degli scrittori latinoamericani più importanti, autore di Cento anni di solitudine.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Herman', 'Hesse', 11, 'Herman Hesse è stato uno scrittore tedesco vincitore del Premio Nobel per la Letteratura nel 1946.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Italo', 'Calvino', 11, 'Italo Calvino è stato uno degli scrittori italiani più importanti del XX secolo.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Jorge Luis', 'Borges', 11, 'Jorge Luis Borges è stato uno degli scrittori argentini più influenti del XX secolo.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Marguerite', 'Duras', 11, 'Marguerite Duras è stata una scrittrice francese nota per il suo stile sperimentale e poetico.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Agatha', 'Christie', 3, 'Agatha Christie è stata una celebre scrittrice britannica di gialli.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('George', 'Orwell', 11, 'George Orwell è stato uno scrittore britannico autore di opere come 1984 e La fattoria degli animali.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Leo', 'Tolstoj', 2, 'Lev Tolstoj è stato uno degli scrittori russi più famosi, autore di Guerra e pace e Anna Karenina.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Philip', 'K. Dick', 10, 'Philip K. Dick è stato uno degli autori più influenti nel campo della fantascienza, noto per opere come "Blade Runner" e "L Uomo nell Alto Castello".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Terry', 'Pratchett', 10, 'Terry Pratchett è stato uno scrittore britannico famoso per la serie di romanzi umoristici del "Mondo Disco".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Arthur', 'Conan Doyle', 3, 'Sir Arthur Conan Doyle è stato uno scrittore scozzese noto per i suoi romanzi e racconti gialli, in particolare per il personaggio di Sherlock Holmes.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Dan', 'Brown', 4, 'Dan Brown è uno scrittore statunitense famoso per i suoi thriller, tra cui "Il Codice Da Vinci" e "Angeli e Demoni".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Michael', 'Crichton', 5, 'Michael Crichton è stato uno scrittore e regista statunitense noto per i suoi romanzi di fantascienza e thriller, come "Jurassic Park" e "Il mondo perduto".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('John', 'Grisham', 4, 'John Grisham è uno scrittore statunitense famoso per i suoi legal thriller, tra cui "Il Cliente" e "Il Fuggitivo".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('H.P.', 'Lovecraft', 5, 'H.P. Lovecraft è stato uno scrittore statunitense noto per i suoi racconti di orrore cosmico, che hanno influenzato il genere horror.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Charles', 'Dickens', 11, 'Charles Dickens è stato uno degli scrittori inglesi più importanti del XIX secolo, celebre per romanzi come "Oliver Twist" e "Grandi speranze".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Margaret', 'Mitchell', 4, 'Margaret Mitchell è stata una scrittrice statunitense, autrice del celebre romanzo "Via col vento".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Gabriel Garcia', 'Marquez', 11, 'Gabriel Garcia Marquez è stato uno degli scrittori latinoamericani più importanti, autore di Cento anni di solitudine.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('J.R.R.', 'Tolkien', 1, 'J.R.R. Tolkien è stato uno degli autori fantasy più celebri, noto per il suo epico romanzo Il signore degli anelli.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY)VALUES ('Elena', 'Ferrante', 11, 'Elena Ferrante è lo pseudonimo di una misteriosa scrittrice italiana, autrice della saga de L''amica geniale.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('George', 'Orwell', 11, 'George Orwell è stato uno scrittore britannico autore di opere come 1984 e La fattoria degli animali.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Franz', 'Kafka', 12, 'Franz Kafka è stato uno scrittore boemo di lingua tedesca, noto per opere come Il processo e La metamorfosi.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('George R.R.', 'Martin', 1, 'George R.R. Martin è uno scrittore statunitense famoso per la serie di romanzi Cronache del ghiaccio e del fuoco, che ha ispirato la serie televisiva Il Trono di Spade.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Dan', 'Brown', 4, 'Dan Brown è uno scrittore statunitense famoso per i suoi thriller, tra cui "Il Codice Da Vinci" e "Angeli e Demoni".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Umberto', 'Eco', 11, 'Umberto Eco è stato uno degli scrittori italiani più importanti del XX secolo.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Suzanne', 'Collins', 2, 'Suzanne Collins è una scrittrice e sceneggiatrice statunitense, autrice della trilogia di romanzi Hunger Games.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Daniele', 'Luttazzi', 11, 'Daniele Luttazzi è uno scrittore, comico e conduttore televisivo italiano.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('William', 'Shakespeare', 11, 'William Shakespeare è stato uno dei più grandi drammaturghi e poeti della letteratura mondiale, autore di opere come Romeo e Giulietta e Amleto.');


--popolo la tabella dei libri
INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (1, 'Holly', 4, '2023-01-01', '2023-01-01', 5, 21.99, '9780553103540', 138, 'Quando Penny Dahl chiama la agenzia Finders Keepers nella speranza che possano aiutarla a ritrovare la sua figlia scomparsa, Holly Gibney è restia ad accettare il caso. Il suo socio, Pete, ha il Covid. Sua madre, con cui ha sempre avuto una relazione complicata, è appena morta. E Holly dovrebbe essere in ferie. Ma qualcosa nella voce della signora Dahl che le impedisce di dirle di no. A pochi isolati di distanza dal punto in cui è scomparsa Bonnie Dahl, vivono Rodney ed Emily Harris. Sono il ritratto della rispettabilità borghese: ottuagenari, sposati da una vita, professori universitari emeriti. Ma nello scantinato della loro casetta ordinata e piena di libri nascondono un orrendo segreto, che potrebbe avere a che fare con la scomparsa di Bonnie. È quasi impossibile smascherare il loro piano criminale: i due vecchietti sono scaltri, sono pazienti. E sono spietati. Holly dovrà fare appello a tutto il suo talento per superare in velocità e astuzia i due professori e le loro menti perversamente contorte.', 4);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (2, 'Un animale selvaggio', 4, '2024-01-01', '2024-01-01', 4, 21.99, '9780747532743', 108, '2 luglio 2022, due ladri stanno per rapinare una importante gioielleria di Ginevra. Ma questo non sarà un colpo come tutti gli altri. Venti giorni prima, in un elegante sobborgo sulle rive del lago, Sophie Braun sta per festeggiare il suo quarantesimo compleanno. La vita le sorride, abita con il marito Arpad e i due figli in una magnifica villa al limitare del bosco. Sono entrambi ricchi, belli, felici. Ma il loro mondo idilliaco all’improvviso s’incrina. I segreti che Arpad custodisce cominciano a essere troppi perché possano restare nascosti per sempre. Il loro vicino, un poliziotto sposato dalla reputazione impeccabile, è ossessionato da quella coppia perfetta e da quella donna conturbante. La osserva, la ammira, la spia in ogni momento dell’intimità. Nel giorno del compleanno di Sophie, un uomo misterioso si presenta con un regalo che sconvolgerà la sua vita dorata. I fili che intrappolano queste vite portano lontano nel tempo, lontano da Ginevra e dalla villa elegante dei Braun, in un passato che insegue il presente e che Sophie e Arpad dovranno affrontare per risolvere un intrigo diabolico, dal quale nessuno uscirà indenne. Nemmeno il lettore.', 5);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (3, 'Abel', 12, '2023-01-01', '2023-01-01', 1, 16.99, '9780060256654', 78, 'Ha ventisette anni, Abel, quando diventa leggenda. Ha messo fine a una rapina sparando simultaneamente con due pistole contro obiettivi diversi. Un colpo detto il Mistico, che pochi sono in grado di mettere a segno con la sua precisione. È lo sceriffo della cittadina di un Ovest immaginario ed è innamorato di Hallelujah Wood, una donna che ha addosso una specie di mistero, mani piccole e labbra orientali. Anche lei lo ama: ogni tanto parte senza che lui sappia dove va – “passiamo senza fermarci, è inteso così” –, ma torna sempre. La madre di Abel, invece, anni prima se n’è andata per non tornare mai più. Ha preso i quattro cavalli migliori e ha lasciato lui, i fratelli e la sorella al loro destino. Una bruja una volta gli ha detto: “Sarà molto doloroso, ma un giorno, Abel, te lo prometto, nascerai”. Alessandro Baricco dà vita a un romanzo che è una storia spirituale, sapienziale, e al tempo stesso un western dove la scrittura è geometrica e il racconto visionario.', 4);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (3, 'Oceano mare', 12, '2022-01-01', '2022-01-01', 1, 11.99, '9780060256651', 88, '"Oceano mare" racconta del naufragio di una fregata della marina francese, molto tempo fa, in un oceano. Gli uomini a bordo cercheranno di salvarsi su una zattera. Sul mare si incontreranno le vicende di strani personaggi. Come il professore Bartleboom che cerca di stabilire dove finisce il mare, o il pittore Plasson che dipinge solo con acqua marina, e tanti altri individui in cerca di sé, sospesi sul bordo, col destino segnato dal mare. E sul mare si affaccia anche la locanda Almayer, dove le tante storie confluiscono. Usando il mare come metafora esistenziale, Baricco narra dei suoi surreali personaggi, spaziando in vari registri stilistici.', 4);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (4, 'Harry Potter e la pietra filosofale.', 1, '2020-01-01', '2020-01-01', 5, 9.99, '9780060256652', 235, 'Tutto comincia da qui. Il primo capitolo di uno dei più grandi fenomeni letterari internazionali, il libro che ha fatto leggere milioni di ragazzi e ha unito genitori e figli nella scoperta di un universo fantastico che è già parte del immaginario collettivo. Edizione speciale con contenuti inediti: la mappa di Hogwarts, il glossario, curiosità sui fondatori di Hogwarts.', 5);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (5, 'Il vento conosce il mio nome', 13, '2023-01-01', '2023-01-01', 1, 21.99, '9780060256653', 135, 'Vienna, 1938. Samuel Adler è un bambino ebreo di sei anni il cui padre scompare durante la Notte dei cristalli, quando la sua famiglia perde tutto. La madre, per salvarlo, lo mette su un treno che lo porterà dall’Austria all’Inghilterra. Per Samuel inizia così una nuova fase della sua lunga vita, sempre accompagnato dal suo fedele violino e dal peso dell’incertezza e della solitudine. Arizona, 2019. Anita Díaz, sette anni, sale su un altro treno con sua madre per sfuggire a un pericolo imminente nel Salvador e cercare rifugio negli Stati Uniti. Ma il loro arrivo coincide con la nuova politica di separazione famigliare, e Anita si ritrova sola e spaventata in un centro di accoglienza a Nogales. Lontana dai suoi affetti e senza certezze, si rifugia su Azabahar, una magica stella che esiste solo nella sua immaginazione. Nel frattempo Selena Durán, una giovane assistente sociale, chiede aiuto a un avvocato di successo nella speranza di rintracciare la madre di Anita. Intrecciando passato e presente, Il vento conosce il mio nome racconta la storia di due personaggi indimenticabili, entrambi alla ricerca di una famiglia.', 4);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (6, 'Che significa diventare adulti?', 13, '2024-01-01', '2024-01-01', 1, 11.99, '9780060256655', 97, 'Che significa diventare adulti? Si deve studiare per forza? Che cos’è la normalità? Che succede quando si muore? A queste e altre domande Banana Yoshimoto cerca di rispondere in un piccolo saggio che, si augura, possa funzionare “un po’ come un amuleto” per aiutare i lettori di tutte le età a ritrovare serenità e speranza nei momenti più difficili.', 5);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (7, 'L''isola alla fine del mondo', 12, '2023-02-01', '2023-02-01', 2, 18.99, '9788804628524', 220, 'Un uomo naufraga su un’isola deserta dopo un incidente aereo. Lottando per sopravvivere, scopre che l''isola non è così disabitata come sembra, e che nasconde segreti che metteranno alla prova la sua forza e la sua sanità mentale.', 4);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (8, 'L''ombra del vento', 11, '2023-03-01', '2023-03-01', 2, 22.99, '9788804628500', 320, 'Un giovane ragazzo scopre un libro misterioso in una biblioteca segreta e si immerge in una avventura che svela oscuri segreti del suo passato familiare e della città di Barcellona.', 5);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (9, 'Il mago', 1, '2023-04-01', '2023-04-01', 3, 19.99, '9788804628517', 280, 'Un giovane mago scopre di avere poteri magici e deve imparare a padroneggiarli mentre affronta minacce oscure e intrighi magici.', 4);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (10, 'Il cammino dell''uomo', 2, '2023-05-01', '2023-05-01', 3, 24.99, '9788804628531', 350, 'Un giovane avventuriero intraprende un viaggio epico per scoprire il vero significato della vita e della morte, incontrando ostacoli e alleati lungo il cammino.', 5);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (11, 'La città perduta', 3, '2023-06-01', '2023-06-01', 4, 20.99, '9788804628548', 300, 'Un investigatore privato viene assunto per trovare una città leggendaria che si crede sia scomparsa nel deserto secoli fa, ma che potrebbe ancora nascondere tesori e segreti nascosti.', 4);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (12, 'L''alchimista', 1, '2023-07-01', '2023-07-01', 5, 17.99, '9788804628555', 250, 'Un pastore spagnolo intraprende un viaggio per trovare un tesoro nascosto, ma lungo il cammino scopre che il vero tesoro è la conoscenza e la autorealizzazione.', 5);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (13, '1Q84', 1, '2023-08-01', '2023-08-01', 5, 23.99, '9788804628562', 500, 'In un mondo parallelo in cui la realtà è distorta e minacciata da forze oscure, due persone si trovano intrappolate in una spirale di eventi che li porterà a confrontarsi con la verità e il destino.', 4);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (14, 'Cento anni di solitudine', 11, '2023-09-01', '2023-09-01', 6, 26.99, '9788804628579', 400, 'Il romanzo narra la storia della famiglia Buendía nel paese immaginario di Macondo, attraverso generazioni segnate da amori proibiti, tragedie e maledizioni, creando un affresco magico e realistico allo stesso tempo.', 5);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (15, 'Il signore degli anelli', 1, '2023-10-01', '2023-10-01', 7, 29.99, '9788804628586', 600, 'Un giovane hobbit di nome Frodo Baggins intraprende un epico viaggio per distruggere un potente anello e salvare il suo mondo dalla minaccia del Signore Oscuro Sauron.', 5);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (16, 'L''amica geniale', 12, '2023-11-01', '2023-11-01', 8, 21.99, '9788804628593', 350, 'Il romanzo segue una amicizia tra due ragazze, Elena e Lila, nel quartiere povero di Napoli negli anni 50, esplorando le loro vite e i loro destini intrecciati.', 5);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (17, '1984', 1, '2023-12-01', '2023-12-01', 9, 18.99, '9788804628609', 320, 'In un mondo totalitario dominato dal Grande Fratello, il protagonista Winston Smith lotta per mantenere la sua libertà di pensiero e identità individuale.', 5);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (18, 'Il processo', 12, '2024-01-01', '2024-01-01', 10, 19.99, '9788804628616', 300, 'Il romanzo segue la storia di Josef K., che viene arrestato e processato da un sistema giudiziario oscuro e assurdo, senza mai sapere di che crimine è accusato.', 4);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (19, 'Cronache del ghiaccio e del fuoco', 1, '2024-02-01', '2024-02-01', 6, 27.99, '9788804628623', 700, 'Un epica saga fantasy che segue le lotte per il potere tra famiglie nobili e le minacce di creature soprannaturali in un mondo simile all Europa medievale.', 5);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (20, 'Il codice Da Vinci', 3, '2024-03-01', '2024-03-01', 10, 23.99, '9788804628630', 400, 'Un professore di simbologia religiosa e una criptologa indagano su una serie di omicidi collegati a un segreto millenario che potrebbe sconvolgere le fondamenta della cristianità.', 4);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (21, 'Il nome della rosa', 3, '2024-04-01', '2024-04-01', 2, 22.99, '9788804628647', 500, 'Un frate domenicano e il suo allievo indagano su una serie di omicidi in un monastero medievale, affrontando misteri teologici e intrighi politici.', 5);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUMBER, SYNOPSIS, RATING)
VALUES (22, 'La ragazza di Fuoco', 2, '2024-05-01', '2024-05-01', 3, 21.99, '9788804628654', 350, 'Non puoi rifiutarti di partecipare agli Hunger Games. Una volta scelto, il tuo destino è scritto. Dovrai lottare fino all''ultimo, persino uccidere per farcela. Katniss ha vinto. Ma è davvero salva? Dopo la settantaquattresima edizione degli Hunger Games, l''implacabile reality show che si svolge a Panem ogni anno, lei e Peeta sono, miracolosamente, ancora vivi. Katniss dovrebbe sentirsi sollevata, perfino felice. Dopotutto, è riuscita a tornare dalla sua famiglia e dall''amico di sempre, Gale. Invece nulla va come Katniss vorrebbe',4);

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
