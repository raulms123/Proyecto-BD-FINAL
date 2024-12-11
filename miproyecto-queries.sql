-- Consulta para obtener los luchadores con su título y división

SELECT
   l.Nombre AS Luchador,
   d.NombreDivision AS Division,
   d.idCampeon AS CampeonID
FROM luchador l
JOIN division d ON l.idLuchador = d.idCampeon;

-- Consulta para obtener el árbitro de cada combate(subconsulta)
SELECT
   c.idCombate,
   c.Resultado,
   c.MetodoFinalizacion,
   c.Duracion,
   c.Arbitro_idArbitro,
   (SELECT a.Nombre FROM arbitro a WHERE a.idArbitro = c.Arbitro_idArbitro) AS Arbitro
FROM combate c;

-- Consulta para obtener los combates de un evento con los luchadores involucrados
SELECT E.Nombre AS Evento, C.idCombate, L1.Nombre AS Luchador_Rojo, L2.Nombre AS Luchador_Azul, C.Resultado
FROM Combate C
JOIN Evento E ON C.Evento_idEvento = E.idEvento
JOIN Luchador L1 ON C.Luchador_idLuchador_rojo = L1.idLuchador
JOIN Luchador L2 ON C.Luchador_idLuchador_azul = L2.idLuchador;

--Consulta para obtener los luchadores con más victorias por decisión unánime
SELECT L.Nombre AS Luchador, COUNT(C.idCombate) AS Victorias_Por_Decision
FROM Luchador L
JOIN Combate C ON (C.Luchador_idLuchador_rojo = L.idLuchador OR C.Luchador_idLuchador_azul = L.idLuchador)
WHERE C.Resultado = 3
GROUP BY L.idLuchador
ORDER BY Victorias_Por_Decision DESC;

--Consulta para obtener el evento con más asistencia
SELECT E.Nombre AS Evento, E.Asistencias
FROM Evento E
ORDER BY E.Asistencias DESC
LIMIT 1;

--Muestro todos los combates clasificados por ronda, con los nombres de los luchadores involucrados
CREATE VIEW Combates_Por_Ronda AS
SELECT R.NumeroRonda, C.idCombate, L1.Nombre AS Luchador_Rojo, L2.Nombre AS Luchador_Azul, C.MetodoFinalizacion, C.Duracion
FROM Combate C
JOIN Ronda R ON C.Ronda_NumeroRonda = R.NumeroRonda
JOIN Luchador L1 ON C.Luchador_idLuchador_rojo = L1.idLuchador
JOIN Luchador L2 ON C.Luchador_idLuchador_azul = L2.idLuchador;


SELECT *
FROM Combates_Por_Ronda;

--Esta vista muestra todos los luchadores agrupados por la división en la que pelean

CREATE VIEW Luchadores_Por_Division AS
SELECT D.NombreDivision, L.Nombre AS Luchador, L.Peso, L.Altura
FROM Luchador L
JOIN Division D ON L.Division_idDivision = D.idDivision
ORDER BY D.NombreDivision, L.Nombre;


SELECT *
FROM Luchadores_Por_Division;

