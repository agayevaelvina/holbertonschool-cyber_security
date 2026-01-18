require 'json'
require_relative '3-read_file'

def merge_json_files(file1_path, file2_path)
  # Read both JSON files
  json1 = read_json_file(file1_path)
  json2 = read_json_file(file2_path)

  # Ensure both are hashes
  unless json1.is_a?(Hash) && json2.is_a?(Hash)
    raise 'Both JSON files must contain JSON objects'
  end

  # Merge json1 into json2
  merged_json = json2.merge(json1)

  # Write merged content back to file2
  File.open(file2_path, 'w') do |file|
    file.write(JSON.pretty_generate(merged_json))
  end
end

