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
    PAGE_NUYMBER INTEGER,
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


--popolo la tabella dei libri
INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUYMBER, SYNOPSIS, RATING)
VALUES (1, 'Holly', 4, '2023-01-01', '2023-01-01', 5, 21.99, '9780553103540', 138, 'Quando Penny Dahl chiama la agenzia Finders Keepers nella speranza che possano aiutarla a ritrovare la sua figlia scomparsa, Holly Gibney è restia ad accettare il caso. Il suo socio, Pete, ha il Covid. Sua madre, con cui ha sempre avuto una relazione complicata, è appena morta. E Holly dovrebbe essere in ferie. Ma qualcosa nella voce della signora Dahl che le impedisce di dirle di no. A pochi isolati di distanza dal punto in cui è scomparsa Bonnie Dahl, vivono Rodney ed Emily Harris. Sono il ritratto della rispettabilità borghese: ottuagenari, sposati da una vita, professori universitari emeriti. Ma nello scantinato della loro casetta ordinata e piena di libri nascondono un orrendo segreto, che potrebbe avere a che fare con la scomparsa di Bonnie. È quasi impossibile smascherare il loro piano criminale: i due vecchietti sono scaltri, sono pazienti. E sono spietati. Holly dovrà fare appello a tutto il suo talento per superare in velocità e astuzia i due professori e le loro menti perversamente contorte.', 4);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUYMBER, SYNOPSIS, RATING)
VALUES (2, 'Un animale selvaggio', 4, '2024-01-01', '2024-01-01', 4, 21.99, '9780747532743', 108, '2 luglio 2022, due ladri stanno per rapinare una importante gioielleria di Ginevra. Ma questo non sarà un colpo come tutti gli altri. Venti giorni prima, in un elegante sobborgo sulle rive del lago, Sophie Braun sta per festeggiare il suo quarantesimo compleanno. La vita le sorride, abita con il marito Arpad e i due figli in una magnifica villa al limitare del bosco. Sono entrambi ricchi, belli, felici. Ma il loro mondo idilliaco all’improvviso s’incrina. I segreti che Arpad custodisce cominciano a essere troppi perché possano restare nascosti per sempre. Il loro vicino, un poliziotto sposato dalla reputazione impeccabile, è ossessionato da quella coppia perfetta e da quella donna conturbante. La osserva, la ammira, la spia in ogni momento dell’intimità. Nel giorno del compleanno di Sophie, un uomo misterioso si presenta con un regalo che sconvolgerà la sua vita dorata. I fili che intrappolano queste vite portano lontano nel tempo, lontano da Ginevra e dalla villa elegante dei Braun, in un passato che insegue il presente e che Sophie e Arpad dovranno affrontare per risolvere un intrigo diabolico, dal quale nessuno uscirà indenne. Nemmeno il lettore.', 5);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUYMBER, SYNOPSIS, RATING)
VALUES (3, 'Abel', 12, '2023-01-01', '2023-01-01', 1, 16.99, '9780060256654', 78, 'Ha ventisette anni, Abel, quando diventa leggenda. Ha messo fine a una rapina sparando simultaneamente con due pistole contro obiettivi diversi. Un colpo detto il Mistico, che pochi sono in grado di mettere a segno con la sua precisione. È lo sceriffo della cittadina di un Ovest immaginario ed è innamorato di Hallelujah Wood, una donna che ha addosso una specie di mistero, mani piccole e labbra orientali. Anche lei lo ama: ogni tanto parte senza che lui sappia dove va – “passiamo senza fermarci, è inteso così” –, ma torna sempre. La madre di Abel, invece, anni prima se n’è andata per non tornare mai più. Ha preso i quattro cavalli migliori e ha lasciato lui, i fratelli e la sorella al loro destino. Una bruja una volta gli ha detto: “Sarà molto doloroso, ma un giorno, Abel, te lo prometto, nascerai”. Alessandro Baricco dà vita a un romanzo che è una storia spirituale, sapienziale, e al tempo stesso un western dove la scrittura è geometrica e il racconto visionario.', 4);

INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUYMBER, SYNOPSIS, RATING)
VALUES (3, 'Oceano mare', 12, '2022-01-01', '2022-01-01', 1, 11.99, '9780060256651', 88, '"Oceano mare" racconta del naufragio di una fregata della marina francese, molto tempo fa, in un oceano. Gli uomini a bordo cercheranno di salvarsi su una zattera. Sul mare si incontreranno le vicende di strani personaggi. Come il professore Bartleboom che cerca di stabilire dove finisce il mare, o il pittore Plasson che dipinge solo con acqua marina, e tanti altri individui in cerca di sé, sospesi sul bordo, col destino segnato dal mare. E sul mare si affaccia anche la locanda Almayer, dove le tante storie confluiscono. Usando il mare come metafora esistenziale, Baricco narra dei suoi surreali personaggi, spaziando in vari registri stilistici.', 4);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUYMBER, SYNOPSIS, RATING)
VALUES (4, 'Harry Potter e la pietra filosofale.', 1, '2020-01-01', '2020-01-01', 5, 9.99, '9780060256652', 235, 'Tutto comincia da qui. Il primo capitolo di uno dei più grandi fenomeni letterari internazionali, il libro che ha fatto leggere milioni di ragazzi e ha unito genitori e figli nella scoperta di un universo fantastico che è già parte del immaginario collettivo. Edizione speciale con contenuti inediti: la mappa di Hogwarts, il glossario, curiosità sui fondatori di Hogwarts.', 5);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUYMBER, SYNOPSIS, RATING)
VALUES (5, 'Il vento conosce il mio nome', 13, '2023-01-01', '2023-01-01', 1, 21.99, '9780060256653', 135, 'Vienna, 1938. Samuel Adler è un bambino ebreo di sei anni il cui padre scompare durante la Notte dei cristalli, quando la sua famiglia perde tutto. La madre, per salvarlo, lo mette su un treno che lo porterà dall’Austria all’Inghilterra. Per Samuel inizia così una nuova fase della sua lunga vita, sempre accompagnato dal suo fedele violino e dal peso dell’incertezza e della solitudine. Arizona, 2019. Anita Díaz, sette anni, sale su un altro treno con sua madre per sfuggire a un pericolo imminente nel Salvador e cercare rifugio negli Stati Uniti. Ma il loro arrivo coincide con la nuova politica di separazione famigliare, e Anita si ritrova sola e spaventata in un centro di accoglienza a Nogales. Lontana dai suoi affetti e senza certezze, si rifugia su Azabahar, una magica stella che esiste solo nella sua immaginazione. Nel frattempo Selena Durán, una giovane assistente sociale, chiede aiuto a un avvocato di successo nella speranza di rintracciare la madre di Anita. Intrecciando passato e presente, Il vento conosce il mio nome racconta la storia di due personaggi indimenticabili, entrambi alla ricerca di una famiglia.', 4);


