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
- Recursive method 
** This is useful when iterating through hash to create xml files in specific schemas

'''ruby


def generate_xml(data, parent = false, opt = {})
  return if data.to_s.empty?
  return unless data.is_a?(Hash)
  unless parent
    # assume that if the hash has a single key that it should be the root
    root, data = data.length == 1 ? data.shift : ['root', data]
    builder = Nokogiri::XML::Builder.new(opt) do |xml|
      xml.send(root) {
        generate_xml(data, xml)
      }
    end
    File.open('./xml_files/Elegran_adverts.xml', 'w') do |file|
      the_file = builder.to_xml
      puts the_file
      return file.write(the_file)
    end
  end
  data.each { |label, value|
    if value.is_a?(Hash)
      attrs = value.fetch('@attributes', {})
      # also passing 'text' as a key makes nokogiri do the same thing
      text = value.fetch('@text', '') 
      parent.send(label, attrs, text) { 
        value.delete('@attributes')
        value.delete('@text')
        generate_xml(value, parent)
      }
    elsif value.is_a?(Array)
      value.each { |el|
        # lets trick the above into firing so we do not need to rewrite the checks
        el = { label => el }
        generate_xml(el, parent) 
      }
    else
      parent.send(label, value)
    end
  }
end
'''
