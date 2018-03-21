require('pg')
require('pry')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

Artist.delete_all()
Album.delete_all()

artist_hash1 = ({'name' => 'Dr Dre'})
artist1 = Artist.new(artist_hash1)
artist1.save()

artist_hash2 = ({'name' => 'Eazy E'})
artist2 = Artist.new(artist_hash2)
artist2.save()
p artist1

album_hash1 = {'title' => 'The Chronic', 'genre' => 'Rap', 'artist_id' => artist1.id}
album1 = Album.new(album_hash1)
album1.save()

album_hash2 = {'title' => 'Eazy Duz It', 'genre' => 'Rap', 'artist_id' => artist2.id}
album2 = Album.new(album_hash1)
album2.save()

album_hash3 = {'title' => '2001', 'genre' => 'Hip Hop', 'artist_id' => artist1.id}
album2 = Album.new(album_hash1)
album2.save()


print album1

Album.all
