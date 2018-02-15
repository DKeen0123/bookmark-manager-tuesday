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

  post '/delete' do
      Link.delete(params[:id])
      redirect '/'
  end

  post '/update' do
    session[:id] = params[:id]
    redirect '/update'
  end

  get '/update' do
    erb :update
  end

  post '/new' do
     # redirect '/' unless !Link.add(params[:bookmark], params[:title])
     flash[:notice] = "That is not a valid URL." unless Link.add(params[:bookmark], params[:title])
     redirect '/'
  end

  post '/updated' do
    redirect '/' unless !Link.update(session[:id], params[:new_title], params[:new_url])
    flash[:notice] = "That is not a valid URL." unless Link.update(session[:id], params[:new_title], params[:new_url])
  end
end
