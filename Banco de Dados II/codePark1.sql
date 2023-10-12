CREATE DATABASE MundoPokemon;
USE MundoPokemon;


CREATE TABLE treinador(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR(30) NOT NULL,
    idade INT NOT NULL
);

CREATE TABLE pokemon(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR(30) NOT NULL,
    apelido VARCHAR(30),
    tipo VARCHAR(20),
    fk_treinador int,
    CONSTRAINT fk_treina
	FOREIGN KEY (fk_treinador)
	REFERENCES treinador(id)
 );



INSERT INTO treinador 
(
    nome,
    idade
)
VALUES
(
	'Ash',
    10
);
*/

INSERT INTO pokemon 
(
    nome,
    apelido,
    tipo,
    fk_treinador
)
VALUES
(
	'pikachu',
	null,
    'elétrico',
    1
);


-- Apenas treinadores com pokemon
SELECT *
FROM treinador inner join pokemon
ON treinador.id = pokemon.fk_treinador;

-- Todos os treinadores, até os que não tem pokemon
SELECT *
FROM treinador left join pokemon
ON treinador.id = pokemon.fk_treinador;

-- Todos os pokemon, até os que não tem treinadores
SELECT *
FROM treinador right join pokemon
ON treinador.id = pokemon.fk_treinador;

-- Todos os treinadores e pokemon
SELECT *
FROM treinador left join pokemon
ON treinador.id = pokemon.fk_treinador
UNION
SELECT *
FROM treinador right join pokemon
ON treinador.id = pokemon.fk_treinador;
