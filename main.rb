require 'rubygems'
require 'ruby-station'; RubyStation.parse_argv
require 'sinatra'
require 'dm-core'
require 'dm-timestamps'

db_path = File.join(RubyStation.data_dir, "formulae.db")
DataMapper.setup(:default, "sqlite3://#{db_path}")

class Formula
  include DataMapper::Resource

  property :id, Serial
  property :formula, String
  property :result, String
  property :created_at, DateTime

  def time
    self.created_at.strftime("%y/%m/%d %H:%M:%S")
  end
end
DataMapper.auto_upgrade!

get '/screen.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :screen
end

get '/' do
  haml :index
end

post '/calculated' do
  Formula.create({
    :formula => params["formula"],
    :result => params["result"]
  })
  "ok"
end

get '/logs' do
  @formulae = Formula.all(:order => [:created_at.desc])
  haml :logs, :layout => false
end

set :port, RubyStation.port
