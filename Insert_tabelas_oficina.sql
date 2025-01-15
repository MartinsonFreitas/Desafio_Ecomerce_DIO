INSERT INTO clients(Fname, Lname, FedId) VALUES
	('Joana', 'Dark', '12365497899'),
	('Carla', 'Amaro', '85749658246'),
	('Silvia', 'Lago', '46695877215'),
	('Kamila', 'Pitanga', '96553815978'),
	('Antonia', 'Silva', '36915984211');

INSERT INTO vehicles(idClient, CarModel, CarBrand, CarColor, LicensePlate) VALUES
	('1', 'Fiesta', 'Ford', 'Amarelo', 'ADC11D4'),
	('1', 'Kicks', 'Nissan', 'Amarelo', 'DRG43Z1'),
	('1', 'T-Cross', 'VW', 'Amarelo', 'AFA22D3'),
	('2', 'TAOS', 'VW', 'Amarelo', 'TFR26A6'),
	('2', 'Kicks', 'Nissan', 'Amarelo', 'FLG74R2'),
	('3', 'Palio', 'Fiat', 'Amarelo', 'CGF13B0'),
	('4', 'T-Cross', 'VW', 'Amarelo', 'CHY53H5'),
	('4', 'Onix', 'GM', 'Amarelo', 'CIE35A2'),
	('5', 'Onix', 'GM', 'Amarelo', 'QAD4KL1');

INSERT INTO mechanics(Mresponsable, MFedId, HourCost) VALUES
	('Karolina Dikma','12332112332', '7.8'), 
	('Amaral Souza','95195175328', '6.95'), 
	('Maria Antonia','75335775391', '6.9'),
	('Florisvaldo Silva', '82888999977', '7.0');

INSERT INTO autoParts(Pname, Pcost, Pstatus) VALUES
	('Motor','235.9', 'Solicitado'), 
	('Amortecedor','199.9', 'Fora de Estoque'), 
	('Filtro de Ar','79.8', 'Disponivel'),
	('Fluido de Freio 1L', '35.5', 'Disponivel'),
	('Oleo de Motor 1L', '49.9', 'Solicitado'),
	('Fluido de Cambio 1L', '69.6', 'Disponivel');

INSERT INTO serviceRequests(idVehicle, RequestType, Description, Status) VALUES
	('3', 'Revisao','Cliente reclamou do barulho no freio', 'Aprovado'), 
	('4', 'Reparo','Troca de partilhas de freio', 'Em andamento'), 
	('8', 'Reparo','Verificar freio', 'Finalizado'),
	('7', 'Revisao', 'Incluir troca de partilhas', 'Finalizado'),
	('1', 'Revisao', 'Trocar partilhas', 'Em andamento'),
	('6', 'Reparo', 'Trocar disco de embreagem', 'Cancelado');

INSERT INTO mechanicService(idRequest, idMechanic, WorkHours) VALUES
	('1', '1', '3.75'), 
	('2', '3', '6.5'), 
	('3', '1', '4.0'),
	('4', '2', '1.9'),
	('5', '4', '2.0'),
	('6', '3', '5.8');

INSERT INTO partService(idRequest, idPart, Pquantity) VALUES
	('1', '4', '2'), 
	('2', '2', '1'), 
	('3', '1', '1'),
	('4', '3', '1'),
	('5', '4', '2'),
	('5', '6', '3');
