#! /usr/bin/env ruby

# Declare local variables.
dec_del = ''
src_path = ''
dst_path = ''

# Prompt user whether to delete original files after successful conversion.
loop do
  print "Do you want original files to be deleted after conversion (y/n)? "
  dec_del = gets.chomp
  print "\n"
  case dec_del
    when 'N', 'n'
      break
    when 'Y', 'y'
      print "Original files will be deleted. Are you sure (y/n)? "
      dec_del_confirm = gets.chomp
      print "\n"
      case dec_del_confirm
        when 'Y', 'y'
          break
        when 'N', 'n'
          dec_del = ''
        else
          puts "Input invalid. Try again or Ctrl + C to cancel this process. "
      end
    else
      puts "Input invalid. Try again or Ctrl + C to cancel this process. "
  end
end

# Get path where source videos are located.
loop do
  print "Type the path where the videos are located (all videos at this path will be converted): "
  src_path = gets.chomp
  src_path = File.expand_path(src_path)
  print "\n"
  unless Dir.exist?(src_path)
    puts "File path is not valid, or permission denied. Please try again."
  else
    break
  end
end
  
# Get path where destination videos will be saved.
loop do
  print "Type the path where the converted videos should be saved: "
  dst_path = gets.chomp
  dst_path = File.expand_path(dst_path)
  print "\n"
  unless Dir.exist?(dst_path)
    puts "File path is not valid, or permission denied. Please try again."
  else
    break
  end
end

# File conversion to MP4.
Dir.foreach(src_path) do |src_file|
  next if src_file == '.' or src_file == '..'
  src_filename = File.basename(src_file, ".*")
  puts "Conversion of \"#{src_file}\" in progress. This may take several minutes..."
  system "ffmpeg -v error -i \"#{src_path}/#{src_file}\" -c:av copy \"#{dst_path}/#{src_filename}.mp4\""
 # Result checking and error handling.
  unless $? == 0
    puts "Conversion of \"#{src_file}\" failed. Consult error.txt for more info"
  else 
    puts "\"#{src_filename}.mp4\" created successfully"
  end
  print "\n"
end
