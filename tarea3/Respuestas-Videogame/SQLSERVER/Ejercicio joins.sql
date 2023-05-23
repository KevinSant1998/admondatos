SELECT g.game_name, ge.genre_name
FROM video_games.dbo.game AS g
JOIN video_games.dbo.game_publisher AS gp ON g.id = gp.game_id
JOIN video_games.dbo.genre AS ge ON g.genre_id = ge.id;

SELECT p.platform_name, g.game_name
FROM video_games.dbo.platform AS p
JOIN video_games.dbo.game_platform AS gp ON p.id = gp.platform_id
JOIN video_games.dbo.game_publisher AS gpub ON gp.game_publisher_id = gpub.id
JOIN video_games.dbo.game AS g ON gpub.game_id = g.id;

SELECT g.game_name
FROM video_games.dbo.game_platform AS gp
JOIN video_games.dbo.game AS g ON gp.id = g.id
WHERE gp.release_year < 2000;

SELECT g.game_name, rs.num_sales
FROM video_games.dbo.game_platform AS gp
JOIN video_games.dbo.region_sales AS rs ON gp.id = rs.game_platform_id
JOIN video_games.dbo.game AS g ON gp.id = g.id
JOIN video_games.dbo.region AS r ON rs.region_id = r.id
WHERE r.region_name = 'Europa'
ORDER BY rs.num_sales DESC;

SELECT g.game_name, rs.num_sales
FROM video_games.dbo.game_platform AS gp
JOIN video_games.dbo.region_sales AS rs ON gp.id = rs.game_platform_id
JOIN video_games.dbo.game AS g ON gp.id = g.id
WHERE gp.platform_id = (SELECT id FROM video_games.dbo.platform WHERE platform_name = 'Wii')
  AND gp.release_year BETWEEN 2000 AND 2009
  AND rs.num_sales < 0.5;

SELECT g.game_name
FROM video_games.dbo.game AS g
JOIN video_games.dbo.game_platform AS gp ON g.id = gp.game_publisher_id
JOIN video_games.dbo.platform AS p ON gp.platform_id = p.id
WHERE p.platform_name = 'PlayStation';

SELECT genre.genre_name, SUM(rs.num_sales) AS total_sales
FROM video_games.dbo.game AS game
JOIN video_games.dbo.genre AS genre ON game.genre_id = genre.id
JOIN video_games.dbo.game_publisher AS gp ON game.id = gp.game_id
JOIN video_games.dbo.game_platform AS gpl ON gp.id = gpl.game_publisher_id
JOIN video_games.dbo.region_sales AS rs ON gpl.id = rs.game_platform_id
JOIN video_games.dbo.region AS region ON rs.region_id = region.id
WHERE region.region_name = 'Europe'
GROUP BY genre.genre_name
ORDER BY total_sales DESC;

SELECT publisher.publisher_name, SUM(rs.num_sales) AS total_sales
FROM video_games.dbo.game AS game
JOIN video_games.dbo.game_publisher AS gp ON game.id = gp.game_id
JOIN video_games.dbo.publisher AS publisher ON gp.publisher_id = publisher.id
JOIN video_games.dbo.game_platform AS gpl ON gp.id = gpl.game_publisher_id
JOIN video_games.dbo.region_sales AS rs ON gpl.id = rs.game_platform_id
JOIN video_games.dbo.region AS region ON rs.region_id = region.id
WHERE region.region_name = 'North America'
GROUP BY publisher.publisher_name
ORDER BY total_sales DESC;

SELECT publisher.publisher_name, COUNT(*) AS total_action_games
FROM video_games.dbo.game AS game
JOIN video_games.dbo.game_publisher AS gp ON game.id = gp.game_id
JOIN video_games.dbo.publisher AS publisher ON gp.publisher_id = publisher.id
JOIN video_games.dbo.genre AS genre ON game.genre_id = genre.id
WHERE genre.genre_name = 'Action'
GROUP BY publisher.publisher_name
ORDER BY total_action_games DESC;

SELECT COUNT(*) AS total_strategy_games
FROM video_games.dbo.game AS game
JOIN video_games.dbo.game_publisher AS gp ON game.id = gp.game_id
JOIN video_games.dbo.publisher AS publisher ON gp.publisher_id = publisher.id
JOIN video_games.dbo.genre AS genre ON game.genre_id = genre.id
WHERE publisher.publisher_name = 'Microsoft' AND genre.genre_name = 'Strategy';






