/*==============================================================*/
/* Nom de SGBD :  MySQL 3.22 (Deprecated)                       */
/* Date de création :  21/01/2022 11:48:05 PM                   */
/*==============================================================*/


drop table if exists Adresses;

drop table if exists Association_13;

drop table if exists Association_15;

drop table if exists Association_16;

drop table if exists Association_18;

drop table if exists Association_19;

drop table if exists Association_20;

drop table if exists Association_21;

drop table if exists Association_22;

drop table if exists CATEGORIE_MED;

drop table if exists Categorie_service;

drop table if exists Categorie_staff;

drop table if exists Chambre;

drop table if exists Composants_doss_pat;

drop table if exists DIAGNOSTICS;

drop table if exists Dossier_patient;

drop table if exists Facture_patient;

drop table if exists Item;

drop table if exists LITS;

drop table if exists MALADIES;

drop table if exists MEDICAMENTS;

drop table if exists Méthodes_payement;

drop table if exists Patient;

drop table if exists SYMPTOMES;

drop table if exists Service;

drop table if exists Staff;

drop table if exists Wilaya;

drop table if exists patient_adresses;

drop table if exists patient_chambre;

drop table if exists staff_adresses;

/*==============================================================*/
/* Table : Adresses                                             */
/*==============================================================*/
create table Adresses
(
   CODE_ADRESSE                   integer                            not null,
   CODE_WILAYA                    integer                            not null,
   L1_NBAT                        varchar(30),
   L2_NRUE                        varchar(30),
   L3_LOCALITE                    varchar(30),
   primary key (CODE_ADRESSE)
);

/*==============================================================*/
/* Table : Association_13                                       */
/*==============================================================*/
create table details_factures
(
   CODE_FACT_PAT                  integer                            not null,
   CODE_ITEM                      integer                            not null,
   QUANTITE                       integer,
   COUT_TOTAL                     float,
   primary key (CODE_FACT_PAT, CODE_ITEM)
);

/*==============================================================*/
/* Table : Association_15                                       */
/*==============================================================*/
create table maladie_symptome
(
   CODE_SYMPTOME                  integer                            not null,
   CODE_MALADIES                  integer                            not null,
   PROBABILITE_ATTENDUE           float,
   VALEUR_MIN                     float,
   VALEUR_MAX                     float,
   COMMENTAIRES                   varchar(30),
   primary key (CODE_SYMPTOME, CODE_MALADIES)
);

/*==============================================================*/
/* Table : Association_16                                       */
/*==============================================================*/
create table patient_symptome
(
   CODE_SYMPTOME                  integer                            not null,
   CODE_PAT                       integer                            not null,
   DATE_OBSERVATION               date,
   VALEUR_SYMPTOME                float,
   primary key (CODE_SYMPTOME, CODE_PAT)
);

/*==============================================================*/
/* Table : Association_18                                       */
/*==============================================================*/
create table patient_lits
(
   CODE_LITS                      integer                            not null,
   CODE_PAT                       integer                            not null,
   DATE_DEB                       date,
   DATE_FIN                       date,
   primary key (CODE_LITS, CODE_PAT)
);

/*==============================================================*/
/* Table : Association_19                                       */
/*==============================================================*/
create table staff_affecte_pat
(
   CODE_PAT                       integer                            not null,
   CODE_STAFF                     integer                            not null,
   DDEBUT_AFFECT                  date,
   DFIN_AFFECT                    date,
   primary key (CODE_PAT, CODE_STAFF)
);

/*==============================================================*/
/* Table : Association_20                                       */
/*==============================================================*/
create table med_indications
(
   CODE_DIAGNOSTIC                integer                            not null,
   CODE_MEDICAMENT                integer                            not null,
   primary key (CODE_DIAGNOSTIC, CODE_MEDICAMENT)
);

/*==============================================================*/
/* Table : Association_21                                       */
/*==============================================================*/
create table traitements_patt
(
   CODE_DIAGNOSTIC                integer                            not null,
   CODE_MEDICAMENT                integer                            not null,
   CODE_PAT                       integer                            not null,
   DATE_ADMIN                     date,
   DOSE_ADMIN                     varchar(30),
   COMMENTAIRES                   varchar(30),
   primary key (CODE_DIAGNOSTIC, CODE_MEDICAMENT, CODE_PAT)
);

