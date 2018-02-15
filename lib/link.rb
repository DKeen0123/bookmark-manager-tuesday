require 'pg'
require 'net/http'

class Link

  attr_reader :id, :url, :title
  def initialize(row)
    @id = row[0]
    @url = row[1]
    @title = row[2]
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    @arr = []
    result.each_row { |row| @arr.push(Link.new(row)) }
    @arr
  end

  def self.add(new_link, title)
    if Link.valid?(new_link)
      DatabaseConnection.query("INSERT INTO links(url, title) VALUES('#{new_link}', '#{title}')")
    else
      false
    end
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM links WHERE id = '#{id}'")
  end

  def self.update(id, new_title, new_url)
    if Link.valid?(new_url)
      DatabaseConnection.query("UPDATE links SET title = '#{new_title}' WHERE id = '#{id}'")
      DatabaseConnection.query("UPDATE links SET url = '#{new_url}' WHERE id = '#{id}'")
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
