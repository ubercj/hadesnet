require "application_system_test_case"

class RegistrationsTest < ApplicationSystemTestCase
  # TODO - figure out how to make system tests work without timing out

  setup do
    # client = Selenium::WebDriver::Remote::Http::Default.new
    # client.read_timeout = 120 # seconds
    # driver = Selenium::WebDriver.for :remote, http_client: client
    @zagreus = users(:zagreus)
  end

  test "visiting the index" do
    # visit "/users/sign_in"
    # assert_selector "p", text: "Welcome to HELL"
  end
end
