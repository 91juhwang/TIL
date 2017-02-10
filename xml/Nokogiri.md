# Generate xml using Ruby

## Using Nokogiri gem

- Basic Build

```ruby
builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml| 
  xml.Adverts { 
    xml.Advert {
      xml.Contact {
        xml.SiteAccountId "Awes"
        xml.Photo "link"
        xml.SpokenLanguages "en"
      }
      xml.SiteAccountId 'elegran'
      xml.LivingArea "Awesome widget"
      xml.Descriptions {
        xml.Description("descriptions here", language: "en")
      } 
      xml.Photos {
        xml.Photo "link"
      }
      xml.Geolocation {
        xml.Latitude 123
        xml.Longitude 123
      }
    }
  }
end

the_file = builder.to_xml

# open a file instance with path '/path/to/file.xml' in write mode (-> 'w')
File.open('./xml_files/Elegran_adverts.xml', 'w') do |file|
  # write the xml string generated above to the file
  file.write(the_file)
end
```