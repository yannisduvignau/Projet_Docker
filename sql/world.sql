CREATE TABLE CD (
  id int NOT NULL PRIMARY KEY,
  titre varchar(50) NOT NULL,
  genre varchar(50) NOT NULL,
  artiste varchar(50) NOT NULL,
  prixUnitaire decimal(65,2) NOT NULL,
  image varchar(100) NOT NULL
);

INSERT INTO CD (id, titre, genre, artiste, prixUnitaire, image) VALUES
(1, 'Ultra', 'Rap', 'Booba', 9.99, 'images/pochette1.jpg'),
(2, 'Monument', 'Rap', 'Alkpote', 10.99, 'images/pochette2.jpg'),
(3, 'Arretez-le', 'Rap', '1plike140', 11.99, 'images/pochette3.jpg'),
(4, 'DRILL FR', 'Rap', 'Gazo', 18.99, 'images/pochette4.jpg'),
(5, 'Platinium', 'Rap', 'PLK', 26.99, 'images/pochette5.jpg'),
(6, 'Cicatrices', 'Rap', 'Zola', 16.99, 'images/pochette6.jpg'),
(7, 'Illmatic', 'Rap', 'Nas', 4.99, 'images/pochette7.jpg'),
(8, 'The R.E.D. Album', 'Rap', 'Game', 8.99, 'images/pochette8.jpg'),
(9, 'Le Monde Chico', 'Rap', 'PNL', 4.99, 'images/pochette9.jpg'),
(10, 'Trinity', 'Rap', 'Laylow', 9.99, 'images/pochette10.jpg'),
(11, 'Mental', 'Rap', 'PLK', 11.99, 'images/pochette11.jpg'),
(12, 'Feu (réédition)', 'Rap', 'Nekfeu', 49.99, 'images/pochette12.jpg'),
(13, 'J.O.$ | Chronique', 'Rap', 'Josman', 46.99, 'images/pochette13.jpg'),
(14, 'Memoria', 'Rap', 'Jazzy Bazz', 12.99, 'images/pochette14.png'),
(15, 'Masque Blanc', 'Rap', 'S.Pri Noir', 9.99, 'images/pochette15.jpg');

CREATE TABLE Utilisateur (
  id int NOT NULL PRIMARY KEY,
  nom varchar(50) NOT NULL,
  pseudo varchar(50) NOT NULL,
  pwd varchar(100) NOT NULL,
  booladmin int NOT NULL
);

INSERT INTO Utilisateur (id, nom, pseudo, pwd, booladmin) VALUES
(1, 'Doe', 'John_Doe', 'booba', 1);