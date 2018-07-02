<img src="https://s3.amazonaws.com/devmountain/readme-logo.png" width="250" align="right">

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

### Summary

The next way to use a primary key is with a nested query/sub-select statement. By using parenthesis we can do a select inside of a select. This is really effective when you have a foreign key link between two tables because now we can filter our main query by criteria on a referenced table.

### Instructions

* Use a sub-select statement to get all tracks from the `Track` table where the `GenreId` is either `Jazz` or `Blues`.

### Solution

<details>

<summary> <code> Sub-Select </code> </summary>

```sql
SELECT * FROM Track 
WHERE GenreId IN ( SELECT GenreId FROM Genre WHERE Name = 'Jazz' OR Name = 'Blues' );
```

</details>

## Setting values to null

### Instructions

* Update `Phone` on the `Employee` table to `null` where the `EmployeeId` is `1`.
* Query the `Employee` table to get the employee you just updated.

### Solution

<details>

<summary> <code> SQL Solutions </code> </summary>

<details>

<summary> <code> Setting to null </code> </summary>

```sql
UPDATE Employee SET Phone = null WHERE EmployeeId = 1;
```

</details>

<details>

<summary> <code> Query the Employee Table </code> </summary>

```sql
SELECT * FROM Employee WHERE EmployeeId = 1;
```

</details>

</details>

## Querying a null value

### Summary

Sometimes you want to know when there is no value. For example, let's use the `Customer` table to figure out which customers do not have a company.

### Instructions

* Get all customers from the `Customer` table who do not have a company.

### Solution

<details>

<summary> <code> No Company Customers </code> </summary>

```sql
SELECT * from Customer WHERE Company IS null;
```

</details>

## Group by

### Summary

How many albums does each artist have? We could count manually, but no! Group by allows us to do aggregate counts.

### Instructions

* Select all artist ids, artist names, and count how many albums they have.

### Solution

<details>

<summary> <code> Group By </code> </summary>

```sql
SELECT ar.artistId, ar.name, count(*) 
FROM Artist ar
JOIN Album a ON ar.ArtistId = a.ArtistId 
GROUP BY ar.artistId;
```

</details>

### Challenge

Modify the solution to order the album count by largest to smallest.

## Distinct

### Summary

Distinct is great if you want to get a dataset with no duplicates. 

### Instructions

* Get all countries from the `Customer` table with no duplicates.

### Solution

<details>

<summary> <code> No Duplicate Countries </code> </summary>

```sql
SELECT DISTINCT Country FROM Customer;
```

</details>

## Delete Rows

### Summary

Deleting rows can be dangerous if you are not cautious. Always do a select of what you plan to delete to make sure that you are going to delete the correct records.

### Instructions

* Select all records from the `Customer` table where fax is null;
* Delete all records from the `Customer` table where fax is null;

### Solution

<details>

<summary> <code> SQL Solutions </code> </summary>

<details>

<summary> <code> All null fax numbers </code> </summary>

```sql
SELECT * FROM Customer WHERE Fax IS null;
```

</details>

<details>

<summary> <code> Delete null fax Customers </code> </summary>

```sql
/* The delete won't work since they are children using a foreign key. However, if there wasn't a foreign key, you would successfully delete all Customers WHERE Fax is null */
DELETE FROM Customers WHERE Fax IS null;
```

</details>

</details>

## Contributions

If you see a problem or a typo, please fork, make the necessary changes, and create a pull request so we can review your changes and merge them into the master repo and branch.

## Copyright

© DevMountain LLC, 2017. Unauthorized use and/or duplication of this material without express and written permission from DevMountain, LLC is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to DevMountain with appropriate and specific direction to the original content.

<p align="center">
<img src="https://s3.amazonaws.com/devmountain/readme-logo.png" width="250">
</p>
