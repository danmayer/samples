require 'sinatra'
require 'active_record'

require_relative 'models/photo'
require_relative 'models/comment'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'db/sinatra_application.sqlite3.db'
)

set :public_folder, File.dirname(__FILE__) + '/public'
set :root, File.dirname(__FILE__)

use Rack::MethodOverride

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  @authors = ['bruce wayne', 'batman']
  erb :index
end

get '/random' do
  @random = call_me
  erb :random
end

get '/photos' do
  @photos = Photo.all
  erb :photos
end

get '/photos/new' do
  @photo = Photo.new
  erb :photo_new
end

get '/photos/:id' do
  @photo = Photo.find(params[:id])
  @comments = @photo.comments
  erb :photo
end

get '/photos/:id/edit' do
  @photo = Photo.find(params[:id])
  erb :photo_edit
end

post '/comments/create' do
  @photo = Photo.find(params[:photo_id])
  @photo.comments.create(:content => params[:content])
  # Comment.create(:photo_id => @photo.id, :content => params[:content])
  redirect "/photos/#{@photo.id}"
end

post '/photos/:id/update' do
  @photo = Photo.find(params[:id])
  @photo.update_attributes(params['photo'])
  redirect "/photos/#{@photo.id}"
end

post '/photos/create' do
  @photo = Photo.create(params['photo'])
  redirect '/photos'
end

delete '/photos/delete/:id' do
  @photo = Photo.find(params[:id])
  @photo.destroy
  redirect '/photos'
end

def call_me
 rand(10)
end
