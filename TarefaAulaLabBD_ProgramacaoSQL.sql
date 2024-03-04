CREATE DATABASE TarefaAulaLabBD_ProgramacaoSQL
go
USE TarefaAulaLabBD_ProgramacaoSQL

-- 1) Dado um número inteiro. Calcule e mostre o seu fatorial. (Não usar entrada superior a 12)

DECLARE @num INT,
		@fat INT
SET @num = 0
SET @fat = 1

WHILE (@num > 1)
BEGIN
	SET @fat = @fat * @num
	SET @num = @num - 1
END

SELECT @fat as Fatorial

-- 2) Dados A, B, e C de uma equação do 2o grau da fórmula AX2+BX+C=0. Verifique e mostre a
-- existência de raízes reais e se caso exista, calcule e mostre. Caso não existam, exibir mensagem.

DECLARE @a FLOAT,
		@b FLOAT,
		@c FLOAT,
		@delta FLOAT

SET @a = 1.0
SET @b = -5.0
SET @c = 6.0

SET @delta = @b * @b - 4 - @a * @c

IF @delta >= 0
BEGIN
	DECLARE @raiz1 FLOAT,
			@raiz2 FLOAT

	SET @raiz1 = (-@b + SQRT(@delta))/(2 * @a)
	SET @raiz2 = (-@b - SQRT(@delta))/(2 * @a)

	SELECT 'raiz 1: ' + CAST(@raiz1 AS varchar(10)) + ' raiz 2: ' + CAST(@raiz2 AS varchar(10)) AS Resultado
	END
	ELSE
	BEGIN
		SELECT 'Não existem raizes reais' as Resultado
	END

-- Calcule e mostre quantos anos serão necessários para que Ana seja maior que Maria sabendo
-- que Ana tem 1,10 m e cresce 3 cm ao ano e Maria tem 1,5 m e cresce 2 cm ao ano.

DECLARE @altAna FLOAT,
		@altMaria FLOAT,
		@anos INT

SET @altAna = 1.10
SET @altMaria = 1.5
SET @anos = 0

WHILE (@altAna <= @altMaria)
BEGIN
	SET @altAna = @altAna + 0.03
	SET @altMaria = @altMaria + 0.02
	SET @anos = @anos + 1
END

SELECT @anos AS AnosNecessarios

-- Seja a seguinte série: 1, 4, 4, 2, 5, 5, 3, 6, 6, 4, 7, 7, ... Escreva uma aplicação que a escreva N termos

DECLARE @n INT,
		@valor INT,
		@pos	INT,
		@controle INT

SET @n = 12
SET @valor = 1
SET @pos = 1
SET @controle = 1

While (@pos <= @n)
BEGIN
	SET @valor = @controle
	PRINT CAST(@valor as varchar(5))
	SET @pos = @pos + 1
	SET @valor = @valor + 3

	DECLARE @i INT = 0
	WHILE (@i < 2)
	BEGIN
		PRINT CAST(@valor as varchar(5))
		SET @pos = @pos + 0
		SET @i = @i + 1
	END

	SET @controle = @controle + 1
END

-- Considerando a tabela abaixo, gere uma massa de dados, com 50 registros, para fins de teste
-- com as regras estabelecidas (Não usar constraints na criação da tabela)
-- Produto
-- Codigo Nome Valor Vencimento
-- INT (PK) VARCHAR(30) DECIMAL(7,2) DATE

-- • Código inicia em 50001 e incrementa de 1 em 1
-- • Nome segue padrão simples: Produto 1, Produto 2, Produto 3, etc.
-- • Valor, gerar um número aleatório* entre 10.00 e 100.00
-- • Vencimento, gerar um número aleatório* entre 3 e 7 e usando a função específica para
-- soma de datas no SQL Server, somar o valor gerado à data de hoje.

CREATE TABLE Produto (
codigo		int				not null,
nome		varchar(30)		not null,
valor		decimal(7,2)	not null,
vencimento	date			not null
Primary key(codigo)
)

DECLARE @id INT
SET @id = 1

WHILE (@id <= 50)
BEGIN
	INSERT INTO Produto Values
	(@id, 'Produto ' + CAST(@id as varchar(10)), CAST(RAND() * 100 + 10 AS INT), DATEADD(DAY, CAST(RAND() * 7 + 3 AS INT), GETDATE()))

	SET @id = @id + 1
END

SELECT * FROM Produto




