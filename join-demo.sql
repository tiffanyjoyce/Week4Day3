SELECT * FROM artist;

SELECT * FROM favorite_song;

-- INNER JOIN

-- LEFT TABLE (FROM clause)
-- RIGHT TABLE (JOIN clause)

SELECT *
FROM artist
INNER JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id
-- parent, chile style relationship here

SELECT * FROM artist;

-- lets flip the order

SELECT *
FROM artist
INNER JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id

SELECT song_name, artist_name, album -- this is what we see(columns)
FROM favorite_song
INNER JOIN artist
ON favorite_song.artist_id = artist.artist_id

SELECT song_name, album, artist_name
FROM favorite_song;

SELECT song_name, album, artist_name
FROM artist;

SELECT artist_name
FROM artist
WHERE artist_id = 2;

-- LEFT JOIN
SELECT song_name, artist_name, album
FROM artist
LEFT JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id

-- REVERSE LEFT JOIN AKA RIGHT JOIN 
SELECT song_name, artist_name, album
FROM favorite_song
LEFT JOIN artist
ON favorite_song.artist_id = artist.artist_id

-- RIGHT JOIN
SELECT song_name, artist_name, album
FROM artist
RIGHT JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id

-- REVERSE RIGHT JOIN AKA LEFT JOIN 
SELECT song_name, artist_name, album
FROM favorite_song
RIGHT JOIN artist
ON favorite_song.artist_id = artist.artist_id

-- its all realtive!

-- FULL JOIN AKA OUTER JOIN
SELECT song_name, artist_name,album
FROM artist
FULL JOIN favorite_song
ON artist.artist_id = favorite_song.artist_id

-- dont forget we can alias

SELECT song_name, artist_name, album
FROM artist AS a
FULL JOIN favorite_song AS f_s
on a.artist_id =  f_s.artist_id
WHERE song_name LIKE 'Y%'
ORDER BY album;