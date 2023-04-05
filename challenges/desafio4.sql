SELECT  u.usuario AS pessoa_usuaria,
	IF(MAX(h.data_reproducao) >= '2021-01-01 00:00:00', 'Ativa', 'Inativa') AS status_pessoa_usuaria
 FROM SpotifyClone.usuarios AS u
 INNER JOIN SpotifyClone.historico_de_reproducoes AS h
 ON SpotifyClone.u.usuario_id = SpotifyClone.h.usuario_id
 GROUP BY u.usuario
 ORDER BY pessoa_usuaria;