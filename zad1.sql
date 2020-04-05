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
	kwota MONEY,
	id_premii INT NOT NULL
);

ALTER TABLE godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);

ALTER TABLE pensje
ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);

INSERT INTO pracownicy VALUES(1,'Igor', 'Szczepański','Powstańców 17','456667898');
INSERT INTO pracownicy VALUES(2,'Ewa', 'Szymańska','Wrocławska 44','338946342');
INSERT INTO pracownicy VALUES(3,'Patryk', 'Piotrowski','Mogilska 121','997564285');
INSERT INTO pracownicy VALUES(4,'Katarzyna', 'Wiśniewska','Centralna 8','445629087');
INSERT INTO pracownicy VALUES(5,'Kaja', 'Zielińska','Pilotów 2','669486321');
INSERT INTO pracownicy VALUES(6,'Zuzanna', 'Krupa','Prądnicka 51','886432759');
INSERT INTO pracownicy VALUES(7,'Andrzej', 'Włodarczyk','Karmelicka 87','664359078');
INSERT INTO pracownicy VALUES(8,'Krzysztof', 'Szymczak','Długa 133','997639618');
INSERT INTO pracownicy VALUES(9,'Alina', 'Tomaszewska','Czarnowiejska 18','556734760');
INSERT INTO pracownicy VALUES(10,'Mateusz', 'Baranowski','Szpitalna 24','123835774');
INSERT INTO godziny VALUES(1,'2020-03-02',25,1);
INSERT INTO godziny VALUES(2,'2020-03-05',32,2);
INSERT INTO godziny VALUES(3,'2020-04-07',19,3);
INSERT INTO godziny VALUES(4,'2020-04-14',21,4);
INSERT INTO godziny VALUES(5,'2020-04-16',27,5);
INSERT INTO godziny VALUES(6,'2020-04-29',33,6);
INSERT INTO godziny VALUES(7,'2020-04-28',16,7);
INSERT INTO godziny VALUES(8,'2020-04-21',18,8);
INSERT INTO godziny VALUES(9,'2020-04-24',28,9);
INSERT INTO godziny VALUES(10,'2020-04-17',22,10);
INSERT INTO premie VALUES(1,'Świąteczna',300);
INSERT INTO premie VALUES(2,'Nadgodziny',200);
INSERT INTO premie VALUES(3,'Uznaniowa',400);
INSERT INTO premie VALUES(4,'Świąteczna',300);
INSERT INTO premie VALUES(5,'Świąteczna',300);
INSERT INTO premie VALUES(6,'Uznaniowa',400);
INSERT INTO premie VALUES(7,'Wakacyjna',300);
INSERT INTO premie VALUES(8,'Nadgodziny',200);
INSERT INTO premie VALUES(9,'Wakacyjna',300);
INSERT INTO premie VALUES(10,'Świąteczna',300);
INSERT INTO pensje VALUES(1,'kierownik odziału',4800,1);
INSERT INTO pensje VALUES(2,'administrator sieci',4500,2);
INSERT INTO pensje VALUES(3,' główny księgowy',3900,3);
INSERT INTO pensje VALUES(4,'przedstawiciel handlowy',4100,4);
INSERT INTO pensje VALUES(5,'administrator systemu',4300,5);
INSERT INTO pensje VALUES(6,' kierownik zespołu',3800,6);
INSERT INTO pensje VALUES(7,'główny analityk',5200,7);
INSERT INTO pensje VALUES(8,'dyrektor generalny',7800,8);
INSERT INTO pensje VALUES(9,'kierownik projektu',4600,9);
INSERT INTO pensje VALUES(10,'radaca prawny',5800,10);


