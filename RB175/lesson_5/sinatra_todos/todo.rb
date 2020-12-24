require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/content_for"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, :escape_html => true
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

  def error_for_todo(name)
    if !(1..100).cover? name.strip.size
      "Todo name must be between 1 and 100 characters."
    end
  end

  def list_complete?(list)
    todos_count(list) > 0 && todos_remaining_count(list) == 0
  end

  def list_class(list)
    list_complete?(list) ? "complete" : "new"
  end

  def todos_remaining_count(list)
    list[:todos].select { |todo| !todo[:completed] }.size
  end

  def todos_count(list)
    list[:todos].size
  end

  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| list_complete?(list) }

    incomplete_lists.each { |list| yield list, lists.index(list) }
    complete_lists.each { |list| yield list, lists.index(list) }
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition { |todo| todo[:completed] }

    incomplete_todos.each { |todo| yield todo, todos.index(todo) }
    complete_todos.each { |todo| yield todo, todos.index(todo) }
  end

  def load_list(index)
    list = session[:lists][index] if index && session[:lists][index]
    return list if list

    session[:error] = "The specified list was not found."
    redirect "/lists"
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
  @list = load_list(params[:id].to_i)
  @list_id = params[:id].to_i
  erb :list, layout: :layout
end

# Edit the list with post
post "/lists/:id" do
  list_name = params[:list_name]
  id = params[:id].to_i
  @list = load_list(id)

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = "The list has been updated."
    redirect "/lists/#{id}"
  end
end

# Edit the list
get "/lists/:id/edit" do
  @list = load_list(params[:id].to_i)
  erb :edit_list, layout: :layout
end

# Delete a todo list
post "/lists/:id/destroy" do
  id = params[:id].to_i
  session[:lists].delete_at(id)
  session[:success] = "The list has been deleted."
  redirect "/lists"
end

# Add a todo to the list
post "/lists/:list_id/todos" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  text = params[:todo].strip

  error = error_for_todo(text)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    @list[:todos] << {name: text, completed: false}
    session[:success] = "The todo was added."
    redirect "/lists/#{@list_id}"
  end
end

# Delete a todo from a list
post "/lists/:list_id/todos/:id/destroy" do
  @list_id = params[:list_id].to_i
  @list = lost_list(@list_id)
  todo_id = params[:id].to_i

  @list[:todos].delete_at(todo_id)
  session[:success] = "The todo has been added."
  redirect "/lists/#{@list_id}"
end

# Mark or unmark a todo from a list
post "/lists/:list_id/todos/:id" do
  @list_id = params[:list_id].to_i
  @list = lost_list(@list_id)
  todo_id = params[:id].to_i

  boolean_complete = params[:completed] == "true"
  @list[:todos][todo_id][:completed] = boolean_complete

  session[:success] = "The todo has been updated."
  redirect "/lists/#{@list_id}"
end

# Complete all todos
post "/lists/:list_id/complete_all" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  @list[:todos].each do |todo|
    todo[:completed] = true
  end
  session[:success] = "All todos are complete."
  redirect "/lists/#{@list_id}"
end