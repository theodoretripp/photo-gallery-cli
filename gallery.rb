
def absolute_paths_list(file_paths) #adapts for arrays
  absolute_paths_array = []

  file_paths.each do |file|
    absolute_paths_array.push(File.absolute_path(file))
  end

  return absolute_paths_array
end

def img_tag(photo_path)
  img_tag_str = "<img src=\"#{photo_path}\">"

  return img_tag_str
end

def tag_list_builder(photo_files)
  tag_array = []

  photo_files.each do |each_path|
    tag_array.push(img_tag(each_path))
  end

  tag_string = tag_array.join("\n  ")

  return tag_string
end

def html_gallery(image_tags)
full_html = <<-HTML
<!DOCTYPE html>
<html>
<head>
  <title>My Gallery</title>
</head>
<body>
  <h1>My Gallery</h1>
  #{image_tags}
</body>
</html>
  HTML

  return full_html
end

if __FILE__ == $PROGRAM_NAME
  photo_files = ARGV # Get arguments - files

  absolute_paths_array = absolute_paths_list(photo_files) # Create array of paths
  tag_string = tag_list_builder(absolute_paths_array) # Build tags from paths
  puts html_gallery(tag_string) # Insert the tags into the HTML templage.
end