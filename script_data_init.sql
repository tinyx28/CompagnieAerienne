
/*** table utilisateur ***/
INSERT INTO utilisateur(
            id_utilisateur, nom, prenom, mdp)
    VALUES (?, 'RABARY', 'JAONA', 'AZERTYUIOP');
INSERT INTO utilisateur(
            id_utilisateur, nom, prenom, mdp)
    VALUES (?, 'RABARIJAONA', 'LOIC', 'QWERTYUIOP');

/*** table  poste ***/
INSERT INTO poste(
            id_poste, designation, salaire)
    VALUES ('pilote', 3000000);
INSERT INTO poste(
            id_poste, designation, salaire)
    VALUES ('hotesse', 2000000);


/*** table employe ***/
INSERT INTO employe(
            id_poste, nom, prenom, contact, email)
    VALUES (1, 'RAMANANTSALAMA', 'ANTHONY', '033 79 031 13', 'Anthonyramanantsalama@gmail.com');
INSERT INTO employe(
            id_poste, nom, prenom, contact, email)
    VALUES (1, 'RAVALOMANANA', 'BALIAKA', '034 12 140 78', 'Baliaka@gmail.com');
INSERT INTO employe(
            id_poste, nom, prenom, contact, email)
    VALUES (1, 'RAVALISON', 'BALROG', '034 12 141 79', 'Balrog@gmail.com');

/*** table aeroport ***/
INSERT INTO aeroport(
            designation, ville)
    VALUES ( 'AIRMADAGASCAR', 'ANTANANARIVO');
INSERT INTO aeroport(
            designation, ville)
    VALUES ( 'AIRFRANCE', 'PARIS');
INSERT INTO aeroport(
            designation, ville)
    VALUES ( 'AIRFRANCE', 'MARSEILLE');

/*** table parcoursacvions ***/
INSERT INTO parcouravion(
            depart, arrivee, distance)
    VALUES ( 'ANTANANARIVO', 'PARIS', 12000);
INSERT INTO parcouravion(
            depart, arrivee, distance)
    VALUES ( 'ANTANANARIVO', 'JOHANESGURG', 1200);
INSERT INTO parcouravion(
            depart, arrivee, distance)
    VALUES ( 'PARIS', 'MARSEILLE', 800);

/*** table appareil ***/
INSERT INTO appareil(
             designation, consommation, nb_place)
    VALUES ( 'AIRBUS-340', 300, 300);

INSERT INTO appareil(
             designation, consommation, nb_place)
    VALUES ( 'BOING-R40', 200, 300);
INSERT INTO appareil(
             designation, consommation, nb_place)
    VALUES ( 'BOING-R41', 500, 800);

/*** table vol ***/
INSERT INTO vol(
            id_appareil, id_parcour, id_aeroport, id_employe, taux_remplissage, 
            tarif_billet, date_depart, date_arrivee)
    VALUES ( 1, 1, 1, 1, 40, 
            5000000, '2012-05-03 03:00:00', '2012-05-04 04:00:00');
INSERT INTO vol(
            id_appareil, id_parcour, id_aeroport, id_employe, taux_remplissage, 
            tarif_billet, date_depart, date_arrivee)
    VALUES ( 2, 2, 1, 1, 40, 
            100000, '2012-05-03 03:00:00', '2012-05-04 04:00:00');
INSERT INTO vol(
            id_appareil, id_parcour, id_aeroport, id_employe, taux_remplissage, 
            tarif_billet, date_depart, date_arrivee)
    VALUES ( 3, 3, 1, 1, 40, 
            2000000, '2012-05-03 03:00:00', '2012-05-04 04:00:00');