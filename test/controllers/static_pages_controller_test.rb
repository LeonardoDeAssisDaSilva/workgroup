require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @title = "Equipes Virtuais"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Ajuda | #{@title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "Sobre | #{@title}"
  end

end
