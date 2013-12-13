require 'page-object'
require 'selenium/webdriver'

require_relative '../common/WebDriverUtils'
class FreelancerPage < WebDriverUtils
  include PageObject

  @@name = "//h1[@class='oH1Huge']"
  @@job_title = "//h1[@class='oH2High']"
  @@skills = "//section[contains(@class,'oExpandableOneLine oSkills')]"
  @@overview = "//section[@class='oOverview']/p"
  def initialize driver
    @@driver = driver
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

  def get_item_detail detail_xpath
    get_element_text detail_xpath, 0
  end

  def get_freelancer_data
    @@freelancer = []
    @@freelancer << get_name
    @@freelancer << get_job_title
    @@freelancer << get_skills
    @@freelancer << get_overview
  end

  def check_freelancer_data freelancer
    current_result = true
    current_result = freelancer.get_name <=> get_name
    current_result = freelancer.get_name <=> get_job_title
    current_result = get_skills.include?freelancer.get_skills
    current_result = get_overview.include?freelancer.get_facts
    current_result = get_overview.include?freelancer.get_description

    if current_result
      puts "Data is the same"
    else
      puts "Data is not the same"
    end
    current_result
  end

  def check_freelancer keyword
    current_result = Common.find_part_in_array(keyword, get_freelancer_data)
    if current_result
      puts "Keyword: '" + keyword + "' was found for " + get_name
    else
      puts "Keyword: '" + keyword + "' was not found for '"  + get_name
    end
    current_result
  end

end