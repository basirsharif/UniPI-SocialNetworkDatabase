BEGIN;
INSERT INTO `UTENTE`(NomeUtente, `Password`, Nome, Cognome, DataRegistrazione)
	VALUES 	('m.lasagna', 'faebfvaes', 'Mario', 'Lasagna', '2009-12-25 12:36:24'),
			('f.melanzana', 'aefbvsr', 'Francesco', 'Melanzana', '2009-08-12 08:12:24'),
			('l.parmigiana', 'aSDxawdf', 'Laura', 'Parmigiana', '2009-01-01 15:36:58'),
			('s.pizza', 'p,kompo', 'Salvatore', 'Pizza', '2009-05-30 09:58:12'),
			('k.tonno', 'oinpjnui', 'Kevin', 'Tonno', '2009-09-22 13:45:36'),
			('g.fioredizucca', 'jlfhgeaif', 'Gabriele', 'Fioredizucca', '2009-06-25 13:54:24'),
			('c.gelato', 'hkbyjf', 'Claudia', 'Gelato', '2009-02-02 15:47:24'),
			('b.tartufino', 'jfnevdnem', 'Brizio', 'Tartufino', '2009-07-23 14:05:56'),
			('e.pistacchio', 'njdfjhxksh', 'Enrico', 'Pistacchio', '2009-03-06 23:56:57'),
			('f.cavolo', 'jdfchdmjfj', 'Francesca', 'Cavolo', '2009-12-25 12:36:24');
COMMIT;

BEGIN;
INSERT INTO `GRUPPO`(Amministratore, Tema, Nome, VisibilitaGruppo, DataCreazioneGruppo)
	VALUES 	(1, 'Cucina', 'La prova del cuoco', 'Pubblico', '2010-12-25 12:36:24'),
			(1, 'Sport', 'Snorkeling', 'Privato', '2010-08-12 08:12:24'),
			(10, 'Giardinaggio', 'Le nostre piantine', 'Privato', '2010-01-01 15:36:58'),
			(8, 'Cinema', 'Kubrick Fan Club', 'Pubblico', '2010-05-30 09:58:12'),
			(7, 'Libri', 'Kundera Official', 'Pubblico', '2010-09-22 13:45:36'),
			(3, 'Musica', 'One Direction <3', 'Pubblico', '2010-06-25 13:54:24'),
			(4, 'Arte', 'Museo del Louvre', 'Pubblico', '2010-02-02 15:47:24'),
			(2, 'Viaggi', 'Alpitour', 'Privato', '2010-07-23 14:05:56'),
			(5, 'Arte', 'Le opere di Leonardo', 'Privato', '2010-03-06 23:56:57'),
			(6, 'Sport', 'Corsa mattutina Pisa', 'Privato', '2010-12-25 12:36:24');
COMMIT;

BEGIN;
INSERT INTO `MESSAGGIO`(Mittente, Destinatario, TestoMessaggio, DataMessaggio)
	VALUES 	(1, 3, 'Ciao, esci oggi?', '2011-12-25 12:36:24'),
			(3, 7, 'Ho visto ora il messaggio, scusami!', '2011-08-12 08:12:24'),
			(10, 6, 'Ti è piaciuto il film di ieri?', '2011-01-01 15:36:58'),
			(8, 2, 'Mi dispiace ma non potrò esserci, sono in ospedale...', '2011-05-30 09:58:12'),
			(7, 4, 'Serve una mano a organizzare la festa per Mario?', '2011-09-22 13:45:36'),
			(4, 7, 'Tranquillo, è tutto apposto!', '2011-09-22 13:54:24'),
			(10, 4, 'Pizza, ti va una pizza? Ahahah', '2011-02-02 15:47:24'),
			(2, 5, 'Mi sono divertito un sacco ieri, da ripetere!!', '2011-07-23 14:05:56'),
			(5, 2, 'Pure io!!', '2011-07-23 14:06:57'),
			(8, 5, 'Booooooooobs!', '2011-12-25 12:36:24');
COMMIT;

BEGIN;
INSERT INTO `SEGNALAZIONE`(Segnalante, Segnalato, DataSegnalazione)
	VALUES 	(1, 8, '2011-01-25 12:36:24'),
			(1, 8, '2011-06-01 15:36:58'),
			(2, 5, '2011-09-12 08:12:24'),
			(2, 5, '2011-12-12 08:12:24'),
			(5, 7, '2011-06-30 09:58:12'),
			(8, 4, '2011-10-22 13:45:36');
