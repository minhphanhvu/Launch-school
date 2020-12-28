ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "minitest/reporters"
require 'rack/test'

MiniTest::Reporters.use!

require_relative "../cms.rb"

class CmsTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    # Create directory of content_files inside test directory if not exist
    FileUtils.mkdir_p(get_content_path)
  end

  def create_document(name, content = "")
    File.open(File.join(get_content_path, name), "w") do |file|
      file.write(content)
    end
  end

  def test_index
    create_document "about.md"
    create_document "changes.txt"
    create_document "history.txt"

    get "/"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "history.txt"
    assert_includes last_response.body, "changes.txt"
  end

  def test_file_content
    create_document "history.txt", "1993 - Yukihiro Matsumoto dreams up Ruby."

    get "/history.txt"
    
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "1993 - Yukihiro Matsumoto dreams up Ruby."
  end

  def test_file_not_found
    get "/math.txt"
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_equal 200, last_response.status
    assert_includes last_response.body, "math.txt does not exist."

    get "/"
    refute_includes last_response.body, "math.txt does not exist."
  end

  def test_markdown_content
    create_document "about.md", "# Ruby is...\nA dynamic"

    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Ruby is...</h1>"
    assert_includes last_response.body, "<p>A dynamic"
  end

  def test_edit_get_method
    create_document "changes.txt"

    get "/changes.txt/edit"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea id"
    assert_includes last_response.body, "<input type='submit'"
  end

  def test_edit_post_method
    create_document "changes.txt"

    post "/changes.txt/edit", edit_file_content: "Changes of Ruby:"
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_equal 200, last_response.status
    assert_includes last_response.body, "changes.txt has been updated."

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Changes of Ruby:"
  end

  def test_new 
    get "/new"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, "action="
  end

  def test_create
    post "/create", file_name: "story.txt"
    assert_equal 302, last_response.status
    
    get last_response["Location"]
    assert_includes last_response.body, "story.txt was created."

    get "/"
    assert_includes last_response.body, "story.txt"
  end

  def test_create_empty_name
    post "/create", file_name: ""
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is requied."
  end

  def teardown
    FileUtils.rm_rf(get_content_path)
  end
end
