require 'minitest/autorun'
require './utilities'

describe 'Methods' do

  describe 'leap_year?' do
    it 'is a leap year when divisible by 4' do
      leap_year?(1920).must_equal(true)
      leap_year?(1924).must_equal(true)
      leap_year?(1928).must_equal(true)
    end

    it 'is not a leap year when not divisible by 4' do
      leap_year?(1921).must_equal(false)
      leap_year?(1923).must_equal(false)
      leap_year?(1922).must_equal(false)
    end

    it 'is a leap year when the year is divisible by 400' do
      leap_year?(400).must_equal(true)
      leap_year?(1600).must_equal(true)
      leap_year?(2000).must_equal(true)
    end

    it 'is not a leap year when not divisible by 400' do
      leap_year?(1300).must_equal(false)
      leap_year?(1400).must_equal(false)
      leap_year?(1500).must_equal(false)
    end

  end

  describe 'percent_of_a_year' do
    it 'correctly calculates percentage' do
      percent_of_a_year(0).must_equal("0.0%")
      percent_of_a_year(30*60*24*365).must_equal("50.0%")
      percent_of_a_year(60*60*24*365).must_equal("100.0%")
    end
  end

  describe 'standard_to_military_time' do
    it 'works in the morning' do
      standard_to_military_time("6:00 AM").must_equal("6:00")
    end

    it 'works at noon' do
      standard_to_military_time("12:00 PM").must_equal("12:00")
    end

    it 'works in the afternoon' do
      standard_to_military_time("6:00 PM").must_equal("18:00")
    end

    it 'works at midnight' do
      standard_to_military_time("12:00 AM").must_equal("0:00")
    end

  end

  describe 'military_to_standard_time' do
    it 'works in the morning' do
      military_to_standard_time("6:00").must_equal("6:00 am")
    end

    it 'works at noon' do
      military_to_standard_time("12:00").must_equal("12:00 pm")
    end

    it 'works in the afternoon' do
      military_to_standard_time("18:00").must_equal("6:00 pm")
    end

    it 'works at midnight' do
      military_to_standard_time("0:00").must_equal("12:00 am")
    end

  end
  
  describe 'curfew' do
    it 'works on weekdays' do
      curfew?("8:00 pm", true).must_equal(true)
      curfew?("7:59 pm", true).must_equal(false)
    end

    it 'works on weekends' do
      curfew?("10:00 pm", false).must_equal(true)
      curfew?("9:59 pm", false).must_equal(false)
    end

  end

end
