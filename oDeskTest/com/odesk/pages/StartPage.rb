require 'page-object'
require 'selenium/webdriver'

require_relative '../common/WebDriverUtils'
require_relative '../pages/SearchPage'
class StartPage < WebDriverUtils
  include PageObject
  @@lnk_search = "//a[text()='Hire Freelancers']"
  def initialize driver
    @@driver = driver
  end

  def open_hire_freelancers
    puts "\nClicking hire freelancers link..."
    element = find_element_xpath @@lnk_search
    click element
    SearchPage::new @@driver
  end
end