--Przygotuj projekt bazy danych dla wybranej organizacji (mo�e to by� sklep, aplikacja, platforma, magazyn, itp).
--Utw�rz logicznie powi�zane tabele, wype�nione danymi oraz przygotuj wybrane analizy na podstawie dotychczasowych zaj��.
--W�r�d inspiracji analiz mog� znale�� si� np. analizy sprzeda�y, analizy ilo�ci transakcji, wyst�pie�, analizy koszt�w, poszukiwanie anomalii - wszystko co wybierzecie b�dzie w porz�dku. Tworz�c kody pami�taj o dodawaniu komentarzy.
--Przy zwracaniu zadania domowego prze�lij tylko kod.


create database  SKLEP

USE SKLEP

--Tworzenie tabeli

CREATE TABLE Klient (
KlientID int not null identity(1,1) primary key,
Nazwisko varchar(50),
Imi� varchar(50),
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
Zam�wienieID int not null IDENTITY(1,1) primary key,
KlientID int NOT NULL,
DataZam�wienia date NOT NULL,
Status varchar(20) NOT NULL,
)

CREATE TABLE Szczeg�y_Zamowienia (
Szczeg�yID int not null IDENTITY(1,1) primary key,
Zam�wienieID int NOT NULL,
ProduktID int NOT NULL,
Ilo�� int NOT NULL,
CenaJednostkowa decimal(10, 2) NOT NULL
)

CREATE TABLE Kategoria (
KategoriaID int not null IDENTITY(1,1) primary key, 
NazwaKategorii varchar(100)
)


-- Wype�nianie tabel danymi

INSERT INTO Klient(Imi�, Nazwisko, Emial, Telefon, Adres, Miasto)
VALUES
	('Anna', 'Kowalska', 'annakowalska1@wp.pl', '789456123', 'Polna 1', 'Warszawa'),
	('Joanna', 'Nowak', 'joannanowak1223@gamil.com', '456987258', 'Kwiatowa 41', 'Pozna�'),
	('Sylwia', 'Kot', 'kotek789@wp.pl', '896569369', 'Lawendowa 2', 'Gra�sk'),
	('Wioletta', 'Oko�', 'wiolkaokon@o2.pl', '654963125', 'Akacjowa 7', 'Rzesz�w'),
	('El�bieta', 'Pawlik', 'elka1998@gmail.com', '548789125', 'Orzechowa 71', 'Lubin'),
	('Beata', 'Le�', 'becialen_14@wp.pl', '456321456', 'Turystyczna 145', 'Bia�ystok'),
	('Iwona', 'Pi�tek', 'iwonkapiatek.145@o2.pl', '963214562', 'Grunwaldzka 91', 'Bydgoszcz'),
	('Aleksandra', 'Mr�z', 'olkamroz11@wp.pl', '456789147', 'Ja�minowa 58', 'Warszawa'),
	('Dawid', 'Ptak', 'piaszekdawid@wp.pl', '454879636', 'Kalinowa 7/7', 'Warszawa'),
	('Justyna', 'Nowicka', 'justaaaa@wp.pl', '897123753', 'Jasna 147', 'Pozna�')
	
		
	select * from Klient

	INSERT INTO Kategoria( NazwaKategorii)
VALUES
	('Makija�'),
	('Piel�gnacja')

		
	select * from Kategoria

	INSERT INTO Produkt(Nazwa, Cena, StanMagazynowy, KategoriaID) 
VALUES
	('B�yszczyk', 32, 152, '1'),
	('Pomadka', 10.00, 200, '1'),
	('Tusz do rz�s - CZARNY', 35.00, 158, '1'),
	('Puder roz�wietlaj�cy', 45.00,  250, '1'),
	('Br�zer', 70.00, 500, '1'),
	('R� w kamieniu', 40.00, 350, '1'),
	('Korektor', 20.00,  150, '1'),
	('Tusz do rz�s - BR�ZOWY ', 40.00, 150, '1'),
	('Szampon', 70.00, 300, '2'),
	('Od�ywka do w�os�w', 35, 451, '2'),
	('Krem na dzi�', 77.99, 154, '2'),
	('Krem na noc', 147.99, 555, '2')

	INSERT INTO Zamowienie(KlientID, DataZam�wienia, Status) 
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
('1', '2025-01-22', 'Oczekuj�ce'),
('1', '2025-01-25', 'Oczekuj�ce'),
('3', '2025-01-26', 'Oczekuj�ce'),
('4', '2025-01-23', 'Oczekuj�ce'),
('5', '2025-01-24', 'Oczekuj�ce')

	select * from Zamowienie

	INSERT INTO Szczeg�y_Zamowienia(Zam�wienieID, ProduktID, Ilo��, CenaJednostkowa)
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


