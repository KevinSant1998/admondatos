--University DB MYSQL

--1.Realizar una consulta donde pueda obtener los paises donde estan ubicadas cada universidad.
SELECT u.university_name, c.country_name
FROM universities.university AS u
JOIN universities.country AS c ON u.country_id = c.id;

--2. Conocer cuantas universidades hay en cada pais.
SELECT c.country_name, COUNT(u.id) AS num_universities
FROM universities.country AS c
LEFT JOIN universities.university AS u ON c.id = u.country_id
GROUP BY c.country_name;

--3. Conocer cuantos paises no tienen universidades en el ranking.
SELECT COUNT(c.id) AS num_paises_sin_universidades
FROM universities.country AS c
LEFT JOIN universities.university AS u ON c.id = u.country_id
WHERE u.country_id IS NULL;

--4. Mostrar los criterios de cada tipo de ranking.
SELECT rs.system_name AS ranking_system, rc.criteria_name AS ranking_criteria
FROM universities.ranking_system AS rs
JOIN universities.ranking_criteria AS rc ON rs.id = rc.ranking_system_id;

--5. Conocer el ranking que tiene mas criterios
SELECT rs.system_name AS ranking_system, COUNT(rc.id) AS criteria_count
FROM universities.ranking_system AS rs
JOIN universities.ranking_criteria AS rc ON rs.id = rc.ranking_system_id
GROUP BY rs.id, rs.system_name
ORDER BY criteria_count DESC;

--6. Cual es el top de universidades de forma descendente del ano 2012 por cada criterio
SELECT rc.criteria_name AS criteria, u.university_name AS university, ury.score
FROM universities.ranking_criteria AS rc
JOIN universities.university_ranking_year AS ury ON rc.id = ury.ranking_criteria_id
JOIN universities.university AS u ON ury.university_id = u.id
WHERE ury.year = 2012
ORDER BY rc.criteria_name, ury.score DESC;

--7. Mostrar las 5 universidad con mas cantidades de score 100 del ranking tipo 'Center for World University Rankings'
SELECT u.university_name, COUNT(ury.score) AS score_count
FROM universities.university AS u
JOIN universities.university_ranking_year AS ury ON u.id = ury.university_id
JOIN universities.ranking_criteria AS rc ON ury.ranking_criteria_id = rc.id
JOIN universities.ranking_system AS rs ON rc.ranking_system_id = rs.id
WHERE rs.system_name = 'Center for World University Rankings' AND ury.score = 100
GROUP BY u.university_name
ORDER BY score_count DESC
LIMIT 5;

--8. Mostrar que paises se posicionaron con universidades con un score mayor a 90
SELECT c.country_name
FROM universities.university_ranking_year AS ury
JOIN universities.university AS u ON ury.university_id = u.id
JOIN universities.country AS c ON u.country_id = c.id
WHERE ury.score > 90
GROUP BY c.country_name;

--9. Mostrar las universidades que utilizan los criterios del tipo ranking 'Shangai Ranking'
SELECT u.university_name
FROM universities.university AS u
JOIN universities.university_ranking_year AS ury ON u.id = ury.university_id
JOIN universities.ranking_criteria AS rc ON ury.ranking_criteria_id = rc.id
JOIN universities.ranking_system AS rs ON rc.ranking_system_id = rs.id
WHERE rs.system_name = 'Shanghai Ranking';

--10. Mostrar el top 10 de las peores posiciones del tipo ranking 'Times Higher....'
SELECT u.university_name, ury.score
FROM universities.university AS u
JOIN universities.university_ranking_year AS ury ON u.id = ury.university_id
JOIN universities.ranking_criteria AS rc ON ury.ranking_criteria_id = rc.id
JOIN universities.ranking_system AS rs ON rc.ranking_system_id = rs.id
WHERE rs.system_name = 'Times Higher'
ORDER BY ury.score ASC
LIMIT 10;

