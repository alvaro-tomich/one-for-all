DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_plano VARCHAR(20),
  valor_plano FLOAT
);

INSERT INTO plano (nome_plano, valor_plano)
VALUES
       ('gratuito', 0),                         
       ('familiar', 7.99),
       ('universitário', 5.99),
       ('pessoal', 6.99);

CREATE TABLE usuario(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_usuario VARCHAR(20),
  idade TINYINT,
  plano INT,
  data_assinatura DATE,
  FOREIGN KEY (plano) REFERENCES plano(plano_id)
);

INSERT INTO usuario (nome_usuario, idade, plano, data_assinatura)
VALUES ('Thati', 23, 1, '2019-10-20'),
       ('Cintia', 35, 2, '2017-12-30'),
       ('Bill', 20, 3, '2019-06-05'),
       ('Roger', 45, 4, '2020-05-13'),
       ('Norman', 58, 4, '2017-02-17'),
       ('Patrick', 33, 2, '2017-01-06'),
       ('Vivian', 26, 3, '2018-01-05'),
       ('Carol', 19, 3, '2018-02-14'),
       ('Angelina', 42, 2, '2018-04-29'),
       ('Paul', 46, 2, '2017-01-17');

       
CREATE TABLE artista(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_artista VARCHAR(20)
);

INSERT INTO artista (nome_artista)
VALUES ('Walter Phoenix'),
       ('Peter Strong'),
       ('Lance Day'),
       ('Freedie Shannon'),
       ('Tyler Isle'),
       ('Fog');

CREATE TABLE album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(20),
  artista INT,
  ano_lancamento YEAR,
  FOREIGN KEY (artista) REFERENCES artista(artista_id)
);

INSERT INTO album (nome_album, artista, ano_lancamento)
VALUES ('Envious', 1, 1990),
       ('Exuberant', 1, 1993),
	   ('Hallowed Steam', 2, 1995),
       ('Incadescent', 3, 1998),
       ('Temporary Culture', 4, 2001),
       ('Library of liberty', 4, 2003),
       ('Chained Down', 5, 2007),
       ('Cabinet of fools', 5, 2012),
       ('No guarantees', 5, 2015),
       ('Apparatus', 6, 2015);
       
CREATE TABLE musicas(
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_musica VARCHAR(40),
  album INT,
  artista INT,
  duracao_segundos INT,
  FOREIGN KEY (album) REFERENCES album(album_id),
  FOREIGN KEY (artista) REFERENCES artista(artista_id)
);  

INSERT INTO musicas (nome_musica, album, artista, duracao_segundos)
VALUES ('Soul For Us', 1, 1, 200),
	   ('Reflections Of Magic', 1, 1, 163),
       ('Dance With Her Own', 1, 1, 116),
       ('Troubles Of My Inner Fire', 2, 1, 203),
       ('Time Fireworks', 2, 1, 152),
       ('Magic Circus', 3, 2, 105),
       ('Honey, So Do I', 3, 2, 207),
       ("Sweetie, Let's Go Wild", 3, 2, 139),
       ('She Knows', 3, 2, 244),
       ('Fantasy For Me', 4, 3, 100),
       ('Celebration Of More', 4, 3, 146),
       ('Rock His Everything', 4, 3, 223),
       ('Home Forever', 4, 3, 231),
       ('Diamond Power', 4, 3, 241),
       ("Let's Be Silly", 4, 3, 132),
       ('Thang of Thunder', 5, 4, 240),
       ('Words Of Her Lie', 5, 4, 185),
       ('Without My Streets', 5, 4, 176),
       ('Need Of The Evening', 6, 4, 190),
       ('History Of My Roses', 6, 4, 222),
       ('Without My Love', 6, 4, 111),
       ('Walking And Game', 6, 4, 123),
       ('Young And Father', 6, 4, 197),
       ('Finding My Traditions', 7, 5, 179),
       ('Walking And Man', 7, 5, 229),
       ('Hard And Time', 7, 5, 135),
       ("Honey, I'm A Lone Wolf", 7, 5, 150),
       ("She Thinks I Won't Stay Tonight", 8, 5, 166),
       ("He heard You're Bad For Me", 8, 5, 154),
       ("He Hopes We Can't Stay", 8, 5, 210),
       ('I Know I Know', 8, 5, 117),
       ("He's Walking Away", 9, 5, 159),
       ("He's Trouble", 9, 5, 138),
       ('I Heard I Want To Be Alone', 9, 5, 120),
       ('I Ride Alone', 9, 5, 151),
       ('Honey', 10, 6, 79),
       ('You Cheated Me', 10, 6, 95),
       ("Wouldn't It Be Nice", 10, 6, 213),
       ('Baby', 10, 6, 136),
       ('You Make Me Feel So', 10, 6, 83);
       
