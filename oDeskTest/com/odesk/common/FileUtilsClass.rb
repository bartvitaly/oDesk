require 'rubygems'
require 'fileutils'

class FileUtilsClass
  def self.create_dir name
    Dir.mkdir(name)
  end

  def self.create_file name
    File.open(name, 'OPTION') {|f| f.write("write your stuff here") }
  end
end