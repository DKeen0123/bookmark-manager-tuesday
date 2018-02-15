require 'sinatra/base'
require './lib/link'
require 'pg'
require './spec/database_connection_setup'
require 'net/http'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/new' do
     redirect '/' unless !Link.add(params[:bookmark])
     flash[:notice] = "That is not a valid URL." unless Link.add(params[:bookmark])
  end

end
