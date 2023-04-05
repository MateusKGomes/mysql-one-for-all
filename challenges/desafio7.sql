SELECT ar.artista AS artista, al.album AS album, COUNT(s.artista_id) AS pessoas_seguidoras
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al
	ON SpotifyClone.ar.artista_id = SpotifyClone.al.artista_id
INNER JOIN SpotifyClone.seguindo_artistas AS s
	ON SpotifyClone.al.artista_id = SpotifyClone.s.artista_id
	GROUP BY artista, album
	ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;