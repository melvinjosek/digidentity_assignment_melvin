require 'selenium/webdriver'

capabilities = Selenium::WebDriver::Remote::Capabilities.new
chromedriverpath = File.join(File.dirname(__FILE__),'/chromedriver.exe')
Selenium::WebDriver::Chrome.driver_path= chromedriverpath
browser = Selenium::WebDriver.for :chrome

Before do |scenario|
	@browser = browser
end

at_exit do
	browser.quit
end