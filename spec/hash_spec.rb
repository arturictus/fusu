require 'spec_helper'

describe Fusu::Hash do
  describe '::except' do
    it do
      hash = { a: true, b: false, c: nil}
      expect(Fusu::Hash.except(hash, :c)).to eq({ a: true, b: false})
    end
  end

  describe '::except!' do
    it do
      hash = { a: true, b: false, c: nil}
      Fusu::Hash.except!(hash, :c)
      expect(hash).to eq({ a: true, b: false})
    end
  end

  it '::reverse_merge' do
    a = {a: 1, b: 2}
    b = {b: 3, c: 4}

    r = Fusu::Hash.reverse_merge(b, a)
    expect(r).to eq(a.merge(b))
  end
  it '::reverse_merge!' do
    a = {a: 1, b: 2}
    b = {b: 3, c: 4}

    r = Fusu::Hash.reverse_merge(b, a)
    Fusu::Hash.reverse_merge!(b, a)
    expect(b).to eq(r)
  end
end
