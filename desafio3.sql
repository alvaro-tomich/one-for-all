SELECT
   usu.nome_usuario AS usuario,
   COUNT(DISTINCT his.musica) AS "qtde_musicas_ouvidas",
   ROUND(SUM(mus.duracao_segundos) / 60, 2) AS total_minutos 
FROM
   SpotifyClone.usuario AS usu 
   INNER JOIN
      SpotifyClone.historico_reproducao AS his 
      ON usu.usuario_id = his.usuario 
   INNER JOIN
      SpotifyClone.musicas AS mus 
      ON mus.musica_id = his.musica 
GROUP BY
   usu.nome_usuario;