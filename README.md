<img src="https://devmounta.in/img/logowhiteblue.png" width="250" align="right">

# Project Summary

In this project, we'll continue to use <a href="http://jxs.me/chinook-web/" target="_blank">Chinook</a> to create more intermediate SQL queries.

## Foreign Keys - New Table

### Summary

When creating tables we can specify a column as having a foreign key. The datatype of our column must match the datatype of the column we are linking to. The most common foriegn key is a primary key which is usually an integer.

### Instructions 

* Create a new table called `Movie` with an `ID`, `Title`, and `MediaTypeId`.
  * Make `MediaTypeId` a foreign key to the `MediaTypeId` column on the `MediaType` table.
* Add a new entry into the `Movie` table with a `Title` and `MediaTypeId`.
* Query the `Movie` table to get your entry.

### Solution

<details>

<summary> <code> SQL Solutions </code> </summary>

<details>

<summary> <code> Create Movie Table </code> </summary>

```sql
CREATE TABLE Movie (
  ID INTEGER PRIMARY KEY,
  Title TEXT,
  MediaTypeId INTEGER, 
  FOREIGN KEY(MediaTypeId) REFERENCES MediaType(MediaTypeId)
);
```

</details>

<details>

<summary> <code> Add Movie </code> </summary>

```sql
INSERT INTO Movie ( Title, MediaTypeId ) VALUES ( "Aladdin", 3 );
```

</details>

<details>

<summary> <code> Query Movie Table </code> </summary>

```sql
SELECT * FROM Movie;
```

</details>

</details>

## Foreign Keys - Existing Table

### Summary

We can also add a foreign key to an existing table. Let's add one to our `Movie` table that references `GenreId` on the `Genre` table.

### Instructions

* Add a new column called `GenreId` that references `GenreId` on the `Genre` table.
* Query the `Movie` table to see your entry.

### Solution

<details>

<summary> <code> SQL Solutions </code> </summary>

<details>

<summary> <code> Add Foreign Key </code> </summary>

```sql
ALTER TABLE Movie ADD COLUMN GenreId INTEGER REFERENCES Genre(GenreId);
```

</details>

<details>

<summary> <code> Query Movie Table </code> </summary>

```sql
SELECT * FROM Movie;
```

</details>

</details>

## Updating Rows

### Summary

We don't want to leave the `GenreId` equal to `null` so let's add a value using the update command. With an update command you always want to use a `WHERE` clause. If you don't you will overwrite data on all records.

### Instructions

* Update the first entry in the `Movie` table to a `GenreId` of `22`.
* Query the `Movie` table to see your entry.

### Solution

<details>

<summary> <code> SQL Solutions </code> </summary>

<details>

<summary> <code> Updating First Entry </code> </summary>

```sql
UPDATE Movie SET GenreId=22 WHERE id=1;
```

</details>

<details>

<summary> <code> Query Movie Table </code> </summary>

```sql
SELECT * FROM Movie;
```

</details>

</details>

## Using Joins

### Summary

Now that we know how to make foreign keys and change data, let's do some practice queries. The simplest way to use a foreign key is via a join statement. 

### Instructions

* Join the `Artist` and `Album` tables to list out the Artist name and Album name.

### Solution

<details>

<summary> <code> Artist and Album Join </code> </summary>

```sql
SELECT a.title, ar.Name 
FROM Album a 
JOIN Artist ar ON a.ArtistId = ar.ArtistId;
```

</details>

## Using nested queries/sub-selects

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

## Contributions

If you see a problem or a typo, please fork, make the necessary changes, and create a pull request so we can review your changes and merge them into the master repo and branch.

## Copyright

© DevMountain LLC, 2017. Unauthorized use and/or duplication of this material without express and written permission from DevMountain, LLC is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to DevMountain with appropriate and specific direction to the original content.

<p align="center">
<img src="https://devmounta.in/img/logowhiteblue.png" width="250">
</p>
