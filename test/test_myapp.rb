require 'minitest/unit'
require 'rack/test'
require_relative '../app'
MiniTest::Unit.autorun

class MyAppTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end

  def test_root
    get '/'
    assert last_response.ok?
  end

  def test_add_woa_route
    get '/add_woa'
    assert last_response.ok?
  end

  def test_add_woa
    before_count = WorkOutOccasion.count
    before_count_exercise = Exercise.count
    post '/add_woa', :name => "test", :set => 10,
                      :rep => 10, :weight => 10,
                      :date => "2011-12-12", :woa_id => ""
    assert_equal before_count + 1, WorkOutOccasion.count 
    assert_equal before_count_exercise + 1, Exercise.count 
  end
end
