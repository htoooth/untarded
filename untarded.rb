# UnTarded by Jason Ormand aka Okor

file_names = ARGV

# if no file argument is specified, give usage and exit
if !file_names
  puts '#{$0} usage: untarded [list of files]'
  exit
end

action = {}
action['.bz2'] = 'tar -jxvf'
action['.gz'] = 'tar -zxvf'

file_names.each do |file_name|
  extension = File.extname(file_name.to_s)

  # if file doesn't exist, give warning and exit
  if !File.exist?(file_name) && !File.directory?(file_name) then
    puts 'That file does not exist.'
    next
  end

  if !action[extension]
    puts 'I have no idea what to do with #{file_name}.'
    next
  end

  # where the magic happens
  system("#{action[extension]} #{file_name}")
end