--Función para obtener el nombre del luchador y el árbitro que lo ha arbitrado
DELIMITER $$
CREATE FUNCTION ObtenerArbitroPorLuchador(luchadorId INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
   DECLARE arbitroNombre VARCHAR(45);
   SELECT a.Nombre INTO arbitroNombre
   FROM Combate c
   JOIN Arbitro a ON c.Arbitro_idArbitro = a.idArbitro
   WHERE c.Luchador_idLuchador_rojo = luchadorId OR c.Luchador_idLuchador_azul = luchadorId;
  
   RETURN arbitroNombre;
END $$
DELIMITER ;


SELECT Nombre, ObtenerArbitroPorLuchador(idLuchador) AS Arbitro
FROM Luchador;

--Esta función EsCategoriaPeso verifica si un luchador pertenece a una categoría de peso específica comparando el nombre de la división a la que pertenece con una categoría dada
DELIMITER $$
CREATE FUNCTION EsCategoriaPeso(idLuchador INT, nombreDivision VARCHAR(45))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
   DECLARE divisionLuchador VARCHAR(45);
   SELECT NombreDivision INTO divisionLuchador
   FROM Division
   INNER JOIN Luchador ON Division.idDivision = Luchador.Division_idDivision
   WHERE Luchador.idLuchador = idLuchador;
   RETURN divisionLuchador = nombreDivision;
END$$
DELIMITER ;
SELECT idLuchador, Nombre
FROM Luchador
WHERE EsCategoriaPeso(idLuchador, 'Peso Medio') = TRUE;

-- Procedimiento que muestra los luchadores por categoría de peso y información relacionada como el nombre del arbitro
DELIMITER $$
CREATE PROCEDURE MostrarLuchadoresYArbitrosPorCategoriaPeso(nombreDivision VARCHAR(45))
BEGIN
   SELECT
       l.idLuchador,
       l.Nombre AS Luchador,
       l.Record AS Victorias,
       a.Nombre AS Arbitro
   FROM Luchador l
   JOIN Combate c ON l.idLuchador = c.Luchador_idLuchador_rojo OR l.idLuchador = c.Luchador_idLuchador_azul
   JOIN Arbitro a ON c.Arbitro_idArbitro = a.idArbitro
   WHERE EsCategoriaPeso(l.idLuchador, nombreDivision) = TRUE;
END $$
DELIMITER ;


CALL MostrarLuchadoresYArbitrosPorCategoriaPeso('Peso Pesado');

-- Procedimiento para listar combates supervisados por un árbitro específico
DELIMITER $$
CREATE PROCEDURE CombatesPorArbitro(nombreArbitro VARCHAR(45))
BEGIN
   DECLARE done INT DEFAULT 0;
   DECLARE combateID INT;
   DECLARE eventoNombre VARCHAR(45);
   DECLARE combateCursor CURSOR FOR
       SELECT Combate.idCombate, Evento.Nombre
       FROM Combate
       INNER JOIN Evento ON Combate.Evento_idEvento = Evento.idEvento
       INNER JOIN Arbitro ON Combate.Arbitro_idArbitro = Arbitro.idArbitro
       WHERE Arbitro.Nombre = nombreArbitro;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
   OPEN combateCursor;
   combate_loop: LOOP
       FETCH combateCursor INTO combateID, eventoNombre;
       IF done THEN
           LEAVE combate_loop;
       END IF;
       SELECT CONCAT('Combate ID: ', combateID, ' en el evento: ', eventoNombre) AS DetalleCombate;
   END LOOP;
   CLOSE combateCursor;
END$$
DELIMITER ;
CALL CombatesPorArbitro('Herb Dean');

-- Procedimiento para listar luchadores por división
DELIMITER $$
CREATE PROCEDURE LuchadoresPorDivision(nombreDivision VARCHAR(45))
BEGIN
   SELECT Luchador.idLuchador, Luchador.Nombre, Luchador.Pais, Division.NombreDivision
   FROM Luchador
   INNER JOIN Division ON Luchador.Division_idDivision = Division.idDivision
   WHERE Division.NombreDivision = nombreDivision;
END$$
DELIMITER ;
CALL LuchadoresPorDivision('Peso Mosca');

-- Este trigger hace que un luchador no pueda participar como rojo y azul en el mismo combate

DELIMITER $$
CREATE TRIGGER TRG_Verificar_Luchadores_Combate
BEFORE INSERT ON Combate
FOR EACH ROW
BEGIN
   IF NEW.Luchador_idLuchador_rojo = NEW.Luchador_idLuchador_azul THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Un luchador no puede participar en ambos lados del combate.';
   END IF;
END$$
DELIMITER ;


INSERT INTO Combate (idCombate, Arbitro_idArbitro, Ronda_NumeroRonda, Evento_idEvento, Luchador_idLuchador_rojo, Luchador_idLuchador_azul, Resultado)
VALUES (1, 1, 1, 1, 1, 1, 1);

-- Este trigger incrementa el récord de un luchador ganador cuando se registra el resultado de un combate

DELIMITER $$
CREATE TRIGGER TRG_Actualizar_Record
AFTER INSERT ON Combate
FOR EACH ROW
BEGIN
   -- Si el resultado es 1, el luchador rojo ganó.
   IF NEW.Resultado = 1 THEN
       UPDATE Luchador
       SET Record = Record + 1
       WHERE idLuchador = NEW.Luchad or_idLuchador_rojo;
   -- Si el resultado es 2, el luchador azul ganó.
   ELSEIF NEW.Resultado = 2 THEN
       UPDATE Luchador
       SET Record = Record + 1
       WHERE idLuchador = NEW.Luchador_idLuchador_azul;
   END IF;
END$$
DELIMITER ;


INSERT INTO Combate (Resultado, MetodoFinalizacion, Duracion, Arbitro_idArbitro, Ronda_NumeroRonda, Evento_idEvento, Luchador_idLuchador_rojo, Luchador_idLuchador_azul)
VALUES (1, 'KO', 5, 1, 1, 1, 1, 2);

SELECT idLuchador, Nombre, Record
FROM Luchador;
