require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  session[:lists] ||= []
end

helpers do

  # Return a message error if list_name is invalid, otherwise nil.
  def error_for_list_name(name)
    if session[:lists].any? { |list| list[:name] == name }
      "List name must be unique."
    elsif !(1..100).cover? name.strip.size
      "List name must be between 1 and 100 characters."
    end
  end

end

get "/" do
  redirect "/lists"
end

# View all the lists
get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# Create a new list
post "/lists" do
  list_name = params[:list_name]

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: params[:list_name], todos: [] }
    session[:success] = "The list has been created"
    redirect "/lists"
  end
end

# Displaying a single todo list
get "/lists/:id" do
  @list = session[:lists][params[:id].to_i]
  erb :list, layout: :layout
end
