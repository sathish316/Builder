require 'buildr'

xml = Buildr.new
puts xml.phonebook {
  xml.contact {
    xml.full_name 'John Doe'
    xml.email 'john.doe@gmail.com'
    xml.phone '121-101'
  }
  xml.contact {
    xml.full_name 'William Smith'
    xml.email 'william.smith@gmail.com'
    xml.phone '121-102'
  }
}
