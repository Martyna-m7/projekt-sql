--Przygotuj projekt bazy danych dla wybranej organizacji (mo¿e to byæ sklep, aplikacja, platforma, magazyn, itp).
--Utwórz logicznie powi¹zane tabele, wype³nione danymi oraz przygotuj wybrane analizy na podstawie dotychczasowych zajêæ.
--Wœród inspiracji analiz mog¹ znaleŸæ siê np. analizy sprzeda¿y, analizy iloœci transakcji, wystêpieñ, analizy kosztów, poszukiwanie anomalii - wszystko co wybierzecie bêdzie w porz¹dku. Tworz¹c kody pamiêtaj o dodawaniu komentarzy.
--Przy zwracaniu zadania domowego przeœlij tylko kod.


create database  SKLEP

USE SKLEP

--Tworzenie tabeli

CREATE TABLE Klient (
KlientID int not null identity(1,1) primary key,
Nazwisko varchar(50),
Imiê varchar(50),
Emial varchar(50),
Telefon varchar(50) UNIQUE,
Adres varchar(50),
Miasto varchar(50)
)

CREATE TABLE Produkt (
ProduktID int not null identity(1,1) primary key,
Nazwa varchar(50) NOT NULL,
Cena decimal(10, 2) NOT NULL,
KategoriaID int not null,
StanMagazynowy int NOT NULL
)

CREATE TABLE Zamowienie (
ZamówienieID int not null IDENTITY(1,1) primary key,
KlientID int NOT NULL,
DataZamówienia date NOT NULL,
Status varchar(20) NOT NULL,
)

CREATE TABLE Szczegó³y_Zamowienia (
Szczegó³yID int not null IDENTITY(1,1) primary key,
ZamówienieID int NOT NULL,
ProduktID int NOT NULL,
Iloœæ int NOT NULL,
CenaJednostkowa decimal(10, 2) NOT NULL
)

CREATE TABLE Kategoria (
KategoriaID int not null IDENTITY(1,1) primary key, 
NazwaKategorii varchar(100)
)


-- Wype³nianie tabel danymi

INSERT INTO Klient(Imiê, Nazwisko, Emial, Telefon, Adres, Miasto)
VALUES
	('Anna', 'Kowalska', 'annakowalska1@wp.pl', '789456123', 'Polna 1', 'Warszawa'),
	('Joanna', 'Nowak', 'joannanowak1223@gamil.com', '456987258', 'Kwiatowa 41', 'Poznañ'),
	('Sylwia', 'Kot', 'kotek789@wp.pl', '896569369', 'Lawendowa 2', 'Grañsk'),
	('Wioletta', 'Okoñ', 'wiolkaokon@o2.pl', '654963125', 'Akacjowa 7', 'Rzeszów'),
	('El¿bieta', 'Pawlik', 'elka1998@gmail.com', '548789125', 'Orzechowa 71', 'Lubin'),
	('Beata', 'Leñ', 'becialen_14@wp.pl', '456321456', 'Turystyczna 145', 'Bia³ystok'),
	('Iwona', 'Pi¹tek', 'iwonkapiatek.145@o2.pl', '963214562', 'Grunwaldzka 91', 'Bydgoszcz'),
	('Aleksandra', 'Mróz', 'olkamroz11@wp.pl', '456789147', 'Jaœminowa 58', 'Warszawa'),
	('Dawid', 'Ptak', 'piaszekdawid@wp.pl', '454879636', 'Kalinowa 7/7', 'Warszawa'),
	('Justyna', 'Nowicka', 'justaaaa@wp.pl', '897123753', 'Jasna 147', 'Poznañ')
	
		
	select * from Klient

	INSERT INTO Kategoria( NazwaKategorii)
VALUES
	('Makija¿'),
	('Pielêgnacja')

		
	select * from Kategoria

	INSERT INTO Produkt(Nazwa, Cena, StanMagazynowy, KategoriaID) 
VALUES
	('B³yszczyk', 32, 152, '1'),
	('Pomadka', 10.00, 200, '1'),
	('Tusz do rzês - CZARNY', 35.00, 158, '1'),
	('Puder rozœwietlaj¹cy', 45.00,  250, '1'),
	('Br¹zer', 70.00, 500, '1'),
	('Ró¿ w kamieniu', 40.00, 350, '1'),
	('Korektor', 20.00,  150, '1'),
	('Tusz do rzês - BR¥ZOWY ', 40.00, 150, '1'),
	('Szampon', 70.00, 300, '2'),
	('Od¿ywka do w³osów', 35, 451, '2'),
	('Krem na dziñ', 77.99, 154, '2'),
	('Krem na noc', 147.99, 555, '2')

	INSERT INTO Zamowienie(KlientID, DataZamówienia, Status) 
VALUES

