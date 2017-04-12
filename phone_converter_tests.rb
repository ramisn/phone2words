require_relative 'phone_converter'
require 'rspec'


RSpec.describe PhoneConverter do
  it 'convert 6686787825 phone to expected words' do
     expect(PhoneConverter.phone2words('6686787825')).to eq ( [["noun", "struck"], ["onto", "struck"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"] )
  end

  it 'convert 2282668687 phone to expected words' do
     expect(PhoneConverter.phone2words('2282668687')).to eq ( [["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "amounts"], ["cat", "contour"], ["acta", "mounts"], "catamounts"] )
  end

end
