#confirmation.rb

require 'page-object'

class ConfirmationPage
  include PageObject
	CONFIRMBTN = { css: 'input[value=\'Confirm\']'  }

	attr_reader :driver

  def initialize(driver)
    @driver = driver
	wait = Selenium::WebDriver::Wait.new(:timeout => 15)
	wait.until { driver.find_element(CONFIRMBTN) }
  end
  
  def select_create_address()
	driver.find_element(CONFIRMBTN).click
  end
end