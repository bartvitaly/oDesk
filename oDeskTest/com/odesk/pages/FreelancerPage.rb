require 'page-object'
require 'selenium/webdriver'

require_relative '../common/WebDriverUtils'
class FreelancerPage < WebDriverUtils
  include PageObject

  @@name = "//h1[@class='oH1Huge']"
  @@job_title = "//h1[@class='oH2High']"
  @@skills = "//section[@class='oExpandableOneLine oSkills']"
  @@overview = "//section[@class='oOverview']/p[@itemprop='description']"

  @@freelancer = []
  def initialize driver
    @@driver = driver
  end

  def  get_search_items
    find_elements_xpath @@list_item_search
  end

  def get_name
    get_item_detail(@@name)
  end

  def get_job_title
    get_item_detail(@@job_title)
  end

  def get_skills
    get_item_detail(@@skills)
  end

  def get_overview
    get_item_detail(@@overview)
  end

  def get_item_detail(detail_xpath)
    $size = get_search_items.length
    details = []

    i = 1
    while i < $size + 1
      detail = find_element_xpath detail_xpath
      details << detail.text
      i += 1
    end
    details
  end

  def get_freelancers
    @@freelancer << get_name
    @@freelancer << get_job_title
    @@freelancer << get_skills
    @@freelancer << get_overview
  end

end