CREATE DATABASE db_Campanha;
USE db_Campanha;

CREATE TABLE Organizador (
idOrganizador INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
rua VARCHAR(45),
bairro VARCHAR(45),
email VARCHAR(45),
fkSupervisor INT, CONSTRAINT fkS FOREIGN KEY (fkSupervisor) REFERENCES Organizador(idOrganizador)
)AUTO_INCREMENT = 30;

INSERT INTO Organizador (nome,rua, bairro, email, fksupervisor) VALUES
	('João Pedro', 'Rua Otelo Augusto Ribeiro', 'Guainasases', 'JP@gmail.com', null),
    ('Cauã Souza', 'Travessa Manuel Pereira de Lima', 'Itaquera', 'CS@gmail.com',  null),
    ('Leonardo Silva', 'Rua Marambaia', 'Casa Verde', 'LS@gmail.com', null);
    
UPDATE Organizador SET fkSupervisor = 30
	WHERE idOrganizador in (31,32);


CREATE TABLE Campanha (
idCampanha INT PRIMARY KEY AUTO_INCREMENT,
categoria VARCHAR(45),
instituicao VARCHAR(45), CONSTRAINT catchk CHECK (instituicao in ('Capacetes Brancos', 'Mães da Sé')),
fkOrganizador INT, CONSTRAINT fkO FOREIGN KEY (fkOrganizador) REFERENCES Organizador(idOrganizador)
)AUTO_INCREMENT = 500;

INSERT INTO Campanha (categoria, instituicao, fkOrganizador) VALUES
	('Higiene', 'Capacetes Brancos',  30),
    ('Alimentos', 'Capacetes Brancos',  30),
    ('Roupas', 'Mães da Sé',  31),
    ('Máscara de Proteção', 'Capacetes Brancos', 32);
    
SELECT * FROM Organizador;

SELECT * FROM Campanha;

SELECT * FROM Organizador JOIN Campanha ON fkOrganizador = idOrganizador;

SELECT * FROM Organizador JOIN Campanha ON fkOrganizador = idOrganizador
	WHERE Organizador.nome = 'João Pedro';

SELECT * FROM Organizador AS OS JOIN Organizador AS O ON  OS.fkSupervisor = O.idOrganizador;

SELECT * FROM Organizador AS OS JOIN Campanha ON fkOrganizador = idOrganizador 
	JOIN Organizador AS O ON  OS.fkSupervisor = O.idOrganizador;
    
SELECT * FROM Organizador AS O JOIN Campanha ON fkOrganizador = idOrganizador 
	JOIN Organizador AS OS ON  OS.idOrganizador = O.fkSupervisor 
		WHERE O.nome = 'Leonardo Silva';
	



