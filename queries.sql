/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = ' ';
COMMIT;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_with_date;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO delete_with_date;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT MAX(escape_attempts) FROM animals WHERE neutered = true OR neutered = false;
SELECT MIN(weight_kg),MAX(weight_kg) FROM animals;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';


SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT * FROM animals RIGHT OUTER JOIN owners ON animals.owner_id = owners.id;
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;


SELECT COUNT(owners.full_name) AS num, owners.full_name
FROM animals 
INNER JOIN owners 
 ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY num DESC LIMIT 1;


-- join table for visits queries

SELECT animals.name FROM animals JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'William Tatcher' 
ORDER BY visits.date DESC LIMIT 1;


SELECT COUNT(animals.name) FROM animals JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez'; 


SELECT * FROM vets LEFT JOIN specializations ON specializations.vets_id = vets.id 
LEFT JOIN species ON species.id = specializations.species_id; 


SELECT * FROM animals JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' AND
visits.date BETWEEN '2020-5-1' AND '2020-8-30'; 



SELECT COUNT(animals.name) AS num, animals.name
FROM animals 
INNER JOIN visits 
ON visits.animals_id = animals.id
INNER JOIN vets ON visits.vets_id = vets.id
GROUP BY animals.name
ORDER BY num  LIMIT 1;


SELECT animals.name,visits.date FROM animals JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' 
GROUP BY animals.name, visits.date
ORDER BY visits.date ASC LIMIT 1;


SELECT * FROM animals JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON vets.id = visits.vets_id 
ORDER BY visits.date DESC LIMIT 1;



SELECT COUNT(vets.name) FROM visits
INNER JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = (SELECT vets.name
FROM  specializations
RIGHT JOIN vets ON specializations.vets_id = vets.id
WHERE specializations.species_id is NULL);



SELECT species.name FROM species
JOIN animals ON animals.species_id = species.id
JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(species.name) DESC LIMIT 1;





