require 'sinatra'
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"
require 'redcarpet'

configure do
  enable :sessions
  set :session_secret, 'super secret'
end

before do
  # File.join to use for different OS
  session[:paths] = Dir[File.join(get_content_path, + "*")]
end

# Get the path to the content directory, if run MiniTest, direct it
# to another directory inside test directory
def get_content_path
  if ENV["RACK_ENV"] != "test"
    File.expand_path("..", __FILE__) + "/content_files"
  else
    File.expand_path("..", __FILE__) + "/test/content_files"
  end
end

def render_html(plain_text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(plain_text)
end

helpers do

  def get_file_names
    session[:paths].map { |path| path.split("/")[-1] }
  end

  def exist_file?(file_name)
    get_file_names.include?(file_name)
  end

  def get_path_name(file_name)
    session[:paths].select { |path| path.match(file_name) }[0]
  end

  def load_file(file_name)
    path_name = get_path_name(file_name)
    extension_name = File.extname(path_name)
    if extension_name == '.txt'
      headers["Content-Type"] = "text/plain"
      File.read(path_name)
    elsif extension_name == ".md"
      # erb method to tell browser to interpret as HTML coupled with CSS style
      erb render_html(File.read(path_name))
    end
  end

  def empty?(file_name)
    file_name.strip == ""
  end

end

# Signin page
get "/users/signin" do
  erb :signin
end

# Post method sign in
post "/users/signin" do
  username = params[:username]
  password = params[:password]

  if username == "admin" && password == "secret"
    session[:success] = "Welcome!"
    session[:user] = true
    redirect "/"
  else
    session[:error] = "Invalid Credentials"
    status 422
    erb :signin
  end
end

# Post method sign out
post "/users/signout" do
  session[:user] = false
  session[:success] = "You have been signed out."
  redirect "/"
end

# Index page
get "/" do
  @files = get_file_names

  erb :index, layout: :layout
end

# Add favicon.io path to redirect this Chrome browser request
# Image of favicon.ico has been placed in public directory to avoid this get method
=begin
get "/favicon.ico" do
  redirect "/"
end
=end

# Render new document page for the user to enter the content
get "/new" do
  erb :new, layout: :layout
end

# Post method to handle new document
post "/create" do
  file_name = params[:file_name]
  if !empty?(file_name)
    f = File.open(File.join(get_content_path, + "#{file_name}"), "w")
    f.close()
    session[:success] = "#{file_name} was created."

    redirect "/"
  else
    session[:error] = "A name is requied."
    status 422

    erb :new, layout: :layout
  end
end

# Return the content of a file
get "/:file_name" do
  file_name = params[:file_name]

  if exist_file?(file_name)
    load_file(file_name)
  else
    session[:error] = "#{file_name} does not exist."
    redirect "/"
  end
end

# Delete a document with post method - implement javascript later
post "/:file_name/delete" do
  file_name = params[:file_name]
  path_name = get_path_name(file_name)
  File.delete(path_name)
  session[:success] = "#{file_name} was deleted."

  redirect "/"
end

# Render edit page for each corresponding document
get "/:file_name/edit" do
  @file_name = params[:file_name]
  @file_content = File.read(get_path_name(@file_name))

  erb :edit, layout: :layout
end

# Edit post method
post "/:file_name/edit" do
  content = params[:edit_file_content]
  File.write(get_path_name(params[:file_name]), content)
  session[:success] = "#{params[:file_name]} has been updated."

  # 303 status code if redirect with post, 302 with get method
  # However, Rack::Test will only set 302 no matter what. use 302 writing test cases
  redirect "/"
end
