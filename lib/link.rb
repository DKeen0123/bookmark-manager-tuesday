require 'pg'
require 'net/http'

class Link

  attr_reader :id, :url
  def initialize(row)
    @id = row[0]
    @url = row[1]
  end

  def self.all
    p result = DatabaseConnection.query("SELECT * FROM links")
    arr = []
    result.each_row { |row| arr.push(Link.new(row)) }
    p arr
  end

  def self.add(new_link)
    if Link.valid?(new_link)
      DatabaseConnection.query("INSERT INTO links(url) VALUES('#{new_link}')")
    else
      false
    end
  end

  def self.valid?(url)
    url = URI(url)
    res = Net::HTTP.get_response(url)
    res.code == "301" || "302" || "200"
    rescue
      false
  end
end