COMMIT;

BEGIN;
INSERT INTO `BLOCCO`(Bloccante, Bloccato, DataBlocco)
	VALUES	(1, 8, '2011-06-01 15:36:58'),
			(2, 5, '2011-12-12 08:12:24');
COMMIT;

BEGIN;
INSERT INTO `SONDAGGIO`(Gestore, Domanda, DataInizioSondaggio, DataFineSondaggio)
	VALUES 	(2, 'Cosa compriamo da bere?', '2012-04-30 12:36:24', '2012-04-30 19:00:00'),
			(4, 'Qual è il vostro cantante preferito?', '2011-04-23 15:25:55', NULL),
			(8, 'Al concerto di chi vorreste andare?', '2012-05-28 14:09:10', NULL),
			(6, 'Che libro mi consigliate?', '2011-03-26 08:32:00', '2011-03-26 09:00:00'),
			(3, 'Dove andiamo in vacanza?', '2010-06-15 12:36:24', '2010-06-30 12:00:00'),
			(5, 'Mac o PC?', '2010-04-21 12:36:24', NULL),
			(5, 'Android o iOS?', '2010-04-21 12:46:01', NULL),
			(9, 'In quale ristorante è più buona la pizza?', '2010-05-24 12:36:24', '2010-11-26 20:00:00'),
			(1, 'Finley o Sonohra?', '2010-12-26 12:36:24', NULL),
			(10, 'Dove andreste in vacanza questa estate?', '2010-05-30 12:36:24', NULL),
			(7, 'Leonardo: meglio ingegnere o artista?', '2010-09-23 14:34:56', NULL);
COMMIT;

BEGIN;
INSERT INTO `RISPOSTE`(Sondaggio, TestoRisposta)
	VALUES 	(1, 'Coca Cola'),
			(1, 'Fanta'),
			(1, 'Acqua'),
			(1, 'Vodka'),
			(2, 'Finley'),
			(2, 'Sonohra'),
			(2, 'Justin Bieber'),
			(2, 'One Direction'),
			(3, 'Finley'),
			(3, 'Sonohra'),
			(9, 'Finley'),
			(9, 'Sonohra'),
			(3, 'Justin Bieber'),
			(3, 'One Direction'),
			(4, 'Narnia'),
			(4, 'I pilastri della terra'),
			(4, 'Il metodo di Cartesio'),
			(4, 'Il diario di Anna Frank'),
			(5, 'Mykonos'),
			(5, 'Ibiza'),
			(5, 'Avellino'),
			(5, 'Lloret de mar'),
			(10, 'Mykonos'),
			(10, 'Ibiza'),
			(10, 'Matera'),
			(10, 'Maiorca'),
			(6, 'Mac'),
			(6, 'PC'),
			(7, 'Android'),
			(7, 'iOS'),
			(8, 'Il cinghialetto'),
			(8, 'Panuozzo'),
			(8, 'Pizza Pazza'),
			(8, 'Pizza no stop'),
			(8, 'Flash Pizza'),
			(11, 'Ingegnere'),
			(11, 'Artista');
COMMIT;

BEGIN;
INSERT INTO `EVENTO`(Organizzatore, LuogoEvento, DataEvento, DescrizioneEvento)
	VALUES 	(1, 'Roma', '2013-05-19 11:20:00', 'Sagra del Pecorino Romano'),
			(3, 'Amelia', '2012-09-15 13:00:00', 'Festa Campestre'),
			(1, 'Bergamo', '2014-02-09 15:00:00', 'Protesta Contro la Assenza del Mare'),
			(2, 'Campagnatico', '2014-07-24 08:30:00', 'Festa della Ranocchia'),
			(2, 'Pisa', '2010-03-24 23:30:00', 'Capodanno Pisano'),
			(5, 'Siracusa', '2010-03-30 11:15:00', 'Festa del Mimo'),
			(1, 'New York', '2012-12-21 11:00:00', 'Festa di Fine Mondo'),
			(3, 'Milano', '2013-01-21 12:30:00', 'Mostra del Tartufo'),
			(2, 'Perugia', '2014-01-23 08:00:00', 'Festa Del Cioccolato'),
			(1, 'Vicenza', '2013-05-24 09:30:00', 'Festa del Coltivatore di Carote');
