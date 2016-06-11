require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :population }
    it { should validate_presence_of :language }
  end

  # #symbol means we are testing an instance method
  describe '#name_language' do
    it 'returns name and population message' do
      country = Country.create(name: 'USA', 
                               population: '1000000', 
                               language: 'English')
      expect(country.name_language).to eq("#{country.name} has a primary language of: #{country.language}")
    end
  end

  describe "#country_size" do
    it "returns large if country size is > 1000000" do
      country = Country.create(name: 'USA', 
                               population: '3000000', 
                               language: 'English')
      expect(country.country_size).to eq('large')
    end

    it "return large if country size is == 1000000" do
      country = Country.create(name: 'USA', 
                               population: '1000000', 
                               language: 'English')
      expect(country.country_size).to eq('large')
    end

    it "returns medium if country size is > 500000" do
      country = Country.create(name: 'USA', 
                               population: '700000', 
                               language: 'English')
      expect(country.country_size).to eq('large')
    end

    it "returns small if country size < 500000" do
      country = Country.create(name: 'USA', 
                               population: '10', 
                               language: 'English')
      expect(country.country_size).to eq('Small')
    end
  end
end