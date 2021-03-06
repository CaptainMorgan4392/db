INSERT INTO organizer(id, name, surname, birthdate) VALUES (1, 'Nikita', 'Kosarev', '2000-10-30');
INSERT INTO organizer(id, name, surname, birthdate) VALUES (2, 'Marat', 'Pashentsev', '2000-05-24');
INSERT INTO organizer(id, name, surname, birthdate) VALUES (3, 'Andrey', 'Nikolotov', '2000-12-31');
INSERT INTO organizer(id, name, surname, birthdate) VALUES (4, 'Vasya', 'Pupkin', '2000-01-01');

INSERT INTO building(id, name, capacity, buildingtype) VALUES (1, 'Kakoi-to teatr', 3228, 'theatre');
INSERT INTO building(id, name, capacity, buildingtype) VALUES (2, 'Kakoi-to kinoteatr', 1488, 'cinema');
INSERT INTO theatre(id, address) VALUES (1, 'Ulitsa Pushkina Dom Kolotushkina');
INSERT INTO cinema(id, diagonal, address) VALUES (2, 322, 'Ulitsa Esenina Dom Karuselina');

INSERT INTO event(id, name, eventtype, eventplace, eventdate) VALUES (1, 'Concert of Pushkin', 1, 1, '2100-01-01');
INSERT INTO event(id, name, eventtype, eventplace, eventdate) VALUES (2, 'Opera of Kolotushkin', 2, 1, '2100-02-01');
INSERT INTO event(id, name, eventtype, eventplace, eventdate) VALUES (3, 'Musicle of Pushkin', 4, 2, '2100-03-01');
INSERT INTO event(id, name, eventtype, eventplace, eventdate) VALUES (4, 'Triller of Kolotushkin', 4, 2, '2100-04-01');

INSERT INTO organizer_event(id, organizer, event) VALUES (1, 1, 1);
INSERT INTO organizer_event(id, organizer, event) VALUES (2, 1, 2);
INSERT INTO organizer_event(id, organizer, event) VALUES (3, 1, 3);
INSERT INTO organizer_event(id, organizer, event) VALUES (4, 2, 2);
INSERT INTO organizer_event(id, organizer, event) VALUES (5, 2, 3);
INSERT INTO organizer_event(id, organizer, event) VALUES (6, 3, 3);