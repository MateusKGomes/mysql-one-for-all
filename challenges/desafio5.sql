
SELECT c.cancao AS cancao, COUNT(h.cancao_id) AS reproducoes
 FROM SpotifyClone.cancoes AS c
 INNER JOIN SpotifyClone.historico_de_reproducoes AS h
  ON SpotifyClone.c.cancao_id = SpotifyClone.h.cancao_id
   GROUP BY c.cancao
   ORDER BY reproducoes DESC, cancao LIMIT 2;