require 'spec_helper'

describe 'blank?' do
  it 'String' do
    expect(Fusu.blank?('')).to eql true
    expect(Fusu.blank?('hello')).to eql false
  end
  it 'Array' do
    expect(Fusu.blank?([])).to eql true
  end
end
