-- write your queries here

-- 1. Show all owners and their vehicles (including owners with no vehicles)
SELECT *
FROM owners o
LEFT JOIN vehicles v
ON o.id = v.owner_id;

-- 2. Count of vehicles per owner
SELECT o.first_name, o.last_name, COUNT(v.id) AS count
FROM owners o
LEFT JOIN vehicles v
ON o.id = v.owner_id
GROUP BY o.id
ORDER BY o.first_name ASC;

-- 3. Count vehicles and average price per owner (average as integer), filtered
SELECT 
    o.first_name,
    o.last_name,
    CAST(AVG(v.price) AS INT) AS average_price,
    COUNT(v.id) AS count
FROM owners o
LEFT JOIN vehicles v
ON o.id = v.owner_id
GROUP BY o.id
HAVING COUNT(v.id) > 1 AND AVG(v.price) > 10000
ORDER BY o.first_name DESC;

