UPDATE pracownicy 
SET telefon = '(+48)' || telefon

UPDATE pracownicy
SET telefon = SUBSTRING(telefon,1,8) || '-' || SUBSTRING (telefon,9,3) || '-' || SUBSTRING (telefon,12,3)

SELECT UPPER(imie), UPPER(nazwisko), UPPER(adres), UPPER(telefon) FROM pracownicy
ORDER BY LENGTH(pracownicy.nazwisko) DESC LIMIT 1 

SELECT MD5(pensje.kwota) AS kwota FROM pracownicy
INNER JOIN wynagrodzenia ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika
INNER JOIN pensje ON pensje.id_pensji = wynagrodzenia.id_pensji

SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota AS pensja, premie.kwota AS premia FROM wynagrodzenia
LEFT JOIN pracownicy ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
LEFT JOIN pensje ON pensje.id_pensji = wynagrodzenia.id_pensji
LEFT JOIN premie ON premie.id_premii = wynagrodzenia.id_premii

SELECT 'Pracownik ' || pracownicy.imie || ' ' || pracownicy.nazwisko || ' w dniu ' ||
godziny.data1|| ' otrzymał pensje całkowitš na kwotę ' || pensje.kwota + premie.kwota ||
', gdzie wynagrodzenie zasadnicze wynosiło: '|| pensje.kwota || ',a premia: ' || premie.kwota 
INNER JOIN pracownicy ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika 
JOIN pensje ON pensje.id_pensji = wynagrodzenia.id_pensji 
JOIN premie ON premie.id_premii = wynagrodzenia.id_premii 
JOIN godziny ON godziny.id_godziny = wynagrodzenia.id_godziny;

