/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  26/08/2025 17:44:54                      */
/*==============================================================*/


drop table if exists DIM_ACTOR;

drop table if exists DIM_CATEGORY;

drop table if exists DIM_GEOGRAPHY;

drop table if exists DIM_RENTAL_DATE;

drop table if exists FACT_CASTING;

drop table if exists FACT_Profitability;

/*==============================================================*/
/* Table : DIM_ACTOR                                            */
/*==============================================================*/
create table DIM_ACTOR
(
   ACTOR_ID             smallint not null,
   FIRST_NAME           varchar(45),
   LAST_NAME            varchar(45),
   FULL_NAME            varchar(90),
   primary key (ACTOR_ID)
);

/*==============================================================*/
/* Table : DIM_CATEGORY                                         */
/*==============================================================*/
create table DIM_CATEGORY
(
   CATEGORY_ID          smallint not null,
   NAME                 varchar(25),
   primary key (CATEGORY_ID)
);

/*==============================================================*/
/* Table : DIM_GEOGRAPHY                                        */
/*==============================================================*/
create table DIM_GEOGRAPHY
(
   GEOGRAPHY_ID         smallint not null,
   CITY                 varchar(50),
   COUNTRY              varchar(50),
   CONTINENT            varchar(50),
   primary key (GEOGRAPHY_ID)
);

/*==============================================================*/
/* Table : DIM_RENTAL_DATE                                      */
/*==============================================================*/
create table DIM_RENTAL_DATE
(
   RENTAL_ID            int not null,
   DATE                 datetime,
   primary key (RENTAL_ID)
);

/*==============================================================*/
/* Table : FACT_CASTING                                         */
/*==============================================================*/
create table FACT_CASTING
(
   ACTOR_ID             smallint not null,
   CATEGORY_ID          smallint not null,
   NB_FILMS             int,
   primary key (ACTOR_ID, CATEGORY_ID),
   constraint FK_ACTOR_CATING foreign key (ACTOR_ID)
      references DIM_ACTOR (ACTOR_ID) on delete restrict on update restrict,
   constraint FK_CATEGORY_CASTING foreign key (CATEGORY_ID)
      references DIM_CATEGORY (CATEGORY_ID) on delete restrict on update restrict
);

/*==============================================================*/
/* Table : FACT_Profitability                                          */
/*==============================================================*/
create table FACT_Profitability
(
   CATEGORY_ID          smallint not null,
   GEOGRAPHY_ID         smallint not null,
   RENTAL_ID            int not null,
   ACTOR_ID             smallint not null,
   NB_RENTAL            int,
   AMOUNT               decimal(5,2),
   primary key (CATEGORY_ID, GEOGRAPHY_ID, RENTAL_ID, ACTOR_ID),
   constraint FK_ASSOCIATION_6 foreign key (ACTOR_ID)
      references DIM_ACTOR (ACTOR_ID) on delete restrict on update restrict,
   constraint FK_ASSOCIATION_7 foreign key (CATEGORY_ID)
      references DIM_CATEGORY (CATEGORY_ID) on delete restrict on update restrict,
   constraint FK_ASSOCIATION_8 foreign key (RENTAL_ID)
      references DIM_RENTAL_DATE (RENTAL_ID) on delete restrict on update restrict,
   constraint FK_ASSOCIATION_9 foreign key (GEOGRAPHY_ID)
      references DIM_GEOGRAPHY (GEOGRAPHY_ID) on delete restrict on update restrict
);