COMMIT;

BEGIN;
INSERT INTO `MATERIALE`(NomeMateriale)
	VALUES 	('Forchetta'),
			('Bicchiere'),
			('Costume'),
			('Maschera'),
			('Palloncino'),
			('Tavolo'),
			('Sedia'),
			('Gioco da Tavolo'),
			('Pane'),
			('Spada'),
			('Carota'),
			('Pentola'),
			('Sandaletto'),
			('Bastone'),
			('Scolapasta'),
			('Computer'),
			('Bicicletta'),
			('Cuffia'),
			('Sci'),
			('Fazzoletto'),
			('Cappello'),
			('Aquilone'),
			('Fotocamera'),
			('Radio'),
			('Chitarra'),
			('Pallone'),
			('Barca'),
			('Acqua Salata'),
			('Paletta'),
			('Secchiello'),
			('Cinghiale');
COMMIT;

BEGIN;
INSERT INTO `INFORMAZIONI`(Utente, CittaNascita, DataNascita, CittaAttuale, StatoCivile, Sesso)
	VALUES 	(1, 'Ossi', '1985-12-03', 'Tissi', 'Sposato', 'M'),
			(2, 'Milano', '1990-10-22', 'Bergamo', 'Celibe', 'M'),
			(3, 'Parma', '1994-01-01', 'Parma', 'Nubile', 'F'),
			(4, 'Avellino', '1994-08-29', 'Pisa', 'Impegnato', 'M'),
			(5, 'Orbetello', '1994-09-22', 'Farnese', 'Celibe', 'M'),
			(6, 'Roma', '1994-02-07', 'Pisa', 'Celibe', 'M'),
			(7, 'Cecina', '1994-02-02', 'Cecina', 'Impegnata', 'F'),
			(8, 'Olbia', '1994-09-07', 'Olbia', 'Celibe', 'M'),
			(9, 'Sassari', '1993-05-23', 'Bari', 'Fidanzato ufficialmente', 'M'),
			(10, 'Pisa', '1980-04-24', 'Pisa', 'Vedova', 'F');
COMMIT;

BEGIN;
INSERT INTO `INTERESSE`(TipoInteresse, NomeInteresse)
	VALUES 	('Sport', 'Calcio'),
			('Arte', 'Monet'),
			('Musica', 'Beethoven'),
			('Libri', 'Dan Brown'),
			('Cinema', 'Stanley Kubrick'),
			('Viaggi', 'Egitto'),
			('Cucina', 'Lasagne'),
			('Giardinaggio', 'Gestione orto'),
			('Tecnologia', 'Telefonia'),
			('Videogiochi', 'Call of duty'),
			('Moda', 'Fendi'),
			('Motori', 'Ferrari Enzo'),
			('Collezionismo', 'Francobolli'),
			('Sport', 'Tennis'),
			('Arte', 'Cezanne'),
			('Musica', 'Red hot chili peppers'),
			('Libri', 'Umberto Eco'),
			('Cinema', 'Alfred Hitchcock'),
			('Viaggi', 'Monte Amiata'),
			('Cucina', 'Frittura di pesce'),
			('Giardinaggio', 'Concime biologico'),
			('Tecnologia', 'Computer'),
			('Videogiochi', 'Angry Birds'),
			('Moda', 'Gucci'),
			('Motori', 'Moto da cross'),
			('Collezionismo', 'Collezione di trattori in scala'),
			('Sport', 'Nuoto'),
			('Arte', 'Gauguin'),
			('Musica', 'Black eyed peas'),
			('Libri', 'Giorgio Faletti'),
			('Cinema', 'Dragon Trainer'),
			('Viaggi', 'Tuscia viterbese'),
			('Cucina', 'Fiori di zucca fritti'),
			('Giardinaggio', 'Rose e orchidee'),
			('Tecnologia', 'Hardware'),
			('Videogiochi', 'Ridge racer'),
			('Moda', 'Asso di cuori'),
			('Motori', 'Opel Zafira'),
			('Collezionismo', 'Monete antiche');

COMMIT;

