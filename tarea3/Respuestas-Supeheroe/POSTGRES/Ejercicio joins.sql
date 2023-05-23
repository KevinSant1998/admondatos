
SELECT s.superhero_name, sp.power_name
FROM superhero.superhero AS s
JOIN superhero.superhero_superpower AS ss ON ss.superhero_id = s.id
JOIN superhero.superpower AS sp ON sp.id = ss.power_id;

SELECT s.superhero_name, COUNT(ss.power_id) AS total_superpowers
FROM superhero.superhero AS s
JOIN superhero.superhero_superpower AS ss ON ss.superhero_id = s.id
GROUP BY s.superhero_name;

SELECT s.superhero_name, sp.power_name, COUNT(*) AS power_count
FROM superhero.superhero AS s
JOIN superhero.superhero_superpower AS ss ON ss.superhero_id = s.id
JOIN superhero.superpower AS sp ON sp.id = ss.power_id
GROUP BY s.superhero_name, sp.power_name
ORDER BY s.superhero_name, power_count desc;

SELECT s.superhero_name
FROM superhero.superhero AS s
LEFT JOIN superhero.superhero_superhero_attribute AS ssa ON ssa.superhero_id = s.id
LEFT JOIN superhero.attribute AS a ON a.id = ssa.attribute_id
WHERE a.attribute_name <> 'Intelligence' OR a.attribute_name IS NULL;

SELECT s.superhero_name
FROM superhero.superhero AS s
JOIN (
  SELECT superhero_id, COUNT(*) AS attribute_count
  FROM superhero.superhero_superhero_attribute
  GROUP BY superhero_id
  HAVING COUNT(*) = 3 OR COUNT(*) = 5
) AS counts ON counts.superhero_id = s.id;

SELECT superhero_name
FROM superhero.superhero
WHERE gender_id = (
  SELECT id
  FROM superhero.gender
  WHERE gender = 'Female'
);

SELECT DISTINCT colour
FROM superhero.colour
WHERE id IN (
  SELECT skin_colour_id
  FROM superhero.superhero
);

SELECT sh.superhero_name, r.race, COUNT(hp.power_id) AS cantidad_superpoderes
FROM superhero.superhero sh
JOIN superhero.race r ON sh.race_id = r.id
LEFT JOIN superhero.hero_power hp ON sh.id = hp.hero_id
GROUP BY sh.superhero_name, r.race

SELECT p.publisher_name, COUNT(sh.id) AS cantidad_superheroes
FROM superhero.superhero sh
JOIN superhero.publisher p ON sh.publisher_id = p.id
JOIN superhero.alignment a ON sh.alignment_id = a.id
WHERE a.alignment = 'Bueno'
GROUP BY p.publisher_name

