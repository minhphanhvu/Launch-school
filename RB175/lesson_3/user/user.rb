require "tilt/erubis"
require 'sinatra'
require "sinatra/reloader" if development?
require 'yaml'

before do
  @yml_text = YAML.load_file 'users.yaml'
  @users = @yml_text.keys
  users_amount, total_interests = count_interests(@yml_text)
  @footer_mes = "There are #{users_amount} with a total of #{total_interests} interests."
end

# @yml_text loaded:
=begin
  {
  :jamy=>{:email=>"jamy.rustenburg@gmail.com", :interests=>["woodworking", "cooking", "reading"]},
  :nora=>{:email=>"nora.alnes@yahoo.com", :interests=>["cycling", "basketball", "economics"]},
  :hiroko=>{:email=>"hiroko.ohara@hotmail.com", :interests=>["politics", "history", "birding"]}
  }
=end

helpers do

  def count_interests(yml_hsh)
    users_amount = yml_hsh.length
    total_interests = 0

    yml_hsh.each do |_, hsh|
      total_interests += hsh[:interests].size
    end

    [users_amount, total_interests]
  end
end

get "/" do
  @title = "List of users"

  erb :home
end

get "/:name" do
  name = params[:name]
  @user_name = name

  user_symbol = name.to_sym
  redirect "/" if !@users.include?(name.to_sym)
  @user_interests = @yml_text[user_symbol][:interests].join(", ")
  @user_email = @yml_text[user_symbol][:email]
  @users = @users.select! { |user| user != user_symbol }

  erb :user
end

not_found do
  redirect "/"
end
