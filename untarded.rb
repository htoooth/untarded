# UnTarded by Jason Ormand aka Okor

filename = ARGV[0]
extension = File.extname(filename.to_s)

# if no file argument is specified, give usage and exit
if filename == nil
  puts 'Example usage: untarded somefile.tar.gz'
	exit
end

# if file doesn't exist, give warning and exit
if File.exist?(filename)==false && File.directory?(filename)==false then
  puts 'That file does not exist.'
  exit
end

# where the magic happens
if extension == '.bz2'
	`tar -jxvf #{filename}`
elsif extension == '.gz'
	`tar -zxvf #{filename}`
else
	puts 'I have no idea what to do with this file.'
end




