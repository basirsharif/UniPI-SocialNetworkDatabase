ALTER TABLE Utente
ADD COLUMN NumeroLikeHashtag INT(50) DEFAULT 0;

ALTER TABLE Utente
ADD COLUMN NumeroContenutiConHashtag INT(50) DEFAULT 0;

DROP TABLE IF EXISTS MV_LikeContenutiInteressi;
CREATE TABLE MV_LikeContenutiInteressi
(
	IDUtente INT(50) NOT NULL,
	Argomento varchar(255) NOT NULL,
	NumeroLikeArgomento INT(50) DEFAULT 0,
	NumeroContenutiPerArgomento INT(50) DEFAULT 0,
	PRIMARY KEY (IDUtente, Argomento),
	FOREIGN KEY (IDUtente)
		REFERENCES UTENTE(IDUtente)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

CREATE OR REPLACE VIEW LikeUtente AS
(
	SELECT L.Liker AS IDUtente, H.TipoHashtag AS Argomento, COUNT(*) AS NumeroLikeArgomento
	FROM Hashtag H NATURAL JOIN `Like` L 
	GROUP BY  L.Liker, H.TipoHashtag
);

CREATE OR REPLACE VIEW ContenutiUtente AS
(
	SELECT P.Utente AS IDUtente, H.TipoHashtag AS Argomento, COUNT(*) AS NumeroContenutiPerArgomento
	FROM Possesso P NATURAL JOIN Hashtag H
	GROUP BY P.Utente, H.TipoHashtag
);

INSERT INTO MV_LikeContenutiInteressi
	SELECT LU.IDUtente, LU.Argomento, LU.NumeroLikeArgomento, CU.NumeroContenutiPerArgomento
	FROM LikeUtente LU NATURAL JOIN ContenutiUtente CU  
		UNION
	SELECT LU.IDUtente, LU.Argomento, LU.NumeroLikeArgomento, 0
	FROM LikeUtente LU NATURAL LEFT OUTER JOIN ContenutiUtente CU  
	WHERE CU.Argomento IS NULL
		OR CU.IDUtente IS NULL
		UNION
	SELECT CU.IDUtente, CU.Argomento, 0, CU.NumeroContenutiPerArgomento
	FROM LikeUtente LU NATURAL RIGHT OUTER JOIN ContenutiUtente CU  
	WHERE LU.Argomento IS NULL
		OR LU.IDUtente IS NULL;

DROP TRIGGER IF EXISTS AggiornaNumeroLikeArgomento;
DELIMITER $$
CREATE TRIGGER AggiornaNumeroLikeArgomento
AFTER INSERT ON `LIKE`
FOR EACH ROW
BEGIN 	
	INSERT INTO MV_LikeContenutiInteressi(IDUtente, Argomento, NumeroLikeArgomento) 
		SELECT L.Liker, H.TipoHashtag, 1
		FROM `Like` L NATURAL JOIN Hashtag H
		WHERE L.Liker  = NEW.Liker
			AND L.Contenuto = NEW.Contenuto
			AND H.TipoHashtag IS NOT NULL
		ON DUPLICATE KEY
		UPDATE NumeroLikeArgomento = NumeroLikeArgomento + 1;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS AggiornaNumeroContenutiPerArgomento;
DELIMITER $$
CREATE TRIGGER AggiornaNumeroContenutiPerArgomento
AFTER INSERT ON Hashtag
FOR EACH ROW
BEGIN 
	SET @possessore = (SELECT P.Utente
					   FROM Hashtag H NATURAL JOIN Possesso P
					   WHERE H.Hashtagger = NEW.Hashtagger
							AND H.Contenuto = NEW.Contenuto);
	UPDATE Utente
		SET NumeroContenutiConHashtag = NumeroContenutiConHashtag + 1
		WHERE IDUtente =  @possessore;

INSERT INTO MV_LikeContenutiInteressi(IDUtente, Argomento, NumeroContenutiPerArgomento) 
	SELECT P.Utente, NEW.TipoHashtag, 1
	FROM Hashtag H NATURAL JOIN Possesso P
	WHERE H.Hashtagger = NEW.Hashtagger
	ON DUPLICATE KEY
	UPDATE NumeroContenutiPerArgomento = NumeroContenutiPerArgomento + 1;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS UtentiInteressati;
DELIMITER $$
CREATE PROCEDURE UtentiInteressati()
BEGIN
	CREATE TABLE IF NOT EXISTS utentiInteressati
	(
		Utente INT(50) NOT NULL,
		Argomento VARCHAR(255) NOT NULL,
		PRIMARY KEY (Utente, Argomento)
	);

	TRUNCATE TABLE utentiInteressati;

	INSERT INTO utentiInteressati
	SELECT LCI.IDUtente, LCI.Argomento
	FROM MV_LikeContenutiInteressi LCI
	WHERE LCI.NumeroLikeArgomento + LCI.NumeroContenutiPerArgomento >= 0.4 * (SELECT U.NumeroLikeHashtag + U.NumeroContenutiConHashtag
																	   FROM Utente U
																	   WHERE U.IDUtente = LCI.IDUtente);

	SELECT *
	FROM utentiInteressati;
END $$
DELIMITER ;

CALL UtentiInteressati() ;