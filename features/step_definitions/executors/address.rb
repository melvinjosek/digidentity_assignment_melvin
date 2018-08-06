#address.rb

require 'page-object'

class AddressPage
  include PageObject
	STREET = { css: '#address_street'  }
	HOUSENO = { css: '#address_house_number'}
	POSTCODE = { css: '#address_postcode'}
	CREATEADDRESSBTN = { css: 'input[value=\'Create Address\']'  }

	attr_reader :driver

  def initialize(driver)
    @driver = driver
	wait = Selenium::WebDriver::Wait.new(:timeout => 15)
	wait.until { driver.find_element(CREATEADDRESSBTN) }
  end
  
  def select_create_address()
	driver.find_element(CREATEADDRESSBTN).click
  end
  
  def fill_street(street)
	driver.find_element(STREET).send_keys(street)
  end
  
  def fill_houseno(houseno)
	driver.find_element(HOUSENO).send_keys(houseno)
  end
  
  def fill_postcode(postcode)
	driver.find_element(POSTCODE).send_keys(postcode)
  end
  
end