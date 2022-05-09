SELECT
	COUNT(DISTINCT mus.musica_id) AS cancoes,
	COUNT(DISTINCT art.artista_id) AS artistas,
    COUNT(DISTINCT alb.album_id) AS albuns
FROM 
	SpotifyClone.artista AS art
INNER JOIN 
    SpotifyClone.musicas AS mus
ON 
       mus.artista = art.artista_id
INNER JOIN
    SpotifyClone.album AS alb ON alb.artista = art.artista_id;