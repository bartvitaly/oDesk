require 'rubygems'
require 'selenium-webdriver'
require 'minitest'
require 'minitest/autorun'

require_relative '../common/WebDriverUtils'
require_relative '../common/PropertyUtils'
class Test1 < MiniTest::Test
  def setup
    propertyUtils = PropertyUtils.new
    url = propertyUtils::get_property("url")

    @driver = WebDriverUtils::new::get_driver
    driver.get url
  end

  def test
    element = @driver.find_element :name => "q"
    element.send_keys "Cheese!"
    element.submit

    puts "Page title is #{driver.title}"

    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.title.downcase.start_with? "cheese!" }

    puts "Page title is #{driver.title}"
    @driver.quit
  end

end