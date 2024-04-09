CREATE TABLE editora (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255)
);

INSERT INTO editora (nome) VALUES ('editora 1');

CREATE TABLE livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    editora_id INT,
    foto VARCHAR(255),
    FOREIGN KEY (editora_id) REFERENCES editora(id)
);

INSERT INTO livro (titulo, autor, editora_id, foto) VALUES ('livro 1','edigar',1,'');
INSERT INTO livro (titulo, autor, editora_id, foto) VALUES ('livro 2','esteven',1,'');

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    senha VARCHAR(50),
    isAdmin BOOLEAN
);

INSERT INTO usuario (username,senha,isadmin) VALUES ('allan','123',true);