select * from Szczeg�y_Zamowienia


--ANALIZA

--1.Ile transakcji (zam�wie�) wykona� ka�dy klient?
SELECT 
    k.Imi�,
    k.Nazwisko,
    COUNT(z.Zam�wienieID) AS LiczbaTransakcji
FROM 
    Klient k
JOIN Zamowienie z ON k.KlientID = z.KlientID
GROUP BY 
    k.KlientID, k.Imi�, k.Nazwisko
ORDER BY 
    LiczbaTransakcji DESC;

--2.Ile zam�wie� jest w statusie "Zrealizowane" a ile w "Oczekuj�ce".

SELECT 
    z.Status,
    COUNT(z.Zam�wienieID) AS LiczbaZam�wie�
FROM 
    Zamowienie z
GROUP BY 
    z.Status;

--3.Klienci, kt�rzy z�o�yli wi�cej ni� jedno zam�wienie.
	
SELECT 
    k.Imi�,
    k.Nazwisko,
    COUNT(z.Zam�wienieID) AS LiczbaZam�wie�
FROM 
    Klient k
JOIN Zamowienie z ON k.KlientID = z.KlientID
GROUP BY 
    k.KlientID, k.Imi�, k.Nazwisko
HAVING 
    COUNT(z.Zam�wienieID) > 1
ORDER BY 
    LiczbaZam�wie� DESC;


--4.Cena jednostkowa produktu.
SELECT 
    p.Nazwa,
    p.Cena
FROM 
    Produkt p
ORDER BY 
    p.Cena ASC

--5.Pokaz nazwy produkt�w, kt�re zosta�y sprzedane oraz ich ��czn� warto��.
SELECT Nazwa, sum(Szczeg�y_Zamowienia.CenaJednostkowa*Ilo��) as Warto��
FROM Produkt 
	join Szczeg�y_Zamowienia on (Produkt.ProduktID = Szczeg�y_Zamowienia.ProduktID)
	join Zamowienie on (Zamowienie.Zam�wienieID = Szczeg�y_Zamowienia.Szczeg�yID)
GROUP BY Nazwa
ORDER BY Nazwa

--6.Poka� nazwiska klient�w, kt�rzy z�o�yli zam�wienie na B�yszczyk.
SELECT Nazwisko
FROM Klient 
	left join Zamowienie on (Zamowienie.KlientID = Klient.KlientID)
	left join Szczeg�y_Zamowienia on  (Zamowienie.Zam�wienieID = Szczeg�y_Zamowienia.Zam�wienieID)
	left join Produkt on (Szczeg�y_Zamowienia.ProduktID = Produkt.ProduktID)
WHERE Nazwa like 'B�yszczyk'

--7.Poka� ��czn� warto�� wszystkich zam�wie�. 
SELECT sum (Szczeg�y_Zamowienia.Ilo�� * Szczeg�y_Zamowienia.CenaJednostkowa) as Warto��_wszystkich_zam�wie�
FROM Zamowienie
	join Szczeg�y_Zamowienia on Zamowienie.Zam�wienieID = Szczeg�y_Zamowienia.Zam�wienieID;


--8.Dla jakiej kategorii produkt�w warto�� w magazynie jest najwi�ksza?
SELECT TOP 1 K.NazwaKategorii, SUM(P.StanMagazynowy * P.Cena) AS WartoscMagazynowa
FROM Produkt P
JOIN Kategoria K ON P.KategoriaID = K.KategoriaID
GROUP BY K.NazwaKategorii
ORDER BY WartoscMagazynowa DESC; 

--9. Wy�wietl nazwiska klient�w, kt�rych 2ga litera to "o", 4ta to "a". 
SELECT Nazwisko
FROM Klient
WHERE Nazwisko like '_o_a%'

--10.Ile zam�wie� by�o z�o�onych z Warszawy?
SELECT 
    COUNT(*) AS Zam�wienia_z_Warszawy
FROM 
    Zamowienie
JOIN 
    Klient ON Zamowienie.KlientID = Klient.KlientID
WHERE 
    Klient.Miasto = 'Warszawa'
