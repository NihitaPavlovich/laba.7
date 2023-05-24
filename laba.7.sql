CREATE TABLE subject
(
  id serial PRIMARY KEY,
  name varchar(128) NOT NULL
);

CREATE TABLE subject_type
(
  id serial PRIMARY KEY,
  name varchar(128) NOT NULL
);

CREATE TABLE class
(
  id serial PRIMARY KEY,
  subject int NOT NULL REFERENCES subject(id),
  subject_type int NOT NULL REFERENCES subject_type(id)
);

CREATE TABLE time
(
  id serial PRIMARY KEY,
  start_time varchar(64) NOT NULL
);


CREATE TABLE teacher
(
  id serial PRIMARY KEY,
  full_name varchar(256) NOT NULL
);

CREATE TABLE teacher_subject
(
  id serial PRIMARY KEY,
  teacher int NOT NULL REFERENCES teacher(id),
  class int NOT NULL REFERENCES class(id)
);

CREATE TABLE timetable
(
  id serial PRIMARY KEY,
  week int NOT NULL,
  day int NOT NULL,
  class int NOT NULL REFERENCES class(id),
  class_time int NOT NULL REFERENCES time(id),
  room_number varchar(64) NOT NULL
);

INSERT INTO subject (id, name)
VALUES
(1, 'Основы DevOps'), (2, 'Введение в информационные технологии'), (3,'Физика'),
(4, 'Игровые виды спорта'), (5, 'Высшая математика'), (6, 'Основы баз данных'),
(7, 'Проектный практикум'), (8, 'История'), (9, 'Иностранный язык');

INSERT INTO subject_type (id, name)
VALUES
(1, 'Лекция'), (2, 'Практика'), (3, 'Лабораторная работа');

INSERT INTO time (id, start_time)
VALUES
(1, '9:30 - 11:05'), (2, '11:20 - 12:55'), (3, '13:10 - 14:45'),
(4, '15:25 - 17:00'), (5, '17:15 - 18:50');

INSERT INTO teacher (id, full_name)
VALUES
(1, 'Городничев М.Г.'), (2, 'Фурлетов Ю.М.'), (3, 'Сирко И.В.'), (4, 'Королев И.В.'),
(5, 'Гетманская И.В.'), (6, 'Полищук Ю.В.'), (7, 'Потапченко Т.Д.'), (8, 'Фурлетов Ю.М.'),
(9, 'Липатов В.Н.'), (10, 'Шуралев А.В.'), (11, 'Вальковский С.Н.'), (12, 'Кожевникова Т.В.'),
(13, 'Изотова А.А.'), (14, 'Алмохамед М.'), (15, 'Дягтярев В.Ф.');

INSERT INTO class (id, subject, subject_type)
VALUES
(1, 1, 1), (2, 1, 3), (3, 2, 2), (4, 2, 3), (5, 3, 1), (6, 15, 2), (7, 3, 3), (8, 4, 2),
(9, 5, 1), (10, 14, 2), (11, 6, 1), (12, 6, 2), (13, 6, 3), (14, 7, 2), (15, 8, 1), (16, 8, 2),
(17, 9, 2);

INSERT INTO teacher_subject (id, teacher, class)
VALUES
(1, 1, 1), (2, 9, 2), (3, 2, 3), (4, 2, 4), (5, 11, 5), (6, 15, 6), (7, 6, 7), (8, 4, 8),
(9, 5, 9), (10, 14, 10), (11, 6, 11), (12, 16, 12), (13, 13, 13), (14, 7, 14), (15, 10, 15), (16, 10, 16),
(17, 12, 17);

INSERT INTO timetable (week, day, class, class_time, room_number)
VALUES
--Нечет--
--Понедельник -- 
(1, 1, 1, 4, 'А-502'),
--Вторник--
(1, 2, 7, 2, 'Н-342'), (1, 2, 8, 3, 'Н-С/Зал'),
--Среда--
(1, 3, 2, 2, 'А-ВЦ-302'), (1, 3, 8, 3, 'А-С/Зал'), (1, 3, 3, 4, 'А-Л-203'),
--Четверг--
(1, 4, 17, 2, 'Н-322'), (1, 4, 9, 3, 'Н-514'), (1, 4, 16, 4, 'Н-316'), (1, 4, 11, 5, 'Н-310'),
--Пятница--
--Суббота--
(1, 6, 10, 2, 'А-301'), (1, 6, 14, 3, 'А-Л-208'), (1, 6, 4, 4, 'А-Л-203'),

--Чет--
--Понедельник--
(2, 1, 6, 2, 'Н-332а'), (2, 1, 4, 3, 'Н-С/Зал'), (2, 1, 13, 4, 'Н-519'), (2, 1, 12, 5, 'Н-405'),
--Вторник--
(2, 2, 9, 2, 'Н-514'), (2, 2, 15, 3, 'Н-227'), (2, 2, 10, 4, 'Н-328'), (2, 2, 17, 5, 'Н-428'),
--Среда--
(2, 3, 16, 1, 'Н-318'), (2, 3, 5, 2, 'Н-226'), 
--Четверг--
--Пятница--
--Суббота--
(2, 6, 4, 2, 'А-Л-203'), (2, 6, 2, 3, 'А-ВЦ-302'), (2, 6, 8, 4, 'А-С/Зал');
--End.