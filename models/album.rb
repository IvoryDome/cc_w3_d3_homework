require ('pg')
require('pry')
require_relative('artist.rb')
require_relative('../db/sql_runner.rb')

class Album
  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @title = options ['title']
    @genre = options ['genre']
    @artist_id = options ['artist_id']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album)}
  end


  def self.delete_all()
    sql = "DELETE FROM albums;"
    albums = SqlRunner.run(sql)
  end

  def display_artist()
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artists_hash = results[0]
    artist = Artist.new(artists_hash)
    return artist
  end

















end
