-- CREATE DATABASE JogoPokemon;
USE JogoPokemon;



CREATE TABLE jogador(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR(30) NOT NULL,
    idade INT NOT NULL,
    dinheiro FLOAT NOT NULL
);



CREATE TABLE item(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR(30) NOT NULL,
    preco FLOAT,
	tipo VARCHAR(30) NOT NULL,
    quantidade INT,
    fk_jogador INT,
    CONSTRAINT fk_jogador_constraint
	FOREIGN KEY (fk_jogador)
	REFERENCES jogador(id)
 );
 
  -- DROP TRIGGER decrementar_dinheiro;
DELIMITER //
CREATE TRIGGER decrementar_dinheiro
AFTER UPDATE ON jogopokemon.item
FOR EACH ROW
BEGIN
	IF NEW.quantidade > OLD.quantidade THEN
	UPDATE jogopokemon.jogador
	SET dinheiro = dinheiro - (old.preco * (new.quantidade - old.quantidade))
    WHERE old.fk_jogador = jogador.id;
    END IF;
END;
//
 
INSERT INTO jogador 
(
    nome,
    idade,
    dinheiro
)
VALUES
('Marcos', 20 , 300.5),
('Ash', 10 , 30.5),
('Bartolomeu', 55 , 5200);



INSERT INTO item 
(
    nome,
    preco,
    tipo,
    quantidade,
    fk_jogador
)
VALUES
('pokeball', 5, 'pokeball', 10, 1),
('thunder stone', 5000,'evolution stone',  1, 2),
('ultra ball', 25, 'pokeball', 50, 3);


UPDATE item
SET quantidade = quantidade + 1
WHERE nome = 'thunder stone' and fk_jogador = 2;

SELECT *
FROM jogador INNER JOIN item
ON jogador.id = item.fk_jogador;


