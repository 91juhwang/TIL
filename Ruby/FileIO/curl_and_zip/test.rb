require 'curb'
require 'curl'
require 'zip'

def start
  curl = Curl::Easy.new('http://mss2.elegran.com/download/elegran-ads.zip')
  curl.on_body do |data| 
    f = File.open('Elegran_AdvertsImport.zip', 'a') do |f| 
      f.write data
    end
  end
  curl.perform
end

start

Zip::File.open('Elegran_AdvertsImport.zip') do |zipfile|
  zipfile.each do |file|
    file_path = File.join('./', file.name)
    FileUtils.mkdir_p(File.dirname(file_path))
    zipfile.extract(file, file_path) unless File.exist?(file_path)
  end
end