BEGIN;
INSERT INTO `SCUOLA`(TipoScuola, NomeScuola, CittaScuola)
	VALUES 	('Scuola Media', 'Istituto Comprensivo', 'Olbia'),
			('Liceo Scientifico', 'Paolo Ruffini', 'Viterbo'),
			('Liceo Classico', 'Pietro Colletta', 'Avellino'),
			('Scuola Media', 'Dante Alighieri', 'Avellino'),
			('Istituto Tecnico Aeronautico', 'Attilio Deffenu', 'Olbia'),
			('Liceo Scientico', 'Ulisse Dini', 'Pisa'),
			('ITIS', 'John Von Newmann', 'Roma'),
			('Scuola Media', 'Santa Caterina', 'Frosinone'),
			('Liceo Musicale', 'Calamandrei', 'Firenze'),
			('ITCG', 'Enrico Fermi', 'Pontedera');
COMMIT;

BEGIN;
INSERT INTO `ISTRUZIONE`(Scuola, TitoloStudio, DataInizioFrequentazione, DataFineFrequentazione)
	VALUES 	(5, 'Perito Aeronautico', 2008, 2013),
			(1, 'Licenza Media', 2004, 2008),
			(4, 'Licenza Media', 2005, 2008),
			(3, 'Diploma', 2008, 2013),
			(6, 'Diploma', 1994, 1999);
COMMIT;

BEGIN;
INSERT INTO `IMPIEGO`(Utente, CittaImpiego, LuogoImpiego, RuoloImpiego, DataInizioImpiego, DataFineImpiego)
	VALUES 	(4, 'Pisa', 'Studio Notarile Davella', 'Notaio', 2014, NULL),
			(5, 'Helsinki', 'Nokia by Microsoft', 'CEO', 2012, NULL),
			(7, 'Cupertino', 'Apple Inc.', 'Designer', 2002, NULL),
			(1, 'Pisa', 'Panuozzo Mania', 'Pony express', 2009, 2012),
			(10, 'New York', 'Vogue', 'Stilista', 2014, NULL);
COMMIT;

BEGIN;
INSERT INTO `ALTRO`(Utente, OrientamentoPolitico, OrientamentoReligioso, OrientamentoSessuale)
	VALUES 	(1, 'Partito Democratico', 'Cristiano', 'Etero'),
			(3, 'Forza Italia', 'Agnostica', 'Lesbica'),
			(4, 'Nessuno', 'Cristiano non cattolico', 'Etero'),
			(5, 'Nessuno', 'Ateo', 'Etero'),
			(10, 'SEL', 'Atea', 'Etero');
COMMIT;

BEGIN;
INSERT INTO `POST`(TestoPost, DataPost)
	VALUES 	('Questa pioggia proprio non ci voleva! :(', '2013-09-12 12:45:32'),
			('Boooooooooooooooooooooooooooooobs!', '2010-03-17 13:23:23'),
			('Non funziona whatsapp, voglio morire D:', '2011-12-30 23:00:50'),
			('Lo sai che i papaveri son alti alti alti?', '2009-08-26 19:45:12'),
			('Questi mondiali mi hanno deluso :(', '2014-09-13 15:56:19'),
			('Sono stanca di tutto questo!!', '2012-10-24 08:07:02'),
			('Non vedo l\'ora che sia Agosto... QUANTO PROGRAMMO!', '2009-02-19 11:22:38'),
			('Sto male D:', '2010-06-03 12:09:44'),
			('Si stava meglio quando si stava peggio...', '2012-12-23 20:01:14'),
			('Oh mio Dio il concerto di Justin!!!!111!1!!!oneone', '2010-01-12 03:47:37'),
			('Che vita di stenti...', '2010-12-12 14:59:57'),
			('Mi puzzano i piedi bleah', '2013-08-02 15:02:30'),
			('Buonanotte amici miei', '2010-02-18 22:42:40'),
			('Le zanzare mi adorano :(', '2010-05-30 11:12:43'),
			('Chi semina vento raccoglie tempesta', '2011-02-12 23:09:23'),
			('Se son rose, sono rose!', '2011-06-28 09:10:14'),
			('Che bello, oggi shopping :D', '2012-07-20 12:09:34'),
			('Qualcuno che vuole uscire stasera??', '2013-12-02 19:42:54'),
			('L\' alcool è la versione liquida di Photoshop', '2014-12-11 14:18:53'),
			('Oggi regalano i panini al MCDonald!!', '2012-07-18 21:23:26'),
			('Marquez 9 su 9 dajeee', '2013-05-23 04:52:48'),
			('La sera da leone, la mattina da coglione', '2010-07-25 05:58:47'),
			('Tra tutte le ossa che potevi rompermi, mi hai rotto il cuore </3', '2010-07-25 05:58:47'),
			('No tuccheti che mi caccheti', '2012-04-25 12:34:25');
