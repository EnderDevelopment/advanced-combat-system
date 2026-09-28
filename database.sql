CREATE TABLE IF NOT EXISTS combat_system (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    wins INT DEFAULT 0,
    losses INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES users(identifier)
);

INSERT INTO combat_system (player_id) SELECT identifier FROM users WHERE identifier NOT IN (SELECT player_id FROM combat_system);