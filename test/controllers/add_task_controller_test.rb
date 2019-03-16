require 'test_helper'

class AddTaskControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get add_task_index_url
    assert_response :success
  end

end
