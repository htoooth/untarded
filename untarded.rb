# UnTarded by Jason Ormand aka Okor
# 
# This script depends on tar, p7zip, unzip, bzip2

file_names = ARGV

# if no file argument is specified, give usage and exit
if file_names[0]==nil || file_names[0]=="-h"
  puts 'Usage: untarded [list of files]'
  exit
end




action = {}
action['.tar.bz2'] = 'tar -jxvf'
action['.tar.gz'] = 'tar -zxvf'
action['.bz2'] = 'bzip2 -d'
action['.7z'] = 'p7zip -d'
action['.zip'] = 'unzip'



file_names.each do |file_name|
  extension = file_name.scan(/\.[a-z]+\S+/).join

  # if file doesn't exist, give warning and exit
  if !File.exist?(file_name) && !File.directory?(file_name) then
    puts 'That file does not exist.'
    next
  end
  
  if !action[extension]
    puts "I have no idea what to do with #{file_name}"
    next
  end

  # where the magic happens
  system("#{action[extension]} #{file_name}")
  puts "done"
end