INSERT INTO BOOK (AUTHOR_ID, TITLE, GENRE_ID, EDITION_DATE, PRINT_DATE, PUBLISHER_ID, PRICE, EAN, PAGE_NUYMBER, SYNOPSIS, RATING)
VALUES (6, 'Che significa diventare adulti?', 13, '2024-01-01', '2024-01-01', 1, 11.99, '9780060256655', 97, 'Che significa diventare adulti? Si deve studiare per forza? Che cos’è la normalità? Che succede quando si muore? A queste e altre domande Banana Yoshimoto cerca di rispondere in un piccolo saggio che, si augura, possa funzionare “un po’ come un amuleto” per aiutare i lettori di tutte le età a ritrovare serenità e speranza nei momenti più difficili.', 5);


-- popolo la tabella utenti
INSERT INTO "USER" (EMAIL, PASSWORD, DATE_OF_REGISTRATION, PREFERRED_GENRES)
VALUES
('user1@example.com', 'password1', '2023-01-01', 1),
('user2@example.com', 'password2', '2023-01-02', 2),
('user3@example.com', 'password3', '2023-01-03', 3),
('user4@example.com', 'password4', '2023-01-04', 4),
('user5@example.com', 'password5', '2023-01-05', 5),
('user6@example.com', 'password6', '2023-01-06', 6),
('user7@example.com', 'password7', '2023-01-07', 7),
('user8@example.com', 'password8', '2023-01-08', 8),
('user9@example.com', 'password9', '2023-01-09', 9),
('user10@example.com', 'password10', '2023-01-10', 10),
('user11@example.com', 'password11', '2023-01-11', 11),
('user12@example.com', 'password12', '2023-01-12', 12),
('user13@example.com', 'password13', '2023-01-13', 13),
('user14@example.com', 'password14', '2023-01-14', 14),
('user15@example.com', 'password15', '2023-01-15', 15);

-- Popolamento della tabella ORDERS
INSERT INTO ORDERS (ORDER_NUMBER, BOOK_ID, USER_ID, ADDRESS, BOOKING_DATE, ORDER_TOTAL)
VALUES
(1001, 1, 1, 'Via Roma 1, Milano, Italia', '2023-01-01', 25.99),
(1002, 2, 2, 'Via Garibaldi 2, Roma, Italia', '2023-01-02', 19.99),
(1003, 3, 3, 'Piazza San Marco 3, Venezia, Italia', '2023-01-03', 35.50),
(1004, 4, 4, 'Corso Vittorio Emanuele 4, Napoli, Italia', '2023-01-04', 28.75),
(1005, 5, 5, 'Via della Conciliazione 5, Firenze, Italia', '2023-01-05', 30.00),
(1006, 6, 6, 'Piazza Duomo 6, Palermo, Italia', '2023-01-06', 22.49),
(1007, 1, 7, 'Corso Buenos Aires 7, Torino, Italia', '2023-01-07', 27.99),
(1008, 2, 8, 'Via del Corso 8, Bologna, Italia', '2023-01-08', 18.99),
(1009, 3, 9, 'Corso Umberto I 9, Genova, Italia', '2023-01-09', 32.25),
(1010, 4, 10, 'Piazza Bra 10, Verona, Italia', '2023-01-10', 23.75),
(1011, 5, 11, 'Piazza del Campo 11, Siena, Italia', '2023-01-11', 20.99),
(1012, 6, 12, 'Corso Cavour 12, Perugia, Italia', '2023-01-12', 24.50),
(1013, 1, 13, 'Via dei Tribunali 13, Catania, Italia', '2023-01-13', 28.00),
(1014, 2, 14, 'Piazza del Popolo 14, Lecce, Italia', '2023-01-14', 19.25),
(1015, 3, 15, 'Corso Vittorio Veneto 15, Trento, Italia', '2023-01-15', 35.99),
(1016, 4, 1, 'Via Roma 16, Milano, Italia', '2023-01-16', 27.99),
(1017, 5, 2, 'Via Garibaldi 17, Roma, Italia', '2023-01-17', 24.50),
(1018, 6, 3, 'Piazza San Marco 18, Venezia, Italia', '2023-01-18', 18.75),
(1019, 1, 4, 'Corso Vittorio Emanuele 19, Napoli, Italia', '2023-01-19', 31.00),
(1020, 2, 5, 'Via della Conciliazione 20, Firenze, Italia', '2023-01-20', 22.25);


