CREATE DATABASE supportops;
USE supportops;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE issues (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    module VARCHAR(100),
    description TEXT,
    status VARCHAR(20) DEFAULT 'open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE logins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    status VARCHAR(20),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO users (username, password) VALUES ('admin', 'admin123');

select * from users;

SELECT * FROM issues;

select * from logins;

ALTER TABLE issues ADD COLUMN closed_at TIMESTAMP NULL DEFAULT NULL;

insert into users values(2,'admin2','admin1212');

CREATE TABLE IF NOT EXISTS knowledge_articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    issue_id INT,
    author VARCHAR(100),
    title VARCHAR(255),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(issue_id) REFERENCES issues(id)
    );
    
    
    select * from knowledge_articles;
