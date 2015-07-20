require './parser'

handle = File.open(ARGV[0], "r")
md_file = handle.read
handle.close
html_file = Parser.new.parsed(md_file)
writer = File.open(ARGV[1], "w")
writer.write(html_file)
writer.close
