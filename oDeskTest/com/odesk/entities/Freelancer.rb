class Freelancer
  def initialize id, name, job_title, skills, facts, description
    @id = id
    @name = name
    @job_title = job_title
    @skills = skills
    @facts = facts
    @description = description

    @freelancer = []
    @freelancer << id
    @freelancer << name
    @freelancer << job_title
    @freelancer << skills
    @freelancer << facts
    @freelancer << description
  end

  def get_freelancer_array
    @freelancer
  end

  def get_id
    @id
  end

  def get_name
    @name
  end

  def get_job_title
    @job_title
  end

  def get_skills
    @skills
  end

  def get_facts
    @facts
  end

  def get_description
    @description
  end

end