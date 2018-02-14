require 'pg'

class Link

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect dbname: 'bookmark_manager_test'
    else
      con = PG.connect dbname: 'bookmark_manager'
    end
    result = con.exec "SELECT * FROM links"
    result.column_values(1)
  end

  def self.add(new_link)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect dbname: 'bookmark_manager_test'
    else
      con = PG.connect dbname: 'bookmark_manager'
    end
    con.exec "INSERT INTO links(url) VALUES('#{new_link}')"
  end
end
 
