
CREATE DATABASE sirket1;
GO
USE sirket;
GO
-- Departmanlar tablosu
CREATE TABLE Departmanlar (
    departman_id INT PRIMARY KEY,
    departman_adi NVARCHAR(50)
);

-- Pozisyonlar tablosu
CREATE TABLE Pozisyonlar (
    pozisyon_id INT PRIMARY KEY,
    pozisyon_adi NVARCHAR(50),
    maas DECIMAL(10, 2)
);

-- Çalýþanlar tablosu
CREATE TABLE Calisanlar (
    calisan_id INT PRIMARY KEY,
    ad NVARCHAR(50),
    soyad NVARCHAR(50),
    pozisyon_id INT,
    departman_id INT,
    eposta NVARCHAR(50),
    telefon NVARCHAR(15),
    FOREIGN KEY (pozisyon_id) REFERENCES Pozisyonlar(pozisyon_id),
    FOREIGN KEY (departman_id) REFERENCES Departmanlar(departman_id)
);

-- Projeler tablosu
CREATE TABLE Projeler (
    proje_id INT PRIMARY KEY,
    proje_adi NVARCHAR(50),
    baslangic_tarihi DATE,
    bitis_tarihi DATE,
    departman_id INT,
    FOREIGN KEY (departman_id) REFERENCES Departmanlar(departman_id)
);

-- Calisan_Projeler tablosu
CREATE TABLE Calisan_Projeler (
    calisan_id INT,
    proje_id INT,
    PRIMARY KEY (calisan_id, proje_id),
    FOREIGN KEY (calisan_id) REFERENCES Calisanlar(calisan_id),
    FOREIGN KEY (proje_id) REFERENCES Projeler(proje_id)
);
