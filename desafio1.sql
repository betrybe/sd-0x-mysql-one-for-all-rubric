CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE Available_Plans (
plan_id INT PRIMARY KEY auto_increment,
plan_name VARCHAR(50),
plan_value DOUBLE
) engine=InnoDB;

INSERT INTO 
Available_Plans (plan_name, plan_value)
VALUES
('familiar', 7.99),
('gratuito', 0),
('universitário', 5.99);

CREATE TABLE User (
user_id INT PRIMARY KEY auto_increment,
user_name VARCHAR(130), 
user_age INT NOT NULL,
plan_id INT NOT NULL,
FOREIGN KEY (plan_id) REFERENCES Available_Plans (plan_id)
);

INSERT INTO 
User (user_name, user_age, plan_id)
VALUES
('Thati', (YEAR(NOW()) - 1998), 2),
('Cintia', (YEAR(NOW()) - 1986), 1),
('Bill', (YEAR(NOW()) - 2001), 3),
('Roger', (YEAR(NOW()) - 1976), 2);

CREATE TABLE Musicians (
musician_id INT PRIMARY KEY auto_increment,
musician_name VARCHAR(130)
);

INSERT INTO
Musicians (musician_name)
VALUES
('Freedie Shannon'),
('Lance Day'),
('Peter Strong'),
('Walter Phoenix');

CREATE TABLE Albums (
album_id INT PRIMARY KEY auto_increment,
album_name VARCHAR(130),
musician_id INT NOT NULL,
FOREIGN KEY (musician_id) REFERENCES Musicians (musician_id)
);

INSERT INTO
Albums (album_name, musician_id)
VALUES
('Envious', 4),
('Exuberant', 4),
('Hallowed Steam', 3),
('Incandescent', 2),
('Temporary Culture', 1);

CREATE TABLE Songs (
song_id INT PRIMARY KEY auto_increment,
song_name VARCHAR(130),
album_id INT NOT NULL,
musician_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES Albums (album_id),
FOREIGN KEY (musician_id) REFERENCES Musicians (musician_id)
);

INSERT INTO
Songs (song_name, album_id, musician_id)
VALUES
('Soul For Us', 1, 4),
('Reflections Of Magic', 1, 4),
('Dance With Her Own', 1, 4),
('Troubles Of My Inner Fire', 2, 4),
('Time Fireworks', 2, 4),
('Magic Circus', 3, 3),
('Honey, So Do I', 3, 3),
("Sweetie, Let's Go Wild", 3, 3),
('She Knows', 3, 3),
('Fantasy For Me', 4, 2),
('Celebration Of More', 4, 2),
('Rock His Everything', 4, 2),
('Home Forever', 4, 2),
('Diamond Power', 4, 2),
("Honey, Let's Be Silly", 4, 2),
('Thang Of Thunder', 5, 1),
('Words Of Her Life', 5, 1),
('Without My Streets', 5, 1);

CREATE TABLE Following_Musicians (
user_id INT NOT NULL,
musician_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES User (user_id),
FOREIGN KEY (musician_id) REFERENCES Musicians (musician_id),
PRIMARY KEY (user_id, musician_id)
);

INSERT INTO
Following_Musicians (user_id, musician_id)
VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 2),
(2, 4),
(3, 3),
(3, 4),
(4, 1);

CREATE TABLE Reproduction_History (
user_id INT NOT NULL,
song_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES User (user_id),
FOREIGN KEY (song_id) REFERENCES Songs (song_id),
PRIMARY KEY (user_id, song_id)
);

INSERT INTO
Reproduction_History (user_id, song_id)
VALUES
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);
