require 'pg'

class Link

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.column_values(1)
  end

  def self.add(new_link)
    DatabaseConnection.query("INSERT INTO links(url) VALUES('#{new_link}')")
  end
end
