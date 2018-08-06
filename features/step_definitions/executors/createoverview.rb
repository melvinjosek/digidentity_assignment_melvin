#createoverview.rb

require 'page-object'

class CreateOverviewPage
  include PageObject
	SUCCESSMESSAGE = { css: '#notice'  }

	attr_reader :driver

  def initialize(driver)
    @driver = driver
	wait = Selenium::WebDriver::Wait.new(:timeout => 15)
	wait.until { driver.find_element(SUCCESSMESSAGE) }
  end
  
  def read_success_message()
	return driver.find_element(SUCCESSMESSAGE).text
  end
end