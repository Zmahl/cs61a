CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT a.name AS name, b.size AS size
    FROM dogs AS a, sizes AS b
    WHERE (a.height > b.min AND a.height <= b.max);

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child FROM parents, dogs WHERE parent = name ORDER BY height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child AS sib1, b.child AS sib2
  FROM parents AS a, parents AS b
  WHERE a.parent = b.parent AND a.child < b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || a.sib1 || " plus " || a.sib2 || " have the same size: " || b.size AS sentence
  FROM siblings AS a, size_of_dogs AS b, size_of_dogs as c
  WHERE a.sib1 = b.name AND a.sib2 = c.name AND a.sib2 = c.name AND b.size = c.size;


-- Ways to stack 4 dogs to a height of at least 175, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height, n);

-- Add your INSERT INTOs here

-- https://github.com/yngz/cs61a/blob/master/homework/hw11/hw11.sql

CREATE TABLE stacks AS
  SELECT a.name || ", " || b.name || ", " || c.name || ", " || d.name,
  a.height + b.height + c.height + d.height AS total_height
  FROM dogs AS a, dogs AS b, dogs AS c, dogs AS d
  WHERE a.height + b.height + c.height + d.height > 175
    AND a.height < b.height
    AND b.height < c.height
    AND c.height < d.height
  ORDER BY total_height;


-- Total size for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


-- Heights and names of dogs that are above average in height among
-- dogs whose height has the same first digit.
CREATE TABLE above_average AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


-- non_parents is an optional, but recommended question
-- All non-parent relations ordered by height difference
CREATE TABLE non_parents as
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

