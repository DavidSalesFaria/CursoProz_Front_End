CREATE DATABASE vendasProd;
USE vendasProd;


CREATE TABLE vendas(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	produto VARCHAR(30) NOT NULL,
    valor FLOAT NOT NULL,
    quantidade INT NOT NULL,
    data_venda DATE NOT NULL
);


INSERT INTO vendas
(
    produto,
    valor,
    quantidade,
    data_venda
)
VALUES
('camisa', 20.99, 18, '2023-10-01'),
('meia', 10.50, 23, '2023-10-01'),
('sapato', 200.99, 15, '2023-10-01'),
('calça jeans', 50.99, 18, '2023-10-02'),
('moletom', 1000.50, 23, '2023-10-02'),
('terno', 2000.99, 5, '2023-10-02');



DELIMITER $$
CREATE PROCEDURE exibir_total_vendido ()
BEGIN
	SELECT data_venda, SUM(quantidade) as total
	FROM vendas
	GROUP BY data_venda;
END; $$


CALL exibir_total_vendido()

