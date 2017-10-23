require 'spec_helper'

describe Fusu::Try do
  let(:string) { 'Hello' }

  it 'test_nonexisting_method' do
    method = :undefined_method
    expect !string.respond_to?(method)
    expect(Fusu.try(string, method)).to be_nil
  end

  it 'test_nonexisting_method_with_arguments' do
    method = :undefined_method
    expect !string.respond_to?(method)
    expect(Fusu.try(string, method, "llo", "y")).to be_nil
  end

  it 'test_nonexisting_method_bang' do
    method = :undefined_method
    expect !string.respond_to?(method)
    expect{ Fusu.try!(string, method) }.to raise_error NoMethodError
  end

  it 'test_nonexisting_method_with_arguments_bang' do
    method = :undefined_method
    expect !string.respond_to?(method)
    expect{ Fusu.try!(string, method, "llo", "y") }.to raise_error NoMethodError
  end

  it 'test_valid_method' do
    expect(5).to eq Fusu.try(string, :size)
  end

  it 'test_argument_forwarding' do
    expect("Hey").to eq Fusu.try(string, :sub, "llo", "y")
  end

  it 'test_block_forwarding' do
    expect("Hey").to eq Fusu.try(string, :sub, "llo") { |match| "y" }
  end

  it 'test_nil_to_type' do
    expect(Fusu.try(nil, :to_s)).to be_nil
    expect(Fusu.try(nil, :to_i)).to be_nil
  end

  it 'test_false_try' do
    expect("false").to eq Fusu.try(false, :to_s)
  end

  it 'test_try_only_block' do
    expect(Fusu.try(string, &:reverse)).to eq string.reverse
  end

  it 'test_try_only_block_bang' do
    expect(Fusu.try!(string, &:reverse)).to eq string.reverse
  end

  it 'test_try_only_block_nil' do
    ran = false
    Fusu.try(nil) { ran = true }
    expect(false).to eq ran
  end

  it 'test_try_with_instance_eval_block' do
    expect(string.reverse).to eq Fusu.try(string) { reverse }
  end

  it 'test_try_with_instance_eval_block_bang' do
    expect(string.reverse).to eq Fusu.try!(string) { reverse }
  end
end
