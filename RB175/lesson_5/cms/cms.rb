require 'sinatra'
require "sinatra/reloader"
require "tilt/erubis"
require 'redcarpet'
require 'yaml'
require 'bcrypt'

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

def get_extensions
  if ENV["RACK_ENV"] != "test"
    YAML.load_file(File.expand_path("..", __FILE__) + "/admin/extensions.yml")
  else
    YAML.load_file(File.expand_path("..", __FILE__) + "/test/extensions.yml")
  end
end

def extension_valid?(file_name)
  extension = File.extname(file_name)
  get_extensions[extension] == true
end

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

def authenticate_user
  if session[:user] != true
    session[:error] = "You must be signed in to do that."
    redirect "/"
  end
end

def users_info
  if ENV["RACK_ENV"] != "test"
    path = File.expand_path("..", __FILE__) + "/admin"
  else
    path = File.expand_path("..", __FILE__) + "/test"
  end
  YAML.load_file(path + "/users.yml")
end

def add_user(yaml_data)
  if ENV["RACK_ENV"] != "test"
    path = File.expand_path("..", __FILE__) + "/admin/users.yml"
  else
    path = File.expand_path("..", __FILE__) + "/test/users.yml"
  end
  File.open(path, 'w') { |f| YAML.dump(yaml_data, f) } 
end

def bcrypt_authentication?(username, password)
  encrypted_password = users_info[username]
  if BCrypt::Password.new(encrypted_password) == password
    true
  else
    false
  end
end

# All URL pathpatterns here.


# Return signup page
get "/users/signup" do
  erb :signup, layout: :layout
end

# Sign a new user up
post "/users/signup" do
  username = params[:username]
  # Don't ask me how to_s works here, I shoot randomly at this
  password = BCrypt::Password.create(params[:password]).to_s

  yaml_data = users_info
  yaml_data[username] = password

  add_user(yaml_data)
  session[:user] = true

  redirect "/"
end

# Signin page
get "/users/signin" do
  erb :signin
end

# Post method sign in
post "/users/signin" do
  username = params[:username]
  password = params[:password]

  if users_info.key?(username) && bcrypt_authentication?(username, password)
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

# Render new document page for the user to enter the content
get "/new" do
  authenticate_user

  erb :new, layout: :layout
end

# Post method to handle new document
post "/create" do
  authenticate_user

  file_name = params[:file_name]

  if empty?(file_name)
    session[:error] = "A name is requied."
    status 422

    erb :new, layout: :layout
  elsif !extension_valid?(file_name)
    session[:error] = "Extension or file name is not supported."
    status 422

    erb :new, layout: :layout
  else
    f = File.open(File.join(get_content_path, + "#{file_name}"), "w")
    f.close()
    session[:success] = "#{file_name} was created."

    redirect "/"
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

# Duplicate document
post "/:file_name/duplicate" do
  file_name = params[:file_name]
  dup_name = file_name.gsub(".", "_dup.")
  authenticate_user

  old_path = File.join(get_content_path, file_name)
  new_path = File.join(get_content_path, dup_name)
  File.open(new_path, "w+") { |f| f.write(File.read(old_path)) }
  session[:success] = "#{file_name} is successfully duplicated."

  redirect "/"
end

# Delete a document with post method - implement javascript later
post "/:file_name/delete" do
  authenticate_user

  file_name = params[:file_name]
  path_name = get_path_name(file_name)
  File.delete(path_name)
  session[:success] = "#{file_name} was deleted."

  redirect "/"
end

# Render edit page for each corresponding document
get "/:file_name/edit" do
  authenticate_user

  @file_name = params[:file_name]
  @file_content = File.read(get_path_name(@file_name))

  erb :edit, layout: :layout
end

# Edit post method
post "/:file_name/edit" do
  authenticate_user

  content = params[:edit_file_content]
  File.write(get_path_name(params[:file_name]), content)
  session[:success] = "#{params[:file_name]} has been updated."

  # 303 status code if redirect with post, 302 with get method
  # However, Rack::Test will only set 302 no matter what. use 302 writing test cases
  redirect "/"
end
