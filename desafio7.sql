SELECT
   art.nome_artista AS artista,
   alb.nome_album AS album,
   COUNT(seg.seguidor) AS 'seguidores' 
FROM
   SpotifyClone.artista AS art 
   INNER JOIN
      SpotifyClone.album AS alb 
      ON art.artista_id = alb.artista 
   INNER JOIN
      SpotifyClone.seguidores AS seg 
      ON art.artista_id = seg.artista_id 
GROUP BY
   art.artista_id,
   album 
ORDER BY
   seguidores DESC,
   artista,
   album;