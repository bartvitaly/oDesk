require 'rubygems'
require 'selenium-webdriver'
require "test/unit"

require_relative '../common/WebDriverUtils'
require_relative '../common/PropertyUtils'
class Test1 < Test::Unit::TestCase
  def setup
    url = PropertyUtils.get_property("url")
    @webDriverUtils = WebDriverUtils::new
    @driver = @webDriverUtils::get_driver
    @driver.get url
  end

  def test
    element = @driver.find_element :xpath => "//a[text()='Hire Freelancers']"
    @webDriverUtils.click(element)
    puts "Page title is #{@driver.title}"

    element = @driver.find_element :xpath => "//input[@name='q']"
    @webDriverUtils.submit(element, PropertyUtils.get_property("keyword"))

    puts "Page title is #{@driver.title}"
    @driver.quit
  end

end