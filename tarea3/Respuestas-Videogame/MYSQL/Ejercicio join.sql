SELECT g.id, g.game_name, ge.genre_name
FROM video_games.game AS g
JOIN video_games.genre AS ge ON g.genre_id = ge.id;

ELECT p.platform_name, g.game_name
FROM video_games.platform AS p
JOIN video_games.game_platform AS gp ON p.id = gp.platform_id
JOIN video_games.game AS g ON gp.game_id = g.id;

SELECT g.game_name
FROM video_games.game_platform AS gp
JOIN video_games.game AS g ON gp.id = g.id
WHERE gp.release_year < 2000;

SELECT g.game_name, rs.num_sales
FROM video_games.game AS g
JOIN video_games.region_sales AS rs ON g.id = rs.game_platform_id
JOIN video_games.region AS r ON rs.region_id = r.id
WHERE r.region_name = 'Europa'
ORDER BY rs.num_sales DESC;

SELECT g.game_name, rs.num_sales
FROM video_games.game AS g
JOIN video_games.game_platform AS gp ON g.id = gp.id
JOIN video_games.region_sales AS rs ON gp.id = rs.game_platform_id
JOIN video_games.region AS r ON rs.region_id = r.id
WHERE gp.platform_id = (SELECT id FROM video_games.platform WHERE platform_name = 'Wii')
  AND rs.num_sales < 0.5
  AND gp.release_year >= 2000 AND gp.release_year < 2010;

SELECT g.game_name
FROM video_games.game AS g
JOIN video_games.game_platform AS gp ON g.id = gp.id
JOIN video_games.platform AS p ON gp.platform_id = p.id
WHERE p.platform_name = 'PlayStation';

SELECT g.genre_name, SUM(rs.num_sales) AS total_sales
FROM video_games.game AS gm
JOIN video_games.genre AS g ON gm.genre_id = g.id
JOIN video_games.region_sales AS rs ON gm.id = rs.game_platform_id
JOIN video_games.region AS r ON rs.region_id = r.id
WHERE r.region_name = 'Europe'
GROUP BY g.genre_name
ORDER BY total_sales DESC
LIMIT 5;

SELECT p.publisher_name, SUM(rs.num_sales) AS total_sales
FROM video_games.game_publisher AS gp
JOIN video_games.publisher AS p ON gp.publisher_id = p.id
JOIN video_games.game_platform AS gp2 ON gp.game_id = gp2.id
JOIN video_games.region_sales AS rs ON gp2.id = rs.game_platform_id
JOIN video_games.region AS r ON rs.region_id = r.id
WHERE r.region_name = 'Norteamérica'
GROUP BY p.publisher_name
ORDER BY total_sales DESC;

SELECT p.publisher_name, COUNT(*) AS action_games_count
FROM video_games.game AS g
JOIN video_games.game_publisher AS gp ON g.id = gp.game_id
JOIN video_games.publisher AS p ON gp.publisher_id = p.id
JOIN video_games.genre AS ge ON g.genre_id = ge.id
WHERE ge.genre_name = 'Acción'
GROUP BY p.publisher_name
ORDER BY action_games_count DESC;

SELECT COUNT(*) AS strategy_games_count
FROM video_games.game AS g
JOIN video_games.game_publisher AS gp ON g.id = gp.game_id
JOIN video_games.publisher AS p ON gp.publisher_id = p.id
JOIN video_games.genre AS ge ON g.genre_id = ge.id
WHERE ge.genre_name = 'Estrategia' AND p.publisher_name = 'Microsoft';


