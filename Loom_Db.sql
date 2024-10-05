CREATE DATABASE Loom_DB
GO
USE Loom_DB
GO
CREATE TABLE YoneticiTurleri
(
	ID int IDENTITY(1,1),
	Isim nvarchar(50) NOT NULL,
	CONSTRAINT pk_YoneticiTur PRIMARY KEY(ID)
)
GO
INSERT INTO YoneticiTurleri (Isim) VALUES('Admin')
INSERT INTO YoneticiTurleri (Isim) VALUES('Yazar')
GO
CREATE TABLE Yoneticiler
(
	ID int IDENTITY(1,1),
	YoneticiTur_ID int NOT NULL,
	Isim nvarchar(120),
	Soyisim nvarchar(120),
	Mail nvarchar(200) NOT NULL,
	KullaniciAdi nvarchar(75),
	Sifre nvarchar(20),
	AktifMi bit,
	CONSTRAINT pk_Yoneticiler PRIMARY KEY(ID),
	CONSTRAINT fk_YoneticiYoneticiTur FOREIGN KEY(YoneticiTur_ID)
	REFERENCES YoneticiTurleri(ID)
)
GO
INSERT INTO Yoneticiler(YoneticiTur_ID, Isim, Soyisim, Mail,KullaniciAdi,Sifre,AktifMi)
VALUES(1, 'Developer','Developer', 'dev@dev.com','cilgindev26','1234',1)
GO
CREATE TABLE Kategoriler
(
	ID int IDENTITY(1,1),
	Isim nvarchar(50),
	Durum bit,
	CONSTRAINT pk_Kategori PRIMARY KEY(ID)
)
GO
CREATE TABLE Oyunlar
(
	ID int IDENTITY(1,1),
	Isim nvarchar(50),
	Durum bit,
	CONSTRAINT pk_Oyun PRIMARY KEY(ID)
)
GO
CREATE TABLE Turler
(
	ID int IDENTITY(1,1),
	Isim nvarchar(50),
	CONSTRAINT pk_Tur PRIMARY KEY(ID)
)
GO
CREATE TABLE OyunTurleri
(
	ID bigint IDENTITY(1,1),
	Oyun_ID int,
	Tur_ID int,
	CONSTRAINT pk_oyunTur PRIMARY KEY(ID),
	CONSTRAINT fk_OyunTurOyun FOREIGN KEY(Oyun_ID)
	REFERENCES Oyunlar(ID),
	CONSTRAINT fk_OyunTurTur FOREIGN KEY(Tur_ID)
	REFERENCES Turler(ID)
)
GO
CREATE TABLE Icerikler
(
	ID int IDENTITY(1,1),
	Kategori_ID int NOT NULL,
	Yazar_ID int NOT NULL,
	Oyun_ID int,
	Ozet nvarchar(500),
	Icerik ntext,
	KapakResmi nvarchar(50),
	Eklemetarihi datetime,
	GoruntulemeSayi bigint,
	Durum bit,
	CONSTRAINT pk_icerik PRIMARY KEY(ID),
	CONSTRAINT fk_icerikKategori FOREIGN KEY(Kategori_ID)
	REFERENCES Kategoriler(ID),
	CONSTRAINT fk_icerikYazar FOREIGN KEY(Yazar_ID)
	REFERENCES Yoneticiler(ID),
	CONSTRAINT fk_icerikOyun FOREIGN KEY(Oyun_ID)
	REFERENCES Oyunlar(ID)
)
GO
CREATE TABLE Uyeler
(
	ID int IDENTITY(1,1),
	Isim nvarchar(120),
	Soyisim nvarchar(120),
	Mail nvarchar(200) NOT NULL,
	KullaniciAdi nvarchar(75),
	Sifre nvarchar(20),
	SonGirisTarihi Datetime,
	AktifMi bit,
	CONSTRAINT pk_uyeler PRIMARY KEY(ID)
)
GO
CREATE TABLE Yorumlar
(
	ID int IDENTITY(1,1),
	IcerikID int NOT NULL,
	UyeID int NOT NULL,
	Yorum nvarchar(2000),
	EklemeTarihi Datetime,
	Durum bit,
	CONSTRAINT pk_yorumlar PRIMARY KEY(ID),
	CONSTRAINT fk_YorumIcerik FOREIGN KEY(IcerikID)
	REFERENCES Icerikler(ID),
	CONSTRAINT fk_YorumUye FOREIGN KEY(UyeID)
	REFERENCES Uyeler(ID)
)