('1', '2024-08-02', 'Zrealizowane'),
('2', '2024-11-12', 'Zrealizowane'),
('3', '2024-09-02', 'Zrealizowane'),
('4', '2024-07-12', 'Zrealizowane'),
('5', '2024-07-21', 'Zrealizowane'),
('6', '2024-07-01', 'Zrealizowane'),
('7', '2024-12-22', 'Zrealizowane'),
('8', '2024-12-12', 'Zrealizowane'),
('9', '2024-12-02', 'Zrealizowane'),
('10', '2024-11-02', 'Zrealizowane'),
('1', '2025-01-22', 'Oczekuj¹ce'),
('1', '2025-01-25', 'Oczekuj¹ce'),
('3', '2025-01-26', 'Oczekuj¹ce'),
('4', '2025-01-23', 'Oczekuj¹ce'),
('5', '2025-01-24', 'Oczekuj¹ce')

	select * from Zamowienie

	INSERT INTO Szczegó³y_Zamowienia(ZamówienieID, ProduktID, Iloœæ, CenaJednostkowa)
VALUES
('1', '1','1', 32),
('1', '10', '3', 35),
('1', '11', '2', 77.99),
('2', '1', '3', 32),
('3', '2', '2', 10),
('3', '1', '1', 32),
('4', '3', '4', 35),
('4', '10', '2',35),
('5', '5', '6', 70),
('5', '4', '2', 45),
('6', '5', '1', 70),
('7', '6', '2', 40),
('8', '7', '1', 20),
('9', '8', '4', 40),
('10', '9', '2', 70)


select * from Szczegó³y_Zamowienia


--ANALIZA

--1.Ile transakcji (zamówieñ) wykona³ ka¿dy klient?
SELECT 
    k.Imiê,
    k.Nazwisko,
    COUNT(z.ZamówienieID) AS LiczbaTransakcji
FROM 
    Klient k
JOIN Zamowienie z ON k.KlientID = z.KlientID
GROUP BY 
    k.KlientID, k.Imiê, k.Nazwisko
ORDER BY 
    LiczbaTransakcji DESC;

--2.Ile zamówieñ jest w statusie "Zrealizowane" a ile w "Oczekuj¹ce".

SELECT 
    z.Status,
    COUNT(z.ZamówienieID) AS LiczbaZamówieñ
FROM 
    Zamowienie z
GROUP BY 
    z.Status;

--3.Klienci, którzy z³o¿yli wiêcej ni¿ jedno zamówienie.
	
SELECT 
    k.Imiê,
    k.Nazwisko,
    COUNT(z.ZamówienieID) AS LiczbaZamówieñ
FROM 
    Klient k
JOIN Zamowienie z ON k.KlientID = z.KlientID
GROUP BY 
    k.KlientID, k.Imiê, k.Nazwisko
HAVING 
    COUNT(z.ZamówienieID) > 1
ORDER BY 
    LiczbaZamówieñ DESC;


--4.Cena jednostkowa produktu.
SELECT 
    p.Nazwa,
    p.Cena
FROM 
    Produkt p
ORDER BY 
    p.Cena ASC

--5.Pokaz nazwy produktów, które zosta³y sprzedane oraz ich ³¹czn¹ wartoœæ.
SELECT Nazwa, sum(Szczegó³y_Zamowienia.CenaJednostkowa*Iloœæ) as Wartoœæ
FROM Produkt 
	join Szczegó³y_Zamowienia on (Produkt.ProduktID = Szczegó³y_Zamowienia.ProduktID)
	join Zamowienie on (Zamowienie.ZamówienieID = Szczegó³y_Zamowienia.Szczegó³yID)
GROUP BY Nazwa
ORDER BY Nazwa

--6.Poka¿ nazwiska klientów, którzy z³o¿yli zamówienie na B³yszczyk.
SELECT Nazwisko
FROM Klient 
	left join Zamowienie on (Zamowienie.KlientID = Klient.KlientID)
	left join Szczegó³y_Zamowienia on  (Zamowienie.ZamówienieID = Szczegó³y_Zamowienia.ZamówienieID)
	left join Produkt on (Szczegó³y_Zamowienia.ProduktID = Produkt.ProduktID)
WHERE Nazwa like 'B³yszczyk'

--7.Poka¿ ³¹czn¹ wartoœæ wszystkich zamówieñ. 
SELECT sum (Szczegó³y_Zamowienia.Iloœæ * Szczegó³y_Zamowienia.CenaJednostkowa) as Wartoœæ_wszystkich_zamówieñ
FROM Zamowienie
	join Szczegó³y_Zamowienia on Zamowienie.ZamówienieID = Szczegó³y_Zamowienia.ZamówienieID;


--8.Dla jakiej kategorii produktów wartoœæ w magazynie jest najwiêksza?
SELECT TOP 1 K.NazwaKategorii, SUM(P.StanMagazynowy * P.Cena) AS WartoscMagazynowa
FROM Produkt P
JOIN Kategoria K ON P.KategoriaID = K.KategoriaID
GROUP BY K.NazwaKategorii
ORDER BY WartoscMagazynowa DESC; 

--9. Wyœwietl nazwiska klientów, których 2ga litera to "o", 4ta to "a". 
SELECT Nazwisko
FROM Klient
WHERE Nazwisko like '_o_a%'

--10.Ile zamówieñ by³o z³o¿onych z Warszawy?
SELECT 
    COUNT(*) AS Zamówienia_z_Warszawy
FROM 
    Zamowienie
JOIN 
    Klient ON Zamowienie.KlientID = Klient.KlientID
WHERE 
    Klient.Miasto = 'Warszawa'
