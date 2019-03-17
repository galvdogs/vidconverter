#! /usr/bin/env ruby

#Prompt user whether to delete original files after successful conversion
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

#Pull path where source videos are located
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
  
#Pull path where destination videos will be saved
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

print src_path
print dst_path

