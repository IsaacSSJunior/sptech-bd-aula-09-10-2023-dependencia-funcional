CREATE DATABASE db_AlunoProjeto;
USE db_AlunoProjeto;

CREATE TABLE Projeto (
idProjeto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(45)
);

INSERT INTO Projeto (nome,descricao) VALUES
	('Super Solar', 'Maketing do Sistema Solar'),
    ('V6', 'Desenho Folha A2 - Protótipo de Motor V6'),
    ('Doce Horta', 'Plataforma Web para frutas & Legumes');

CREATE TABLE Aluno (
raAluno CHAR(8) PRIMARY KEY,
nome VARCHAR(45),
telefoneP VARCHAR(20),
telefoneS VARCHAR(20),
fkRepresentante CHAR(8), CONSTRAINT fkR FOREIGN KEY (fkRepresentante) REFERENCES Aluno(raAluno),
fkProjeto INT, CONSTRAINT fkP FOREIGN KEY (fkProjeto) REFERENCES Projeto(idProjeto)
);

INSERT INTO Aluno VALUES
	('01232150', 'Isaac', '11919193312', '1199191332',null, 2),
    ('01232327', 'Sabrina', '11914593312', '11939193112', null, 1),
    ('01232998', 'Luana', '11912163612', '11969196311', null, 1),
    ('01232017', 'Kaique', '11999193312', '11959193314', null, 2),
    ('01232498', 'Diego', '11979192312', '11912193616', null,3),
    ('01232697', 'Leonardo', '11969193222', '11949196317', null,3);
    
UPDATE Aluno SET fkRepresentante = '01232150' -- Isaac
	WHERE raAluno = '01232327'; -- Sabrina
    
UPDATE Aluno SET fkRepresentante = '01232017' -- Kaique
	WHERE raAluno = '01232998'; -- Luana
    
UPDATE Aluno SET fkRepresentante = '01232697' -- Leonardo
	WHERE raAluno = '01232498'; -- Diego

CREATE TABLE Acompanhante (
idAcompanhante INT,
fkAluno CHAR(8),
PRIMARY KEY (idAcompanhante, fkAluno),
nome VARCHAR (45),
tipoRelacao VARCHAR (45)
);

INSERT INTO Acompanhante VALUES 
	(1,'01232150','Pedro Lopes', 'Primo'),
    (2,'01232998','Mateus', 'Namorado'),
    (3,'01232498','Valquiria', 'Mãe');
    
SELECT * FROM Projeto;

SELECT * FROM Aluno;

SELECT * FROM Acompanhante;

SELECT * FROM Aluno JOIN Projeto ON fkProjeto = idProjeto;

SELECT * FROM Aluno JOIN Acompanhante ON raAluno = fkAluno;

SELECT * FROM Aluno AS A JOIN Aluno AS AR ON A.raAluno = AR.fkRepresentante;

SELECT * FROM Aluno JOIN Projeto ON fkProjeto = idProjeto
	WHERE Projeto.nome = 'V6';
    
SELECT * FROM Projeto JOIN Aluno AS A ON idProjeto = fkProjeto
	JOIN Acompanhante ON fkAluno = raAluno;

