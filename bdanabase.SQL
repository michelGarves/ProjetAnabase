DROP DATABASE IF EXISTS anabase;

CREATE DATABASE IF NOT EXISTS anabase;
USE anabase;
# -----------------------------------------------------------------------------
#       TABLE : FACTURE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FACTURE
 (
   NUM_FACTURE INTEGER(2) NOT NULL  ,
   NUM_CONGRESSISTE INTEGER(2) NOT NULL  ,
   DATE_FACTURE DATE NULL  ,
   CODE_REGLEMENT BOOL NULL  ,
   MONTANT_FACTURE BIGINT(4) NULL  
   , PRIMARY KEY (NUM_FACTURE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE FACTURE
# -----------------------------------------------------------------------------


CREATE UNIQUE INDEX I_FK_FACTURE_CONGRESSISTE
     ON FACTURE (NUM_CONGRESSISTE ASC);

# -----------------------------------------------------------------------------
#       TABLE : ORGANISME_PAYEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ORGANISME_PAYEUR
 (
   NUM_ORGANISME INTEGER(2) NOT NULL  ,
   NOM_ORGANISME CHAR(32) NULL  ,
   ADRESSE_ORGANISME CHAR(50) NULL  
   , PRIMARY KEY (NUM_ORGANISME) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CONGRESSISTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONGRESSISTE
 (
   NUM_CONGRESSISTE INTEGER(2) NOT NULL  ,
   NUM_ORGANISME INTEGER(2) NULL  ,
   NUM_HOTEL INTEGER(2) NULL  ,
   NOM_CONGRESSISTE CHAR(32) NULL  ,
   PRENOM_CONGRESSISTE CHAR(32) NULL  ,
   ADRESSE_CONGRESSISTE CHAR(50) NULL  ,
   TEL_CONGRESSISTE CHAR(10) NULL  ,
   DATE_INSCRIPTION DATE NULL  ,
   CODE_ACCOMPAGNATEUR BOOL NULL  
   , PRIMARY KEY (NUM_CONGRESSISTE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CONGRESSISTE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CONGRESSISTE_ORGANISME_PAYEUR
     ON CONGRESSISTE (NUM_ORGANISME ASC);

CREATE  INDEX I_FK_CONGRESSISTE_HOTEL
     ON CONGRESSISTE (NUM_HOTEL ASC);

# -----------------------------------------------------------------------------
#       TABLE : SESSION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SESSION
 (
   NUM_SESSION INTEGER(2) NOT NULL  ,
   DATE_SESSION DATE NULL  ,
   HEURE_SESSION TIME NULL  ,
   PRIX_SESSION INTEGER(2) NULL  ,
   NOM_SESSION CHAR(32) NULL  
   , PRIMARY KEY (NUM_SESSION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : HOTEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS HOTEL
 (
   NUM_HOTEL INTEGER(2) NOT NULL  ,
   NOM_HOTEL CHAR(32) NULL  ,
   ADRESSE_HOTEL CHAR(50) NULL  ,
   NOMBRE_ETOILES SMALLINT(1) NULL  ,
   PRIX_PARTICIPANT INTEGER(2) NULL  ,
   PRIX_SUPPL INTEGER(2) NULL  
   , PRIMARY KEY (NUM_HOTEL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ACTIVITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ACTIVITE
 (
   NUM_ACTIVITE INTEGER(2) NOT NULL  ,
   NOM_ACTIVITE CHAR(32) NULL  ,
   DATE_ACTIVITE DATE NULL  ,
   HEURE_ACTIVITE TIME NULL  ,
   PRIX_ACTIVITE INTEGER(2) NULL  
   , PRIMARY KEY (NUM_ACTIVITE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : REL_1
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REL_1
 (
   NUM_CONGRESSISTE INTEGER(2) NOT NULL  ,
   NUM_ACTIVITE INTEGER(2) NOT NULL  
   , PRIMARY KEY (NUM_CONGRESSISTE,NUM_ACTIVITE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE REL_1
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_REL_1_CONGRESSISTE
     ON REL_1 (NUM_CONGRESSISTE ASC);

CREATE  INDEX I_FK_REL_1_ACTIVITE
     ON REL_1 (NUM_ACTIVITE ASC);

# -----------------------------------------------------------------------------
#       TABLE : PARTICIPATION_SESSION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PARTICIPATION_SESSION
 (
   NUM_CONGRESSISTE INTEGER(2) NOT NULL  ,
   NUM_SESSION INTEGER(2) NOT NULL  
   , PRIMARY KEY (NUM_CONGRESSISTE,NUM_SESSION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PARTICIPATION_SESSION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PARTICIPATION_SESSION_CONGRESSISTE
     ON PARTICIPATION_SESSION (NUM_CONGRESSISTE ASC);

CREATE  INDEX I_FK_PARTICIPATION_SESSION_SESSION
     ON PARTICIPATION_SESSION (NUM_SESSION ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE FACTURE 
  ADD FOREIGN KEY FK_FACTURE_CONGRESSISTE (NUM_CONGRESSISTE)
      REFERENCES CONGRESSISTE (NUM_CONGRESSISTE) ;


ALTER TABLE CONGRESSISTE 
  ADD FOREIGN KEY FK_CONGRESSISTE_ORGANISME_PAYEUR (NUM_ORGANISME)
      REFERENCES ORGANISME_PAYEUR (NUM_ORGANISME) ;


ALTER TABLE CONGRESSISTE 
  ADD FOREIGN KEY FK_CONGRESSISTE_HOTEL (NUM_HOTEL)
      REFERENCES HOTEL (NUM_HOTEL) ;


ALTER TABLE REL_1 
  ADD FOREIGN KEY FK_REL_1_CONGRESSISTE (NUM_CONGRESSISTE)
      REFERENCES CONGRESSISTE (NUM_CONGRESSISTE) ;


ALTER TABLE REL_1 
  ADD FOREIGN KEY FK_REL_1_ACTIVITE (NUM_ACTIVITE)
      REFERENCES ACTIVITE (NUM_ACTIVITE) ;


ALTER TABLE PARTICIPATION_SESSION 
  ADD FOREIGN KEY FK_PARTICIPATION_SESSION_CONGRESSISTE (NUM_CONGRESSISTE)
      REFERENCES CONGRESSISTE (NUM_CONGRESSISTE) ;


ALTER TABLE PARTICIPATION_SESSION 
  ADD FOREIGN KEY FK_PARTICIPATION_SESSION_SESSION (NUM_SESSION)
      REFERENCES SESSION (NUM_SESSION) ;

