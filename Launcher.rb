#! Program files/Ruby22/bin/ruby
# Example application to demonstrate Ruby features

class Launcher


launcher = Launcher.new

  def initialize app_map #Define method "initialize" with argument "app_map"
    @app_map = app_map
  end
  
    #Execute a given file using the associate application
    def run file_name 
      application = select_app file_name
      system "#{application} #{file_name}"
    end
    
    # Given a file, loop up the matching application
    def select_app file_name
      ftype = file_type file_name
      @app_map[ ftype ]
    end
    
    # Return the part of the file name string after the last '.'
    def file_type file_name
      File.extname( file_name ).gsub( /^\./, '' ).downcase
    end

  def help
    print " 
    You must pass in the path to the file to launch.
  
    Usage: #{__FILE__} target_file
  " 
  end
  
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

end