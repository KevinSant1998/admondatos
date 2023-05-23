--University DB POSTGRES

--1.Realizar una consulta donde pueda obtener los paises donde estan ubicadas cada universidad.
SELECT u.university_name, c.country_name
FROM universities.university AS u
JOIN universities.country AS c ON u.country_id = c.id;

--2. Conocer cuantas universidades hay en cada pais.
SELECT c.country_name, COUNT(u.id) AS total_universities
FROM universities.country AS c
LEFT JOIN universities.university AS u ON u.country_id = c.id
GROUP BY c.country_name;

--3. Conocer cuantos paises no tienen universidades en el ranking.
SELECT COUNT(*) AS total_paises_sin_universidades
FROM universities.country AS c
WHERE NOT EXISTS (
  SELECT 1
  FROM universities.university AS u
  WHERE u.country_id = c.id
);

--4. Mostrar los criterios de cada tipo de ranking.
SELECT rs.system_name, rc.criteria_name
FROM universities.ranking_system AS rs
INNER JOIN universities.ranking_criteria AS rc ON rs.id = rc.ranking_system_id

--5. Conocer el ranking que tiene mas criterios
SELECT rs.system_name, COUNT(rc.id) AS num_criteria
FROM universities.ranking_system AS rs
INNER JOIN universities.ranking_criteria AS rc ON rs.id = rc.ranking_system_id
GROUP BY rs.system_name
ORDER BY num_criteria desc;

--6. Cual es el top de universidades de forma descendente del ano 2012 por cada criterio
SELECT rc.criteria_name, u.university_name, ury.score
FROM universities.ranking_criteria AS rc
JOIN universities.university_ranking_year AS ury ON rc.id = ury.ranking_criteria_id
JOIN universities.university AS u ON u.id = ury.university_id
WHERE ury.year = 2012 AND rc.id IN (
  SELECT DISTINCT ranking_criteria_id
  FROM universities.university_ranking_year
  WHERE year = 2012
)
ORDER BY rc.criteria_name, ury.score DESC;

--7. Mostrar las 5 universidad con mas cantidades de score 100 del ranking tipo 'Center for World University Rankings'
SELECT u.university_name, COUNT(*) AS score_count
FROM universities.university_ranking_year AS ury
JOIN universities.university AS u ON u.id = ury.university_id
JOIN universities.ranking_criteria AS rc ON rc.id = ury.ranking_criteria_id
JOIN universities.ranking_system AS rs ON rs.id = rc.ranking_system_id
WHERE rs.system_name = 'Center for World University Rankings' AND ury.score = 100
GROUP BY u.university_name
ORDER BY score_count DESC
LIMIT 5;

--8. Mostrar que paises se posicionaron con universidades con un score mayor a 90
SELECT c.country_name
FROM universities.university_ranking_year AS ury
JOIN universities.university AS u ON u.id = ury.university_id
JOIN universities.country AS c ON c.id = u.country_id
WHERE ury.score > 90
GROUP BY c.country_name;

--9. Mostrar las universidades que utilizan los criterios del tipo ranking 'Shangai Ranking'
SELECT u.university_name
FROM universities.university AS u
JOIN universities.ranking_criteria AS rc ON rc.id = u.ranking_criteria_id
JOIN universities.ranking_system AS rs ON rs.id = rc.ranking_system_id
WHERE rs.system_name = 'Shanghai Ranking';

--10. Mostrar el top 10 de las peores posiciones del tipo ranking 'Times Higher....'
SELECT u.university_name, yr.year, yr.score
FROM universities.university AS u
JOIN universities.university_ranking_year AS yr ON yr.university_id = u.id
JOIN universities.ranking_criteria AS rc ON rc.id = yr.ranking_criteria_id
JOIN universities.ranking_system AS rs ON rs.id = rc.ranking_system_id
WHERE rs.system_name = 'Times Higher'
ORDER BY yr.score ASC
LIMIT 10;




