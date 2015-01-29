require 'fileutils'

def img_tag(photo_path)
  "<img src=\"#{photo_path}\" class=\"img_medium brd\">"
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

  full_html
end

def create_directory(path)
  Dir.mkdir(path.first)
  Dir.chdir(path.first)
  Dir.mkdir(path.last)
end

def create_html_file(content)
  File.open("gallery.html", "w"){ |file| file.puts content}
end

def photo_gallery(files)
  relative_path = ["public", "img"]

  create_directory(relative_path)

  tag_string = tag_list_builder(files) # Build tags from paths.

  content = html_gallery(tag_string) # Insert the tags into the HTML templage.

  create_html_file(content) #Create file and write file in current working direcotry
end

if __FILE__ == $PROGRAM_NAME
  photo_gallery(ARGV)
end
