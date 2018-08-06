#newprofile.rb

require 'page-object'

class NewProfilePage
  include PageObject
	NAME = { css: '#profile_name'  }
	SURNAME = { css: '#profile_surname'  }
	DOBYEAR = { css: '#profile_date_of_birth_1i'  }
	DOBMONTH = { css: '#profile_date_of_birth_2i'  }
	DOBDAY = { css: '#profile_date_of_birth_3i'  }
	CREATEPROFILEBTN = { css: 'input[value=\'Create Profile\']'  }

	attr_reader :driver

  def initialize(driver)
    @driver = driver
	wait = Selenium::WebDriver::Wait.new(:timeout => 15)
	wait.until { driver.find_element(NAME) }
  end
  
  def fill_name(name)
	driver.find_element(NAME).send_keys(name)
  end
  
  def fill_surname(surname)
	driver.find_element(SURNAME).send_keys(surname)
  end
  
  def fill_dobyear(year)
	driver.find_element(DOBYEAR).send_keys(year)
  end
  
  def fill_dobmonth(month)
	driver.find_element(DOBMONTH).send_keys(month)
  end
  
  def fill_dobday(day)
	driver.find_element(DOBDAY).click
	driver.find_element(DOBDAY).send_keys(day)
	driver.action.send_keys("\n").perform
  end
  
  def select_createprofile()
	driver.find_element(CREATEPROFILEBTN).click
  end
end