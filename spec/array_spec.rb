require 'spec_helper'

describe Fusu::Array do
  describe "::wrap" do
    it { expect(Fusu::Array.wrap(nil)).to eq [] }
    it { expect(Fusu::Array.wrap([nil])).to eq [nil] }
    it { expect(Fusu::Array.wrap([1])).to eq [1] }
    it { expect(Fusu::Array.wrap(1)).to eq [1] }
  end
end
