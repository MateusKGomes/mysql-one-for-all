SELECT 
  u.usuario AS pessoa_usuaria,
  COUNT(h.cancao_id) AS musicas_ouvidas,
  ROUND(SUM(c.duracao_segundos) / 60, 2) AS total_minutos
  FROM SpotifyClone.usuarios AS u
		INNER JOIN SpotifyClone.historico_de_reproducoes  AS h
			ON SpotifyClone.u.usuario_id = SpotifyClone.h.usuario_id
            INNER JOIN SpotifyClone.cancoes AS c
            ON SpotifyClone.h.cancao_id = SpotifyClone.c.cancao_id             
            GROUP BY u.usuario
            ORDER BY u.usuario;