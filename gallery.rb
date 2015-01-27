def absolute_paths_list(file_paths) #adapts for arrays
  file_paths.map { |file| File.absolute_path(file) }
end

def img_tag(photo_path)
  "<img src=\"#{photo_path}\">"
end

def tag_list_builder(photo_files)
  photo_files.map { |each_path| img_tag(each_path) }.join("\n  ")
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

  full_html
end

def photo_gallery(files)
  absolute_paths_array = absolute_paths_list(files) # Create array of paths

  tag_string = tag_list_builder(absolute_paths_array) # Build tags from paths

  return html_gallery(tag_string) # Insert the tags into the HTML templage.
end

if __FILE__ == $PROGRAM_NAME
  puts photo_gallery(ARGV)
end
