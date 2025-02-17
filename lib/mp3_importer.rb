

class MP3Importer
  attr_accessor :path
  
  def initialize(directory_of_files)
    @path = directory_of_files
  end
  
 def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end
  
  def import
    files.each {|file| Song.new_by_filename(file)}
  end
  
  
end