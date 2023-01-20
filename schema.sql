/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD species VARCHAR(100)

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);


ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT, ADD CONSTRAINT species_fk FOREIGN KEY (species_id)  REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT, ADD CONSTRAINT owner_fk FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    species_id INT REFERENCES species (id) ON DELETE CASCADE,
    vets_id INT REFERENCES vets (id) ON DELETE CASCADE,
    PRIMARY KEY(species_id,vets_id)
);

CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    animals_id INT REFERENCES animals (id) ON DELETE CASCADE,
    vets_id INT REFERENCES vets (id) ON DELETE CASCADE,
    date DATE NOT NULL,
    PRIMARY KEY(id)
);