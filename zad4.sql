CREATE TABLE pracownicy(
	id_pracownika SERIAL PRIMARY KEY NOT NULL,
	imie VARCHAR(30) NOT NULL,
	nazwisko VARCHAR(30) NOT NULL,
	adres VARCHAR(30) NOT NULL,
	telefon VARCHAR(12)	
);
CREATE TABLE godziny(
	id_godziny INT PRIMARY KEY NOT NULL,
	data1 DATE NOT NULL,
	liczba_godzin INT,
	id_pracownika INT NOT NULL
);
CREATE TABLE premie(
	id_premii INT PRIMARY KEY NOT NULL,
	rodzaj VARCHAR(30) NOT NULL,
	kwota MONEY
);
CREATE TABLE pensje(
	id_pensji INT PRIMARY KEY NOT NULL,
	stanowisko VARCHAR(50) NOT NULL,
	kwota MONEY
);
CREATE TABLE wynagrodzenia(
	id_wynagrodzenia INT PRIMARY KEY NOT NULL,
	data1 DATE NOT NULL,
	id_pracownika SERIAL NOT NULL,
	id_godziny INT NOT NULL,
	id_pensji INT NOT NULL,
	id_premii INT NOT NULL
);

ALTER TABLE godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);

ALTER TABLE wynagrodzenia
ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);
ALTER TABLE wynagrodzenia
ADD FOREIGN KEY (id_godziny) REFERENCES godziny(id_godziny);
ALTER TABLE wynagrodzenia
ADD FOREIGN KEY (id_pensji) REFERENCES pensje(id_pensji);
ALTER TABLE wynagrodzenia
ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);

SELECT id_pracownika,nazwisko FROM pracownicy


SELECT wynagrodzenia.id_pracownika, pensje.kwota, premie.kwota FROM wynagrodzenia
INNER JOIN pensje ON pensje.id_pensji = wynagrodzenia.id_wynagrodzenia
INNER JOIN premie ON premie.id_premii = wynagrodzenia.id_premii
WHERE pensje.kwota + premie.kwota > '1000';

SELECT wynagrodzenia.id_pracownika, pensje.kwota FROM wynagrodzenia
INNER JOIN pensje ON wynagrodzenia.id_pensji=pensje.id_pensji
WHERE pensje.kwota > '2000' AND wynagrodzenia.id_premii IS NULL;

SELECT * FROM pracownicy WHERE imie LIKE 'J%';

SELECT * FROM pracownicy WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';

SELECT pracownicy.imie, pracownicy.nazwisko, godziny.liczba_godzin AS nadgodziny FROM pracownicy
INNER JOIN godziny ON pracownicy.id_pracownika = godziny.id_pracownika
WHERE godziny.liczba_godzin > 160;

SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota FROM pracownicy
INNER JOIN wynagrodzenia ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN pensje ON wynagrodzenia.id_pensji = pensje.id_pensji
WHERE kwota BETWEEN '1500' AND '3000';

SELECT pensje.kwota, pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko FROM pracownicy
INNER JOIN wynagrodzenia ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN pensje ON wynagrodzenia.id_pensji = pensje.id_pensji
GROUP BY pensje.kwota, pracownicy.id_pracownika;

SELECT godziny.liczba_godzin, pracownicy.imie, pracownicy.nazwisko FROM wynagrodzenia
INNER JOIN pracownicy ON pracownicy.id_pracownika = wynagrodzenia.id_wynagrodzenia
INNER JOIN godziny ON godziny.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN premie ON premie.id_premii = wynagrodzenia.id_premii
WHERE godziny.liczba_godzin > 160 AND premie.id_premii IS NULL;
