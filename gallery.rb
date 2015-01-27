
def absolute_paths_list(file_paths) #adapts for arrays
  absolute_paths_array = []

  file_paths.each do |file|
    absolute_paths_array.push(File.absolute_path(file))
  end

  return absolute_paths_array
end

def img_tag(photo_path)
  img_tag_str = "<img src=\"#{photo_path}\" class=\"img_medium brd\">"

  return img_tag_str
end

def tag_list_builder(photo_files)
  tag_array = []

  photo_files.each do |each_path|
    tag_array.push(img_tag(each_path))
  end

  tag_string = tag_array.join("\n    ")

  return tag_string
end

# Note on v0.5: added height, width, and class to the img_tag method.
# Added css style section into the HTML document.

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
    <style>
      .brd {
        border: 2px solid grey;
        margin: 8px;
        box-shadow: 5px 5px 10px grey;
      }
      .img_medium {
        width: 200;
        height: 200;
      }
    </style>
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