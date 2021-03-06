SET NAMES latin1;
SET FOREIGN_KEY_CHECKS = 0;

BEGIN;
DROP DATABASE IF EXISTS `SocialNetwork`;
CREATE DATABASE `SocialNetwork`;
COMMIT;

USE `SocialNetwork`;

DROP TABLE IF EXISTS `UTENTE`;
CREATE TABLE `UTENTE` (
  `IDUtente` int(50) NOT NULL AUTO_INCREMENT,
  `NomeUtente` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Nome` char(20) NOT NULL,
  `Cognome` char(20) NOT NULL,
  `DataRegistrazione` TIMESTAMP NOT NULL,
  PRIMARY KEY (`IDUtente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `GRUPPO`;
CREATE TABLE `GRUPPO` (
  `IDGruppo` int(50) NOT NULL AUTO_INCREMENT,
  `Amministratore` int(50) NOT NULL,
  `Tema` varchar(255) NOT NULL,
  `Nome` char(20) NOT NULL,
  `VisibilitaGruppo` char(20) NOT NULL,
  `DataCreazioneGruppo` TIMESTAMP NOT NULL,
  PRIMARY KEY (`IDGruppo`),
  FOREIGN KEY (Amministratore)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `MESSAGGIO`;
CREATE TABLE `MESSAGGIO` (
  `Mittente` int(50) NOT NULL,
  `Destinatario` int(50) NOT NULL,
  `TestoMessaggio` varchar(255) NOT NULL,
  `DataMessaggio` TIMESTAMP NOT NULL,
  PRIMARY KEY (`Mittente`,`Destinatario`,`DataMessaggio`),
  FOREIGN KEY (Mittente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Destinatario)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `SEGNALAZIONE`;
CREATE TABLE `SEGNALAZIONE` (
  `Segnalante` int(50) NOT NULL,
  `Segnalato` int(50) NOT NULL,
  `DataSegnalazione` TIMESTAMP NOT NULL,
  PRIMARY KEY (`Segnalante`,`Segnalato`,`DataSegnalazione`),
  FOREIGN KEY (Segnalante)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Segnalato)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `BLOCCO`;
CREATE TABLE `BLOCCO` (
  `Bloccante` int(50) NOT NULL,
  `Bloccato` int(50) NOT NULL,
  `DataBlocco` TIMESTAMP NOT NULL,
  `Attivo` BOOLEAN DEFAULT 1,
  PRIMARY KEY (`Bloccante`,`Bloccato`,`DataBlocco`),
  FOREIGN KEY (Bloccante)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Bloccato)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `SONDAGGIO`;
CREATE TABLE `SONDAGGIO` (
  `IDSondaggio` int(50) NOT NULL AUTO_INCREMENT,
  `Gestore` int(50) NOT NULL,
  `Domanda` varchar(255) NOT NULL,
  `DataInizioSondaggio` DATE NOT NULL,
  `DataFineSondaggio` DATE DEFAULT NULL,
  PRIMARY KEY (`IDSondaggio`),
  FOREIGN KEY (Gestore)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `RISPOSTE`;
CREATE TABLE `RISPOSTE` (
  `IDRisposta` int(50) NOT NULL AUTO_INCREMENT,
  `Sondaggio` int(50) NOT NULL,
  `TestoRisposta` TEXT NOT NULL,
  PRIMARY KEY (`IDRisposta`),
  FOREIGN KEY (Sondaggio)
	REFERENCES SONDAGGIO(IDSondaggio)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `EVENTO`;
CREATE TABLE `EVENTO` (
  `IDEvento` int(50) NOT NULL AUTO_INCREMENT,
  `Organizzatore` int(50) NOT NULL,
  `LuogoEvento` varchar(255) NOT NULL,
  `DataEvento` TIMESTAMP NOT NULL,
  `DescrizioneEvento` TEXT NOT NULL,
  `NumeroPartecipanti` INT DEFAULT 1,
  `NumeroIncerti` INT DEFAULT 0,
  `NumeroNonPartecipanti` INT DEFAULT 0,
  PRIMARY KEY (`IDEvento`),
  FOREIGN KEY (Organizzatore)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `MATERIALE`;
CREATE TABLE `MATERIALE` (
  `IDMateriale` int(50) NOT NULL AUTO_INCREMENT,
  `NomeMateriale` varchar(255) NOT NULL,
  PRIMARY KEY (`IDMateriale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `INFORMAZIONI`;
CREATE TABLE `INFORMAZIONI` (
  `IDInformazione` int(50) NOT NULL AUTO_INCREMENT,
  `Utente` int(50) NOT NULL,
  `CittaNascita` varchar(255),
  `DataNascita` DATE,
  `CittaAttuale` varchar(255),
  `StatoCivile` varchar(255),
  `Sesso` varchar(255),
  PRIMARY KEY (`IDInformazione`,`Utente`),
  FOREIGN KEY (Utente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `INTERESSE`;
CREATE TABLE `INTERESSE` (
  `IDInteresse` int(50) NOT NULL AUTO_INCREMENT,
  `TipoInteresse` varchar(255) NOT NULL,
  `NomeInteresse` varchar(255) NOT NULL,
  PRIMARY KEY (`IDInteresse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `ISTRUZIONE`;
CREATE TABLE `ISTRUZIONE` (
  `IDIstruzione` int(50) NOT NULL AUTO_INCREMENT,
  `Scuola` int(50) NOT NULL,
  `TitoloStudio` varchar(255),
  `DataInizioFrequentazione` YEAR,
  `DataFineFrequentazione` YEAR,
  PRIMARY KEY (`IDIstruzione`),
  FOREIGN KEY (Scuola)
	REFERENCES SCUOLA(IDScuola)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `IMPIEGO`;
CREATE TABLE `IMPIEGO` (
  `IDImpiego` int(50) NOT NULL AUTO_INCREMENT,
  `Utente` int(50) NOT NULL,
  `CittaImpiego` varchar(255),
  `LuogoImpiego` varchar(255),
  `RuoloImpiego` varchar(255),
  `DataInizioImpiego` YEAR DEFAULT NULL,
  `DataFineImpiego` YEAR DEFAULT NULL,
  PRIMARY KEY (`IDImpiego`,`Utente`),
  FOREIGN KEY (Utente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `SCUOLA`;
CREATE TABLE `SCUOLA` (
  `IDScuola` int(50) NOT NULL AUTO_INCREMENT,
  `TipoScuola` varchar(255) NOT NULL,
  `NomeScuola` varchar(255) NOT NULL,
  `CittaScuola` varchar(255) NOT NULL,
  PRIMARY KEY (`IDScuola`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `ALTRO`;
CREATE TABLE `ALTRO` (
  `IDAltro` int(50) NOT NULL AUTO_INCREMENT,
  `Utente` int(50) NOT NULL,
  `OrientamentoPolitico` varchar(255),
  `OrientamentoReligioso` varchar(255),
  `OrientamentoSessuale` varchar(255),
  PRIMARY KEY (`IDAltro`,`Utente`),
  FOREIGN KEY (Utente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `POST`;
CREATE TABLE `POST` (
  `IDPost` int(50) NOT NULL AUTO_INCREMENT,
  `TestoPost` varchar(255) NOT NULL,
  `DataPost` TIMESTAMP NOT NULL,
  PRIMARY KEY (`IDPost`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `CONTENUTO`;
CREATE TABLE `CONTENUTO` (
  `IDContenuto` int(50) NOT NULL AUTO_INCREMENT,
  `NomeContenuto` varchar(255) NOT NULL,
  `DataUpload` TIMESTAMP NOT NULL,
  `TipoContenuto` varchar(255) NOT NULL,
  `Visibile` varchar(255) NOT NULL DEFAULT 'Pubblico',
  `NumeroLike` int(50) DEFAULT 0,
  PRIMARY KEY (`IDContenuto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `COMMENTO`;
CREATE TABLE `COMMENTO` (
  `IDCommento` int(50) NOT NULL AUTO_INCREMENT,
  `Utente` int(50) NOT NULL,
  `Contenuto` int(50) NOT NULL,
  `DataCommento` TIMESTAMP NOT NULL,
  `TestoCommento` varchar(255) NOT NULL DEFAULT 'Pubblico',
  PRIMARY KEY (`IDCommento`),
  FOREIGN KEY (Utente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Contenuto)
	REFERENCES CONTENUTO(IDContenuto)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `GALLERIA`;
CREATE TABLE `GALLERIA` (
  `IDGalleria` int(50) NOT NULL AUTO_INCREMENT,
  `NomeGalleria` varchar(255) NOT NULL,
  PRIMARY KEY (`IDGalleria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `RAPPORTO`;
CREATE TABLE `RAPPORTO` (
  `Follower` int(50) NOT NULL,
  `Following` int(50) NOT NULL,
  `Richiesta` varchar(255) NOT NULL DEFAULT 'Pendente',
  `DataRichiesta` TIMESTAMP NOT NULL,
  `Relazione` varchar(255),
  PRIMARY KEY (`Follower`,`Following`),
  FOREIGN KEY (Follower)
	REFERENCES UTENTE(IDUtente)
	ON DELETE CASCADE,
  FOREIGN KEY (Following)
	REFERENCES UTENTE(IDUtente)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `ISCRIZIONE`;
CREATE TABLE `ISCRIZIONE` (
  `Utente` int(50) NOT NULL,
  `Gruppo` int(50) NOT NULL,
  `DataIscrizione` TIMESTAMP NOT NULL,
  PRIMARY KEY (`Utente`,`Gruppo`),
  FOREIGN KEY (Utente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE CASCADE,
  FOREIGN KEY (Gruppo)
	REFERENCES GRUPPO(IDGruppo)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `INVITO`;
CREATE TABLE `INVITO` (
  `Invitato` int(50) NOT NULL,
  `Sondaggio` int(50) NOT NULL,
  PRIMARY KEY (`Invitato`,`Sondaggio`),
  FOREIGN KEY (Invitato)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Sondaggio)
	REFERENCES SONDAGGIO(IDSondaggio)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `VOTO`;
CREATE TABLE `VOTO` (
  `Utente` int(50) NOT NULL,
  `RispostaSondaggio` int(50) NOT NULL,
  PRIMARY KEY (`Utente`,`RispostaSondaggio`),
  FOREIGN KEY (Utente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (RispostaSondaggio)
	REFERENCES RISPOSTE(IDRisposta)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `SONDAGGIOGRUPPO`;
CREATE TABLE `SONDAGGIOGRUPPO` (
  `Sondaggio` int(50) NOT NULL,
  `Gruppo` int(50) NOT NULL,
  PRIMARY KEY (`Sondaggio`,`Gruppo`),
  FOREIGN KEY (Sondaggio)
	REFERENCES SONDAGGIO(IDSondaggio)
	ON DELETE CASCADE,
  FOREIGN KEY (Gruppo)
	REFERENCES GRUPPO(IDGruppo)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `SONDAGGIOEVENTO`;
CREATE TABLE `SONDAGGIOEVENTO` (
  `Sondaggio` int(50) NOT NULL,
  `Evento` int(50) NOT NULL,
  PRIMARY KEY (`Sondaggio`,`Evento`),
  FOREIGN KEY (Sondaggio)
	REFERENCES SONDAGGIO(IDSondaggio)
	ON DELETE CASCADE,
  FOREIGN KEY (Evento)
	REFERENCES EVENTO(IDEvento)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `ALLESTIMENTO`;
CREATE TABLE `ALLESTIMENTO` (
  `Evento` int(50) NOT NULL,
  `Materiale` int(50) NOT NULL,
  `Quantita` INT DEFAULT 0,
  PRIMARY KEY (`Evento`,`Materiale`),
  FOREIGN KEY (Evento)
	REFERENCES EVENTO(IDEvento)
	ON DELETE NO ACTION,
  FOREIGN KEY (Materiale)
	REFERENCES MATERIALE(IDMateriale)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `PRESENZA`;
CREATE TABLE `PRESENZA` (
  `Utente` int(50) NOT NULL,
  `Evento` int(50) NOT NULL,
  `Conferma` varchar(255) NOT NULL DEFAULT 'Forse',
  PRIMARY KEY (`Utente`,`Evento`),
  FOREIGN KEY (Evento)
	REFERENCES EVENTO(IDEvento)
	ON DELETE CASCADE,
  FOREIGN KEY (Utente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `TEMPOLIBERO`;
CREATE TABLE `TEMPOLIBERO` (
  `Utente` int(50) NOT NULL,
  `Interesse` int(50) NOT NULL,
  PRIMARY KEY (`Utente`,`Interesse`),
  FOREIGN KEY (Utente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE CASCADE,
  FOREIGN KEY (Interesse)
	REFERENCES INTERESSE(IDInteresse)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `GRADO`;
CREATE TABLE `GRADO` (
  `Utente` int(50) NOT NULL,
  `Istruzione` int(50) NOT NULL,
  PRIMARY KEY (`Utente`,`Istruzione`),
  FOREIGN KEY (Utente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE CASCADE,
  FOREIGN KEY (Istruzione)
	REFERENCES ISTRUZIONE(IDIstruzione)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `PUBBLICAZIONE`;
CREATE TABLE `PUBBLICAZIONE` (
  `Utente` int(50) NOT NULL,
  `PostPubblicato` int(50) NOT NULL,
  PRIMARY KEY (`Utente`,`PostPubblicato`),
  FOREIGN KEY (Utente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (PostPubblicato)
	REFERENCES POST(IDPost)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `DESTINAZIONE`;
CREATE TABLE `DESTINAZIONE` (
  `Destinatario` int(50) NOT NULL,
  `Post` int(50) NOT NULL,
  PRIMARY KEY (`Destinatario`,`Post`),
  FOREIGN KEY (Destinatario)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Post)
	REFERENCES POST(IDPost)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `RISERVATEZZA`;
CREATE TABLE `RISERVATEZZA` (
  `Visualizzante` int(50) NOT NULL,
  `Post` int(50) NOT NULL,
  PRIMARY KEY (`Visualizzante`,`Post`),
  FOREIGN KEY (Visualizzante)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Post)
	REFERENCES POST(IDPost)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `CONDIVISIONE`;
CREATE TABLE `CONDIVISIONE` (
  `Post` int(50) NOT NULL,
  `Gruppo` int(50) NOT NULL,
  PRIMARY KEY (`Post`,`Gruppo`),
  FOREIGN KEY (Post)
	REFERENCES POST(IDPost)
	ON DELETE CASCADE,
  FOREIGN KEY (Gruppo)
	REFERENCES GRUPPO(IDGruppo)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `ALLEGATO`;
CREATE TABLE `ALLEGATO` (
  `Post` int(50) NOT NULL,
  `Contenuto` int(50) NOT NULL,
  PRIMARY KEY (`Post`,`Contenuto`),
  FOREIGN KEY (Post)
	REFERENCES POST(IDPost)
	ON DELETE NO ACTION,
  FOREIGN KEY (Contenuto)
	REFERENCES CONTENUTO(IDContenuto)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `POSSESSO`;
CREATE TABLE `POSSESSO` (
  `Utente` int(50) NOT NULL,
  `Contenuto` int(50) NOT NULL,
  PRIMARY KEY (`Utente`,`Contenuto`),
  FOREIGN KEY (Utente)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Contenuto)
	REFERENCES CONTENUTO(IDContenuto)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `VISIBILITA`;
CREATE TABLE `VISIBILITA` (
  `Visualizzante` int(50) NOT NULL,
  `Contenuto` int(50) NOT NULL,
  PRIMARY KEY (`Visualizzante`,`Contenuto`),
  FOREIGN KEY (Visualizzante)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Contenuto)
	REFERENCES CONTENUTO(IDContenuto)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `TAGGANTE`;
CREATE TABLE `TAGGANTE` (
  `Taggante` int(50) NOT NULL,
  `Contenuto` int(50) NOT NULL,
  PRIMARY KEY (`Taggante`,`Contenuto`),
  FOREIGN KEY (Taggante)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Contenuto)
	REFERENCES CONTENUTO(IDContenuto)
	ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `TAGGATO`;
CREATE TABLE `TAGGATO` (
  `Taggato` int(50) NOT NULL,
  `Contenuto` int(50) NOT NULL,
  PRIMARY KEY (`Taggato`,`Contenuto`),
  FOREIGN KEY (Taggato)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Contenuto)
	REFERENCES CONTENUTO(IDContenuto)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `LIKE`;
CREATE TABLE `LIKE` (
  `Liker` int(50) NOT NULL,
  `Contenuto` int(50) NOT NULL,
  `DataLike` TIMESTAMP NOT NULL,
  PRIMARY KEY (`Liker`,`Contenuto`),
  FOREIGN KEY (Liker)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Contenuto)
	REFERENCES CONTENUTO(IDContenuto)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `HASHTAG`;
CREATE TABLE `HASHTAG` (
  `Hashtagger` int(50) NOT NULL,
  `Contenuto` int(50) NOT NULL,
  `TipoHashtag` varchar(255) NOT NULL,
  `TestoHashtag` varchar(255) NOT NULL,
  PRIMARY KEY (`HashTagger`,`Contenuto`),
  FOREIGN KEY (HashTagger)
	REFERENCES UTENTE(IDUtente)
	ON DELETE NO ACTION,
  FOREIGN KEY (Contenuto)
	REFERENCES CONTENUTO(IDContenuto)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `ARCHIVIAZIONE`;
CREATE TABLE `ARCHIVIAZIONE` (
  `Galleria` int(50) NOT NULL,
  `Immagine` int(50) NOT NULL,
  PRIMARY KEY (`Galleria`,`Immagine`),
  FOREIGN KEY (Galleria)
	REFERENCES GALLERIA(IDGalleria)
	ON DELETE NO ACTION,
  FOREIGN KEY (Immagine)
	REFERENCES CONTENUTO(IDContenuto)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;