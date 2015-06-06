-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

\connect tournament


-- create players table
DROP TABLE IF EXISTS players CASCADE;
CREATE TABLE players (
	player_id SERIAL PRIMARY KEY, 
	player_name TEXT
);


-- create match table
DROP TABLE IF EXISTS matches CASCADE;
CREATE TABLE matches (
	match_id SERIAL PRIMARY KEY,
	winner INT,
	loser INT,
	FOREIGN KEY (winner) REFERENCES players(player_id),
	FOREIGN KEY (loser) REFERENCES players(player_id)
);

-- create results view
-- show number of wins and matches by player
CREATE VIEW standings AS
SELECT player_id,
	player_name,
	(SELECT count(*) FROM matches WHERE player_id = winner) AS wins,
	(SELECT count(*) FROM matches WHERE player_id IN (winner, loser)) AS matches
FROM players
GROUP BY player_id;