--answers to read me file

--syntax hint

SELECT [Column names] 
FROM [table] [abbv]
JOIN [table2] [abbv2] ON abbv.prop = abbv2.prop WHERE [Conditions];

SELECT a.name, b.name FROM some_table a JOIN another_table b ON a.some_id = b.some_id;
SELECT a.name, b.name FROM some_table a JOIN another_table b ON a.some_id = b.some_id WHERE b.email = 'e@mail.com';

--Get all invoices where the unit_price on the invoice_line is greater than $0.99.

SELECT *
FROM invoice i
JOIN invoice_line il ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;

--Get the invoice_date, customer first_name and last_name, and total from all invoices.

SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id;

--Get the customer first_name and last_name and the support rep's first_name and last_name from all customers.
--Support reps are on the employee table.

select customer.first_name, customer.last_name, employee.first_name, employee.last_name from customer
join employee on employee.employee_id = customer.support_rep_id;

--Get the album title and the artist name from all albums.

SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id;

--Get all playlist_track track_ids where the playlist name is Music.

select playlist_track.track_id 
from playlist_track
join playlist on (playlist.playlist_id = playlist_track.playlist_id)
where playlist.name = 'Music';


--Get all track names for playlist_id 5.

select track.name 
from track 
join playlist_track on (playlist_track.track_id = track.track_id)
where playlist_track.track_id = 5;


--Get all track names and the playlist name that they're on ( 2 joins ).

select track.name, playlist.name 
from track
join playlist_track on (playlist_track.track_id = track.track_id)
join playlist on (playlist_track.playlist_id = playlist.playlist_id);

--Get all track names and album titles that are the genre Alternative & Punk ( 2 joins )

select track.name, album.title 
from track 
join album on (album.album_id = track.album_id)
join genre on (genre.genre_id = track.genre_id)
where genre.name = 'Alternative & Punk';
 
 --black diamond
 --Get all tracks on the playlist(s) called Music and show their name, genre name, album name, and artist name.
--At least 5 joins.



