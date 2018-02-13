require 'pg'

class Link

def self.all
  con = PG.connect dbname: 'bookmark_manager'
  rows = con.exec "SELECT * FROM links"
  rows.column_values(1)
end
end
