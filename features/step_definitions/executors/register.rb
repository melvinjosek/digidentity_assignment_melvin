#register.rb

require 'page-object'

class RegisterPage
  include PageObject
	ACCOUNTEMAIL = { css: '#account_email'  }
	ACCOUNTPASSWORD = { css: '#account_password_digest'  }
	CREATEACCOUNTBTN = { css: 'input[value=\'Create Account\']'  }

	attr_reader :driver

  def initialize(driver)
    @driver = driver
	wait = Selenium::WebDriver::Wait.new(:timeout => 15)
	wait.until { driver.find_element(ACCOUNTEMAIL) }
	wait.until { driver.find_element(CREATEACCOUNTBTN) }
  end
  
  def fill_email(email)
	driver.find_element(ACCOUNTEMAIL).send_keys(email)
  end
  
  def fill_pwd(pwd)
	driver.find_element(ACCOUNTPASSWORD).send_keys(pwd)
  end
  
  def select_createaccount()
	driver.find_element(CREATEACCOUNTBTN).click
  end
end