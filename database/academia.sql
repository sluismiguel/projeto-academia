CREATE SCHEMA academia;

CREATE TABLE cliente (
   id INT NOT NULL,
   nome VARCHAR (20) NOT NULL,
   telefone INT (11),
   email VARCHAR (25),
   idade INT (2),
   observacoes VARCHAR (50)
);