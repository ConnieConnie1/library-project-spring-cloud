-- creo la tabella generi
CREATE TABLE IF NOT EXISTS GENRES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    GENRE VARCHAR(100) NOT NULL
);

-- creo la tabella autori
CREATE TABLE IF NOT EXISTS AUTHORS (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    SURNAME VARCHAR(100),
    GENRES_ID INTEGER,
    Biography VARCHAR(5000),
    FOREIGN KEY (GENRES_ID) REFERENCES GENRES(ID)
);



-- creo la tabella Books
CREATE TABLE Books (
    ID SERIAL PRIMARY KEY,
    AUTHOR_ID INTEGER,
    GENRE_ID INTEGER,
    EDITOR VARCHAR(100),
    EDITION_DATE DATE,
    PRINT_DATE DATE,
    PRICE DECIMAL(10, 2),
    EAN VARCHAR(100) UNIQUE,
    PAGE_NUYMBER INTEGER,
    synopsis BYTEA,
    RATING INTEGER CHECK (RATING >= 1 AND RATING <= 5),
    FOREIGN KEY (author_id) REFERENCES AUTHORS(Id),
    FOREIGN KEY (genre_id) REFERENCES GENRES(Id)
);
