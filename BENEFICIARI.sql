		IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Beneficiari')
	BEGIN
		CREATE DATABASE Beneficiari;
	END;

	USE Beneficiari;

	CREATE LOGIN JohnDoe WITH PASSWORD = 'jd#1234';
	CREATE LOGIN EmmaSmith WITH PASSWORD = 'es@5678';
	CREATE LOGIN DavidWong WITH PASSWORD = 'dw*2024';
	CREATE LOGIN SarahJones WITH PASSWORD = 'sj!pass';
	CREATE LOGIN MikeRoberts WITH PASSWORD = 'mr#7890';


	IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Beneficiari')
	BEGIN
		CREATE TABLE login_Users(
			UserID INT PRIMARY KEY,
			Username VARCHAR(20) NOT NULL, 
			Pass VARCHAR(20) NOT NULL
		);
	END;

	CREATE TABLE BeneficiariCopy(
        BenificiarID INT PRIMARY KEY,
        Nume VARCHAR(30) NOT NULL,
        Prenume VARCHAR(30) NOT NULL,
        Adresa VARCHAR(100) NOT NULL,
        Telefon VARCHAR(20) NOT NULL,
        Mediul VARCHAR(10) NOT NULL,
        CodLocalitate VARCHAR(10) NOT NULL,
		Email VARCHAR(50) NOT NULL
    );

	IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Beneficiari')
	BEGIN
    CREATE TABLE Beneficiari(
        BenificiarID INT PRIMARY KEY,
        Nume VARCHAR(30) NOT NULL,
        Prenume VARCHAR(30) NOT NULL,
        Adresa VARCHAR(100) NOT NULL,
        Telefon VARCHAR(20) NOT NULL,
        Mediul VARCHAR(10) NOT NULL,
        CodLocalitate VARCHAR(10) NOT NULL,
		Email VARCHAR(50) NOT NULL
    );
	END;

	INSERT INTO Beneficiari VALUES 
    (1, 'Popescu', 'Ion', 'Str. Libertatii, nr. 10', '0721123456', 'Urban', 'CL001', 'ion.popescu@example.com'),
    (2, 'Ionescu', 'Maria', 'Bd. Independentei, nr. 5', '0732123456', 'Urban', 'CL002', 'maria.ionescu@example.com'),
    (3, 'Radulescu', 'Andrei', 'Str. Crangului, nr. 8', '0743123456', 'Urban', 'CL003', 'andrei.radulescu@example.com'),
    (4, 'Popa', 'Ana', 'Str. Mihai Viteazu, nr. 12', '0754123456', 'Urban', 'CL004', 'ana.popa@example.com'),
    (5, 'Georgescu', 'Mihai', 'Bd. Stefan cel Mare, nr. 3', '0765123456', 'Urban', 'CL005', 'mihai.georgescu@example.com'),
    (11, 'Mihai', 'Ioana', 'Bd. Decebal, nr. 40', '0722123456', 'Urban', 'CL006', 'ioana.mihai@example.com'),
    (12, 'Gheorghe', 'Cristian', 'Str. Dorobantilor, nr. 45', '0733123456', 'Urban', 'CL007', 'cristian.gheorghe@example.com'),
    (13, 'Vasilescu', 'Ana', 'Bd. Aviatorilor, nr. 50', '0744123456', 'Urban', 'CL008', 'ana.vasilescu@example.com'),
    (14, 'Iancu', 'Elena', 'Str. Pacii, nr. 55', '0755123456', 'Urban', 'CL009', 'elena.iancu@example.com'),
    (15, 'Cristea', 'Adrian', 'Bd. Republicii, nr. 60', '0766123456', 'Urban', 'CL010', 'adrian.cristea@example.com'),
    (16, 'Preda', 'Mirela', 'Str. Libertatii, nr. 65', '0777123456', 'Urban', 'CL011', 'mirela.preda@example.com'),
    (17, 'Stancu', 'Mircea', 'Bd. Unirii, nr. 70', '0788123456', 'Urban', 'CL012', 'mircea.stancu@example.com'),
    (18, 'Balan', 'Andreea', 'Str. Mihai Viteazu, nr. 75', '0799123456', 'Urban', 'CL013', 'andreea.balan@example.com'),
    (19, 'Dumitrache', 'Marius', 'Bd. Independentei, nr. 80', '0700123456', 'Urban', 'CL014', 'marius.dumitrache@example.com'),
    (20, 'Dinu', 'Mara', 'Str. Crangului, nr. 85', '0711123456', 'Urban', 'CL015', 'mara.dinu@example.com'),
    (21, 'Iorgulescu', 'Dragos', 'Bd. Stefan cel Mare, nr. 90', '0722123456', 'Urban', 'CL016', 'dragos.iorgulescu@example.com'),
    (22, 'Nistor', 'Camelia', 'Str. Victoria, nr. 95', '0733123456', 'Urban', 'CL017', 'camelia.nistor@example.com'),
    (23, 'Tudor', 'Dan', 'Bd. Dorobantilor, nr. 100', '0744123456', 'Urban', 'CL018', 'dan.tudor@example.com'),
    (24, 'Stoica', 'Maria', 'Str. Libertatii, nr. 105', '0755123456', 'Urban', 'CL019', 'maria.stoica@example.com'),
    (25, 'Matei', 'Vlad', 'Bd. Aviatorilor, nr. 110', '0766123456', 'Urban', 'CL020', 'vlad.matei@example.com'),
    (26, 'Pop', 'Andrei', 'Str. Pacii, nr. 115', '0777123456', 'Urban', 'CL021', 'andrei.pop@example.com'),
    (27, 'Dobre', 'Elena', 'Bd. Republicii, nr. 120', '0788123456', 'Urban', 'CL022', 'elena.dobre@example.com'),
    (28, 'Diaconu', 'Ionut', 'Str. Decebal, nr. 125', '0799123456', 'Urban', 'CL023', 'ionut.diaconu@example.com'),
    (29, 'Barbu', 'Ana', 'Bd. Dorobantilor, nr. 130', '0700123456', 'Urban', 'CL024', 'ana.barbu@example.com'),
    (30, 'Popescu', 'Cristina', 'Str. Libertatii, nr. 135', '0711123456', 'Urban', 'CL025', 'cristina.popescu@example.com');

	IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Plati')
	BEGIN
	CREATE TABLE Plati(
		PlatiID INT PRIMARY KEY, 
		BenificiarID INT FOREIGN KEY(BenificiarID) REFERENCES Beneficiari(BenificiarID),
		NumarCont VARCHAR(50) NOT NULL, 
		NumeBanca VARCHAR(50) NOT NULL
	);
	END; 

	INSERT INTO Plati VALUES
		(1, 1, 'RO12BTRL1234567890123456', 'Banca Transilvania'),
		(2, 2, 'RO11RNCB1234567890123456', 'BCR'),
		(3, 3, 'RO10BRMA1234567890123456', 'BRD'),
		(4, 4, 'RO09BTRO1234567890123456', 'BT'),
		(5, 5, 'RO08CEC1234567890123456', 'CEC Bank'),
		(11, 11, 'RO12BTRL1234567890123456', 'Banca Transilvania'),
		(12, 12, 'RO11RNCB1234567890123456', 'BCR'),
		(13, 13, 'RO10BRMA1234567890123456', 'BRD'),
		(14, 14, 'RO09BTRO1234567890123456', 'BT'),
		(15, 15, 'RO08CEC1234567890123456', 'CEC Bank'),
		(16, 16, 'RO07INGB1234567890123456', 'ING Bank'),
		(17, 17, 'RO06BTRL1234567890123456', 'Banca Transilvania'),
		(18, 18, 'RO05RNCB1234567890123456', 'BCR'),
		(19, 19, 'RO04BTRO1234567890123456', 'BT'),
		(20, 20, 'RO03CEC1234567890123456', 'CEC Bank'),
		(21, 21, 'RO12BTRL1234567890123456', 'Banca Transilvania'),
		(22, 22, 'RO11RNCB1234567890123456', 'BCR'),
		(23, 23, 'RO10BRMA1234567890123456', 'BRD'),
		(24, 24, 'RO09BTRO1234567890123456', 'BT'),
		(25, 25, 'RO08CEC1234567890123456', 'CEC Bank'),
		(26, 26, 'RO07INGB1234567890123456', 'ING Bank'),
		(27, 27, 'RO06BTRL1234567890123456', 'Banca Transilvania'),
		(28, 28, 'RO05RNCB1234567890123456', 'BCR'),
		(29, 29, 'RO04BTRO1234567890123456', 'BT'),
		(30, 30, 'RO03CEC1234567890123456', 'CEC Bank');


	IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ConturiBancare')
	BEGIN
	CREATE TABLE ConturiBancare(
		ContID INT PRIMARY KEY,
		BeneficiarID INT FOREIGN KEY(BeneficiarID) REFERENCES Beneficiari(BenificiarID),
		NumarCont VARCHAR(50) NOT NULL, 
		NumarBanca VARCHAR(50) NOT NULL
	);
	END;

	INSERT INTO ConturiBancare VALUES 
		(1, 1, 'RO12INGB1234567890123456', 'ING Bank'),
		(2, 2, 'RO11BTRL1234567890123456', 'Banca Transilvania'),
		(3, 3, 'RO10RNCB1234567890123456', 'BCR'),
		(4, 4, 'RO09BTRO1234567890123456', 'BT'),
		(5, 5, 'RO08CEC1234567890123456', 'CEC Bank'),
		(11, 11, 'RO12INGB1234567890123456', 'ING Bank'),
		(12, 12, 'RO11BTRL1234567890123456', 'Banca Transilvania'),
		(13, 13, 'RO10RNCB1234567890123456', 'BCR'),
		(14, 14, 'RO09BTRO1234567890123456', 'BT'),
		(15, 15, 'RO08CEC1234567890123456', 'CEC Bank'),
		(16, 16, 'RO07INGB1234567890123456', 'ING Bank'),
		(17, 17, 'RO06BTRL1234567890123456', 'Banca Transilvania'),
		(18, 18, 'RO05RNCB1234567890123456', 'BCR'),
		(19, 19, 'RO04BTRO1234567890123456', 'BT'),
		(20, 20, 'RO03CEC1234567890123456', 'CEC Bank'),
		(21, 21, 'RO12INGB1234567890123456', 'ING Bank'),
		(22, 22, 'RO11BTRL1234567890123456', 'Banca Transilvania'),
		(23, 23, 'RO10RNCB1234567890123456', 'BCR'),
		(24, 24, 'RO09BTRO1234567890123456', 'BT'),
		(25, 25, 'RO08CEC1234567890123456', 'CEC Bank'),
		(26, 26, 'RO07INGB1234567890123456', 'ING Bank'),
		(27, 27, 'RO06BTRL1234567890123456', 'Banca Transilvania'),
		(28, 28, 'RO05RNCB1234567890123456', 'BCR'),
		(29, 29, 'RO04BTRO1234567890123456', 'BT'),
		(30, 30, 'RO03CEC1234567890123456', 'CEC Bank');


	IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'IstoricTranzactii')
	BEGIN
	CREATE TABLE IstoricTranzactii(
		TranzactieID INT PRIMARY KEY, 
		BeneficiarID INT FOREIGN KEY(BeneficiarID) REFERENCES Beneficiari(BenificiarID), 
		TipTranzactie VARCHAR(20) NOT NULL, 
		Suma FLOAT NOT NULL, 
		DataTranzactie DATETIME NOT NULL
	);
	END;

	INSERT INTO IstoricTranzactii VALUES
		(1, 1, 'Plata', 150.75, '2024-04-01 10:30:00'),
		(2, 2, 'Transfer', 200.50, '2024-04-02 12:45:00'),
		(3, 3, 'Plata', 75.25, '2024-04-03 15:20:00'),
		(4, 4, 'Plata', 100.00, '2024-04-04 09:00:00'),
		(5, 5, 'Transfer', 300.25, '2024-04-05 11:10:00'),
		(11, 11, 'Plata', 200.00, '2024-04-11 10:30:00'),
		(12, 12, 'Transfer', 150.50, '2024-04-12 12:45:00'),
		(13, 13, 'Plata', 80.25, '2024-04-13 15:20:00'),
		(14, 14, 'Plata', 300.00, '2024-04-14 09:00:00'),
		(15, 15, 'Transfer', 250.75, '2024-04-15 11:10:00'),
		(16, 16, 'Plata', 175.00, '2024-04-16 14:30:00'),
		(17, 17, 'Transfer', 180.25, '2024-04-17 16:20:00'),
		(18, 18, 'Plata', 90.00, '2024-04-18 08:45:00'),
		(19, 19, 'Transfer', 200.50, '2024-04-19 10:15:00'),
		(20, 20, 'Plata', 120.75, '2024-04-20 12:00:00'),
		(21, 21, 'Plata', 220.00, '2024-04-21 10:30:00'),
		(22, 22, 'Transfer', 180.50, '2024-04-22 12:45:00'),
		(23, 23, 'Plata', 85.25, '2024-04-23 15:20:00'),
		(24, 24, 'Plata', 290.00, '2024-04-24 09:00:00'),
		(25, 25, 'Transfer', 240.75, '2024-04-25 11:10:00'),
		(26, 26, 'Plata', 160.00, '2024-04-26 14:30:00'),
		(27, 27, 'Transfer', 170.25, '2024-04-27 16:20:00'),
		(28, 28, 'Plata', 100.00, '2024-04-28 08:45:00'),
		(29, 29, 'Transfer', 190.50, '2024-04-29 10:15:00'),
		(30, 30, 'Plata', 130.75, '2024-04-30 12:00:00');


	IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DocumenteIdentitate')
	BEGIN
	CREATE TABLE DocumenteIdentitate(
		DocumentID INT PRIMARY KEY, 
		BeneficiarID INT FOREIGN KEY(BeneficiarID) REFERENCES Beneficiari(BenificiarID), 
		TipDocument VARCHAR(20) NOT NULL, 
		NumarDocument VARCHAR(50) NOT NULL, 
		DataExpirare DATE NOT NULL
	);
	END; 

	INSERT INTO DocumenteIdentitate VALUES
    (1, 1, 'CI', '123456', '2026-05-01'),
    (2, 2, 'BI', '654321', '2025-06-01'),
    (3, 3, 'CI', '987654', '2023-07-01'),
    (4, 4, 'BI', '456789', '2024-08-01'),
    (5, 5, 'CI', '789012', '2025-09-01'),
    (6, 11, 'CI', '987654', '2026-05-01'),
    (7, 12, 'BI', '456789', '2025-06-01'),
    (8, 13, 'CI', '789012', '2023-07-01'),
    (9, 14, 'BI', '234567', '2024-08-01'),
    (10, 15, 'CI', '890123', '2025-09-01'),
    (11, 16, 'BI', '345678', '2026-10-01'),
    (12, 17, 'CI', '901234', '2027-11-01'),
    (13, 18, 'BI', '456789', '2028-12-01'),
    (14, 19, 'CI', '012345', '2029-01-01'),
    (15, 20, 'BI', '567890', '2030-02-01'),
    (16, 21, 'CI', '123456', '2031-03-01'),
    (17, 22, 'BI', '678901', '2032-04-01'),
    (18, 23, 'CI', '234567', '2033-05-01'),
    (19, 24, 'BI', '789012', '2034-06-01'),
    (20, 25, 'CI', '345678', '2035-07-01'),
    (21, 26, 'BI', '890123', '2036-08-01'),
    (22, 27, 'CI', '456789', '2037-09-01'),
    (23, 28, 'BI', '901234', '2038-10-01'),
    (24, 29, 'CI', '567890', '2039-11-01'),
    (25, 30, 'BI', '012345', '2040-12-01');


	GO
	CREATE TRIGGER addInsertedWithID
	ON Beneficiari
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @MaxId INT;

		SELECT @MaxId = ISNULL(MAX(BenificiarID), 0) + 1 FROM Beneficiari;

		INSERT INTO Beneficiari (BenificiarID, Nume, Prenume, Adresa, Telefon, Mediul, CodLocalitate, Email)
		SELECT @MaxId, Nume, Prenume, Adresa, Telefon, Mediul, CodLocalitate, Email
		FROM inserted;
	END;

	-- INSERT TRIGGER START

	GO
	CREATE TRIGGER DocumenteIdentitate_Insert
	ON DocumenteIdentitate
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @MaxId INT;
		DECLARE @MaxIdDoc INT;

		SELECT @MaxId = IDENT_CURRENT('Beneficiari');
		SELECT @MaxIdDoc = ISNULL(MAX(DocumentID),0)+1 FROM DocumenteIdentitate;

		INSERT INTO DocumenteIdentitate (DocumentID, BeneficiarID, TipDocument, NumarDocument, DataExpirare)
		SELECT @MaxIdDoc, @MaxId, ISNULL(i.TipDocument, 'Not Defined'), ISNULL(i.NumarDocument, 'Not Defined'), ISNULL(i.DataExpirare, '2001-01-01')
		FROM inserted i;
	END; 


	GO
	CREATE TRIGGER ConturiBancare_Insert
	ON ConturiBancare
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @MaxId INT;
		DECLARE @MaxIdCont INT;

		SELECT @MaxId = IDENT_CURRENT('Beneficiari');
		SELECT @MaxIdCont = ISNULL(MAX(ContID),0)+1 FROM ConturiBancare;

		INSERT INTO ConturiBancare (ContID,BeneficiarID, NumarCont, NumarBanca)
		SELECT  @MaxIdCont,@MaxId, ISNULL(i.NumarCont, 'Not Defined'), ISNULL(i.NumarBanca, 'Not Defined')
		FROM inserted i;
	END;

	GO
	CREATE TRIGGER Plati_Insert
	ON Plati
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @MaxId INT;
		DECLARE @MaxIdPlat INT;

		SELECT @MaxId = IDENT_CURRENT('Beneficiari');
		SELECT @MaxIdPlat = ISNULL(MAX(PlatiID),0)+1 FROM Plati;

		INSERT INTO Plati (PlatiID, BenificiarID, NumarCont, NumeBanca)
		SELECT @MaxIdPlat, @MaxId, ISNULL(NumarCont, 'Not Defined'), ISNULL(NumeBanca, 'Not Defined')
		FROM inserted i;
	END;

	GO
	CREATE TRIGGER IstoricTranzactii_Insert
    ON IstoricTranzactii
    INSTEAD OF INSERT
    AS
    BEGIN
        DECLARE @MaxId INT;
        DECLARE @MaxTranzactieID INT;

        SELECT @MaxId = IDENT_CURRENT('Beneficiari');
        SELECT @MaxTranzactieID = ISNULL(MAX(TranzactieID), 0) + 1 FROM IstoricTranzactii;

        INSERT INTO IstoricTranzactii (TranzactieID, BeneficiarID, TipTranzactie, Suma, DataTranzactie)
        SELECT @MaxTranzactieID, @MaxId, ISNULL(i.TipTranzactie, 'Not Defined'), ISNULL(i.Suma, 0), ISNULL(i.DataTranzactie, '2001-01-01')
        FROM inserted i;
    END;

	GO
	CREATE TRIGGER deleteBeneficiar
	ON Beneficiari
	INSTEAD OF DELETE
	AS 
	BEGIN
		DECLARE @DeletedBeneficiarID INT;
		SELECT @DeletedBeneficiarID = BenificiarID FROM deleted;

		DELETE FROM DocumenteIdentitate WHERE BeneficiarID = @DeletedBeneficiarID;
		DELETE FROM IstoricTranzactii WHERE BeneficiarID = @DeletedBeneficiarID;
		DELETE FROM ConturiBancare WHERE BeneficiarID = @DeletedBeneficiarID;
		DELETE FROM Plati WHERE BenificiarID = @DeletedBeneficiarID; 

		DELETE FROM Beneficiari WHERE BenificiarID = @DeletedBeneficiarID;
	END;

	-- INSERT TRIGGER END


	-- FUCNTIONS START
	GO
	CREATE FUNCTION dbo.CalculeazaSumaTotalaTranzactiiBeneficiar(@BeneficiarID INT)
	RETURNS FLOAT
	AS
	BEGIN
		DECLARE @SumaTotala FLOAT;

		SELECT @SumaTotala = SUM(Suma)
		FROM IstoricTranzactii
		WHERE BeneficiarID = @BeneficiarID;

		RETURN @SumaTotala;
	END;

	
	GO
	CREATE PROCEDURE dbo.ActualizeazaAdresaBeneficiar
		@BeneficiarID INT,
		@NouaAdresa VARCHAR(100)
	AS
	BEGIN
		UPDATE Beneficiari
		SET Adresa = @NouaAdresa
		WHERE BenificiarID = @BeneficiarID;
	END;

	
	GO
	CREATE FUNCTION dbo.ObtineNumarPlatiBeneficiar(@BeneficiarID INT)
	RETURNS INT
	AS
	BEGIN
		DECLARE @NumarPlati INT;

		SELECT @NumarPlati = COUNT(*)
		FROM Plati
		WHERE BenificiarID = @BeneficiarID;

		RETURN @NumarPlati;
	END;

	GO
	CREATE PROCEDURE dbo.StergeDocumenteIdentitateExpirate
	AS
	BEGIN
		DELETE FROM DocumenteIdentitate
		WHERE DataExpirare < GETDATE();
	END;

	-- FUCNTIONS END

	-- CREATE VIEW START

	GO
	CREATE VIEW BeneficiarTransactionSummary AS
	SELECT 
		b.BenificiarID,
		b.Nume,
		b.Prenume,
		b.Adresa,
		b.Telefon,
		b.Mediul,
		b.CodLocalitate,
		b.Email,
		ISNULL((SELECT SUM(Suma) FROM IstoricTranzactii it WHERE it.BeneficiarID = b.BenificiarID), 0) AS TotalSumTransactions,
		ISNULL((SELECT COUNT(*) FROM IstoricTranzactii it WHERE it.BeneficiarID = b.BenificiarID), 0) AS NumberOfTransactions,
		ISNULL((SELECT MAX(DataTranzactie) FROM IstoricTranzactii it WHERE it.BeneficiarID = b.BenificiarID), '1900-01-01') AS LatestTransactionDate
	FROM 
		Beneficiari b;
	GO

	-- View to see document details for beneficiaries
	CREATE VIEW BeneficiarDocumentSummary AS
	SELECT 
		b.BenificiarID,
		b.Nume,
		b.Prenume,
		d.TipDocument,
		d.NumarDocument,
		d.DataExpirare
	FROM 
		Beneficiari b
	JOIN 
		DocumenteIdentitate d ON b.BenificiarID = d.BeneficiarID;
	GO

	CREATE VIEW BeneficiarPaymentSummary AS
	SELECT 
		b.BenificiarID,
		b.Nume,
		b.Prenume,
		p.NumarCont,
		p.NumeBanca
	FROM 
		Beneficiari b
	JOIN 
		Plati p ON b.BenificiarID = p.BenificiarID;
	GO

	-- CREATE VIEW END


	-- TRANSACTIONS START

	BEGIN TRANSACTION;
	UPDATE Beneficiari
	SET Adresa = 'New Address',
		Telefon = '+1234567890'
	WHERE BenificiarID = 1;
	ROLLBACK;

	BEGIN TRANSACTION;
	INSERT INTO Beneficiari (Nume, Prenume, Adresa, Telefon, Mediul, CodLocalitate, Email)
	VALUES ('John', 'Doe', '123 Main St', '+9876543210', 'Urban', 'ABC123', 'john.doe@example.com');
	ROLLBACK;

	BEGIN TRANSACTION;
	DELETE FROM IstoricTranzactii WHERE BeneficiarID = 2;
	DELETE FROM Plati WHERE BenificiarID = 2;
	DELETE FROM DocumenteIdentitate WHERE BeneficiarID = 2;
	DELETE FROM Beneficiari WHERE BenificiarID = 2;
	ROLLBACK;

	BEGIN TRANSACTION;
	UPDATE Beneficiari
	SET Email = 'updated_email@example.com'
	WHERE BenificiarID = 3;
	ROLLBACK;

	BEGIN TRANSACTION;
	INSERT INTO IstoricTranzactii (BeneficiarID, TipTranzactie, Suma, DataTranzactie)
	VALUES (1, 'Deposita', 500.00, GETDATE());
	ROLLBACK;
	
	-- TRANSACTIONS END

	-- INDEX START

	CREATE INDEX Beneficiari_Nume ON Beneficiari(Nume);
	CREATE INDEX IstoricTranzactii_TipTranzactie ON IstoricTranzactii(TipTranzactie);
	CREATE INDEX Beneficiari_Adresa ON Beneficiari(Adresa);
	CREATE INDEX DocumenteIdentitate_DataExpirare ON DocumenteIdentitate(DataExpirare);
	CREATE INDEX ConturiBancare_BeneficiarID_NumarCont ON ConturiBancare(BeneficiarID, NumarCont);

	-- INDEX END



