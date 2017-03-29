ALTER TABLE Utente
ADD COLUMN NumeroTotaleInteressi INT(50) DEFAULT 0;

DROP TABLE IF EXISTS MV_InteressiUtente;
CREATE TABLE MV_InteressiUtente
(
	IDUtente Int(50) NOT NULL,
	Argomento varchar(255) NOT NULL,
	NumeroIscrizioni Int(50) default 0,
	NumeroInteressi int(50) default 0,
	PRIMARY KEY(IDUtente, Argomento),
	FOREIGN KEY (IDUtente)
		REFERENCES UTENTE(IDUtente)
)ENGINE = InnoDB DEFAULT CHARSET = latin1;

CREATE OR REPLACE VIEW UtenteGruppo AS
(
	SELECT I.Utente, G.Tema, COUNT(*) AS NumeroIscrizioni
	FROM Iscrizione I INNER JOIN Gruppo G ON I.Gruppo = G.IDGruppo
	GROUP BY I.Utente, G.Tema
);

CREATE OR REPLACE VIEW UtenteInteresse AS
(
	SELECT TL.Utente, I.TipoInteresse, COUNT(*) AS NumeroInteressi
	FROM Interesse I INNER JOIN TempoLibero TL ON I.IDInteresse = TL.Interesse
	GROUP BY TL.Utente, I.TipoInteresse
);

INSERT INTO MV_InteressiUtente
		SELECT UG.Utente AS IDUtente, UG.Tema AS Argomento, UG.NumeroIscrizioni, UI.NumeroInteressi
		FROM UtenteGruppo UG NATURAL JOIN UtenteInteresse UI
		WHERE UG.Tema = UI.TipoInteresse
	UNION
		SELECT UG.Utente AS IDUtente, UG.Tema AS Argomento, UG.NumeroIscrizioni, 0
		FROM UtenteGruppo UG NATURAL LEFT OUTER JOIN UtenteInteresse UI
		WHERE UI.TipoInteresse IS NULL
		OR UI.Utente IS NULL
	UNION
		SELECT UI.Utente AS IDUtente, UI.TipoInteresse AS Argomento, 0, UI.NumeroInteressi
		FROM UtenteGruppo UG NATURAL RIGHT OUTER JOIN UtenteInteresse UI
		WHERE UG.Tema IS NULL
		OR UG.Utente IS NULL;


DROP TRIGGER IF EXISTS NumeroIscrizioni;
DELIMITER $$
CREATE TRIGGER NumeroIscrizioni
AFTER INSERT ON Iscrizione
FOR EACH ROW
BEGIN 
	UPDATE Utente
	SET NumeroTotaleInteressi=NumeroTotaleInteressi + 1
	WHERE IDUtente = New.Utente;

	SET @nuovoTema = (SELECT Tema
					  FROM Gruppo
					  WHERE IDGruppo = NEW.Gruppo);

	SET @esiste = (SELECT COUNT(*)
				   FROM MV_InteressiUtente
				   WHERE IDUtente = NEW.Utente
						AND Argomento = @nuovoTema);
	IF @esiste = 1
		THEN UPDATE MV_InteressiUtente
			 SET NumeroIscrizioni=NumeroIscrizioni + 1
				WHERE IDUtente = New.Utente
					AND Argomento = @nuovoTema;
	ELSE INSERT INTO MV_InteressiUtente
			 VALUES (NEW.Utente, @nuovoTema, 1, 0);
	END IF;
END $$
DELIMITER ;


DROP TRIGGER IF EXISTS NumeroInteressi;
DELIMITER $$
CREATE TRIGGER NumeroInteressi
AFTER INSERT ON TempoLibero
FOR EACH ROW
BEGIN 
	UPDATE Utente
	SET NumeroTotaleInteressi=NumeroTotaleInteressi + 1
	WHERE IDUtente = New.Utente;

	SET @nuovoInteresse = (SELECT TipoInteresse
						   FROM Interesse
						   WHERE IDInteresse = NEW.Interesse);

	SET @esiste = (SELECT COUNT(*)
				   FROM MV_InteressiUtente
				   WHERE IDUtente = NEW.Utente
						AND Argomento = @nuovoInteresse);

	IF @esiste = 1
	THEN UPDATE MV_InteressiUtente
		SET NumeroInteressi=NumeroInteressi + 1
		WHERE IDUtente = New.Utente
			AND Argomento = @nuovoInteresse;
	ELSE INSERT INTO MV_InteressiUtente
		VALUES (NEW.Utente, @nuovoInteresse, 0, 1);
	END IF;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS UtentiTarget;
DELIMITER $$
CREATE PROCEDURE UtentiTarget ()
BEGIN	
	CREATE TABLE IF NOT EXISTS utentiTarget
	(
		Utente INT(50) NOT NULL,
		Argomento VARCHAR(255) NOT NULL,
		PRIMARY KEY (Utente, Argomento)
	);

	TRUNCATE TABLE utentiTarget;

	INSERT INTO utentiTarget
	SELECT IU.IDUtente, IU.Argomento
	FROM MV_InteressiUtente IU
	WHERE IU.NumeroIscrizioni + IU.NumeroInteressi >= 0.3* (SELECT U.NumeroTotaleInteressi
															FROM Utente U
															WHERE U.IDUtente = IU.IDUtente);

	SELECT *
	FROM utentiTarget;
END $$
DELIMITER ;

CALL UtentiTarget();