SELECT ar.artista AS artista, al.album AS album 
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al 
ON SpotifyClone.ar.artista_id = SpotifyClone.al.artista_id
WHERE artista = "Elis Regina"
ORDER BY album;