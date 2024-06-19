-- En esta consulta se sacará a todos los luchadores que hayan nacido después de 1985, cuyo peso sea mayor de 60, y que pertenezcan al equipo "Team Gamma".

SELECT *
FROM Luchador
WHERE YEAR(FechaNacimiento) > 1985
AND Peso > 60
AND Equipo = 'Team Gamma';
-- Con esta consulta estamos encontrando los luchadores con el récord más alto registrado en cada equipo:

SELECT L1.Nombre, L1.Record, L1.Equipo
FROM Luchador AS L1
WHERE (L1.Equipo, L1.Record) IN (
    SELECT Equipo, MAX(Record) AS MaxRecord
    FROM Luchador
    GROUP BY Equipo
);

-- En esta consulta queremos obtener los nombres de los entrenadores con sus respectivas academias,junto con el nombre del luchador y el nombre de su título asociado

SELECT DISTINCT e.NombreEntrenador, e.Academia, l.Nombre, l.Titulo_NombreTitutlo AS Titulo
FROM Luchador l
JOIN Entrenador e ON l.Entrenador_NombreEntrenador = e.NombreEntrenador
WHERE l.Titulo_NombreTitutlo IS NOT NULL;

-- Con esta consulta para mostrar información detallada de los combates, incluyendo nombres de luchadores y resultado

SELECT c.idCombate, c.`Fecha/Hora`, l1.Nombre AS Luchador1, l2.Nombre AS Luchador2, c.`Resultado`, c.`MetodoFinalizacion`, c.`Duracion`
FROM `Participacion` p
JOIN `combate` c ON p.idCombate = c.idCombate
JOIN `luchador` l1 ON p.idLuchador = l1.idLuchador
JOIN `luchador` l2 ON p.idLuchador != l2.idLuchador AND p.idCombate = (SELECT idCombate FROM `Participacion` WHERE idCombate = p.idCombate LIMIT 1)wwwww
ORDER BY c.idCombate;





Vista 1

-- Esta esta vista está hecha con la consulta del apartado anterior donde se nos mostraba la información detallada de los combates con el nombre del ganador

CREATE VIEW Detalles_Combates AS
SELECT c.idCombate, c.`Fecha/Hora`, l1.Nombre AS Luchador1, l2.Nombre AS Luchador2,
   CASE WHEN p.Ganador = l1.idLuchador THEN l1.Nombre ELSE l2.Nombre END AS Ganador,
   c.`Resultado`, c.`MetodoFinalizacion`, c.`Duracion`
FROM `Participacion` p
JOIN `combate` c ON p.idCombate = c.idCombate
JOIN `luchador` l1 ON p.idLuchador = l1.idLuchador
JOIN `luchador` l2 ON p.idLuchador != l2.idLuchador AND p.idCombate = (SELECT idCombate FROM `Participacion` WHERE idCombate = p.idCombate LIMIT 1);
SELECT * FROM Detalles_Combates;

Vista 2

-- Creamos  una vista llamada MejoresLuchadores que muestra los nombres, récords y equipos de los luchadores con el mejor récord en cada equipo.

CREATE VIEW MejoresLuchadores AS
SELECT L1.Nombre, L1.Record, L1.Equipo
FROM Luchador AS L1
WHERE (L1.Equipo, L1.Record) IN (
   SELECT Equipo, MAX(Record) AS MaxRecord
   FROM Luchador
   GROUP BY Equipo
);

SELECT * FROM mejoresluchadores m ;

Triggers 1

DELIMITER //
CREATE TRIGGER before_insert_combate
BEFORE INSERT ON combate
FOR EACH ROW
BEGIN
   IF NEW.Duracion > 1000 THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La duración del combate no puede ser mayor a 60 minutos';
   END IF;
END //
DELIMITER ;
INSERT INTO combate (idCombate, `Fecha/Hora`, Resultado, MetodoFinalizacion, Duracion, Arbitro_idArbitro, Ronda_NumeroRonda, Evento_idEvento)
VALUES (17, '2024-06-20 18:00:00', 1, 'KO', 1001, 1, 1, 1);

Triggers 2

DELIMITER //
CREATE TRIGGER validarInsercionArbitro
BEFORE INSERT ON arbitro
FOR EACH ROW
BEGIN
   DECLARE v_count INT;
  
   SELECT COUNT(*) INTO v_count
   FROM arbitro
   WHERE Nombre = NEW.Nombre;
  
   IF v_count > 0 THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'El nombre del árbitro ya existe.';
   END IF;
