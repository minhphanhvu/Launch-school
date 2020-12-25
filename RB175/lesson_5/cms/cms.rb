require 'sinatra'
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  
  # Get the root path beforehand, may not need and delete later
  def get_root_path
    File.expand_path("..", __FILE__)
  end

  # Get the path to the content directory
  def get_content_path
    get_root_path + "/content_files"
  end

  session[:paths] = Dir[get_content_path + "/*"]

end

# Index page
get "/" do
  # Dir.glob() is fine too + File.basename() method
  # Dir[] returns a list of all path names
  @files = session[:paths].map do |path|
    path.split("/")[-1]
  end

  erb :index, layout: :layout
end

# Return the content of a file
get "/:file_name" do
  file_name = params[:file_name]
  path_name = session[:paths].select { |path| path.match(file_name) }[0]
  headers["Content-Type"] = "text/plain"

  File.read(path_name)
end