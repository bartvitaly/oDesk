class PropertyUtils
  #get property value by name
  def  self.get_property property_name
    load_properties["#{property_name}"]
  end

  #returns array of property values
  def self.load_properties
    @properties_filename = File.expand_path("../../../../", __FILE__) + "/test.properties"
    properties = {}
    File.open(@properties_filename, 'r') do |properties_file|
      properties_file.read.each_line do |line|
        line.strip!
        if (line[0] != ?# and line[0] != ?=)
          i = line.index('=')
          if (i)
          properties[line[0..i - 1].strip] = line[i + 1..-1].strip
          else
            properties[line] = ''
          end
        end
      end
    end
    properties
  end
end