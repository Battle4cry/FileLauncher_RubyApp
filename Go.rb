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

class Html
 DEFAULT_BROWSER = 'firefox'
 
 def run file, args
   if args.empty?
     system "#{DEFAULT_BROWSER} #{file}"
   else
     dispatch_on_parameters file, args
   end
  end
  
  def dispatch_on_parameters file, args
    cmd = args.shift
    send "do_#{cmd}", file, args
  end
  
  def do_opera file, args=nil
    system "opera #{file} #{args}"
  end
  
  def do_konq file, args=nil
    system "konqueror #{file} #{args}"
  end
 end
