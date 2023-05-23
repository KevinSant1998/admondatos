SELECT g.game_name, ge.genre_name
FROM video_games.game g
JOIN video_games.genre ge ON g.genre_id = ge.id

SELECT g.game_name, p.platform_name
FROM video_games.game g
JOIN video_games.game_platform gp ON g.id = gp.game_publisher_id
JOIN video_games.platform p ON gp.platform_id = p.id

SELECT g.game_name, gp.release_year
FROM video_games.game g
JOIN video_games.game_platform gp ON g.id = gp.game_publisher_id
WHERE gp.release_year < 2000

SELECT g.game_name, rs.num_sales
FROM video_games.game g
JOIN video_games.game_platform gp ON g.id = gp.id
JOIN video_games.region_sales rs ON gp.id = rs.game_platform_id
JOIN video_games.region r ON rs.region_id = r.id
WHERE r.region_name = 'Europa'
ORDER BY rs.num_sales DESC;

SELECT g.game_name, rs.num_sales
FROM video_games.game g
JOIN video_games.game_platform gp ON g.id = gp.id
JOIN video_games.region_sales rs ON gp.id = rs.game_platform_id
JOIN video_games.platform p ON gp.platform_id = p.id
WHERE p.platform_name = 'Wii'
  AND gp.release_year >= 2000 AND gp.release_year <= 2009
  AND rs.num_sales < 0.5;

SELECT g.game_name
FROM video_games.game g
JOIN video_games.game_platform gp ON g.id = gp.id
JOIN video_games.platform p ON gp.platform_id = p.id
WHERE p.platform_name LIKE '%PlayStation%';

SELECT g.genre_name, SUM(rs.num_sales) AS total_sales
FROM video_games.genre g
JOIN video_games.game ON g.id = game.genre_id
JOIN video_games.game_platform ON game_platform.id = game.genre_id
JOIN video_games.region_sales rs ON rs.game_platform_id = game_platform.id
JOIN video_games.region ON region.id = rs.region_id
WHERE region.region_name = 'Europe'
GROUP BY g.genre_name
ORDER BY total_sales DESC
LIMIT 5;

SELECT p.publisher_name, SUM(rs.num_sales) AS total_sales
FROM video_games.publisher p
JOIN video_games.game_publisher gp ON gp.publisher_id = p.id
JOIN video_games.game_platform gpl ON gpl.id = gp.game_publisher_id
JOIN video_games.region_sales rs ON rs.game_platform_id = gpl.id
JOIN video_games.region r ON r.id = rs.region_id
WHERE r.region_name = 'North America'
GROUP BY p.publisher_name
ORDER BY total_sales DESC;

SELECT p.publisher_name, COUNT(g.id) AS action_games_count
FROM video_games.publisher p
JOIN video_games.game_publisher gp ON gp.publisher_id = p.id
JOIN video_games.game g ON g.id = gp.game_id
JOIN video_games.genre gen ON gen.id = g.genre_id
WHERE gen.genre_name = 'Action'
GROUP BY p.publisher_name
ORDER BY action_games_count DESC
LIMIT 1;

SELECT COUNT(g.id) AS strategy_games_count
FROM video_games.publisher p
JOIN video_games.game_publisher gp ON gp.publisher_id = p.id
JOIN video_games.game g ON g.id = gp.game_id
JOIN video_games.genre gen ON gen.id = g.genre_id
WHERE p.publisher_name = 'Microsoft' AND gen.genre_name = 'Strategy';





