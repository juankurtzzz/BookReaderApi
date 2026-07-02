require "test_helper"

class ReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reading = readings(:one)
  end

  test "should get index" do
    get readings_url, as: :json
    assert_response :success
  end

  test "should create reading" do
    assert_difference("Reading.count") do
      post readings_url, params: { reading: { book_id: @reading.book_id, current_page: @reading.current_page, finished_at: @reading.finished_at, personal_note: @reading.personal_note, rating: @reading.rating, started_at: @reading.started_at, status: @reading.status } }, as: :json
    end

    assert_response :created
  end

  test "should show reading" do
    get reading_url(@reading), as: :json
    assert_response :success
  end

  test "should update reading" do
    patch reading_url(@reading), params: { reading: { book_id: @reading.book_id, current_page: @reading.current_page, finished_at: @reading.finished_at, personal_note: @reading.personal_note, rating: @reading.rating, started_at: @reading.started_at, status: @reading.status } }, as: :json
    assert_response :success
  end

  test "should destroy reading" do
    assert_difference("Reading.count", -1) do
      delete reading_url(@reading), as: :json
    end

    assert_response :no_content
  end
end
