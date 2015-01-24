

def absolute_path(file)
  File.absolute_path(file)
end

def run_test
  p absolute_path("photos/bunny-1.jpg") == "/home/ubuntu/workspace/sprint1/photo-gallery-cli"
end

photo_file = ARGV[0]

puts absolute_path(photo_file)


