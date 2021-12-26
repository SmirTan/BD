Create table Author
( AID numeric (4),
  AName varchar (80),
  ASurname varchar (80),
  AMidlename varchar (80),
  ACountry varchar (80),
  ASex varchar (10),
  ADate_Birthday Date,
  ADesription varchar(4000),
  Constraint pk_Author Primary key (AID)
);

Create table Genre
( GID numeric (4),
  GName varchar (80),
  Constraint pk_Genre Primary key (GID)
);

Create table PublishingHouse
( HID numeric (4),
  HName varchar (80),
  HSeries varchar (80),
  Constraint pk_PublishingHouse Primary key (HID)
);

Create table Book
( BID numeric (4),
  BAID numeric (4),
  BGID numeric (4),
  BHID numeric (4),
  BName varchar (300),
  BPages numeric (10),
  BCopies numeric (10),
  BWeight numeric (10),
  BPrice numeric (6),
  BDescription varchar (4000),
  Constraint pk_Book Primary key (BID),
  Constraint fk_Author
      Foreign key (BAID)
          References Author(AID),
  Constraint fk_Genre
      Foreign key (BGID)
          References Genre(GID),
  Constraint fk1_PublishingHouse
      Foreign key (BHID)
          References PublishingHouse(HID)
);

Create table People
( PID numeric(4),
  PSurname varchar (80),
  PName varchar (80),
  PMidleName varchar (80),
  PSex varchar (10),
  PBirth Date,
  PPhone numeric (12),
  PEmaile varchar (80),
  Constraint pk_People Primary key (PID)
);

Create table Basket
( BSID numeric(4),
  BSPID numeric(4),
  BSDate Date,
      Constraint pr_Basket Primary key (BSID),
  Constraint fk_People
      Foreign key (BSPID)
          References People(PID)
);


Create table Basket_Content
( BCID numeric(4),
  BCBID numeric(4),
  BCBSID numeric(4),
  BCCount numeric(10),
  BCPrice numeric(10),
  Constraint pk_Basket_Content Primary key (BCID),
  Constraint fk_Book
      Foreign key (BCBID)
          References Book(BID),
  Constraint fk_Basket
      Foreign key (BCBSID)
          References Basket(BSID)
);

Create table Sale
( SID numeric (4),
  SBSID numeric(4),
  SDate Date,
  SDiscount numeric(40),
  SCost numeric (10),
  Constraint pk_Sale Primary key (SID),
  Constraint fk1_Basket
      Foreign key (SBSID)
          References Basket(BSID)
);

Create table Log
( LID numeric (4),
  OldPrice numeric (10),
  NewPrice numeric (10),
  LType varchar (80),
  LDate date
);  
