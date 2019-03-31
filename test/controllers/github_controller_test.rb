require 'test_helper'

class GithubControllerTest < ActionDispatch::IntegrationTest
  test "should get autoproject" do
    get github_autoproject_url
    assert_response :success
  end

end