COMMIT;

BEGIN;
INSERT INTO `CONTENUTO`(NomeContenuto, DataUpload, TipoContenuto, Visibile)
	VALUES 	('Primo Maggio!! 1', '2012-05-02 12:00:00', 'Immagine', 'Pubblico'),
			('Primo Maggio!! 2', '2012-05-02 12:00:02', 'Immagine', 'Pubblico'),
			('Primo Maggio!! 3', '2012-05-02 12:00:05', 'Immagine', 'Pubblico'),
			('Aforisma filosofico', '2012-12-02 12:00:00', 'Documento', 'Privato'),
			('Bellissima festa!', '2011-02-28 14:00:00', 'Video', 'Intermedio'),
			('La mia canzone preferita :D', CURRENT_TIMESTAMP, 'Musica', 'Pubblico'),
			('Curriculum vitae', '2013-07-02 11:00:00', 'Documento', 'Intermedio'),
			('La canzone del mio primo matrimonio', '2014-10-02 17:40:03', 'Musica', 'Pubblico'),
			('Appunti di basi di dati', CURRENT_TIMESTAMP, 'Documento', 'Intermedio'),
			('Laura Pausini - Marco se ne è andato', '2010-07-02 08:36:00', 'Video', 'Pubblico'),
			('Natale scorso 1', '2012-12-25 23:59:50', 'Immagine', 'Intermedio'),
			('Natale scorso 2', '2012-12-25 23:59:50', 'Immagine', 'Intermedio'),
			('Natale scorso 3', '2012-12-25 23:59:50', 'Immagine', 'Intermedio'),
			('Natale scorso 4', '2012-12-25 23:59:50', 'Immagine', 'Intermedio'),
			('Estate 1', '2013-07-02 09:30:50', 'Immagine', 'Pubblico'),
			('Estate 2', '2013-07-02 09:30:50', 'Immagine', 'Pubblico'),
			('Estate 3', '2013-07-02 09:30:50', 'Immagine', 'Pubblico'),
			('Estate 4', '2013-07-02 09:30:50', 'Immagine', 'Pubblico'),
			('Estate 5', '2013-07-02 09:30:50', 'Immagine', 'Pubblico'),
			('Note personali', CURRENT_TIMESTAMP, 'Documento', 'Intermedio'),
			('Laureaaaa!!!', '2014-08-29 13:10:50', 'Video', 'Intermedio'),
			('Laureaaaa!!!', '2014-08-29 13:11:01', 'Immagine', 'Intermedio'),
			('Che chef <3', CURRENT_TIMESTAMP, 'Video', 'Pubblico'),
			('Che pepe!', '2010-05-29 14:50:10', 'Video', 'Pubblico');
COMMIT;

BEGIN;
INSERT INTO `COMMENTO`(Utente, Contenuto, DataCommento, TestoCommento)
	VALUES 	(1, 1, '2012-05-02 16:24:32', 'Che scemi <3'),
			(1, 2, '2012-05-02 16:24:50', 'Quanto avete bevutooo!!! xD'),
			(1, 3, '2012-05-02 16:25:21', 'Questa scena non me la ricordo O.o'),
			(3, 6, CURRENT_TIMESTAMP, 'Anche a me piace molto'),
			(2, 10, '2010-10-02 11:10:12', 'Ma che ascolti -.-"'),
			(5, 15, '2014-05-13 09:12:09', 'Che caldo che faceva'),
			(5, 16, '2014-05-11 02:14:45', 'Che acqua limpida :)'),
			(5, 17, '2013-07-23 05:16:56', 'Qui sei uscita proprio bene'),
			(5, 18, '2013-07-30 12:12:45', '<3'),
			(9 , 23, CURRENT_TIMESTAMP, 'Alla fine si è bruciato tutto hahahaha'),
			(7 , 23, '2010-09-30 23:15:32', 'Oddio muoio ihihihihi');
