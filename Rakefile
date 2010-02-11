require 'rake'

desc "Installs the dot files into your home directory."
task :install do
  home = File.expand_path('~')
  replace_all = false

  Dir['*'].each do |file|
    next if %w[Rakefile README].include?(file)

    if file =~ /bin/
      target = File.join(home, file)
    else
      target = File.join(home, ".#{file}")
    end

    if File.exist?(target)
      if replace_all
        replace_file(file, target)
      else
        print "overwrite #{target}? [ynaq] "

        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file, target)
        when 'y'
          replace_file(file, target)
        when 'q'
          exit
        else
          puts "skipping #{target}"
        end
      end
    else
      link_file(file, target)
    end
  end
end

def replace_file(file, target)
  `rm -rf #{target}`
  link_file(file, target)
end

def link_file(file, target)
  puts "linking #{target}"
  `ln -s #{File.expand_path(file)} #{target}`
end
