require "json"

class BasicObject
  def blank?
    self.nil? || self.to_s.strip == ""
  end
end

project_dir = ARGV[0]
custom_projections = File.join(project_dir, ".projections.json")

if project_dir.blank? || !File.exist?(custom_projections)
  exit 0
end

begin
  JSON.parse(File.read(custom_projections))
  exit 0
rescue
  puts "Invalid JSON detected in .projections.json"
  exit 1
end