COMMIT;

BEGIN;
INSERT INTO `GALLERIA`(NomeGalleria)
	VALUES 	('Primo Maggio!!!'),
			('Natale scorso'),
			('Estate');
COMMIT;

BEGIN;
INSERT INTO `RAPPORTO`(Follower, Following, Richiesta, DataRichiesta, Relazione)
	VALUES 	(1, 2, 'Accettata','2013-08-13 13:59:39', 'Amico'),
			(2, 1, 'Accettata','2013-08-13 13:59:39', 'Amico'),
			(5, 3, 'Pendente','2013-01-19 15:45:00', 'Conoscente'),
			(6, 3, 'Pendente','2013-01-24 12:24:32', 'Amico'),
			(4, 7, 'Scaduta','2011-05-30 21:32:56', 'Conoscente'),
			(9, 4, 'Accettata','2010-01-22 09:15:13', 'Familiare'),
			(4, 9, 'Accettata','2010-01-22 11:54:22', 'Familiare'),
			(1, 5, 'Rifiutata','2012-01-12 16:35:23', 'Conoscente'),
			(9, 3, 'Accettata','2014-01-23 08:54:14', 'Amico'),
			(5, 8, 'Pendente','2011-03-22 19:47:03', 'Collega'),
			(10, 4, 'Accettata','2010-02-02 19:47:03', 'Familiare'),
			(4, 10, 'Accettata','2010-02-02 19:50:03', 'Familiare');
COMMIT;

BEGIN;
INSERT INTO `ISCRIZIONE`(Utente, Gruppo, DataIscrizione)
	VALUES 	(1, 6, '2011-08-30 23:15:32'),
			(1, 8, '2011-09-30 23:15:32'),
			(2, 7, '2011-07-30 23:17:32'),
			(3, 9, '2011-06-30 23:14:32'),
			(4, 8, '2011-04-30 23:15:32'),
			(6, 10, '2011-01-30 23:15:32'),
			(7, 2, '2011-03-30 23:15:32'),
			(7, 7, '2011-06-30 23:15:32'),
			(8, 1, '2011-07-30 23:15:32'),
			(8, 6, '2011-02-20 23:15:32');
COMMIT;

BEGIN;
INSERT INTO `INVITO`(Invitato, Sondaggio)
	VALUES 	(1, 1),
			(2, 3),
			(3, 2),
			(4, 6),
			(4, 4),
			(5, 9),
			(7, 1),
			(7, 5),
			(10, 10),
			(6, 4);
COMMIT;

BEGIN;
INSERT INTO `VOTO`(Utente, RispostaSondaggio)
	VALUES 	(1, 2),
			(2, 9),
			(3, 5),
			(4, 27),
			(4, 15),
			(5, 11),
			(7, 1),
			(7, 21),
			(10, 24),
			(6, 16);
COMMIT;

BEGIN;
INSERT INTO `SONDAGGIOGRUPPO`(Sondaggio, Gruppo)
	VALUES 	(1, 1),
			(11, 9),
			(4, 5),
			(9, 6),
			(3, 6);
COMMIT;

BEGIN;
INSERT INTO `PRESENZA`(Utente, Evento, Conferma)
	VALUES 	(1, 1, 'Si'),
			(3, 2, 'No'),
			(1, 3, 'Forse'),
			(2, 4, 'Forse'),
			(2, 5, 'Forse'),
			(5, 6, 'Si'),
			(1, 7, 'Si'),
			(3, 8, 'Si'),
			(2, 9, 'No'),
			(1, 10, 'No'),
			(10, 1, 'Si'),
			(4, 2, 'Forse'),
			(6, 3, 'Si'),
			(3, 4, 'Forse'),
			(9, 5, 'No'),
			(10, 6, 'No'),
			(8, 7, 'Forse'),
			(4, 8, 'Forse'),
			(4, 9, 'Si'),
			(2, 10, 'Si'),
			(9, 1, 'Si'),
			(5, 2, 'Si'),
			(7, 3, 'No');
COMMIT;

