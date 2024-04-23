DROP DATABASE IF EXIST maarch
use maarch


CREATE TABLE USER (
    id_user INT AUTO_INCREMENT PRIMARY KEY, 
    civilite ENUM ('Mr', 'Mme', 'Mademoiselle'),
    nom VARCHAR(50) NOT NULL, 
    prenom VARCHAR(50) NOT NULL, 
    email VARCHAR(100) NOT NULL, 
    mdp_hache VARCHAR(255) NOT NULL,
    role_id INT NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE TABLE TECHNICIEN (
    id_technicien INT AUTO_INCREMENT PRIMARY KEY,
    total_intervention INT,
    note FLOAT,
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES USER(id_user)
);

CREATE TABLE INTERVENTION (
    id_intervention INT AUTO_INCREMENT PRIMARY KEY,
    date_intervention TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    technicien_id INT,
    FOREIGN KEY (technicien_id) REFERENCES TECHNICIEN(id_technicien)
);

CREATE TABLE COMMENTAIRE (
    id_commentaire INT AUTO_INCREMENT PRIMARY KEY,
    intervention_id INT,
    commentaire TEXT,
    FOREIGN KEY (intervention_id) REFERENCES INTERVENTION(id_intervention)
);
