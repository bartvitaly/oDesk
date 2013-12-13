require 'rubygems'

class Common
  def self.find_in_array value, array
    array.include?(value)
  end

  def self.find_part_in_array value, array
    array.any?{|s| s.include?(value)}
  end

  def self.random_number min_number, max_number
    min_number + Random.rand(max_number)
  end

end