BEGIN;
INSERT INTO `ALLESTIMENTO`(Evento, Materiale, Quantita)
	VALUES 	(1, 9, 20),
			(10, 10, 50),
			(4, 7, 100),
			(9, 5, 0),
			(3, 4, 20),
			(5, 20, 25),
			(3, 27, 500),
			(7, 22, 12),
			(6, 2, 100),
			(2, 24, 3);
COMMIT;

BEGIN;
INSERT INTO `SONDAGGIOEVENTO`(Sondaggio, Evento)
	VALUES 	(8, 5),
			(2, 10),
			(7, 1);
COMMIT;

BEGIN;
INSERT INTO `TEMPOLIBERO`(Utente, Interesse)
	VALUES 	(1, 18),
			(2, 29),
			(3, 12),
			(4, 23),
			(5, 26),
			(6, 36),
			(7, 6),
			(8, 9),
			(9, 2),
			(10, 25),
			(1, 34),
			(2, 7),
			(3, 27),
			(4, 31),
			(5, 30),
			(6, 28),
			(7, 5),
			(8, 8),
			(9, 22),
			(10, 10),
			(1, 38),
			(2, 14),
			(3, 33),
			(4, 24),
			(5, 17),
			(6, 37),
			(7, 19),
			(8, 1),
			(9, 15),
			(10, 11);
COMMIT;

BEGIN;
INSERT INTO `GRADO`(Utente, Istruzione)
	VALUES 	(1, 1),
			(1, 2),
			(4, 3),
			(4, 4),
			(10, 5);
COMMIT;

BEGIN;
INSERT INTO `PUBBLICAZIONE`(Utente, PostPubblicato)
	VALUES 	(5, 1),
			(1, 3),
			(8, 4),
			(2, 5),
			(6, 7),
			(4, 8),
			(7, 9),
			(5, 11),
			(9, 14);
COMMIT;

BEGIN;
INSERT INTO `DESTINAZIONE`(Destinatario, Post)
	VALUES 	(8, 2),
			(10, 6),
			(7, 12),
			(3, 15),
			(10, 17),
			(5, 20),
			(7, 22),
			(6, 19);

COMMIT;

BEGIN;
INSERT INTO `RISERVATEZZA`(Visualizzante, Post)
	VALUES 	(1, 1),
			(2, 1),
			(3, 1),
			(4, 2),
			(5, 2),
			(6, 3),
			(7, 3),
			(8, 3),
			(9, 4),
			(10, 5),
			(1, 6),
			(2, 7),
			(3, 7),
			(4, 8),
			(5, 8),
			(6, 9),
			(7, 10),
			(8, 11),
			(9, 12),
			(10, 12),
			(1, 13),
			(2, 14),
			(3, 15),
			(4, 15),
			(5, 15),
			(6, 16),
			(7, 17),
			(8, 18),
			(9, 19),
			(10, 20),
			(1, 21),
			(2, 22),
			(3, 23);
COMMIT;

BEGIN;
INSERT INTO `CONDIVISIONE`( Post,Gruppo)
	VALUES 	(7, 10),
			(9, 13),
			(5, 16),
			(1, 18),
			(10, 21),
			(8, 23);
COMMIT;

BEGIN;
INSERT INTO `ALLEGATO`(Post, Contenuto)
	VALUES 	(1, 14),
			(2, 10),
			(3, 12),
			(4, 23),
			(6, 10),
			(13, 5),
			(14, 19),
			(8, 20),
			(5, 1),
			(9, 11);
COMMIT;

BEGIN;
INSERT INTO `POSSESSO`(Utente, Contenuto)
	VALUES 	(5, 1),
			(5, 2),
			(5, 3),
			(4, 4),
			(8, 5),
			(6, 6),
			(4, 7),
			(10, 8),
			(7, 9),
			(1, 10),
			(8, 11),
			(8, 12),
			(8, 13),
			(8, 14),
			(10, 15),
			(10, 16),
			(10, 17),
			(10, 18),
			(10, 19),
			(2, 20),
			(10, 21),
			(10, 22),
			(4, 23);
COMMIT;

