/*VINCOLO 1*/
DROP TRIGGER IF EXISTS ControlloNomeUtente;
DELIMITER $$
CREATE TRIGGER ControlloNomeUtente BEFORE INSERT ON Utente
FOR EACH ROW
BEGIN
	SET @quanti = (SELECT COUNT(*)
					FROM Utente
					WHERE IDUtente = NEW.IDUtente);
	IF @quanti > 0
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Utente già esistente';
	END IF;
END $$
DELIMITER ;

/*VINCOLO 10*/
DROP TRIGGER IF EXISTS ControlloBlocco;
DELIMITER $$
CREATE TRIGGER ControlloBlocco BEFORE INSERT ON Blocco
FOR EACH ROW
BEGIN
	SET @quanti = (SELECT COUNT(*) 
					FROM Segnalazione 
					WHERE Segnalante = NEW.Bloccante
						AND Segnalato = NEW.Bloccato);
	IF MOD(@quanti, 2) = 0
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Non è stata fatta ancora la seconda segnalazione';
	END IF;
END $$ 
DELIMITER ; 

/*VINCOLO 17*/
DROP TRIGGER IF EXISTS ControlloSondaggioEvento;
DELIMITER $$
CREATE TRIGGER ControlloSondaggioEvento BEFORE INSERT ON Sondaggio
FOR EACH ROW
BEGIN
	SET @quanti = (SELECT COUNT(*)
					FROM Presenza P
					WHERE P.Utente = NEW.Gestore
						AND P.Evento = (SELECT SE.Evento
										FROM SondaggioEvento SE
										WHERE SE.Sondaggio = NEW.IDSondaggio)
									);
	IF @quanti < 1
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Utente non iscritto a evento';
	END IF;
END $$
DELIMITER ;