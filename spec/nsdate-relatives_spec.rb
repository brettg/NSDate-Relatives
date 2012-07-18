require 'spec_helper'

# Looks like NSDate and ruby Time are the same so we'll roll w/ that...
describe 'NSDate+Relatives' do
  let (:base_date) {Time.local(2011, 7, 21, 10, 10, 11)}

  describe 'beginningOfDay' do
    it 'should return 00:00 of the same day' do
      base_date.beginningOfDay.should == Time.local(2011, 7, 21)
    end
  end

  describe 'beginningOfWeek' do
    it 'should return 00:00 Sunday of that week' do
      base_date.beginningOfWeek.should == Time.local(2011, 7, 17)
    end
  end

  describe 'begginningOfMonth' do
    it 'should return 00:00 on the first of the month' do
      base_date.beginningOfMonth.should == Time.local(2011, 7, 1)
    end
  end

  describe 'beginningOfYear' do
    it 'should return 00:00 on the first of year' do
      base_date.beginningOfYear.should == Time.local(2011, 1, 1)
    end
  end

  describe 'previousDay' do
    it 'should return the same time on the previous day' do
      base_date.previousDay.should == Time.local(2011, 7, 20, 10, 10, 11)
    end
    it 'should work across months and years' do
      d = Time.local(2011, 1, 1)
      d.previousDay.should == Time.local(2010, 12, 31)
    end
  end

  describe 'previousWeek' do
    it 'should return the same time a week earlier' do
      base_date.previousWeek.should == Time.local(2011, 7, 14, 10, 10, 11)
    end
    it 'should work across years' do
      d = Time.local(2011, 1, 3)
      d.previousWeek.should == Time.local(2010, 12, 27)
    end
  end

  describe 'previousMonth' do
    it 'should return time and day a month earlier' do
      base_date.previousMonth.should == Time.local(2011, 6, 21, 10, 10, 11)
    end
    it 'should work across years' do
      d = Time.local(2011, 1, 30)
      d.previousMonth.should == Time.local(2010, 12, 30)
    end
    it 'should use the latest day in the month if the current day does not exist in prev month' do
      d = Time.local(2011, 3, 30)
      d.previousMonth.should == Time.local(2011, 2, 28)
    end
  end

  describe 'previousYear' do
    it 'should return the same day and time a year earlier' do
      base_date.previousYear.should == Time.local(2010, 7, 21, 10, 10, 11)
    end
    it 'should return the day after given a leap day' do
      d = Time.local(2008, 2, 29)
      d.previousYear.should == Time.local(2007, 3, 1)
    end
  end
end
