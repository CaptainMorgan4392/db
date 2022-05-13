-- liquibase formatted sql

-- changeset liquibase:1
CREATE TABLE impresario (
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    name VARCHAR NOT NULL ,
    surname VARCHAR NOT NULL ,
    birthDate DATE NOT NULL
);

CREATE TABLE artist (
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    name VARCHAR NOT NULL ,
    surname VARCHAR NOT NULL ,
    birthDate DATE NOT NULL
);

CREATE TABLE jenre (
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    name VARCHAR NOT NULL
);

--changeset liquibase:2
CREATE TABLE impresario_artist_jenre (
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    impresario INT NOT NULL ,
    artist INT NOT NULL ,
    jenre INT NOT NULL,

    FOREIGN KEY (impresario) REFERENCES impresario(id) ON DELETE CASCADE ,
    FOREIGN KEY (artist) REFERENCES artist(id) ON DELETE CASCADE,
    FOREIGN KEY (jenre) REFERENCES jenre(id) ON DELETE CASCADE
);

--changeset liquibase:3
CREATE TABLE building(
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    name VARCHAR NOT NULL ,
    capacity INT NOT NULL ,
    buildingType VARCHAR NOT NULL
);

CREATE TABLE theatre(
    id INT PRIMARY KEY ,
    address VARCHAR NOT NULL ,

    FOREIGN KEY (id) REFERENCES building(id) ON DELETE CASCADE
);

CREATE TABLE concert_square(
    id INT PRIMARY KEY ,

    FOREIGN KEY (id) REFERENCES building(id) ON DELETE CASCADE
);

CREATE TABLE cinema(
    id INT PRIMARY KEY ,
    diagonal INT NOT NULL ,
    address VARCHAR NOT NULL ,

    FOREIGN KEY (id) REFERENCES building(id) ON DELETE CASCADE
);

CREATE TABLE culture_palace(
    id INT PRIMARY KEY ,
    address VARCHAR NOT NULL ,

    FOREIGN KEY (id) REFERENCES building(id) ON DELETE CASCADE
);

CREATE TABLE stage(
    id INT PRIMARY KEY ,
    address VARCHAR NOT NULL ,

    FOREIGN KEY (id) REFERENCES building(id) ON DELETE CASCADE
);

--changeset liquibase:4
CREATE TABLE event_type(
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    eventType VARCHAR NOT NULL
);

CREATE TABLE place(
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    place SMALLINT NOT NULL
);

CREATE TABLE organizer(
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    name VARCHAR NOT NULL ,
    surname VARCHAR NOT NULL ,
    birthDate DATE NOT NULL
);

CREATE TABLE event(
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    name VARCHAR NOT NULL ,
    eventType INT NOT NULL ,
    eventPlace INT NOT NULL ,
    eventDate DATE NOT NULL ,

    FOREIGN KEY (eventType) REFERENCES event_type(id) ON DELETE CASCADE ,
    FOREIGN KEY (eventPlace) REFERENCES building(id) ON DELETE CASCADE
);

--changeset liquibase:5
CREATE TABLE artist_event (
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    artist INT NOT NULL ,
    event INT NOT NULL ,

    FOREIGN KEY (artist) REFERENCES artist(id) ON DELETE CASCADE ,
    FOREIGN KEY (event) REFERENCES event(id) ON DELETE CASCADE
);

CREATE TABLE artist_place (
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    artistEvent INT NOT NULL ,
    place INT NOT NULL ,

    FOREIGN KEY (artistEvent) REFERENCES artist_event(id) ON DELETE CASCADE ,
    FOREIGN KEY (place) REFERENCES place(id) ON DELETE CASCADE
);

CREATE TABLE organizer_event (
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
    organizer INT NOT NULL ,
    event INT NOT NULL ,

    FOREIGN KEY (organizer) REFERENCES organizer(id) ON DELETE CASCADE ,
    FOREIGN KEY (event) REFERENCES event(id) ON DELETE CASCADE
);

--changeset liquibase:6
ALTER TABLE building ADD CONSTRAINT positive_capacity CHECK (capacity > 0);
ALTER TABLE cinema ADD CONSTRAINT positive_diagonal CHECK (diagonal > 0);

--changeset liquibase:7
ALTER TABLE impresario ADD CONSTRAINT adult CHECK (birthDate < now() - interval '18 years');
ALTER TABLE artist ADD CONSTRAINT adult CHECK (birthDate < now() - interval '18 years');
ALTER TABLE organizer ADD CONSTRAINT adult CHECK (birthDate < now() - interval '18 years');

--changeset liquibase:8
ALTER TABLE impresario ADD CONSTRAINT valid_length_name CHECK (length(name) <> 0 AND length(name) <= 100);
ALTER TABLE impresario ADD CONSTRAINT valid_length_surname CHECK (length(surname) <> 0 AND length(surname) <= 100);
ALTER TABLE artist ADD CONSTRAINT valid_length_name CHECK (length(name) <> 0 AND length(name) <= 100);
ALTER TABLE artist ADD CONSTRAINT valid_length_surname CHECK (length(surname) <> 0 AND length(surname) <= 100);
ALTER TABLE organizer ADD CONSTRAINT valid_length_name CHECK (length(name) <> 0 AND length(name) <= 100);
ALTER TABLE organizer ADD CONSTRAINT valid_length_surname CHECK (length(surname) <> 0 AND length(surname) <= 100);

ALTER TABLE building ADD CONSTRAINT valid_length_name CHECK (length(name) <> 0 AND length(name) <= 200);

ALTER TABLE theatre ADD CONSTRAINT valid_address CHECK (length(address) > 10);
ALTER TABLE cinema ADD CONSTRAINT valid_address CHECK (length(address) > 10);
ALTER TABLE culture_palace ADD CONSTRAINT valid_address CHECK (length(address) > 10);
ALTER TABLE stage ADD CONSTRAINT valid_address CHECK (length(address) > 10);

ALTER TABLE cinema ADD CONSTRAINT valid_diagonal CHECK (diagonal > 0);

ALTER TABLE event ADD CONSTRAINT valid_event_date CHECK (eventDate > now());

--changeset liquibase:9
CREATE INDEX events_year_2022 ON event(eventDate)
WHERE (extract('year' from eventDate) = 2022);

--changeset liquibase:10
INSERT INTO event_type VALUES (1, 'CONCERT');
INSERT INTO event_type VALUES (2, 'PERFORMANCE');
INSERT INTO event_type VALUES (3, 'COMPETITION');
INSERT INTO event_type VALUES (4, 'FILM');

--changeset liquibase:11
INSERT INTO jenre VALUES (1, 'CONCERT');
INSERT INTO jenre VALUES (2, 'OPERA');
INSERT INTO jenre VALUES (3, 'PERFORMANCE');
INSERT INTO jenre VALUES (4, 'COMEDY');
INSERT INTO jenre VALUES (5, 'DRAMA');
INSERT INTO jenre VALUES (6, 'TRILLER');
INSERT INTO jenre VALUES (7, 'COMPETITION');
INSERT INTO jenre VALUES (8, 'ACTION');
INSERT INTO jenre VALUES (9, 'MUSICLE');

