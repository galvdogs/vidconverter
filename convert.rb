

#Prompt user whether to delete original files after successful conversion
loop do
  print "Do you want original files to be deleted after conversion (y/n)? "
  dec_del = gets.chomp
  case dec_del
    when 'N', 'n'
      break
    when 'Y', 'y'
      print "Original files will be deleted. Are you sure (y/n)? "
      dec_del_confirm = gets.chomp
      case dec_del_confirm
        when 'Y', 'y'
          break
        when 'N', 'n'
          dec_del = ''
        else
          print "Input invalid. Try again or Ctrl + C to cancel this process"
          dec_del = '' 
      end
    else
      print "Input invalid. Try again or Ctrl + C to cancel this process"
      dec_del = ''
  end
end

#Convert video to MP4
loop do
  print "Type the path where the videos are located (all videos at this path will be converted): "
  src_path = gets.chomp
end
  
    
    
    
