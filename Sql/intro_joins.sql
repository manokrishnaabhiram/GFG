DROP DATABASE IF EXISTS users;
CREATE DATABASE users;

CREATE TABLE IF NOT EXISTS users.users_2021 (UserID INT PRIMARY KEY, Name VARCHAR(50));
CREATE TABLE IF NOT EXISTS users.users_2022 (UserID INT PRIMARY KEY, Name VARCHAR(50));
CREATE TABLE IF NOT EXISTS users.users_2023 (UserID INT PRIMARY KEY, Name VARCHAR(50));

INSERT INTO users.users_2021 (UserID, Name) VALUES (1, 'Ashish'), (2, 'Laura'), (7, 'Prakash');
INSERT INTO users.users_2022 (UserID, Name) VALUES (1, 'Ashish'), (2, 'Laura'), (3, 'Charlie'), (4, 'Grace');
INSERT INTO users.users_2023 (UserID, Name) VALUES (1, 'Ashish'), (2, 'Laura'), (3, 'Charlie'), (4, 'Grace'), (5, 'Henry');

SELECT * FROM users.users_2021;
SELECT * FROM users.users_2022;
SELECT * FROM users.users_2023;

use users;

-- INNER JOIN
select * from users_2021 as t_2021
inner join users_2022 as t_2022
on t_2022.userid = t_2021.userid;

-- LEFT JOIN
select * from users_2021 as t_2021
LEFT join users_2022 as t_2022
on t_2022.userid = t_2021.userid;

-- RIGHT JOIN
select * from users_2021 as t_2021
RIGHT join users_2022 as t_2022
on t_2022.userid = t_2021.userid;


SELECT * FROM USERS.USERS_2021;

SELECT * FROM GFGDA3.CUSTOMER  AS CUSTOMER_1
RIGHT JOIN USERS.USERS_2021 AS USERS
ON CUSTOMER_1.CUSTOMER_ID = USERS.USERID;
 
SELECT * FROM (SELECT * FROM GFGDA3.CUSTOMER  AS CUSTOMER_1
RIGHT JOIN USERS.USERS_2021 AS USERS
ON CUSTOMER_1.CUSTOMER_ID = USERS.USERID) AS AA1;

