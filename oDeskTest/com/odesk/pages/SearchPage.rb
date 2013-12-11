require 'page-object'
require 'selenium/webdriver'

require_relative '../common/WebDriverUtils'
class SearchPage < WebDriverUtils
  include PageObject
  def initialize driver
    @@driver = driver
  end

  #basic elements
  unordered_list(:searchResults, :xpath => "//ul[@class='oSearchResultsList']")
  list_item(:searchItem, :xpath => "//li[@class='oSearchResultItem']")
  #name item + "//span[@itemprop='name']"

  def search keyword
    element = find_element_xpath "//input[@name='q']"
    submit element, keyword
  end

  def get_items
    @@driver.find_elements
  end

end