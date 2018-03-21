require ('pg')
require('pry')
require_relative('../db/sql_runner.rb')
require_relative('album')

class Artist
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options ['name']
    @id = options ['id'].to_i
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map {|artist| Artist.new(artist)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    artists = SqlRunner.run(sql)
  end

  # def self.delete_all()
  #   sql = "DELETE FROM customers"
  #   SqlRunner.run(sql)
  # end























end