BEGIN;
INSERT INTO `VISIBILITA`(Visualizzante, Contenuto)
	VALUES 	(5, 11),
			(7, 11),
			(1, 11),
			(5, 12),
			(7, 12),
			(1, 12),
			(5, 13),
			(7, 13),
			(1, 13),
			(5, 14),
			(7, 14),
			(1, 14),
			(8, 20),
			(6, 20),
			(4, 20),
			(8, 21),
			(6, 21),
			(4, 21),
			(8, 22),
			(6, 22),
			(4, 22),
			(10, 5),
			(3, 5),
			(10, 7),
			(4, 7),
			(8, 7),
			(2, 9),
			(9, 9);
COMMIT;

BEGIN;
INSERT INTO `LIKE`(Liker, Contenuto, DataLike)
	VALUES 	(1, 23, '2014-01-06 14:48:42'),
			(2, 20, '2013-03-25 01:25:25'),
			(3, 17, '2011-02-04 02:46:50'),
			(4, 13, '2012-03-09 07:10:52'),
			(5, 8, '2012-06-22 14:09:49'),
			(6, 7, '2012-07-20 14:08:23'),
			(7, 5, '2014-10-09 17:39:17'),
			(8, 2, '2012-05-08 00:02:30'),
			(9, 1, '2012-10-06 13:25:58'),
			(10, 15, '2013-12-03 18:22:17');
COMMIT;

BEGIN;
INSERT INTO `TAGGANTE`(Taggante, Contenuto)
	VALUES 	(1, 1),
			(2, 8),
			(3, 3),
			(4, 7),
			(5, 14),
			(6, 15),
			(7, 9),
			(8, 23),
			(9, 21),
			(10, 10);
COMMIT;


BEGIN;
INSERT INTO `TAGGATO`(Taggato, Contenuto)
	VALUES 	(10, 1),
			(9, 8),
			(8, 3),
			(7, 7),
			(6, 14),
			(5, 15),
			(4, 9),
			(3,23),
			(2, 21),
			(1, 10);
COMMIT;

BEGIN;
INSERT INTO `HASHTAG`(Hashtagger, Contenuto, TipoHashtag, TestoHashtag)
	VALUES 	(1, 23, 'Tecnologia', '#Nokia520'),
			(2, 22, 'Arte', '#Louvre'),
			(3, 21, 'Sport', '#Mondiali'),
			(4, 20, 'Cinema', '#Frozen2013'),
			(5, 19, 'Cucina', '#BuonAppetito'),
			(6, 18, 'Musica', '#Bieber'),
			(7, 17, 'Viaggi', '#instaVacanza'),
			(8, 16, 'Giardinaggio', '#RoseRossePerTe'),
			(9, 15, 'Musica', '#RedHot'),
			(10, 14, 'Sport', '#InternazionaliBNL'),
			(1, 13, 'Giardinaggio', '#IMieiFiori'),
			(2, 12, 'Tecnologia', '#XBoxOne'),
			(3, 11, 'Cucina', '#OggiCucinoIo'),
			(4, 10, 'Giardinaggio', '#BacarozzoInGiardino'),
			(5, 9, 'Viaggi', '#VoglioAndareQui'),
			(6, 8, 'Cinema', '#Maleficent'),
			(7, 7, 'Tecnologia', '#GalaxyS5'),
			(8, 6, 'Cucina', '#Carbonara'),
			(9, 5, 'Arte', '#Uffizi'),
			(10,4 , 'Musica', '#Concerto'),
			(1, 3, 'Musica', '#MusicaClassica'),
			(2, 2, 'Viaggi', '#Egitto2014'),
			(3, 1, 'Arte', '#Orsay'),
			(4, 23, 'Giardinaggio', '#TulipaniOlanda'),
			(5, 22, 'Cinema', '#IronMan3'),
			(6, 21, 'Tecnologia', '#SonyVaioPro'),
			(7, 20, 'Musica', '#Pianoforte'),
			(8, 19, 'Tecnologia', '#MacPro'),
			(9, 18, 'Sport', '#Volleyball'),
			(10, 17, 'Viaggi', '#Londra2015');
COMMIT;

BEGIN;
INSERT INTO `ARCHIVIAZIONE`(Galleria, Immagine)
	VALUES 	(1, 1),
			(1, 2),
			(1, 3),
			(2, 11),
			(2, 12),
			(2, 13),
			(2, 14),
			(3, 15),
			(3, 16),
			(3, 17),
			(3, 18),
			(3, 19);
COMMIT;