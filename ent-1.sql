CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(50)
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    creator_id INT REFERENCES users(id),
    title VARCHAR(30),
    text_ TEXT
);

CREATE TABLE user_posts (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);
INSERT INTO users (first_name, last_name, email) 
VALUES ('Emiliano', 'Meza', 'emiliano@gmail.com'),
('Juan', 'Ballesteros', 'juan@gmail.com'),
('Carlos', 'Montreal', 'carlos@gmail.com');
INSERT INTO posts (creator_id, title, text_)
VALUES (1, 'Post 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(2, 'Post 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(3, 'Post 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(1, 'Post 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(2, 'Post 5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.');
ALTER TABLE user_posts RENAME TO likes;
INSERT INTO likes (post_id)
VALUES (1),
(2),
(3),
(4),
(5);
SELECT p.*, u.first_name, u.last_name, u.email
FROM posts p
JOIN users u ON p.creator_id = u.id;
SELECT p.*, u.first_name, u.last_name, u.email
FROM posts p
JOIN likes l ON p.id = l.post_id
JOIN users u ON l.user_id = u.id;

