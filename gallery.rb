
def absolute_path(file)
    File.absolute_path(file)
end

def img_tag(photo_path)
  img_tag_str =  "<img src=\"#{photo_path}\">"
  return img_tag_str
end

#def tag_builder(photo_files)
#  photo_files.each do |each_path|
#    tag_array = img_tag(each_path)
#  end
#  tag_string = tag_array.join
#  return tag_string
#end

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

def run_test
  photo_files = "photos/*.jpg"
  valid_img_html = "<img src=\"/home/ubuntu/workspace/sprint1/photo-gallery-cli/photos/bunny-1.jpg\">"

  p absolute_path("photos/bunny-1.jpg") == "/home/ubuntu/workspace/sprint1/photo-gallery-cli/photos/bunny-1.jpg"
  p img_tag( absolute_path(photo_files[0]) ) == "<img src=\"/home/ubuntu/workspace/sprint1/photo-gallery-cli/photos/bunny-1.jpg\">"
  p html_gallery(valid_img_html).include?(valid_img_html)
end

# run_test

if __FILE__ == $PROGRAM_NAME

  photo_files = ARGV
  image_tags_array = []
  ARGV.each do |file|
    filename = absolute_path(file)
    image_tag = img_tag(filename)
    image_tags_array.push(image_tag)
  end
  image_tags_str = image_tags_array.join("\n  ")
  puts html_gallery(image_tags_str)
end