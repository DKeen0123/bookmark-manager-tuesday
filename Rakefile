

task :database_setup do
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query('DROP TABLE IF EXISTS links')
  DatabaseConnection.query('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60))')
  DatabaseConnection.query("INSERT INTO links(url) VALUES('http://www.google.com')")
  DatabaseConnection.query("INSERT INTO links(url) VALUES('http://www.twitter.com')")
end
