-- 4. SQL

CREATE DATABASE Company
GO

USE Company


CREATE TABLE positions ( 
	id      INTEGER ,
	name_   VARCHAR(50) ,
	salary  INTEGER ,
	PRIMARY KEY (id));

CREATE TABLE contracts ( 
	id             INTEGER ,
	name_          VARCHAR(50) ,
	tax_percentage INT ,
	PRIMARY KEY (id));

CREATE TABLE employees ( 
	id           INTEGER ,
	name_        VARCHAR(50)  NOT NULL ,
	contract_id  INTEGER ,
	position_id  INTEGER ,
	PRIMARY KEY (id),
	CONSTRAINT emp_contract_id FOREIGN KEY (contract_id) REFERENCES contracts(id),
	CONSTRAINT emp_position_id FOREIGN KEY (position_id) REFERENCES positions(id));


-- Заполнение таблицы positions
INSERT INTO positions (id, name_, salary) VALUES
(1, 'Менеджер', 45000),
(2, 'Разработчик', 60000),
(3, 'Дизайнер', 30000),
(4, 'Аналитик', 48000);

-- Заполнение таблицы contracts
INSERT INTO contracts (id, name_, tax_percentage) VALUES
(1, 'Трудовой договор', 13),
(2, 'ИП', 6),
(3, 'Самозанятый', 4);

-- Заполнение таблицы employees
INSERT INTO employees (id, name_, contract_id, position_id) VALUES
(1, 'Иванов Иван', 1, 1),
(2, 'Петров Петр', 2, 2),
(3, 'Сидоров Сидор', 1, 3),
(4, 'Кузнецов Алексей', 1, 4),
(5, 'Смирнова Анна', 3, 1);


/* Запрос, формирующий отчет, в котором для каждого сотрудника указано количество денежных средств, 
   которые нужно заплатить в качестве налогов за сотрудника. В отчете только те сотрудники, 
   чья ставка меньше 50000 рублей. */
SELECT 
    e.name_ AS employee_name,
    p.salary AS salary,
    c.tax_percentage,
    (p.salary * c.tax_percentage / 100) AS tax_amount
FROM 
    employees e
JOIN 
    positions p ON e.position_id = p.id
JOIN 
    contracts c ON e.contract_id = c.id
WHERE 
    p.salary < 50000;


/*
select * from employees;
select * from positions;
select * from contracts;
*/