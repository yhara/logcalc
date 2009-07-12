require 'rubygems'
require 'ruby-station'; RubyStation.parse_argv
require 'sinatra'

get '/screen.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :screen
end

get '/' do
  haml :index
end

set :port, RubyStation.port
