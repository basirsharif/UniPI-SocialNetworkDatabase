/*OPERAZIONE 1*/
CREATE OR REPLACE VIEW OpzioniSondaggio AS
(
	SELECT R.IDRisposta AS Risposta
	FROM Risposte R INNER JOIN Sondaggio S ON (R.Sondaggio = S.IDSondaggio)
	WHERE R.Sondaggio = 2
);

CREATE OR REPLACE VIEW NumeroVotiRisposta AS
(
	SELECT RispostaSondaggio AS Risposta, COUNT(*) AS NumeroVoti
	FROM Voto
	GROUP BY RispostaSondaggio
);

SELECT Risposta, NumeroVoti
FROM OpzioniSondaggio NATURAL JOIN NumeroVotiRisposta;

/*OPERAZIONE 2*/
CREATE OR REPLACE VIEW Invitati AS 
(
	 SELECT Utente AS Invitato, Conferma
	 FROM Presenza
	 WHERE Evento = 3
);

SELECT Conferma, COUNT(*) AS NumeroUtenti
FROM Invitati
GROUP BY Conferma;

/*OPERAZIONE 3*/
CREATE OR REPLACE VIEW ContenutiUtente AS 
(
	 SELECT Contenuto
	 FROM Possesso
	 WHERE Utente = 5
);

CREATE OR REPLACE VIEW NumeroLikeContenuto AS 
(
	 SELECT Contenuto, COUNT(*) AS NumeroLike
	 FROM `LIKE`
	 GROUP BY Contenuto
);

SELECT Contenuto
FROM ContenutiUtente NATURAL JOIN NumeroLikeContenuto
ORDER BY NumeroLike DESC
LIMIT 1;

/*OPERAZIONE 4*/
DELETE FROM Archiviazione
WHERE Galleria = 2
	AND Immagine = 13;

/*OPERAZIONE 5*/
INSERT INTO `LIKE`(Liker, Contenuto, DataLike)
	VALUES (5, 12, CURRENT_TIMESTAMP);

/*OPERAZIONE 6*/
UPDATE Presenza 
  SET Conferma = 'Si'
  WHERE Utente = 2
		AND EVENTO = 4;

/*OPERAZIONE 7*/
CREATE OR REPLACE VIEW NumeroFollower AS 
(
	 SELECT COUNT(*) AS NumeroFollower
	 FROM Rapporto 
	 WHERE Following = 10
		AND Richiesta = 'Accettata'
);

CREATE OR REPLACE VIEW NumeroFollowing AS 
( 
	 SELECT COUNT(*) AS NumeroFollowing 
	 FROM Rapporto 
	 WHERE Follower = 10
		   AND Richiesta = 'Accettata'
);

SELECT NumeroFollower, NumeroFollowing
FROM NumeroFollower, NumeroFollowing;

/*OPERAZIONE 8*/
INSERT INTO Segnalazione(Segnalante, Segnalato, DataSegnalazione) 
	VALUES (2, 4, CURRENT_TIMESTAMP); 

/*OPERAZIONE 2 CON RIDONDANZA*/
SELECT NumeroPartecipanti, NumeroIncerti, NumeroNonPartecipanti
FROM Evento
WHERE IDEvento = 2;

/*OPERAZIONE 3 CON RIDONDANZA*/
CREATE OR REPLACE VIEW ContenutiUtente AS 
(
	 SELECT Contenuto
	 FROM Possesso
	 WHERE Utente = 10
);

SELECT CU.Contenuto
FROM Contenuto C INNER JOIN ContenutiUtente CU ON (IDContenuto = CU.Contenuto)
ORDER BY C.NumeroLike
LIMIT 1;

/*OPERAZIONE 5 CON RIDONDANZA*/
INSERT INTO `LIKE`(Liker, Contenuto, DataLike)
	VALUES (2, 4, CURRENT_TIMESTAMP);

DROP TRIGGER IF EXISTS AggiornaNumeroLike;

DELIMITER $$
CREATE TRIGGER AggiornaNumeroLike
AFTER INSERT ON `LIKE` 
FOR EACH ROW
BEGIN
	  UPDATE Contenuto 
		   SET NumeroLike = NumeroLike + 1
		   WHERE IDContenuto = OLD.Contenuto;
END $$
DELIMITER ;

/*OPERAZIONE 6 CON RIDONDANZA*/
UPDATE Presenza 
	SET Conferma = 'Si'
	WHERE Utente = 2
		AND EVENTO = 4;

DROP TRIGGER IF EXISTS ModificaPartecipantiEvento;

DELIMITER $$
CREATE TRIGGER ModificaPartecipantiEvento
AFTER UPDATE ON Presenza
FOR EACH ROW
BEGIN
	UPDATE Evento 
		SET NumeroIncerti = NumeroIncerti - 1
		AND NumeroPartecipanti = NumeroPartecipanti + 1
		WHERE IDEvento = OLD.Evento;
END $$
DELIMITER ;