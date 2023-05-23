SELECT p.full_name, e.event_name, c.city_name, g.games_name
FROM olympics.dbo.medal m
JOIN olympics.dbo.competitor_event ce ON ce.medal_id = m.id
JOIN olympics.dbo.games_competitor gc ON gc.id = ce.competitor_id
JOIN olympics.dbo.person p ON p.id = gc.person_id
JOIN olympics.dbo.event e ON e.id = ce.event_id
JOIN olympics.dbo.games g ON g.id = gc.games_id
JOIN olympics.dbo.games_city gcit ON gcit.games_id = g.id
JOIN olympics.dbo.city c ON c.id = gcit.city_id
JOIN olympics.dbo.sport s ON s.id = e.sport_id
WHERE m.medal_name = 'Gold' AND s.sport_name IN ('Football', 'Basketball', 'Golf');

SELECT e.event_name, g.games_name
FROM olympics.dbo.event e
JOIN olympics.dbo.games_competitor gc ON gc.games_id = e.games_id
JOIN olympics.dbo.games g ON g.id = e.games_id
WHERE g.games_year = 2000;

SELECT c.city_name, COUNT(gc.games_id) AS total_olympics
FROM olympics.dbo.city c
JOIN olympics.dbo.games_city gc ON gc.city_id = c.id
GROUP BY c.city_name
ORDER BY total_olympics DESC;

SELECT nr.region_name
FROM olympics.dbo.noc_region nr
LEFT JOIN olympics.dbo.person_region pr ON pr.region_id = nr.id
LEFT JOIN olympics.dbo.games_competitor gc ON gc.person_id = pr.person_id
LEFT JOIN olympics.dbo.games g ON g.id = gc.games_id
WHERE g.games_year >= YEAR(GETDATE()) - 10
GROUP BY nr.region_name
HAVING COUNT(gc.id) = 0;

SELECT nr.region_name, COUNT(medal.id) AS total_medals
FROM olympics.dbo.noc_region nr
JOIN olympics.dbo.person_region pr ON pr.region_id = nr.id
JOIN olympics.dbo.games_competitor gc ON gc.person_id = pr.person_id
JOIN olympics.dbo.medal ON medal.id = gc.medal_id
WHERE medal.medal_name IN ('Gold', 'Silver', 'Bronze')
GROUP BY nr.region_name
ORDER BY total_medals DESC;

SELECT e.event_name, COUNT(gc.id) AS total_participants
FROM olympics.dbo.event e
JOIN olympics.dbo.competitor_event ce ON ce.event_id = e.id
JOIN olympics.dbo.games_competitor gc ON gc.id = ce.competitor_id
GROUP BY e.event_name
ORDER BY total_participants DESC;

SELECT s.sport_name
FROM olympics.dbo.sport s
WHERE NOT EXISTS (
  SELECT g.id
  FROM olympics.dbo.games g
  WHERE NOT EXISTS (
    SELECT e.id
    FROM olympics.dbo.event e
    WHERE e.sport_id = s.id
    AND e.id IN (
      SELECT ce.event_id
      FROM olympics.dbo.competitor_event ce
      JOIN olympics.dbo.games_competitor gc ON gc.id = ce.competitor_id
      WHERE gc.games_id = g.id
    )
  )
);

SELECT p.gender, COUNT(*) AS total_medals
FROM olympics.dbo.person p
JOIN olympics.dbo.games_competitor gc ON gc.person_id = p.id
JOIN olympics.dbo.competitor_event ce ON ce.competitor_id = gc.id
GROUP BY p.gender;

SELECT p.height, p.weight, COUNT(*) AS frequency
FROM olympics.dbo.person p
JOIN olympics.dbo.games_competitor gc ON gc.person_id = p.id
JOIN olympics.dbo.competitor_event ce ON ce.competitor_id = gc.id
JOIN olympics.dbo.event e ON e.id = ce.event_id
JOIN olympics.dbo.sport s ON s.id = e.sport_id
WHERE s.sport_name = 'Boxing'
GROUP BY p.height, p.weight
ORDER BY COUNT(*) DESC;

SELECT p.id, p.full_name, p.age
FROM olympics.dbo.person p
JOIN olympics.dbo.games_competitor gc ON gc.person_id = p.id
WHERE p.age < 18;




