require 'sinatra'
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'super secret'
end

before do
  session[:paths] = Dir[get_content_path + "/*"]
end

helpers do

  # Get the root path beforehand, may not need and delete later
  def get_root_path
    File.expand_path("..", __FILE__)
  end

  # Get the path to the content directory
  def get_content_path
    get_root_path + "/content_files"
  end

  def get_file_names
    session[:paths].map do |path|
      path.split("/")[-1]
    end
  end

  def exist_file?(file_name)
    get_file_names.include?(file_name)
  end
end

# Index page
get "/" do
  @files = get_file_names

  erb :index, layout: :layout
end

# Add favicon.io path to get redirect this Chrome browser request
get "/favicon.ico" do
  redirect "/"
end

# Return the content of a file
get "/:file_name" do
  file_name = params[:file_name]

  if exist_file?(file_name)
    path_name = session[:paths].select { |path| path.match(file_name) }[0]
    headers["Content-Type"] = "text/plain"
    File.read(path_name)
  else
    session[:error] = "#{file_name} does not exist."
    redirect "/"
  end
end
