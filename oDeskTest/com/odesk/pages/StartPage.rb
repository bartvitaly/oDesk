require 'page-object'
require 'selenium/webdriver'

require_relative '../common/WebDriverUtils'
require_relative '../pages/SearchPage'
class StartPage < WebDriverUtils
  include PageObject
  def initialize driver
    @@driver = driver
  end

  def open_hire_freelancers
    element = find_element_xpath "//a[text()='Hire Freelancers']"
    click element
    SearchPage::new @@driver
  end
end