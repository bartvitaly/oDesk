require 'rubygems'
require 'selenium-webdriver'

require_relative 'PropertyUtils'
class WebDriverUtils
  def get_driver
    propertyUtils = PropertyUtils.new
    browser = propertyUtils::get_property("browser")
    driver = Selenium::WebDriver.for :"#{browser}"
    options = driver::Options.new
    options::delete_all_cookies
  end

end