DROP DATABASE planeats;

CREATE DATABASE planeats;

\c planeats;

CREATE TABLE RECIPE(
  ID SERIAL PRIMARY KEY,
  NAME TEXT NOT NULL UNIQUE,
  INGREDIENTS ARRAY NOT NULL,
  TIME INTEGER NOT NULL,
  SERVINGS INTEGER NOT NULL,
  DIRECTIONS TEXT NOT NULL,
  NUTR12ITION INTEGER NOT NULL
);

CREATE TABLE MEALS(
  ID SERIAL PRIMARY KEY,
  NAME TEXT NOT NULL,
  FAVORITED BOOLEAN NOT NULL
);

CREATE TABLE MEAL_RECIPES(
  MEAL_ID INTEGER REFERENCES MEALS(ID),
  RECIPE_ID INTEGER REFERENCES RECIPE(ID)
);

CREATE TABLE EVENTS(
  ID SERIAL PRIMARY KEY,
  MEAL_ID INTEGER REFERENCES MEALS(ID),
  MEAL_TIME TEXT NOT NULL UNIQUE
);

CREATE TABLE USERS(
  ID SERIAL PRIMARY KEY,
  USERNAME CHAR(10) NOT NULL UNIQUE
);

CREATE TABLE USER_MEALS(
  USER_ID INTEGER REFERENCES USERS(ID),
  MEAL_ID INTEGER REFERENCES MEALS(ID)
);

