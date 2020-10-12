-- SELECT * FROM album
-- ORDER BY album_id ASC
-- LIMIT 5;

-- SELECT MAX(total) FROM invoice;

-- SELECT customer_id, SUM(total) from invoice
-- GROUP BY customer_id
-- ORDER BY customer_id ASC;

-- SELECT name FROM genre
-- WHERE name ILIKE '_o%';

-- SELECT * FROM invoice
-- WHERE billing_postal_code IS NOT NULL;

-- SELECT DISTINCT customer_id FROM invoice
-- ORDER BY customer_id ASC;

-- ALTER TABLE genre
-- ADD COLUMN ducks TEXT;

-- ALTER TABLE genre
-- ALTER ducks
-- SET DATA TYPE VARCHAR(250);

-- ALTER TABLE hit_tracks
-- RENAME COLUMN name TO "hit_track_name";

-- ALTER TABLE hit_tracks
-- ALTER hit_track_name
-- TYPE VARCHAR(125);

-- CREATE TABLE artist_fav_color (
--     artist_fav_color_id SERIAL PRIMARY KEY,
--   color TEXT,
--   artist_id INTEGER REFERENCES artist(artist_id)
-- );

-- INSERT INTO artist_fav_color (color, artist_id)
-- VALUES
--     ('red', 8),
--   ('orange', 33),
--   ('pink', 36);

-- SELECT a.name, afc.color FROM artist_fav_color afc
-- JOIN artist a ON a.artist_id = afc.artist_id;

-- SELECT name AS artistName FROM artist;

-- I want to get the names of all the artists who have albums that start
-- with the letter 'a'

-- SELECT name FROM artist
-- WHERE artist_id IN (
--   SELECT artist_id FROM album
--     WHERE title ILIKE 'a%'
-- );

-- I want to get the names of all artists who have made songs/tracks that cost
-- more than a dollar
-- SELECT name FROM artist
-- WHERE artist_id IN (
--     SELECT artist_id FROM album
--     WHERE album_id IN (
--         SELECT album_id FROM track
--         WHERE unit_price > 1
-- ));