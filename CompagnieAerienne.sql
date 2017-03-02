/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     02/03/2017 06:42:32                          */
/*==============================================================*/


drop index AEROPORT_PK;

drop table AEROPORT;

drop index APPAREIL_PK;

drop table APPAREIL;

drop index POSTE_EMPLOYE_FK;

drop index EMPLOYE_PK;

drop table EMPLOYE;

drop index PARCOURAVION_PK;

drop table PARCOURAVION;

drop index POSTE_PK;

drop table POSTE;

drop index UTILISATEUR_PK;

drop table UTILISATEUR;

drop index VOL4_FK;

drop index VOL3_FK;

drop index VOL2_FK;

drop index VOL_FK;

drop index VOL_PK;

drop table VOL;

/*==============================================================*/
/* Table: AEROPORT                                              */
/*==============================================================*/
create table AEROPORT (
   ID_AEROPORT          SERIAL               not null,
   DESIGNATION          VARCHAR(100)         null,
   VILLE                VARCHAR(100)         null,
   constraint PK_AEROPORT primary key (ID_AEROPORT)
);

/*==============================================================*/
/* Index: AEROPORT_PK                                           */
/*==============================================================*/
create unique index AEROPORT_PK on AEROPORT (
ID_AEROPORT
);

/*==============================================================*/
/* Table: APPAREIL                                              */
/*==============================================================*/
create table APPAREIL (
   ID_APPAREIL          SERIAL               not null,
   DESIGNATION          VARCHAR(100)         null,
   CONSOMMATION         FLOAT8               null,
   NB_PLACE             INT4                 null,
   constraint PK_APPAREIL primary key (ID_APPAREIL)
);

/*==============================================================*/
/* Index: APPAREIL_PK                                           */
/*==============================================================*/
create unique index APPAREIL_PK on APPAREIL (
ID_APPAREIL
);

/*==============================================================*/
/* Table: EMPLOYE                                               */
/*==============================================================*/
create table EMPLOYE (
   ID_EMPLOYE           SERIAL               not null,
   ID_POSTE             INT4                 not null,
   NOM                  VARCHAR(100)         null,
   PRENOM               VARCHAR(100)         null,
   CONTACT              VARCHAR(10)          null,
   EMAIL                VARCHAR(100)         null,
   constraint PK_EMPLOYE primary key (ID_EMPLOYE)
);

/*==============================================================*/
/* Index: EMPLOYE_PK                                            */
/*==============================================================*/
create unique index EMPLOYE_PK on EMPLOYE (
ID_EMPLOYE
);

/*==============================================================*/
/* Index: POSTE_EMPLOYE_FK                                      */
/*==============================================================*/
create  index POSTE_EMPLOYE_FK on EMPLOYE (
ID_POSTE
);

/*==============================================================*/
/* Table: PARCOURAVION                                          */
/*==============================================================*/
create table PARCOURAVION (
   ID_PARCOUR           SERIAL               not null,
   DEPART               VARCHAR(100)         null,
   ARRIVEE              VARCHAR(100)         null,
   DISTANCE             FLOAT8               null,
   constraint PK_PARCOURAVION primary key (ID_PARCOUR)
);

/*==============================================================*/
/* Index: PARCOURAVION_PK                                       */
/*==============================================================*/
create unique index PARCOURAVION_PK on PARCOURAVION (
ID_PARCOUR
);

/*==============================================================*/
/* Table: POSTE                                                 */
/*==============================================================*/
create table POSTE (
   ID_POSTE             SERIAL               not null,
   DESIGNATION          VARCHAR(100)         null,
   SALAIRE              MONEY                null,
   constraint PK_POSTE primary key (ID_POSTE)
);

/*==============================================================*/
/* Index: POSTE_PK                                              */
/*==============================================================*/
create unique index POSTE_PK on POSTE (
ID_POSTE
);

/*==============================================================*/
/* Table: UTILISATEUR                                           */
/*==============================================================*/
create table UTILISATEUR (
   ID_UTILISATEUR       SERIAL               not null,
   NOM                  VARCHAR(100)         null,
   PRENOM               VARCHAR(100)         null,
   MDP                  VARCHAR(100)         null,
   constraint PK_UTILISATEUR primary key (ID_UTILISATEUR)
);

/*==============================================================*/
/* Index: UTILISATEUR_PK                                        */
/*==============================================================*/
create unique index UTILISATEUR_PK on UTILISATEUR (
ID_UTILISATEUR
);

/*==============================================================*/
/* Table: VOL                                                   */
/*==============================================================*/
create table VOL (
   ID_APPAREIL          INT4                 not null,
   ID_PARCOUR           INT4                 not null,
   ID_AEROPORT          INT4                 not null,
   ID_EMPLOYE           INT4                 not null,
   ID_VOL               SERIAL               not null,
   TAUX_REMPLISSAGE     FLOAT8               null,
   TARIF_BILLET         MONEY                null,
   DATE_DEPART          DATE                 null,
   DATE_ARRIVEE         DATE                 null,
   constraint PK_VOL primary key (ID_APPAREIL, ID_PARCOUR, ID_AEROPORT, ID_EMPLOYE)
);

/*==============================================================*/
/* Index: VOL_PK                                                */
/*==============================================================*/
create unique index VOL_PK on VOL (
ID_APPAREIL,
ID_PARCOUR,
ID_AEROPORT,
ID_EMPLOYE
);

/*==============================================================*/
/* Index: VOL_FK                                                */
/*==============================================================*/
create  index VOL_FK on VOL (
ID_APPAREIL
);

/*==============================================================*/
/* Index: VOL2_FK                                               */
/*==============================================================*/
create  index VOL2_FK on VOL (
ID_PARCOUR
);

/*==============================================================*/
/* Index: VOL3_FK                                               */
/*==============================================================*/
create  index VOL3_FK on VOL (
ID_AEROPORT
);

/*==============================================================*/
/* Index: VOL4_FK                                               */
/*==============================================================*/
create  index VOL4_FK on VOL (
ID_EMPLOYE
);

alter table EMPLOYE
   add constraint FK_EMPLOYE_POSTE_EMP_POSTE foreign key (ID_POSTE)
      references POSTE (ID_POSTE)
      on delete restrict on update restrict;

alter table VOL
   add constraint FK_VOL_VOL_APPAREIL foreign key (ID_APPAREIL)
      references APPAREIL (ID_APPAREIL)
      on delete restrict on update restrict;

alter table VOL
   add constraint FK_VOL_VOL2_PARCOURA foreign key (ID_PARCOUR)
      references PARCOURAVION (ID_PARCOUR)
      on delete restrict on update restrict;

alter table VOL
   add constraint FK_VOL_VOL3_AEROPORT foreign key (ID_AEROPORT)
      references AEROPORT (ID_AEROPORT)
      on delete restrict on update restrict;

alter table VOL
   add constraint FK_VOL_VOL4_EMPLOYE foreign key (ID_EMPLOYE)
      references EMPLOYE (ID_EMPLOYE)
      on delete restrict on update restrict;

