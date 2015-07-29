$:.unshift '.' 
require 'launcher' #Use launcher.rb file code in the common directory

if ARGV.empty?
  help
  exit
else
  app_map = {
     'html' => 'firefox',
     'rb' => 'gvim',
     'jpg' => 'gimp'
  }

  l = Launcher.new app_map 
  target = ARGV.join ' ' 
  l.run target 
end


