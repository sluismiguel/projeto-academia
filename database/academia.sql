CREATE SCHEMA academia;

USE academia;

CREATE TABLE clientes (
   id INT NOT NULL,
   nome VARCHAR (20) NOT NULL,
   telefone INT (11),
   email VARCHAR (25),
   idade INT (2),
   observacoes VARCHAR (50),
   PRIMARY KEY (id)
   );
   
ALTER TABLE clientes MODIFY id int NOT NULL AUTO_INCREMENT;
