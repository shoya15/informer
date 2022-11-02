require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
    assert_select "title", "Home | Informer"
  end

  test "should get about" do
    get welcome_about_url
    assert_response :success
    assert_select "title", "About | Informer"
  end

  test "should get contact" do
    get welcome_contact_url
    assert_response :success
    assert_select "title", "Contact | Informer"
  end
end
