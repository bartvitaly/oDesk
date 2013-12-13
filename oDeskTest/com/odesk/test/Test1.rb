require 'rubygems'
require 'selenium-webdriver'
require "test/unit"

require_relative '../common/WebDriverUtils'
require_relative '../common/PropertyUtils'
require_relative '../pages/StartPage'
require_relative '../pages/SearchPage'
class Test1 < Test::Unit::TestCase
  @@driver = nil
  @@freelancers = Hash["names", []]
  @@names = []
  @@facts = []
  def setup
    #initiate Selenium WebDriver
    url = PropertyUtils.get_property "url"
    @webDriverUtils = WebDriverUtils::new
    @@driver = @webDriverUtils::get_driver
    @@driver.get url
  end

  def test
    #open hire freelancers page
    @startPage = StartPage::new @@driver
    @searchPage = @startPage.open_hire_freelancers

    #search for a freelancer by keyword
    @searchPage.search PropertyUtils.get_property "keyword"
    @@freelancers = @searchPage.get_freelancers
    puts @@freelancers

  end

  def teardown
    @@driver.quit
  end

end