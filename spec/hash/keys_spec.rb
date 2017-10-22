require 'spec_helper'

describe Fusu::Hash::Keys do
  it "transform_keys returns a new hash with the keys computed from the block" do
    original = { a: "a", b: "b" }
    mapped = Fusu::Hash.transform_keys(original) { |k| "#{k}!".to_sym }

    expect({ a: "a", b: "b" }).to eq(original)
    expect({ a!: "a", b!: "b" }).to eq(mapped)
  end

  it "transform_keys! modifies the keys of the original" do
    original = { a: "a", b: "b" }
    mapped = Fusu::Hash.transform_keys!(original) { |k| "#{k}!".to_sym }

    expect({ a!: "a", b!: "b" }).to eq(original)
    expect(original).to eql(mapped)
  end

  it "transform_keys is chainable with Enumerable methods" do
    original = { a: "a", b: "b" }
    mapped = Fusu::Hash.transform_keys(original).with_index { |k, i| [k, i].join.to_sym }
    expect({ a0: "a", b1: "b" }).to eq(mapped)
  end

  it "transform_keys! is chainable with Enumerable methods" do
    original = { a: "a", b: "b" }
    Fusu::Hash.transform_keys!(original).with_index { |k, i| [k, i].join.to_sym }
    expect({ a0: "a", b1: "b" }).to eq(original)
  end

  it "stringify_keys converts all keys to string returning new Hash" do
    original = { a: "a", b: "b" }
    result = Fusu::Hash.stringify_keys(original)
    expect(result).to eq({"a" => "a", "b"=> "b"})
  end
  it "stringify_keys! converts all keys to string destructive way" do
    original = { a: "a", b: "b" }
    Fusu::Hash.stringify_keys!(original)
    expect(original).to eq({"a" => "a", "b"=> "b"})
  end
  it "symbolize_keys converts all keys to symbols returning new Hash" do
      hash = { 'name' => 'Rob', 'age' => '28' }
      mapped = Fusu::Hash.symbolize_keys(hash)
      expect(mapped).to eq({:name=>"Rob", :age=>"28"})
  end
  it "symbolize_keys! converts all keys to symbols destructive way" do
    hash = { 'name' => 'Rob', 'age' => '28' }
    Fusu::Hash.symbolize_keys!(hash)
    expect(hash).to eq({:name=>"Rob", :age=>"28"})
  end

  it 'deep_transform_keys' do
     hash = { person: { name: 'Rob', age: '28' } }
     mapped = Fusu::Hash.deep_transform_keys(hash){ |key| key.to_s.upcase }
     expect(mapped).to eq({"PERSON"=>{"NAME"=>"Rob", "AGE"=>"28"}})
  end
  it 'deep_transform_keys!' do
     hash = { person: { name: 'Rob', age: '28' } }
     Fusu::Hash.deep_transform_keys!(hash){ |key| key.to_s.upcase }
     expect(hash).to eq({"PERSON"=>{"NAME"=>"Rob", "AGE"=>"28"}})
  end

  it 'deep_stringify_keys' do
    hash = { person: { name: 'Rob', age: '28' } }
    mapped = Fusu::Hash.deep_stringify_keys(hash)
    expect(mapped).to eq({"person"=>{"name"=>"Rob", "age"=>"28"}})
  end
  it 'deep_stringify_keys!' do
    hash = { person: { name: 'Rob', age: '28' } }
    Fusu::Hash.deep_stringify_keys!(hash)
    expect(hash).to eq({"person"=>{"name"=>"Rob", "age"=>"28"}})
  end

  it 'deep_symbolize_keys' do
    hash = { 'person' => { 'name' => 'Rob', 'age' => '28' } }
    mapped = Fusu::Hash.deep_symbolize_keys(hash)
    expect(mapped).to eq({:person=>{:name=>"Rob", :age=>"28"}})
  end
  it 'deep_symbolize_keys!' do
    hash = { 'person' => { 'name' => 'Rob', 'age' => '28' } }
    Fusu::Hash.deep_symbolize_keys!(hash)
    expect(hash).to eq({:person=>{:name=>"Rob", :age=>"28"}})
  end

end
