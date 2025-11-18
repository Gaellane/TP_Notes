CREATE DATABASE c_note;

\c c_note;

CREATE TABLE etudiant (
    id SERIAL PRIMARY KEY ,
    etu VARCHAR(10) UNIQUE,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50),
    adresse VARCHAR(50),
);

CREATE TABLE filiere (
    id SERIAL PRIMARY KEY ,
    libelle VARCHAR(50)
);

CREATE TABLE classe(
    id SERIAL PRIMARY KEY ,
    libelle VARCHAR(50)
);

CREATE TABLE semestre(
    id SERIAL PRIMARY KEY ,
    libelle VARCHAR(50),
    id_classe INTEGER REFERENCES classe(id);
);

CREATE TABLE filiere_classe(
    id SERIAL PRIMARY KEY,
    id_classe INTEGER REFERENCES semestre(id),
    id_filiere INTEGER REFERENCES filiere(id)
);

CREATE TABLE _session (
    id SERIAL PRIMARY KEY,
    mois INTEGER NOT NULL ,
    annee INTEGER NOT NULL
);


CREATE TABLE annee_universitaire(
    id SERIAL PRIMARY KEY,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL
);

CREATE TABLE inscription(
    id SERIAL PRIMARY KEY,
    id_etudiant INTEGER NOT NULL REFERENCES etudiant(id),
    id_annee_univeritaire INTEGER NOT NULL REFERENCES annee_universitaire(id),
    id_filiere_classe INTEGER NOT NULL REFERENCES filiere_classe(id),
    date_inscription DATE NOT NULL
);

CREATE TABLE matiere (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(50),
    identif VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE bloc_matiere ( 
    id SERIAL PRIMARY KEY ,
    id_filiere_classe INTEGER NOT NULL REFERENCES filiere_classe(id),
    credit INTEGER NOT NULL

)


CREATE TABLE matiere_filiere (
    id SERIAL PRIMARY KEY,
    id_bloc_matiere INTEGER NOT NULL REFERENCES bloc_matiere(id),
    id_matiere INTEGER NOT NULL REFERENCES matiere(id)
);

CREATE TABLE avancement (
    id SERIAL PRIMARY KEY ,
    id_etudiant INTEGER NOT NULL REFERENCES etudiant
    id_semestre INTEGER NOT NULL REFERENCES semestre(id),
    id_session INTEGER NOT NULL REFERENCES _session(id)
);

CREATE TABLE note(
    id SERIAL PRIMARY KEY ,
    id_inscription INTEGER NOT NULL REFERENCES inscription(id),
    id_matiere_filiere INTEGER NOT NULL REFERENCES matiere_filiere(id),
    note NUMERIC(4,2),
    session_examen DATE NOT NULL,
    date_entree DATE NOT NULL
);

