require 'pg'

con = PG.connect(dbname: 'bookmark_manager_test')
con.exec 'DROP TABLE IF EXISTS links'
con.exec 'CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60))'
con.exec "INSERT INTO links(url) VALUES('http://www.google.com')"
con.exec "INSERT INTO links(url) VALUES('http://www.twitter.com')"
