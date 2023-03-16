-- DDL
-- Create Artist Table
CREATE TABLE artist(
	artist_id SERIAL PRIMARY KEY,
	artist_name VARCHAR(100),
	record_label VARCHAR(100)
);

-- Create favorite_song table
CREATE TABLE favorite_song(
	song_id SERIAL PRIMARY KEY,
	song_name VARCHAR(100),
	artist_id INTEGER,
	album VARCHAR(50),
	date_published DATE,
	plays INTEGER,
	FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

