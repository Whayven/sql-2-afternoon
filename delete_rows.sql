-- Copy, paste, and run the SQL code from the summary.
-- Delete all 'bronze' entries from the table.
DELETE FROM practice_delete 
WHERE type = 'bronze';

-- Delete all 'silver' entries from the table.
DELETE FROM practice_delete 
WHERE type = 'silver';
-- Delete all entries whose value is equal to 150.
DELETE FROM practice_delete 
WHERE value = 150;