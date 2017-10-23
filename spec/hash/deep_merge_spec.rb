require 'spec_helper'

describe Fusu::Hash::DeepMerge do
  it "deep_merge Returns a new hash with `self` and `other_hash` merged recursively." do
    h1 = { a: true, b: { c: [1, 2, 3] } }
    h2 = { a: false, b: { x: [3, 4, 5] } }
    result = Fusu::Hash.deep_merge(h1, h2)
    expect(result).to eq({ a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } })
  end
  it 'deep_merge Like with Hash#merge in the standard library, a block can be provided to merge values'do
    h1 = { a: 100, b: 200, c: { c1: 100 } }
    h2 = { b: 250, c: { c1: 200 } }
    result = Fusu::Hash.deep_merge(h1, h2) { |key, this_val, other_val| this_val + other_val }
    expect(result).to eq({ a: 100, b: 450, c: { c1: 300 } })
  end
  it "deep_merge!" do
    h1 = { a: true, b: { c: [1, 2, 3] } }
    h2 = { a: false, b: { x: [3, 4, 5] } }
    Fusu::Hash.deep_merge!(h1, h2)
    expect(h1).to eq({ a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } })
  end
end
