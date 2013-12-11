require 'rubygems'
require 'selenium-webdriver'

require_relative 'PropertyUtils'
class WebDriverUtils
  @@driver = nil
  def initialize
    browser = PropertyUtils.get_property("browser")
    @@driver = Selenium::WebDriver.for :"#{browser}"
    @@timeout = Integer(PropertyUtils.get_property("timeout"))
  end

  def get_driver
    @@driver
  #options = driver::Options.new
  #options.delete_all_cookies()
  end

  def wait_js_load
    $i = 0

    while $i < @@timeout  do
      if @@driver.execute_script("return jQuery.active == 0") then
      break
      end
      $i +=1
      sleep(1)
    end

  end

  def wait(element)
    wait_js_load
    wait = Selenium::WebDriver::Wait.new(:timeout => @@timeout) # seconds
    element = wait.until { element }
  end

  def find_element_xpath(xpath)
    wait_js_load
    wait = Selenium::WebDriver::Wait.new(:timeout => @@timeout) # seconds
    element = wait.until { @@driver.find_element :xpath => xpath }
  end

  def type(element, text)
    wait(element)
    element.send_keys text
  end

  def submit(element, text)
    type(element, text)
    element.submit
  end

  def click(element)
    wait(element)
    element.click
  end

end