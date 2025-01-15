-- Classificação
SELECT Mresponsable, round(workHours, 2) as workHours, round((workHours * HourCost), 2) as Labor
FROM mechanics m
INNER JOIN mechanicService ms ON ms.idMechanic = m.idMechanic
ORDER BY Labor DESC;

-- Classificação de Mecânicos com 2+ serviços
SELECT Mresponsable, r.RequestType, round(workHours, 2) as workHours, round((workHours * HourCost), 2) as Labor
FROM mechanics m
INNER JOIN mechanicService ms ON ms.idMechanic = m.idMechanic
INNER JOIN serviceRequests r ON ms.idRequest = r.idRequest
GROUP BY Mresponsable
HAVING COUNT(*) > 1
ORDER BY Labor DESC;

-- Atividade do Mecânico com base no status do serviço
SELECT CONCAT(c.Fname, ' ', c.Lname) as Client, CONCAT(v.CarModel, ' ', v.CarColor) as Car, v.LicensePlate, r.RequestType, r.Status,
	CASE
    	WHEN r.Status = 'Cancelado' THEN 'Rever proposta de serviço'
        WHEN r.Status = 'Aprovado' THEN 'Entrar em contato para agendamento'
        WHEN r.Status = 'Finalizado' THEN 'Realizar pós-venda'
        ELSE NULL
    END AS MechanicActivity
FROM vehicles v
INNER JOIN clients c ON v.idClient = c.idClient
INNER JOIN serviceRequests r ON v.idVehicle = r.idVehicle;
