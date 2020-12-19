require "tilt/erubis"
require 'sinatra'
require "sinatra/reloader" if development?

get "/" do
  @list = Dir.glob("public/*").map {|file| File.basename(file, ".*") }.sort
  @title = "Dynamic app"
  @list.reverse! if params[:sort] == "desc"

  erb :home
end
