--DDL

CREATE DATABASE THEBUGRPG

USE THEBUGRPG 

CREATE TABLE Usuarios(
	UsuarioID INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(255) NOT NULL

)

CREATE TABLE Classes(
	ClasseID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL,
	Descricao VARCHAR(255)

)

CREATE TABLE Personagem(
	PersonagemID INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(15) UNIQUE NOT NULL,
	UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId),
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID) 
)

CREATE TABLE Habilidades(
	HabilidadeID INT PRIMARY KEY IDENTITY,
	NomeHabilidade VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE ClasseHabilidades(
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID),
	HabilidadeID INT FOREIGN KEY REFERENCES Classes(ClasseID)
)

--DML
INSERT INTO Usuarios VALUES ('tatiane@email.com', '1234')
INSERT INTO Classes VALUES ('Barbaro', 'Pequeno e forte')
INSERT INTO Habilidades VALUES ('Escudo'), ('Lança'), ('Regeneração')
INSERT INTO Personagem (NomePersonagem, UsuarioID, ClasseID) VALUES ('Arminula', 1, 1)
INSERT INTO ClasseHabilidades (ClasseID, HabilidadeID) VALUES (1,1), (1,2)

INSERT INTO Usuarios VALUES ('Caique@email.com', '4567')
INSERT INTO Classes VALUES ('Monge', 'Magia e rapídez')
INSERT INTO Personagem (NomePersonagem, UsuarioID, ClasseID) VALUES ('MajorBig', 9, 9)
INSERT INTO ClasseHabilidades (ClasseID, HabilidadeID) VALUES (9,1), (9,3)

UPDATE Usuarios
SET Senha = '12345678'
WHERE UsuarioID = 1

--DQL

SELECT *FROM Usuarios
SELECT *FROM Classes
SELECT *FROM Habilidades
SELECT *FROM Personagem
SELECT *FROM ClasseHabilidades

SELECT *FROM Personagem
INNER JOIN Classes
ON Personagem.ClasseID = Classes.ClasseID