/*==============================================================*/
/* Table : Association_22                                       */
/*==============================================================*/
create table med_cat
(
   CODE_CAT_MED                   integer                            not null,
   CODE_MEDICAMENT                integer                            not null,
   primary key (CODE_CAT_MED, CODE_MEDICAMENT)
);

/*==============================================================*/
/* Table : CATEGORIE_MED                                        */
/*==============================================================*/
create table CATEGORIE_MED
(
   CODE_CAT_MED                   integer                            not null,
   DESC_CAT_MED                   varchar(30),
   primary key (CODE_CAT_MED)
);

/*==============================================================*/
/* Table : Categorie_service                                    */
/*==============================================================*/
create table Categorie_service
(
   CODE_CAT_SERVICE               integer                            not null,
   LIBELLE_CAT_SERVICE            varchar(30),
   ABREVIATION                    varchar(30),
   primary key (CODE_CAT_SERVICE)
);

/*==============================================================*/
/* Table : Categorie_staff                                      */
/*==============================================================*/
create table Categorie_staff
(
   CODE_CAT_STAFF                 integer                            not null,
   LIB_CAT_STAFF                  varchar(30),
   primary key (CODE_CAT_STAFF)
);

/*==============================================================*/
/* Table : Chambre                                              */
/*==============================================================*/
create table Chambre
(
   NUM_CHAMBRE                    integer                            not null,
   CODE_SERVICE                   integer                            not null,
   NUM_BATIMENT                   integer,
   NUM_ETAGE                      integer,
   primary key (NUM_CHAMBRE)
);

/*==============================================================*/
/* Table : Composants_doss_pat                                  */
/*==============================================================*/
create table Composants_doss_pat
(
   CODE_COMPOSANT                 integer                            not null,
   DESCRIPTION_COMPOSANT          varchar(30),
   primary key (CODE_COMPOSANT)
);

/*==============================================================*/
/* Table : DIAGNOSTICS                                          */
/*==============================================================*/
create table DIAGNOSTICS
(
   CODE_DIAGNOSTIC                integer                            not null,
   AUTRES_DETAILS                 varchar(100),
   primary key (CODE_DIAGNOSTIC)
);

/*==============================================================*/
/* Table : Dossier_patient                                      */
/*==============================================================*/
create table Dossier_patient
(
   CODE_DOSSIER_PAT               integer                            not null,
   CODE_STAFF                     integer                            not null,
   CODE_PAT                       integer                            not null,
   CODE_COMPOSANT                 integer                            not null,
   DATE_MODIF                     date,
   DATE_ADMISS                    date,
   CONDITION_MEDICALE             varchar(30),
   DETAILS_DOSSIER_PAT            varchar(30),
   primary key (CODE_DOSSIER_PAT)
);

/*==============================================================*/
/* Table : Facture_patient                                      */
/*==============================================================*/
create table Facture_patient
(
   CODE_FACT_PAT                  integer                            not null,
   CODE_PAT                       integer                            not null,
   DATE_FACT                      date,
   MONTANT_FACT                   float,
   DATE_PAYEMENT                  date,
   primary key (CODE_FACT_PAT)
);

/*==============================================================*/
/* Table : Item                                                 */
/*==============================================================*/
create table Item
(
   CODE_ITEM                      integer                            not null,
   LIBELLE_ITEM                   varchar(30),
   COUT_ITEM                      float,
   primary key (CODE_ITEM)
);

/*==============================================================*/
/* Table : LITS                                                 */
/*==============================================================*/
create table LITS
(
   CODE_LITS                      integer                            not null,
   NUM_CHAMBRE                    integer                            not null,
   NUM_LIT                        integer,
   EMPLACEMENT_LIT                varchar(100),
   NUM_CHAMBRE2                   numeric(5,0),
   primary key (CODE_LITS)
);

