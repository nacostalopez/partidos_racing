CREATE DATABASE PARTIDOS_RACING;
USE PARTIDOS_RACING;

CREATE TABLE EQUIPOS
( 
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(100) UNIQUE,
    PAIS VARCHAR(100)
); 

CREATE TABLE PARTIDOS
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    EquipoLocalID INT,
    EquipoVisitanteID INT,
    FECHA DATE,
    RESULTADO VARCHAR(100),
    FOREIGN KEY (EquipoLocalID) REFERENCES EQUIPOS(ID),
    FOREIGN KEY (EquipoVisitanteID) REFERENCES EQUIPOS(ID)
); 

CREATE TABLE VIDEOS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    PartidoID INT,
    Link VARCHAR(255),
    Descripcion VARCHAR(255),
    FOREIGN KEY (PartidoID) REFERENCES PARTIDOS(ID)
);


INSERT INTO EQUIPOS (NOMBRE, PAIS) VALUES ('Racing Club', 'Argentina');
INSERT INTO EQUIPOS (NOMBRE, PAIS) VALUES ('Lanus', 'Argentina');
INSERT INTO EQUIPOS (NOMBRE, PAIS) VALUES ('Tigre', 'Argentina');
INSERT INTO EQUIPOS (NOMBRE, PAIS) VALUES ('Riestra', 'Argentina');
INSERT INTO EQUIPOS (NOMBRE, PAIS) VALUES ('Argentinos Juniors', 'Argentina');
INSERT INTO EQUIPOS (NOMBRE, PAIS) VALUES ('Belgrano', 'Argentina');


INSERT INTO PARTIDOS (EquipoLocalID, EquipoVisitanteID, FECHA, RESULTADO) VALUES (
    (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Racing Club'),
    (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Belgrano'),
    '2024-05-12', '4-4'
);

INSERT INTO PARTIDOS (EquipoLocalID, EquipoVisitanteID, FECHA, RESULTADO) VALUES (
    (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Racing Club'),
    (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Argentinos Juniors'),
    '2024-05-20', '3-0'
);

INSERT INTO PARTIDOS (EquipoLocalID, EquipoVisitanteID, FECHA, RESULTADO) VALUES (
    (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Racing Club'),
    (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Tigre'),
    '2024-05-24', '4-0'
);

INSERT INTO PARTIDOS (EquipoLocalID, EquipoVisitanteID, FECHA, RESULTADO) VALUES (
    (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Racing Club'),
    (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Riestra'),
    '2024-06-01', '1-0'
);

INSERT INTO PARTIDOS (EquipoLocalID, EquipoVisitanteID, FECHA, RESULTADO) VALUES (
    (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Racing Club'),
    (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Lanus'),
    '2024-06-13', '0-2'
);


INSERT INTO VIDEOS (PartidoID, Link, Descripcion) VALUES (
    (SELECT ID FROM PARTIDOS
     WHERE EquipoLocalID = (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Racing Club')
       AND EquipoVisitanteID = (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Belgrano')),
    'https://www.youtube.com/watch?v=O_HPud9H7vA',
    'Luego de remontar un 1-0, Racing se impuso 4-1 y de manera insólita le hacen 3 goles sobre el cierre del partido.'
);

INSERT INTO VIDEOS (PartidoID, Link, Descripcion) VALUES (
    (SELECT ID FROM PARTIDOS
     WHERE EquipoLocalID = (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Racing Club')
       AND EquipoVisitanteID = (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Argentinos Juniors')),
    'https://youtu.be/1mj4CXkuYmI?si=zNnBdZjkLHS052Mj',
    'En un partido que en la previa parecia parejo, Racing pasó por arriba al bicho en Avellaneda con un gran funcionamiento colectivo.'
);

INSERT INTO VIDEOS (PartidoID, Link, Descripcion) VALUES (
    (SELECT ID FROM PARTIDOS
     WHERE EquipoLocalID = (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Racing Club')
       AND EquipoVisitanteID = (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Tigre')),
    'https://youtu.be/mQjm361HCqE?si=GhaWiVy4Kj_ObXqg',
    'Sin sobresaltos el equipo de Costas goleo a un Tigre muy inferior en la noche de Victoria.'
);

INSERT INTO VIDEOS (PartidoID, Link, Descripcion) VALUES (
    (SELECT ID FROM PARTIDOS
     WHERE EquipoLocalID = (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Racing Club')
       AND EquipoVisitanteID = (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Riestra')),
    'https://youtu.be/Rj4TlpxKGkY?si=hWMaxw-H5dcVfLjq',
    'Racing se impuso por la minima ante Riestra como local en un triunfo agónico.'
);

INSERT INTO VIDEOS (PartidoID, Link, Descripcion) VALUES (
    (SELECT ID FROM PARTIDOS
     WHERE EquipoLocalID = (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Racing Club')
       AND EquipoVisitanteID = (SELECT ID FROM EQUIPOS WHERE NOMBRE = 'Lanus')),
    'https://youtu.be/8PlTBMMedTg?si=FvbMDnqUcub6lkYn',
    'Racing cayó por 2 a 0 en condicion de visitante en la Fortaleza con un muy bajo desempeño y goles de Carrera y Bou.'
);
