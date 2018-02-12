require 'sinatra/base'
require './lib/manager'

class BookmarkManager < Sinatra::Base

  get '/' do
    @manager = Manager.new
    erb :index
  end

end
