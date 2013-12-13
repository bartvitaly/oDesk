require 'rubygems'
require 'selenium-webdriver'

require_relative 'FileUtilsClass'
require_relative 'PropertyUtils'
class WebDriverUtils
  @@driver = nil
  def initialize
    browser = PropertyUtils.get_property "browser"
    @@driver = Selenium::WebDriver.for :"#{browser}"
    @@timeout = Integer PropertyUtils.get_property("timeout")
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

  def find_element_xpath xpath
    wait_js_load
    wait = Selenium::WebDriver::Wait.new(:timeout => @@timeout) # seconds
    wait.until { @@driver.find_element :xpath => xpath }
  end

  def  find_element_element_xpath element, xpath
    wait_js_load
    wait = Selenium::WebDriver::Wait.new(:timeout => @@timeout) # seconds
    wait.until { element.find_element :xpath => xpath }
  end

  def find_element_element  xpath
    wait_js_load
    wait = Selenium::WebDriver::Wait.new(:timeout => @@timeout) # seconds
    wait.until { @@driver.find_element :xpath => xpath }
  end

  def find_elements_xpath xpath
    wait_js_load
    wait = Selenium::WebDriver::Wait.new(:timeout => @@timeout) # seconds
    wait.until { @@driver.find_elements :xpath => xpath }
  end

  def get_element_attribute element, attribute
    element.attribute attribute
  end

  def get_element_text xpath, timeout
    wait_js_load
    wait = Selenium::WebDriver::Wait.new(:timeout => timeout) # seconds
    begin
      element = wait.until { @@driver.find_element :xpath => xpath }
      text = element.text
    rescue
      text = ""
    end
    text
  end

  def type element, text
    element.send_keys text
  end

  def submit element, text
    type element, text
    element.submit
  end

  def click element
    # @@driver.move_to element
    element.click
  end

  def click_move element
    $x = element.location[0]
    $y = element.location[1] - 200

    @@driver.execute_script("window.scrollBy(#{$x},#{$y})")

    element.click
  end

end