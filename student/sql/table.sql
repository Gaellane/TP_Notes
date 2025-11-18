USE notes;

-- etudiant
CREATE TABLE etudiant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    etu VARCHAR(10) UNIQUE,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50),
    adresse VARCHAR(50)
);

-- Filiere
CREATE TABLE filiere (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(50)
);

-- Classe
CREATE TABLE classe(
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(50)
);

-- Option
CREATE TABLE _option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(50),
    id_filiere INT,
    FOREIGN KEY (id_filiere) REFERENCES filiere(id)
);

-- Semestre
CREATE TABLE semestre(
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(50),
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES classe(id)
);

-- Filiere-Classe
CREATE TABLE filiere_classe(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_classe INT,
    id_filiere INT,
    FOREIGN KEY (id_classe) REFERENCES classe(id),
    FOREIGN KEY (id_filiere) REFERENCES filiere(id)
);

-- Session
CREATE TABLE _session (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mois INT NOT NULL,
    annee INT NOT NULL
);

-- Annee universitaire
CREATE TABLE annee_universitaire(
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL
);

-- Inscription
CREATE TABLE inscription(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_etudiant INT NOT NULL,
    id_annee_univeritaire INT NOT NULL,
    id_filiere_classe INT NOT NULL,
    date_inscription DATE NOT NULL,
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id),
    FOREIGN KEY (id_annee_univeritaire) REFERENCES annee_universitaire(id),
    FOREIGN KEY (id_filiere_classe) REFERENCES filiere_classe(id)
);

-- Matiere
CREATE TABLE matiere (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(50),
    code VARCHAR(10) UNIQUE NOT NULL
);

-- Matiere par bloc
CREATE TABLE matiere_bloc ( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    credit INT NOT NULL,
    id_filiere_classe INT NOT NULL,
    id_option INT NOT NULL,
    FOREIGN KEY (id_filiere_classe) REFERENCES filiere_classe(id),
    FOREIGN KEY (id_option) REFERENCES _option(id)
);

-- Liste matiere par filiere
CREATE TABLE matiere_filiere (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_bloc_matiere INT NOT NULL,
    id_matiere INT NOT NULL,
    FOREIGN KEY (id_bloc_matiere) REFERENCES matiere_bloc(id),
    FOREIGN KEY (id_matiere) REFERENCES matiere(id)
);

-- Avancement
CREATE TABLE avancement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_etudiant INT NOT NULL,
    id_semestre INT NOT NULL,
    id_session INT NOT NULL,
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id),
    FOREIGN KEY (id_semestre) REFERENCES semestre(id),
    FOREIGN KEY (id_session) REFERENCES _session(id)
);

-- Note
CREATE TABLE note(
    id INT AUTO_INCREMENT PRIMARY KEY,
    note DECIMAL(4,2),
    id_matiere INT NOT NULL,
    id_avancement INT NOT NULL,
    date_entree DATE NOT NULL,
    FOREIGN KEY (id_matiere) REFERENCES matiere(id),
    FOREIGN KEY (id_avancement) REFERENCES avancement(id)
);