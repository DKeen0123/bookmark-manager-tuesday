require 'pg'
require 'net/http'

class Link

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.column_values(1)
  end

  def self.add(new_link)
    if Link.valid?(new_link)
      DatabaseConnection.query("INSERT INTO links(url) VALUES('#{new_link}')")
    else
      false
    end
  end

  def self.valid?(url)
    p url = URI(url)
    # p Net::HTTP.get(url)
    res = Net::HTTP.get_response(url)
    p res.code == "301" or "302" or "200"
    # Net::HTTP.get(url).include?('<HTML><HEAD>')
    rescue
      false
  end
end
