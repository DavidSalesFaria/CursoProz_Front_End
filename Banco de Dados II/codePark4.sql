CREATE DATABASE cadastroClientes;
USE cadastroClientes;

CREATE TABLE cliente(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    idade INT NOT NULL
);

CREATE TABLE cadastro_cliente(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_cliente INT NOT NULL,
    data_cadastro DATE NOT NULL,
    CONSTRAINT fk_cliente_constraint
		FOREIGN KEY (fk_cliente)
		REFERENCES cliente(id)
);


DELIMITER //
CREATE TRIGGER trig_cadastro_cliente
AFTER INSERT ON cadastroClientes.cliente
FOR EACH ROW
BEGIN
	INSERT INTO cadastro_cliente
    (
		fk_cliente,
        data_cadastro
    )
    VALUES
    (
		NEW.id,
        current_date()
    );
END;
//
DELIMITER $$
DROP FUNCTION totalClientes;
CREATE FUNCTION totalClientes (dia DATE)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE total_clientes INT;
    
    SET total_clientes = (SELECT COUNT(*) as total
	FROM cadastro_cliente
    WHERE data_cadastro = dia
	GROUP BY data_cadastro);
    
    return total_clientes;
END; $$



INSERT INTO cliente
(
    nome,
    sobrenome,
    idade
)
VALUES
('Eduardo', 'Ferreira', 19),
('Fernanda', 'Golçalves', 33),
('Marcelo', 'Gomes', 22),
('Ana', 'Gabriela', 66),
('Gabriel', 'Geron', 80),
('Eduardo', 'Tacio', 41);


SELECT *
FROM cliente INNER JOIN cadastro_cliente
ON cliente.id = cadastro_cliente.fk_cliente;

SELECT totalClientes('2023-10-16');
SELECT totalClientes('2023-10-17');