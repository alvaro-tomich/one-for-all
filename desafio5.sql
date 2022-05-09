SELECT
   m.nome_musica AS cancao,
   COUNT(h.musica) AS reproducoes 
FROM
   SpotifyClone.musicas AS m 
   INNER JOIN
      SpotifyClone.historico_reproducao AS h 
      ON m.musica_id = h.musica 
GROUP BY
   cancao 
ORDER BY
   reproducoes DESC,
   cancao LIMIT 2;