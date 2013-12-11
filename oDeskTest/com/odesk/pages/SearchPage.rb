require 'page-object'
require 'selenium/webdriver'

require_relative '../common/WebDriverUtils'
class SearchPage < WebDriverUtils
  include PageObject
  @input_search = "//input[@name='q']"
  @list_item_search = "//ul[@class='oSearchResultsList']/li[@class='oSearchResultItem']"
  def initialize driver
    @@driver = driver
  end

  #basic elements
  # button :google_search, :name => "btnG"
  # text_field(:search, :xpath => "//input[@name='q']")
  # unordered_list(:searchResults, :xpath => "//ul[@class='oSearchResultsList']")
  # list_item(:searchItem, :xpath => "//li[@class='oSearchResultItem']")
  #name item + "//span[@itemprop='name']"

  def search keyword
    #@search_field = self.text_field(:xpath => "//input[@name='q']")
    #self.search_field.set keyword
    element = find_element_xpath @input_search
    submit element, keyword
  end

  def get_search_items
    elements find_elements_xpath @list_item_search
  end

  def get_names
    elements get_search_items
    for element in elements
    #element.
    end

  end

end