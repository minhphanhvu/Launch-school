require 'tilt/erubis'
require "sinatra"
require "sinatra/reloader"

get "/" do
  @chapters = File.readlines 'data/toc.txt'
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/1" do
  @title = "Chapter 1" 
  @chapter_1 = File.read 'data/chp1.txt'
  @chapters = File.readlines 'data/toc.txt'

  erb :chapter
end
