-- Criação da tabela Funcionario
CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,  -- Chave primária
    nome VARCHAR(255) NOT NULL,
    dataNascimento DATE NOT NULL,
    cargo VARCHAR(100) NOT NULL
);

CREATE INDEX idx_nome ON Funcionario(nome);

ALTER TABLE Funcionario
ADD sexo VARCHAR(1);

ALTER TABLE Funcionario
ADD sobrenome VARCHAR(100) NOT NULL;

ALTER TABLE Funcionario
ADD salario int NOT NULL;



--


INSERT INTO mydatabase.Funcionario
(idFuncionario, nome, dataNascimento, cargo)
VALUES(3, 'Tata', '1998-09-13', 'ESTAGIARIO');

UPDATE mydatabase.Funcionario
SET mydatabase.Funcionario.nome = 'Luã Govinda'
WHERE mydatabase.Funcionario.idFuncionario = 1

DELETE from mydatabase.Funcionario
WHERE mydatabase.Funcionario.idFuncionario = 2

-- Filtro

select * from mydatabase.Funcionario
where idFuncionario = 1


select * from mydatabase.Funcionario
where nome = 'Luã Govinda'

-- Ordenacao

select * from mydatabase.Funcionario
order by dataNascimento  asc



-- Criação da tabela Dependente
CREATE TABLE Dependente (
    idDependente INT PRIMARY KEY AUTO_INCREMENT,   -- Chave primária
    nome VARCHAR(255) NOT NULL,
    dataNascimento DATE NOT NULL,
    relacao VARCHAR(100) NOT NULL,                 -- Ex: Filho, Esposa, Pai, etc.
    idFuncionario INT,                             -- Chave estrangeira referenciando Funcionario
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario)
);


select * from mydatabase.Dependente

-- Join

select * from mydatabase.Funcionario
inner join mydatabase.Dependente
on mydatabase.Funcionario.idFuncionario = mydatabase.Dependente.idFuncionario 

-- Update 

UPDATE mydatabase.Funcionario
SET mydatabase.Funcionario.nome = 'Luã Govinda'
WHERE mydatabase.Funcionario.idFuncionario = 1

-- COUNT

select COUNT(*) from mydatabase.Funcionario

-- COUNT : Quantidade de funcionarios com dependentes 

select COUNT(*) from mydatabase.Funcionario
where EXISTS (
	SELECT * from mydatabase.Dependente 
	where mydatabase.Funcionario.idFuncionario = mydatabase.Dependente.idFuncionario) -- Subselect 
	
-- COUNT : Quantidade de funcionarios com dependentes : Exemplo ERRADO
	
select COUNT(*) from mydatabase.Funcionario
where EXISTS (
	SELECT * from mydatabase.Dependente 
	where mydatabase.Dependente.idFuncionario is not null) -- Subselect 
	
-- SUM

select SUM(salario) from mydatabase.Funcionario

	
-- AVG

select AVG(salario) from mydatabase.Funcionario

-- MAX

select MAX(salario) from mydatabase.Funcionario

SELECT nome, salario
FROM Funcionario
WHERE salario = (SELECT MAX(salario) FROM Funcionario);


-- MIN

select MIN(salario) from mydatabase.Funcionario

--

SELECT cargo, COUNT(*) as numero_de_funcionarios
FROM Funcionario
GROUP BY cargo;

--

SELECT cargo, AVG(salario) as numero_de_funcionarios
FROM Funcionario
GROUP BY cargo;

--

SELECT cargo, AVG(salario) as salario_medio
FROM Funcionario
GROUP BY cargo
HAVING salario_medio > 50;

-- VIEW

CREATE VIEW View_SalarioMedioPorCargo AS
SELECT cargo, AVG(salario) as salario_medio
FROM Funcionario
GROUP BY cargo
HAVING salario_medio > 50;

SELECT * FROM View_SalarioMedioPorCargo;



