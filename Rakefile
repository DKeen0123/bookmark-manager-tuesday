require './lib/databaseconnection'
require 'pg'

task :test_database_setup do
  p "Setting up database..."
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query('DROP TABLE IF EXISTS links')
  DatabaseConnection.query('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60))')
  DatabaseConnection.query("INSERT INTO links(url, title) VALUES('http://www.google.com', 'Google')")
  DatabaseConnection.query("INSERT INTO links(url, title) VALUES('http://www.twitter.com', 'Twitter')")
end

task :set_up do
p "Creating databases..."
['bookmark_manager', 'bookmark_manager_test'].each do |database|
  con = PG.connect
  con.exec("CREATE DATABASE #{database}")
  DatabaseConnection.setup("#{database}")
  DatabaseConnection.query('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60))')
  end
end
