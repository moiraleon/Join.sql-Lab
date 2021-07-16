--Join¶
Get all invoices where the unit_price on the invoice_line is greater than $0.99.

select *from invoice_line
where unit_price > .99

Get the invoice_date, customer first_name and last_name, and total from all invoices.

select i.invoice_date, c.first_name, c.last_name
from invoice i
join customer c
on i.invoice_id = c.customer_id


Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers.
Support reps are on the employee table.

select e.last_name, e.first_name, c.first_name, c.last_name
from employee e
join customer c
on e.employee_id = c.customer_id


--------------ALSO
select e.last_name as employee_last, e.first_name as employee_first, c.first_name as customer_first, c.last_name as customer_last
from employee e
join customer c
on e.employee_id = c.support_rep_id


----many more values

Get the album title and the artist name from all albums.

select a.title as album_title, art.name as artist_name
from album a
join artist art
on art.artist_id = a.artist_id


Get all playlist_track track_ids where the playlist name is Music.

select p.playlist_track_id, pl.name 
from playlist_track p
join playlist pl
on p.playlist_id = pl.playlist_id
where pl.name = 'Music'

-----Subquery
select * from playlist
where playlist_id in(
  select playlist_track_id from playlist_track where name = 'Music');


Get all track name`s for `playlist_id 5.

select t.name
from track t
join playlist_track pt
on t.track_id = pt.track_id
where pt.playlist_id = 5;

Get all track name`s and the playlist `name that they’re on ( 2 joins ).

select p.name as playlist_name , t.name as song_name 
from playlist p
join playlist_track pt
on p.playlist_id = pt.playlist_id
join track t
on pt.track_id = t.track_id

Get all track name`s and album `title`s that are the genre `Alternative & Punk ( 2 joins ).

select t.name as track_name, a.title as album_title
from genre g
join track t
on g.genre_id = t.genre_id
join album a
on a.album_id = t.album_id
where g.name = 'Alternative & Punk' 