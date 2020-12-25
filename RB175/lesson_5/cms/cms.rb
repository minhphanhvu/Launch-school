require 'sinatra'
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"

before do
  
  def get_root_path
    File.expand_path("..", __FILE__)
  end

  def get_content_path
    get_root_path + "/content_files"
  end

end

get "/" do
  # Dir.glob() is fine too + File.basename() method
  @files = Dir[get_content_path + "/*"].map do |file|
    file.split("/")[-1]
  end

  erb :index, layout: :layout
end