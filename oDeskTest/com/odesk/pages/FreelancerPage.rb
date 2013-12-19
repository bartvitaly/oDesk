require 'page-object'
require 'selenium/webdriver'

require_relative '../common/WebDriverUtils'
class FreelancerPage < WebDriverUtils
  include PageObject

  @@name = "//h1[@class='oH1Huge']"
  @@job_title = "//h1[@class='oH2High']"
  @@skills = "//section[contains(@class,'oExpandableOneLine oSkills')]"
  @@overview = "//section[@class='oOverview']//p"
  def initialize driver
    is_element_exist?"//h1[@class='oH1Huge' and text()!='']"
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
    $overview_limit = 436
    $skills_limit = -10
    result = true
    puts "\nComparing names: \n1: " + freelancer.get_name + "\n2: " + get_name + "\n"
    current_result = freelancer.get_name == get_name
    if !current_result
      result = false
      puts "\nName is not the same"
    end
    puts "\nComparing job titles: \n1: " + freelancer.get_job_title + "\n2: " + get_job_title + "\n"
    current_result = freelancer.get_job_title == get_job_title
    if !current_result
      result = false
      puts "\nJob title is not the same"
    end
    puts "\nComparing skills: \n1: " + freelancer.get_skills + "\n2: " + get_skills + "\n"
    current_result = freelancer.get_skills.include?get_skills[0..$skills_limit]
    if !current_result
      result = false
      puts "\nSkills are not the same"
    end

    description = freelancer.get_description
    overview = get_overview

    # description = description.gsub("\n", "")
    # description = description.gsub("\r", "")
    description = description[0..$overview_limit]

    overview = overview.gsub("\n", " ")
    overview = overview.gsub("  ", " ")
    overview = overview[0..$overview_limit]

    puts "\nComparing descriptions: \n1: " + description + "\n2: " + overview + "\n"
    current_result = description == overview
    #current_result = get_overview == freelancer.get_description
    if !current_result
      result = false
      puts "\nDescription is not the same"
    end

    result
  end

  def check_freelancer keyword
    data = []
    data = get_freelancer_data
    puts data
    current_result = Common.find_part_in_array(keyword, data)
    if current_result
      puts "\nKeyword: '" + keyword + "' was found for " + get_name
    else
      puts "\nKeyword: '" + keyword + "' was not found for '"  + get_name
    end
    current_result
  end

end