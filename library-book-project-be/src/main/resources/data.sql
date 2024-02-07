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
    GENRE_ID INTEGER,
    EDITOR VARCHAR(100),
    EDITION_DATE DATE,
    PRINT_DATE DATE,
    PUBLISHER_ID INTEGER,
    PRICE DECIMAL(10, 2),
    EAN VARCHAR(100) UNIQUE,
    PAGE_NUYMBER INTEGER,
    synopsis BYTEA,
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
    -- ID_OF_PAST_ORDERS INTEGER REFERENCES ORDERS(ID),
    -- ID_OF_CURRENT_ORDERS INTEGER REFERENCES ORDERS(ID),
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
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Philip', 'K. Dick', 10, 'Philip K. Dick è stato uno degli autori più influenti nel campo della fantascienza, noto per opere come "Blade Runner" e "L'Uomo nell'Alto Castello".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Terry', 'Pratchett', 10, 'Terry Pratchett è stato uno scrittore britannico famoso per la serie di romanzi umoristici del "Mondo Disco".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Arthur', 'Conan Doyle', 3, 'Sir Arthur Conan Doyle è stato uno scrittore scozzese noto per i suoi romanzi e racconti gialli, in particolare per il personaggio di Sherlock Holmes.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Dan', 'Brown', 4, 'Dan Brown è uno scrittore statunitense famoso per i suoi thriller, tra cui "Il Codice Da Vinci" e "Angeli e Demoni".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Michael', 'Crichton', 5, 'Michael Crichton è stato uno scrittore e regista statunitense noto per i suoi romanzi di fantascienza e thriller, come "Jurassic Park" e "Il mondo perduto".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('John', 'Grisham', 4, 'John Grisham è uno scrittore statunitense famoso per i suoi legal thriller, tra cui "Il Cliente" e "Il Fuggitivo".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('H.P.', 'Lovecraft', 5, 'H.P. Lovecraft è stato uno scrittore statunitense noto per i suoi racconti di orrore cosmico, che hanno influenzato il genere dell'horror.');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Charles', 'Dickens', 11, 'Charles Dickens è stato uno degli scrittori inglesi più importanti del XIX secolo, celebre per romanzi come "Oliver Twist" e "Grandi speranze".');
INSERT INTO AUTHOR (NAME, SURNAME, GENRE_ID, BIOGRAPHY) VALUES ('Margaret', 'Mitchell', 4, 'Margaret Mitchell è stata una scrittrice statunitense, autrice del celebre romanzo "Via col vento".');





