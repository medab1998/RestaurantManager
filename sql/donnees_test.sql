-- À exécuter APRÈS le premier démarrage de l'application (les tables sont créées par Hibernate)
USE restaurant_db;

INSERT INTO plat (nom, categorie, description, prix, disponible) VALUES
('Salade Méchouia', 'Entrée', 'Poivrons et tomates grillés, thon, œuf, huile d''olive', 8.500, 1),
('Brik à l''œuf', 'Entrée', 'Feuille de malsouka croustillante, thon, câpres, œuf', 5.000, 1),
('Couscous à l''agneau', 'Plat', 'Semoule fine, légumes de saison, viande d''agneau', 22.000, 1),
('Ojja Merguez', 'Plat', 'Tomates épicées, merguez et œufs', 16.500, 1),
('Spaghetti aux fruits de mer', 'Plat', 'Crevettes, calamars, sauce tomate maison', 24.000, 1),
('Assidet Zgougou', 'Dessert', 'Crème de pin d''Alep, noisettes et amandes', 7.000, 1),
('Thé à la menthe et pignons', 'Boisson', 'Thé vert servi avec pignons de pin', 3.500, 1);

INSERT INTO client (nom, prenom, telephone, email, adresse) VALUES
('Ben Salah', 'Amine', '98 123 456', 'amine.bensalah@email.tn', 'Gabès Centre'),
('Trabelsi', 'Sarra', '55 987 654', 'sarra.trabelsi@email.tn', 'Tunis, Lac 2'),
('Gharbi', 'Yassine', '22 456 789', 'yassine.gharbi@email.tn', 'Sfax');
