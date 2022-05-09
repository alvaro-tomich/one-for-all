SELECT
   art.nome_artista AS artista,
   alb.nome_album AS album 
FROM
   SpotifyClone.artista AS art 
   INNER JOIN
      SpotifyClone.album AS alb 
      ON art.artista_id = alb.artista 
WHERE
   art.nome_artista = "Walter Phoenix" 
ORDER BY
   album;