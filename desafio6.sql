SELECT
   UCASE(ROUND(MIN(p.valor_plano), 2)) AS faturamento_minimo,
   UCASE(ROUND(MAX(p.valor_plano), 2)) AS faturamento_maximo,
   UCASE(ROUND(AVG(p.valor_plano), 2)) AS faturamento_medio,
   UCASE(ROUND(SUM(p.valor_plano), 2)) AS faturamento_total 
FROM
   SpotifyClone.plano AS p 
   INNER JOIN
      SpotifyClone.usuario AS u 
      ON p.plano_id = u.plano;