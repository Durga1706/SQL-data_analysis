-- 
/* Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. 
   We want to find candidates who are proficient in Python, Tableau, and PostgreSQL.  */

SELECT distinct(candidate_id) FROM candidates where skill in ('Python','Tableau','PostgreSQL') order by candidate_id;

/*  Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").
    Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.
*/

SELECT DISTINCT(p.page_id) FROM pages p join page_likes l on p.page_id!=l.page_id  order by p.page_id;

