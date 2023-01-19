/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Agumon','2020-02-03',0,true,10.23);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Gabumon','2018-11-15',2,true,8.0);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Pikachu','2021-01-07',1,false,15.04);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Devimon','2020-05-12',5,true,11.0);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Charmander','2020-02-8',0,false,-11.0);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Plantmon','2021-11-15',2,true,-5.7);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Squirtle','1993-04-02',3,false,-12.13);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Angemon','2005-06-12',1,true,-45.0);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Boarmon','2005-06-07',7,true,20.4);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Blossom','1998-10-13',3,true,17.0);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Ditto','2022-05-14',4,true,22.0);


INSERT INTO owners (full_name,age) VALUES ('Sam Smith',34);
INSERT INTO owners (full_name,age) VALUES ('Jennifer Orwell',19);
INSERT INTO owners (full_name,age) VALUES ('Bob',45);
INSERT INTO owners (full_name,age) VALUES ('Melody Pond',77);
INSERT INTO owners (full_name,age) VALUES ('Dean Winchester',14);
INSERT INTO owners (full_name,age) VALUES ('Jodie Whittaker',38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = 2  WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1  WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';



INSERT INTO vets (name,age,date_of_graduation) VALUES ('William Tatcher',45,'2000-04-23');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Maisy Smith',26,'2019-01-17');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Stephanie Mendez',64,'1981-5-04');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Jack Harkness',38,'2008-6-08');

INSERT INTO specializations (vets_id,species_id) VALUES (1,1);
INSERT INTO specializations (vets_id,species_id) VALUES (3,1);
INSERT INTO specializations (vets_id,species_id) VALUES (3,2);
INSERT INTO specializations (vets_id,species_id) VALUES (4,2);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Agumon'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'2020-5-24'
);


INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Agumon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'2020-7-22'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Gabumon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'2021-02-02'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2020-01-05'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2020-03-08'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2020-05-14'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Devimon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'2021-05-04'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Charmander'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'2021-02-24'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2019-12-21'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'2020-08-10'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2021-04-07'
);


INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Squirtle'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'2019-09-29'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'2020-10-03'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'2020-11-04'
);


INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2019-01-24'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2019-05-15'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2020-02-27'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'2020-08-03'
);


INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Blossom'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'2020-05-24'
);

INSERT INTO visits (animals_id,vets_id,date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Blossom'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'2021-01-11'
);