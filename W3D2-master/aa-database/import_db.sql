DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies; 
DROP TABLE IF EXISTS question_follows; 
DROP TABLE IF EXISTS questions; 
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
  -- foreign key here if needed 
);

INSERT INTO
  users (fname, lname)
VALUES 
  ('P', 'Dub'),
  ('M', 'Dawg');

CREATE TABLE questions (
  id INTEGER PRIMARY KEY, 
  title TEXT NOT NULL, 
  body TEXT NOT NULL, 
  author_id INTEGER NOT NULL,
  
  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
  questions (title, body, author_id)
VALUES 
  ('HEY DAWG', 'Whats for lunch?', (SELECT id FROM users WHERE fname = 'P' AND lname = 'Dub')),
  ('HEY DOGGO', 'Whats for breakfast?', (SELECT id FROM users WHERE fname = 'P' AND lname = 'Dub')),
  ('HEY PUPPER', 'Whats for dinner?', (SELECT id FROM users WHERE fname = 'P' AND lname = 'Dub')),
  ('HEY DAWGIE', 'Whats a scooby snack?', (SELECT id FROM users WHERE fname = 'P' AND lname = 'Dub')),
  ('HEY DIGITY', 'Why Subway?', (SELECT id FROM users WHERE fname = 'M' AND lname = 'Dawg')),
  ('HEY DIGLETT', 'Why Subway Again?', (SELECT id FROM users WHERE fname = 'M' AND lname = 'Dawg')),
  ('HEY DUGTRIO', 'Why NOT Subway?', (SELECT id FROM users WHERE fname = 'M' AND lname = 'Dawg'));


CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL, 
  question_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);
INSERT INTO 
  question_follows (user_id, question_id)
VALUES 
  ((SELECT id FROM users WHERE lname = 'Dub'), (SELECT id FROM questions WHERE questions.body = "Whats for breakfast?")),
  ((SELECT id FROM users WHERE lname = 'Dub'), (SELECT id FROM questions WHERE questions.body = "Whats for dinner?")),
  ((SELECT id FROM users WHERE lname = 'Dub'), (SELECT id FROM questions WHERE questions.body = "Whats for lunch?")),
  ((SELECT id FROM users WHERE lname = 'Dub'), (SELECT id FROM questions WHERE questions.body = "Why NOT Subway?")),
  ((SELECT id FROM users WHERE lname = 'Dub'), (SELECT id FROM questions WHERE questions.body = "Why Subway Again?")),
  ((SELECT id FROM users WHERE lname = 'Dawg'), (SELECT id FROM questions WHERE questions.body = "Whats for breakfast?")),
  ((SELECT id FROM users WHERE lname = 'Dawg'), (SELECT id FROM questions WHERE questions.body = "Whats for lunch?")),
  ((SELECT id FROM users WHERE lname = 'Dawg'), (SELECT id FROM questions WHERE questions.body = "Whats a scooby snack?"));

CREATE TABLE replies (
  id INTEGER PRIMARY KEY, 
  q_id INTEGER NOT NULL,
  p_id INTEGER,
  u_id INTEGER NOT NULL,
  r_body TEXT NOT NULL,
  
  FOREIGN KEY (q_id) REFERENCES questions(id),
   
  FOREIGN KEY (u_id) REFERENCES users(id)
);

INSERT INTO 
  replies (q_id, p_id, u_id, r_body)
VALUES 
  ((SELECT id FROM questions WHERE questions.body = "Whats a scooby snack?"), NULL, (SELECT id FROM users WHERE lname = "Dawg"), "IT's Yummy dude"),
  ((SELECT id FROM questions WHERE questions.body = "Whats a scooby snack?"), 1, (SELECT id FROM users WHERE lname = "Dub"), "Its for dogs dummy"),
  ((SELECT id FROM questions WHERE questions.body = "Whats a scooby snack?"), 2, (SELECT id FROM users WHERE lname = "Dawg"), "WHAAAAAT?"),
  ((SELECT id FROM questions WHERE questions.body = "Why NOT Subway?"), NULL, (SELECT id FROM users WHERE lname = "Dub"), "SUBWAAAAY"),
  ((SELECT id FROM questions WHERE questions.body = "Why NOT Subway?"), 1, (SELECT id FROM users WHERE lname = "Dawg"), "BECAUSE ITS ERRDAY"),
  ((SELECT id FROM questions WHERE questions.body = "Why NOT Subway?"), 2, (SELECT id FROM users WHERE lname = "Dub"), "Jesus dude");

  
  
  
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  q_id INTEGER NOT NULL,
  u_id INTEGER NOT NULL,
  
  FOREIGN KEY (q_id) REFERENCES questions(id),
  FOREIGN KEY (u_id) REFERENCES users(id)
);

INSERT INTO
  question_likes (q_id, u_id)
VALUES
  ((SELECT id FROM questions WHERE questions.body = "Whats a scooby snack?"), (SELECT id FROM users WHERE lname = "Dawg")),
  ((SELECT id FROM questions WHERE questions.body = "Why NOT Subway?"), (SELECT id FROM users WHERE lname = "Dub"));

