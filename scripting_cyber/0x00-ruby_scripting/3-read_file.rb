require 'json'

def read_json_file(file_path)
  file_content = File.read(file_path)
  JSON.parse(file_content)
rescue Errno::ENOENT
  {}
end

