/*
 cats must be ordered by name and will enter an elevator one by one. We would like to know what the running total weight is.
 Return: name, running total weight
 Order by: name

Table Schema
Cats:
  name	varchar
  breed	varchar
  weight	float
  color	varchar
  age	int
*/

select name, sum(weight) over(order by name) running_total_weight from cats;

output:
name	running_total_weight
Alfie	5.5
Ashes	10.0
Charlie	14.8
Felix	19.8
Millie	25.2
Misty	30.9
Molly	35.1
Oscar	41.2
Puss	46.3
Smokey	52.4
Smudge	57.3
Tigger	61.1

/*
 The cats must be ordered first by breed and second by name. They are about to enter an elevator one by one. When all the cats of the same breed have entered they leave.

We would like to know what the running total weight of the cats is.

Return: name, breed, running total weight
Order by: breed, name
*/
select name, breed, sum(weight) over(partition by breed order by breed, name) running_total_weight from cats;
output:
name	breed	running_total_weight
Charlie	British Shorthair	4.8
Smudge	British Shorthair	9.7
Tigger	British Shorthair	13.5
Millie	Maine Coon	5.4
Misty	Maine Coon	11.1
Puss	Maine Coon	16.2
Smokey	Maine Coon	22.3
Ashes	Persian	4.5
Felix	Persian	9.5
Molly	Persian	13.7
Alfie	Siamese	5.5
Oscar	Siamese	11.6

/*
 The cats would like to see the average of the weight of them, the cat just after them and the cat just before them.

The first and last cats are content to have an average weight of consisting of 2 cats not 3.

Return: name, weight, average_weight
Order by: weight
*/
select name, weight, avg(weight) over(order by weight rows between 1 preceding and 1 following) average_weight
 from cats;
output:
name	weight	average_weight
Tigger	3.8	4.0
Molly	4.2	4.2
Ashes	4.5	4.5
Charlie	4.8	4.7
Smudge	4.9	4.9
Felix	5.0	5.0
Puss	5.1	5.2
Millie	5.4	5.3
Alfie	5.5	5.5
Misty	5.7	5.8
Oscar	6.1	6.0
Smokey	6.1	6.1

/*
 The cats must be ordered by weight descending and will enter an elevator one by one. We would like to know what the running total weight is.

If two cats have the same weight they must enter separately

Return: name, running total weight
Order by: weight desc
*/
select name, sum(weight) over(order by weight  DESC ROWS between unbounded preceding and current row) running_total_weight from cats;
output:
name	running_total_weight
Smokey	6.1
Oscar	12.2
Misty	17.9
Alfie	23.4
Millie	28.8
Puss	33.9
Felix	38.9
Smudge	43.8
Charlie	48.6
Ashes	53.1
Molly	57.3
Tigger	61.1

-- Note:
-- Use Unbounded Preceding to make sure you don't include extra rows if 2 rows evaluate to the same thing

/*
 The cats form a line grouped by color. Inside each color group the cats order themselves by name. Every cat must have a unique number for its place in the line.

We must assign each cat a unique number while maintaining their color & name ordering.

Return: unique_number, name, color
*/
select row_number() over(order by color,name) unique_number, name, color from cats 
output:
unique_number	name	color
1	Ashes	Black
2	Charlie	Black
3	Molly	Black
4	Oscar	Black
5	Smudge	Black
6	Alfie	Brown
7	Misty	Brown
8	Smokey	Brown
9	Felix	Tortoiseshell
10	Millie	Tortoiseshell
11	Puss	Tortoiseshell
12	Tigger	Tortoiseshell

-- Note:
  -- row_number() lets us index the ordered items. Each number is unique

/*
 We would like to find the fattest cat. Order all our cats by weight.

The two heaviest cats should both be 1st. The next heaviest should be 3rd.

Return: ranking, weight, name
Order by: ranking, name
*/
select rank() over(order by weight desc) ranking, weight, name from cats order by ranking, name;
output:
ranking	weight	name
1	6.1	Oscar
1	6.1	Smokey
3	5.7	Misty
4	5.5	Alfie
5	5.4	Millie
6	5.1	Puss
7	5.0	Felix
8	4.9	Smudge
9	4.8	Charlie
10	4.5	Ashes
11	4.2	Molly
12	3.8	Tigger

-- Note
  -- rank() lets us index the ordered items. Unlike row_number() it allows duplicate numbers.

/*
 For cats age means seniority, we would like to rank the cats by age (oldest first).

However we would like their ranking to be sequentially increasing.

Return: ranking, name, age
Order by: ranking, name
*/
select dense_rank() over(order by age desc) ranking, name, age from cats order by ranking, name;
output:
ranking	name	age
1	Alfie	5
1	Ashes	5
1	Millie	5
2	Charlie	4
2	Smokey	4
2	Smudge	4
3	Felix	2
3	Misty	2
3	Puss	2
3	Tigger	2
4	Molly	1
4	Oscar	1

-- Note:
  -- dense_rank() differs from rank() as it increases sequentially. Consider a race where 2 people finished first. Dense_rank assigns the next person 2nd. Rank assigns them 3rd.

/*
  Each cat would like to know what percentage of other cats weigh less than it

Return: name, weight, percent
Order by: weight
  */
  select name, weight, percent_rank() over(order by weight) * 100 percent from cats;
name	weight	percent
Tigger	3.8	0.0
Molly	4.2	9.1
Ashes	4.5	18.2
Charlie	4.8	27.3
Smudge	4.9	36.4
Felix	5.0	45.5
Puss	5.1	54.5
Millie	5.4	63.6
Alfie	5.5	72.7
Misty	5.7	81.8
Oscar	6.1	90.9
Smokey	6.1	90.9

--Note:
  -- percent_rank() scores everything from 0 - 1 allowing us to generate distributions or percentiles

-- next question ref: https://www.windowfunctions.com/questions/ranking/4
