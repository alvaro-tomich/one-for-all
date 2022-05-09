SELECT
   u.nome_usuario AS usuario,
   IF(DATE(MAX(h.data_reproducao)) >= '2021-01-01', 'Usuário ativo', 'Usuário inativo') AS condicao_usuario 
FROM
   SpotifyClone.usuario AS u 
   INNER JOIN
      SpotifyClone.historico_reproducao AS h 
      ON u.usuario_id = h.usuario 
GROUP BY
   usuario 
ORDER BY
   usuario;