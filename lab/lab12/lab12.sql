.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = 'blue' AND pet = 'dog';


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color AS person1, b.color AS person2
    FROM students AS a, students AS b
    WHERE (a.song = b.song) AND (a.pet = b.pet) AND a.number <> b.number AND a.time < b.time;


CREATE TABLE sevens AS
  SELECT seven FROM students WHERE students.number = 7 AND           
    (SELECT '7' FROM numbers WHERE (
      numbers.time = students.time AND numbers.'7' = 'True') 
    );

CREATE TABLE favpets AS
  SELECT pet, COUNT(*) FROM students GROUP BY pet ORDER BY COUNT(*) desc LIMIT 10;

CREATE TABLE dog AS
  SELECT pet, COUNT(*) FROM students where pet = 'dog';


CREATE TABLE bluedog_agg AS
  SELECT song, COUNT(*) FROM bluedog_songs GROUP BY song ORDER BY COUNT(*) desc LIMIT 5;


CREATE TABLE instructor_obedience AS
  SELECT seven, instructor, COUNT(*) FROM students WHERE 
    seven = '7' GROUP BY instructor;


CREATE TABLE smallest_int_having AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE smallest_int_count AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

