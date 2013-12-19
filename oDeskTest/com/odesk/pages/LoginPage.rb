require 'page-object'
require 'selenium/webdriver'

require_relative '../common/WebDriverUtils'
require_relative '../common/PropertyUtils'
class LoginPage < WebDriverUtils
  include PageObject
  @@lnk_search = "//a[text()='Hire Freelancers']"
  @@input_login = "//input[@id='username']"
  @@input_password = "//input[@id='password']"
  @@btn_submit = "//input[@id='submit']"
  def initialize driver
    @@driver = driver
  end

  def login
    @@driver.get "https://www.odesk.com/login"
    WebDriverUtils.wait_js_load
    username = find_element_xpath @@input_login
    type username, PropertyUtils.get_property("login")
    password = find_element_xpath @@input_password
    type password, PropertyUtils.get_property("password")
    btn_submit = find_element_xpath @@btn_submit
    click btn_submit
  end

  def logout
    @@driver.get "https://www.odesk.com/logout"
  end
end