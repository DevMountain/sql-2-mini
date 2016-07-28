# intermediate-sql-queries

For today we will be practicing inserting and querying data using SQL.

Here is a website that will let us write queries to interact with some data.  [http://jxs.me/chinook-web/](http://jxs.me/chinook-web/)

On the left are the Tables with their fields.  The right is where we will be writing our queries.  The bottom is where we will see our results.  

## Add foreign key to new table

When creating tables we can specify a column as having a foreign key.

The datatype of our column must match the datatype of the column we are linking to (Usually a primary key which is usually an integer).

Create a new table called movies with an id, title and mediaTypeId.
Make mediaTypeId a foreign key to the MediaType table on the MediaTypeId column. 

```
CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT,
  	mediaTypeId INTEGER, 
    FOREIGN KEY(mediaTypeId) REFERENCES MediaType(MediaTypeId)
);
```

Test this by adding a movie with a title and a mediaTypeId.

```
insert into movies (title, mediaTypeId) values ("Aladdin", 3)
```

Now query the movies table using a simple select statement and you should see your movie.

## Add foreign key to existing table

We can also add a foreign key to an existing table. Let's add one to our movies table that references genre on genreId

```
ALTER TABLE movies ADD COLUMN genreId INTEGER REFERENCES Genre(GenreId);
```

Query your movies table and you will see that the same row is now returned with an extra column.

## Update Rows

We don't want to leave genre null so let's add a value using the update command.  With an update command you always want to use a where clause (if you don't you will overwrite data on all records).

```
update movies set genreId=22 where id=1
```

## Use a join

Now that we know how to make foreign keys and change data let's do some practice queries.  The simplest way to use a foreign key is via a join statement. 

Let's join the artist and album tables so we can list the artist name next to each album name.

```
select a.title, ar.Name from album a join artist ar on a.ArtistId=ar.ArtistId
```

## Use a nested query/sub-select

The next way to use a primary key is with a nested query/sub-select statement.  By using parenthesis we can do a select inside of a select.  This is really effective when you have a foreign key link between two tables because now we can filter our main query by criteria on a referenced table.

```
select * from Track where GenreId in (select GenreId from Genre where Name='Jazz' OR Name='Blues')
```

We just got all data from Track where the track was pointing to a record in the genre table that happend to be either Jazz or Blues.

The subquery `(select GenreId from Genre where Name='Jazz' OR Name='Blues')` returns an array of GenreId.

Our parent query then checks for Tracks where the Track Genre is in that array `where GenreId in `

## Set a value to null

Sometimes we want to remove values.  Try this then select on the Employee table and look at the first Employee

```
update Employee set Phone=null where EmployeeId=1
```

## Query a null value

Sometimes you want to know when there is no value.  What if wanted to know all customers that purchased for themselves and not a company.   

If you try this what do you see?

```
select * from customer where company = null
```

This, this works: 

```
select * from customer where company is null
```


## Group by

How many albums does each artist have?  We could count manually, but no!  Let's use a group by to do some aggregate counts for us.

Select all artist ids, artist names, and a count of how many albums they have.

```
select ar.artistId, ar.name, count(*) from artist ar join album a on ar.ArtistId=a.ArtistId group by ar.artistId
```

#### challenge
Order this by album count, largest first

## Use Distinct

We have hundreds of customers and want to know which countries our customers come from, but no duplicates!

```
select distinct country from customer
```

## Delete Rows

Always do a select before a delete to make sure you get back exactly what you want and only what you want to delete!

```
select * from customer where fax is not null
```

Then replace the `select *` with a `delete` and you're safely deleting rows.

```
delete from customer where fax is not null
```
