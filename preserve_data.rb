require 'json'


def file_read(file_name)
  return unless File.exist?(file_name)

  if File.empty?(file_name)
    []
  else
    file = File.read(file_name)
    JSON.parse(file)
    # []
  end
end

def file_write(file_name, data)
  hashed_data = data.map(&:to_hash)
  File.write(file_name, JSON.generate(hashed_data))
  File.write(file_name, json)
  # File.close(file_name)
end