CREATE TABLE seguidores(
  artista_id INT,
  nome_artista VARCHAR(40),
  seguidor INT,
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
  FOREIGN KEY (seguidor) REFERENCES usuario(usuario_id),
  CONSTRAINT PRIMARY KEY(artista_id, seguidor)
);

INSERT INTO seguidores (artista_id, nome_artista, seguidor)
VALUES (1, 'Walter Phoenix', 1),
       (1, 'Walter Phoenix', 2),
       (1, 'Walter Phoenix', 3),
       (1, 'Walter Phoenix', 6),
       (1, 'Walter Phoenix', 8),
       (2, 'Peter Strong', 3),
       (2, 'Peter Strong', 7),
       (2, 'Peter Strong', 10),
       (3, 'Lance Day', 1),
       (3, 'Lance Day', 2),
       (3, 'Lance Day', 6),
       (3, 'Lance Day', 9),
       (4, 'Freedie Shannon', 1),
       (4, 'Freedie Shannon', 4),
       (4, 'Freedie Shannon', 9),
       (5, 'Tyler Isle', 5),
       (5, 'Tyler Isle', 7),
       (5, 'Tyler Isle', 8),
       (6, 'Fog', 5),
       (6, 'Fog', 6),
       (6, 'Fog', 9),
       (6, 'Fog', 10);
       
CREATE TABLE historico_reproducao(
  usuario INT,
  nome_usuario VARCHAR(40),
  musica INT,
  data_reproducao DATE,
  hora_reproducao TIME,
  FOREIGN KEY (usuario) REFERENCES usuario(usuario_id),
  FOREIGN KEY (musica) REFERENCES musicas(musica_id),
  CONSTRAINT PRIMARY KEY(usuario, musica)
);

INSERT INTO historico_reproducao (usuario, nome_usuario, musica, data_reproducao, hora_reproducao)
VALUES (1, 'Thati',  36, '2020-02-28', '10:45:55'),
       (1, 'Thati', 25, '2020-05-02', '05:30:35'),
       (1, 'Thati', 23, '2020-03-06', '11:22:33'),
       (1, 'Thati', 14, '2020-08-05', '08:05:17'),
       (1, 'Thati', 15, '2020-09-14', '16:32:22'),
       (2, 'Cintia', 34, '2020-01-02', '07:40:33'),
       (2, 'Cintia', 24, '2020-05-16', '06:16:22'),
       (2, 'Cintia', 21, '2020-10-09', '12:27:48'),
       (2, 'Cintia', 39, '2020-09-21', '13:14:46'),
       (3, 'Bill', 6, '2020-11-13', '16:55:13'),
       (3, 'Bill', 3, '2020-12-05', '18:38:30'),
       (3, 'Bill', 26, '2020-07-30', '10:00:00'),
       (4, 'Roger', 2, '2021-08-15', '17:10:10'),
       (4, 'Roger', 35, '2021-07-10', '15:20:30'),
       (4, 'Roger', 27, '2021-01-09', '01:44:33'),
       (5, 'Norman', 7, '2020-07-03', '19:33:28'),
       (5, 'Norman', 12, '2017-02-24', '21:14:22'),
       (5, 'Norman', 14, '2020-08-06', '15:23:43'),
       (5, 'Norman', 1, '2020-11-10', '13:52:27'),
       (6, 'Patrick', 38, '2019-02-07', '20:33:48'),
       (6, 'Patrick', 29, '2017-01-24', '00:31:17'),
       (6, 'Patrick', 30, '2017-10-12', '12:35:20'),
       (6, 'Patrick', 22, '2018-05-29', '14:56:41'),
       (7, 'Vivian', 5, '2018-05-09', '22:30:49'),
       (7, 'Vivian', 4, '2020-07-27', '12:52:58'),
       (7, 'Vivian', 11, '2018-01-16', '18:40:43'),
       (8, 'Carol', 39, '2018-03-21', '16:56:40'),
       (8, 'Carol', 40, '2020-10-18', '13:38:05'),
       (8, 'Carol', 32, '2019-05-25', '08:14:03'),
       (8, 'Carol', 33, '2021-08-15', '21:37:09'),
       (9, 'Angelina', 16, '2021-05-24', '17:23:45'),
       (9, 'Angelina', 17, '2018-12-07', '22:48:52'),
       (9, 'Angelina', 8, '2021-03-14', '06:14:26'),
       (9, 'Angelina', 9, '2020-04-01', '03:36:00'),
       (10, 'Paul', 20, '2017-02-06', '08:21:34'),
       (10, 'Paul', 21, '2017-12-14', '05:33:46'),
       (10, 'Paul', 12, '2017-07-27', '05:24:49'),
       (10, 'Paul', 13, '2017-12-25', '01:03:57');
