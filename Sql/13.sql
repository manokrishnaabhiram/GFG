SELECT * FROM users.users_2021;
SELECT * FROM users.users_2022;
SELECT * FROM users.users_2023;

SELECT * FROM users.users_2021 union SELECT * FROM users.users_2022;
SELECT * FROM users.users_2021 union all SELECT * FROM users.users_2022;
SELECT * FROM users.users_2022 except SELECT * FROM users.users_2021; -- WHY IT IS SHOWING ERROR AND IT IS EXECUTING

SELECT * FROM users.users_2021 union SELECT * FROM users.users_2023;
SELECT * FROM users.users_2021 union all SELECT * FROM users.users_2022
;