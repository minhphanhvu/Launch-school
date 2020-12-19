require 'tilt/erubis'
require "sinatra"
require "sinatra/reloader" if development?

before do
  @chapters = File.readlines 'data/toc.txt'
end

helpers do

  def in_paragraphs(chapter)
    chapter.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end

  def strong_tag(search_query, text)
    text.gsub(search_query, "<strong>#{search_query}</strong>")
  end

end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number]
  redirect "/" unless (1..@chapters.size).cover? number

  @chapter = File.read "data/chp#{number}.txt"
  @title = "Chapter #{number}: #{@chapters[number.to_i - 1]}" 
  @chapter_number = number

  erb :chapter
end

def each_chapter
  @chapters.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

def chapters_matching(query)
  results = []

  return results unless query

  each_chapter do |number, name, contents|
    matches = {}
    contents.split("\n\n").each_with_index do |paragraph, index|
      matches[index] = paragraph if paragraph.include?(query)
    end
    results << {number: number, name: name, paragraphs: matches} if matches.any?
  end

  results
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

not_found do
  redirect "/"
end
