require 'spec_helper'

describe Fusu::HashWithIndifferentAccess do
  let(:data) do
    {
      "name"=>"Artur",
      "first_surname"=>"hello",
      "second_surname"=>"world",
      "address"=>{"postal_code"=>12345, "country"=>{"name"=>"Spain", "language"=>"ES"}},
      address2: {postal_code: 12345, country: {name: "Spain", language: "ES"}},
      "email"=>"asdf@sdfs.com",
      "phone"=>nil
    }
  end

  it '#[]' do
    s = described_class.new(data)
    expect(s['address']['country']['language']).to eq 'ES'
    expect(s[:address][:country][:language]).to eq 'ES'
    expect(s.fetch(:address).fetch(:country).fetch(:language)).to eq 'ES'
    expect(s['address2']['country']['language']).to eq 'ES'
    expect(s[:address2][:country][:language]).to eq 'ES'
    expect(s.fetch(:address2).fetch(:country).fetch(:language)).to eq 'ES'
  end

  it '#fetch' do
    s = described_class.new(data)
    expect(s.fetch(:name)).to eq 'Artur'
    expect(s.fetch('name')).to eq 'Artur'
  end
end