/*==============================================================*/
/* Table : MALADIES                                             */
/*==============================================================*/
create table MALADIES
(
   CODE_MALADIES                  integer                            not null,
   LIBELLE_MALADIE                varchar(30),
   NOM_COURT                      varchar(30),
   SYMPTOMES_COMM                 varchar(100),
   DESCRIPTION                    varchar(256),
   primary key (CODE_MALADIES)
);

/*==============================================================*/
/* Table : MEDICAMENTS                                          */
/*==============================================================*/
create table MEDICAMENTS
(
   CODE_MEDICAMENT                integer                            not null,
   NOM_MED                        varchar(30),
   DESC_MED                       varchar(256),
   PRIX_UNIT                      float(12),
   AUTRES_DETAILS                 varchar(100),
   primary key (CODE_MEDICAMENT)
);

/*==============================================================*/
/* Table : Méthodes_payement                                    */
/*==============================================================*/
create table Méthodes_payement
(
   CODE_METH_PAYEMENT             integer                            not null,
   CODE_PAT                       integer                            not null,
   NUM_CARTE                      integer,
   DATE_EXPIRATION                date,
   primary key (CODE_METH_PAYEMENT)
);

/*==============================================================*/
/* Table : Patient                                              */
/*==============================================================*/
create table Patient
(
   CODE_PAT                       integer                            not null AUTO_INCREMENT AUTO_INCREMENT,
   NOM_PAT                        varchar(30),
   PRENOM_PAT                     varchar(30),
   SEXE_PAT                       varchar(30),
   DNAISS_PAT                     date,
   TAILLE_PAT                     varchar(30),
   POIDS_PAT                      float,
   NTEL_PERS                      varchar(15),
   NTEL_MAISON                    varchar(15),
   NTEL_TRAVAIL                   varchar(15),
   primary key (CODE_PAT)
);

/*==============================================================*/
/* Table : SYMPTOMES                                            */
/*==============================================================*/
create table SYMPTOMES
(
   CODE_SYMPTOME                  integer                            not null,
   NOM_SYMPTOME                   varchar(200),
   DESCRIPTION_SYMPTOME           varchar(256),
   primary key (CODE_SYMPTOME)
);

/*==============================================================*/
/* Table : Service                                              */
/*==============================================================*/
create table Service
(
   CODE_SERVICE                   integer                            not null,
   CODE_CAT_SERVICE               integer                            not null,
   LIBELLE_SERVCIE                varchar(30),
   NBR_TOT_LIT                    integer,
   primary key (CODE_SERVICE)
);

/*==============================================================*/
/* Table : Staff                                                */
/*==============================================================*/
create table Staff
(
   CODE_STAFF                     integer                            not null AUTO_INCREMENT,
   CODE_CAT_STAFF                 integer                            not null,
   SEXE                           varchar(15),
   NOM_STAFF                      varchar(30),
   PRENOM_STAFF                   varchar(30),
   QUALIFICATION                  varchar(30),
   DNAISS_STAFF                   date,
   primary key (CODE_STAFF)
);

/*==============================================================*/
/* Table : Wilaya                                               */
/*==============================================================*/
create table Wilaya
(
   CODE_WILAYA                    integer                            not null,
   LIBELLE_WILAYA                 varchar(30),
   primary key (CODE_WILAYA)
);

/*==============================================================*/
/* Table : patient_adresses                                     */
/*==============================================================*/
create table patient_adresses
(
   CODE_PAT                       integer                            not null,
   CODE_ADRESSE                   integer                            not null,
   DATE_DEB                       date,
   DATE_FIN                       date,
   primary key (CODE_PAT, CODE_ADRESSE)
);

/*==============================================================*/
/* Table : patient_chambre                                      */
/*==============================================================*/
create table patient_chambre
(
   CODE_PAT                       integer                            not null,
   NUM_CHAMBRE                    integer                            not null,
   DATE_DEB                       date,
   DATE_FIN                       date,
   primary key (CODE_PAT, NUM_CHAMBRE)
);

/*==============================================================*/
/* Table : staff_adresses                                       */
/*==============================================================*/
create table staff_adresses
(
   CODE_STAFF                     integer                            not null,
   CODE_ADRESSE                   integer                            not null,
   DATE_DEB                       date,
   DATE_FIN                       date,
   primary key (CODE_STAFF, CODE_ADRESSE)
);

