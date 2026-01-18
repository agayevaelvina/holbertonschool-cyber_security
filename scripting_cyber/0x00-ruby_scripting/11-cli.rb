#!/usr/bin/env ruby
require 'optparse'

file = 'tasks.txt'
File.write(file, "") unless File.exist?(file)
tasks = File.readlines(file, chomp: true)

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"
  opts.on("-aTASK", "--add TASK", "Add a new task") { |t| options[:add] = t }
  opts.on("-l", "--list", "List all tasks") { options[:list] = true }
  opts.on("-rINDEX", "--remove INDEX", Integer, "Remove a task by index") { |i| options[:remove] = i }
  opts.on("-h", "--help", "Show help") { puts opts; exit }
end.parse!

if options[:add]
  tasks << options[:add]
  File.write(file, tasks.join("\n") + "\n")
  puts "Task '#{options[:add]}' added."

elsif options[:list]
  puts "Tasks:\n"  
  tasks.each_with_index { |t, i| puts "#{i+1}. #{t}" }  

elsif options[:remove]
  i = options[:remove] - 1
  if tasks[i]
    puts "Task '#{tasks.delete_at(i)}' removed."
    File.write(file, tasks.join("\n") + "\n")
  else
    puts "Invalid index."
  end

else
  puts "Use -h for help."
end

