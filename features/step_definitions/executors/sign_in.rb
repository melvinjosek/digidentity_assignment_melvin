#sign_in.rb

require 'page-object'

class SignInPage
  include PageObject
	REGISTERBTN = { css: 'a[href=\'/register\']'  }

	attr_reader :driver

  def initialize(driver)
    @driver = driver
	wait = Selenium::WebDriver::Wait.new(:timeout => 15)
	wait.until { driver.find_element(REGISTERBTN) }
  end
  
  def select_register()
	driver.find_element(REGISTERBTN).click
  end
end