END //
DELIMITER ;
INSERT INTO arbitro (idArbitro, Nombre, Pais, Especialidad)
VALUES (21, 'Carlos López', 'España', 'Boxeo');
INSERT IGNORE INTO arbitro (idArbitro, Nombre, Pais, Especialidad)
VALUES (22, 'Carlos López', 'Brasil', 'Jiu-Jitsu');

Función 1

DELIMITER //
CREATE FUNCTION ObtenerNombreLuchador(p_idLuchador INT)
RETURNS VARCHAR(45)
BEGIN
   DECLARE v_Nombre VARCHAR(45);
  
   SELECT Nombre INTO v_Nombre
   FROM luchador
   WHERE idLuchador = p_idLuchador;
  
   RETURN v_Nombre;
END //
DELIMITER ;
SELECT ObtenerNombreLuchador(12) AS NombreLuchador;


Función 2

DELIMITER //
CREATE FUNCTION CalcularEdadLuchador(p_idLuchador INT)
RETURNS INT
BEGIN
   DECLARE v_FechaNacimiento DATE;
   DECLARE v_Edad INT;
  
   SELECT FechaNacimiento INTO v_FechaNacimiento
   FROM luchador
   WHERE idLuchador = p_idLuchador;
  
   SET v_Edad = TIMESTAMPDIFF(YEAR, v_FechaNacimiento, CURDATE());
  
   RETURN v_Edad;
END //
DELIMITER ;

Procedimiento que hace uso de un cursor:

DELIMITER //
CREATE PROCEDURE ListarLuchadoresPorEquipo(IN equipo VARCHAR(100))
BEGIN
   DECLARE done INT DEFAULT FALSE;
   DECLARE nombre_luchador VARCHAR(200);
   DECLARE cur CURSOR FOR SELECT Nombre FROM Luchador WHERE Equipo = equipo;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
   -- Crear una tabla temporal para almacenar los resultados
   CREATE TEMPORARY TABLE IF NOT EXISTS TempLuchadores (
       Luchador VARCHAR(200)
   );
   -- Limpiar la tabla temporal antes de llenarla
   TRUNCATE TABLE TempLuchadores;
   OPEN cur;
   read_loop: LOOP
       FETCH cur INTO nombre_luchador;
       IF done THEN
           LEAVE read_loop;
       END IF;
       -- Insertar el nombre del luchador en la tabla temporal
       INSERT INTO TempLuchadores (Luchador) VALUES (nombre_luchador);
   END LOOP;
   CLOSE cur;
   -- Seleccionar todos los registros de la tabla temporal
   SELECT * FROM TempLuchadores;
   -- Eliminar la tabla temporal
   DROP TEMPORARY TABLE TempLuchadores;
END //
DELIMITER ;
-- Llamar al procedimiento almacenado
CALL ListarLuchadoresPorEquipo('Team Alpha');

Procedimiento 1

DELIMITER //
CREATE PROCEDURE InsertarLuchador(
   IN p_idLuchador INT,
   IN p_Nombre VARCHAR(45),
   IN p_Pais VARCHAR(45),
   IN p_FechaNacimiento DATE,
   IN p_Peso INT,
   IN p_Altura INT,
   IN p_Record VARCHAR(50),
   IN p_Equipo VARCHAR(45),
   IN p_Titulo_NombreTitutlo VARCHAR(100),
   IN p_Division_idDivision INT,
   IN p_Entrenador_NombreEntrenador VARCHAR(45)
)
BEGIN
   INSERT INTO luchador (
       idLuchador, Nombre, Pais, FechaNacimiento, Peso, Altura, Record, Equipo,
       Titulo_NombreTitutlo, Division_idDivision, Entrenador_NombreEntrenador
   ) VALUES (
       p_idLuchador, p_Nombre, p_Pais, p_FechaNacimiento, p_Peso, p_Altura, p_Record,
       p_Equipo, p_Titulo_NombreTitutlo, p_Division_idDivision, p_Entrenador_NombreEntrenador
   );
END //
DELIMITER ;
CALL InsertarLuchador(
   201, 'Juan Pérez', 'Argentina', '1990-05-15', 80, 180, '10-2-0',
   'Equipo A', 'Campeón Peso Medio', 1, 'Abeni Abiodun'
);

Procedimiento 2

DELIMITER //
CREATE PROCEDURE ActualizarRecordLuchador(
   IN p_idLuchador INT,
   IN p_NuevoRecord VARCHAR(50)
)
BEGIN
   UPDATE luchador
   SET Record = p_NuevoRecord
   WHERE idLuchador = p_idLuchador;
END //
DELIMITER ;
CALL ActualizarRecordLuchador(1, '11-2-0');
