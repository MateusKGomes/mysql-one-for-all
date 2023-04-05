-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.artistas(
     artista_id INT PRIMARY KEY auto_increment,
     artista VARCHAR(75) NOT NULL
) engine = InnoDB;

 CREATE TABLE SpotifyClone.planos(
    plano_id INT PRIMARY KEY auto_increment,
    plano VARCHAR(45) NOT NULL,
    valor_plano DECIMAL(3,2)
) engine = InnoDB;

 CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT PRIMARY KEY auto_increment,
    usuario VARCHAR(255) NOT NULL,
    data_assinatura DATE,
    idade INT,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
) engine = InnoDB;

 CREATE TABLE SpotifyClone.albuns(
    album_id INT PRIMARY KEY auto_increment,
    album VARCHAR(75) NOT NULL,
    artista_id INT NOT NULL,
    ano_lancamento YEAR,
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

 CREATE TABLE SpotifyClone.cancoes(
    cancao_id INT PRIMARY KEY auto_increment,
    cancao VARCHAR(75) NOT NULL,
    album_id INT NOT NULL,
    duracao_segundos INT,
    FOREIGN KEY (album_id) REFERENCES albuns (album_id)
) engine = InnoDB;

 CREATE TABLE SpotifyClone.seguindo_artistas(
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

 CREATE TABLE SpotifyClone.historico_de_reproducoes(
    usuario_id INT NOT NULL,
    cancao_id INT,
    data_reproducao DATETIME,
    CONSTRAINT PRIMARY KEY (usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
) engine = InnoDB;


INSERT INTO SpotifyClone.planos (plano, valor_plano)
VALUES
('Gratuito', '0.00'),
('Familiar', '7.99'),
('Universitario', '5.99'),
('Pessoal', '6.99');

INSERT INTO SpotifyClone.artistas (artista)
VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');


INSERT INTO SpotifyClone.usuarios (usuario, idade, data_assinatura, plano_id)
VALUES
('Barbara Liskov', 82, '2019-10-20', 1),
('Robert Cecil Martin', 58, '2017-01-06', 1),
('Ada Lovelace', 37, '2017-12-30', 2),
('Martin Fowler', 46, '2017-01-17', 2),
('Sandi Metz', 58, '2018-04-29', 2),
('Paulo Freire', 19, '2018-02-14', 3),
('Bell Hooks', 26, '2018-01-05', 3),
('Christopher Alexander', 85, '2019-06-05', 4),
('Judith Butler', 45, '2020-05-13', 4),
('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO SpotifyClone.albuns (album, artista_id, ano_lancamento)
VALUES
('Renaissance', 1 , '2022'),
('Jazz', 2, '1978'),
('Hot Space', 2, '1982'),
('Falso Brilhante', 3, '1998'),
('Vento de Maio', 3, '2001'),
('QVVJFA?', 4, '2003'),
('Somewhere Far Beyond', 5, '2007'),
('I Put A Spell On You', 6, '2012');

INSERT INTO SpotifyClone.cancoes (cancao, album_id, duracao_segundos)
VALUES
("BREAK MY SOUL", 1 , 279),
("VIRGO'S GROOVE", 1, 369),
("ALIEN SUPERSTAR", 1, 116),
("Don't Stop Me Now", 2, 203),
("Under Pressure", 3, 152),
("Como Nossos Pais?", 4, 105),
("O Medo de Amar é o Medo de Ser Livre", 5, 207),
("Samba em Paris", 6, 267),
("The Bard's Song", 7, 244),
("Feeling Good", 8, 100);

INSERT INTO SpotifyClone.seguindo_artistas (usuario_id, artista_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 1),
(7, 6),
(9, 3),
(10, 2);

INSERT INTO SpotifyClone.historico_de_reproducoes (usuario_id, cancao_id, data_reproducao)
VALUES
(1, 8, '2022-02-28 10:45:55'),
(1, 2, '2020-05-02 05:30:35'),
(1, 10, '2020-03-06 11:22:33'),
(2, 10, '2022-08-05 08:05:17'),
(2, 7, '2020-01-02 07:40:33'),
(3, 10, '2020-11-13 16:55:13'),
(3, 2, '2020-12-05 18:38:30'),
(4, 8, '2021-08-15 17:10:10'),
(5, 8, '2022-01-09 01:44:33'),
(5, 5, '2020-08-06 15:23:43'),
(6, 7, '2017-01-24 00:31:17'),
(6, 5, '2017-10-12 12:35:20'),
(7, 4, '2011-12-15 22:30:49'),
(8, 4, '2012-03-17 14:56:41'),
(9, 9, '2022-02-24 21:14:22'),
(10, 3, '2015-12-13 08:30:22');
