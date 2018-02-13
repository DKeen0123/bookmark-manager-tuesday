require 'sinatra/base'
require './lib/link'
require 'pg'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/new' do
    Link.add(params[:bookmark])
    redirect '/'
  end

end
