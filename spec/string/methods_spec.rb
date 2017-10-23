# frozen_string_literal: true
require 'spec_helper'
require 'string/inflector_test_cases'
C = InflectorTestCases
describe Fusu::String::Methods do
  let(:const) { Fusu::String }
  let(:cases) { InflectorTestCases }
  it 'test_titleize' do
    C::MixtureToTitleCase.each do |before, titleized|
      expect(const.titleize(before)).to eq(titleized)
    end
  end

  it 'test_titleize_with_keep_id_suffix' do
    C::MixtureToTitleCaseWithKeepIdSuffix.each do |before, titleized|
      expect(const.titleize(before, keep_id_suffix: true)).to eq titleized
    end
  end

  it 'test_upcase_first' do
    expect(const.upcase_first("what a Lovely Day")).to eq "What a Lovely Day"
  end

  it 'test_upcase_first_with_one_char' do
    expect(const.upcase_first("w")).to eq "W"
  end

  it "test_upcase_first_with_empty_string" do
    expect(const.upcase_first("")).to eq ""
  end

  it 'test_camelize' do
    C::CamelToUnderscore.each do |camel, underscore|
      expect(const.camelize(underscore)).to eq camel
    end
  end

  it 'test_camelize_lower' do
    expect(const.camelize("Capital", false)).to eq "capital"
  end

  it 'test_dasherize' do
    C::UnderscoresToDashes.each do |underscored, dasherized|
      expect(const.dasherize(underscored)).to eq dasherized
    end
  end

  it 'test_underscore' do
    C::CamelToUnderscore.each do |camel, underscore|
      expect(const.underscore(camel)).to eq(underscore)
    end
    expect(const.underscore("HTMLTidy")).to eq("html_tidy")
    expect(const.underscore("HTMLTidyGenerator")).to eq("html_tidy_generator")
  end

  it 'test_underscore_to_lower_camel' do
    C::UnderscoreToLowerCamel.each do |underscored, lower_camel|
      expect(const.camelize(underscored, false)).to eq lower_camel
    end
  end

  it 'test_demodulize' do
    expect(const.demodulize("MyApplication::Billing::Account")).to eq "Account"
  end

  it 'test_deconstantize' do
    expect(const.deconstantize("MyApplication::Billing::Account")).to eq("MyApplication::Billing")
  end

  it 'test_foreign_key' do
    C::ClassNameToForeignKeyWithUnderscore.each do |klass, foreign_key|
      expect(const.foreign_key(klass)).to eq(foreign_key)
    end

    C::ClassNameToForeignKeyWithoutUnderscore.each do |klass, foreign_key|
      expect(const.foreign_key(klass, false)).to eq(foreign_key)
    end
  end

  it 'test_humanize' do
    C::UnderscoreToHuman.each do |underscore, human|
      expect(const.humanize(underscore)).to eq(human)
    end
  end

  it 'test_humanize_without_capitalize' do
    C::UnderscoreToHumanWithoutCapitalize.each do |underscore, human|
      expect(const.humanize(underscore, capitalize: false)).to eq(human)
    end
  end

  it 'test_humanize_with_keep_id_suffix' do
    C::UnderscoreToHumanWithKeepIdSuffix.each do |underscore, human|
      expect(const.humanize(underscore, keep_id_suffix: true)).to eq(human)
    end
  end
end
