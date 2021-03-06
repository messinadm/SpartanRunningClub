require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:description) }

  describe 'paperclip validations' do
    it { should have_attached_file :photo }
    it { should validate_attachment_content_type(:photo).allowing('image/png', 'image/jpg') }
  end

  describe '::Followable' do
    it { should have_many(:followings) }
    it { should have_many(:members) }
  end

  describe '::notify_followers' do
    context 'with no upcoming events' do
      it 'should not call the mailer' do
        expect(EventMailer).to_not receive(:upcoming)
        Event.notify_followers
      end
    end

    context 'with upcoming events' do
      before(:all) do
        FactoryGirl.create(:event, date: Date.today + 2.days)
      end

      it 'should call the mailer' do
        expect(EventMailer).to receive(:upcoming).and_return(double("Mailer", deliver: true))
        Event.notify_followers
      end
    end
  end

  describe '#date_string' do
    before(:all) do
      @event = FactoryGirl.build(:event)
    end

    context 'when date is set' do
      before(:all) do
        @event.date = Date.strptime('12/25/2013', '%m/%d/%Y')
      end

      it 'should return string representing the date' do
        expect(@event.date_string).to eq '12/25/2013'
      end
    end

    context 'when date is nil' do
      before(:all) do
        @event.date = nil
      end

      it 'should return nil' do
        expect(@event.date_string).to be nil
      end
    end
  end

  describe '#time_string' do
    before(:all) do
      @event = FactoryGirl.build(:event)
    end

    context 'when time is set' do
      before(:all) do
        @event.time = Time.strptime('5:30 PM', '%l:%M %p')
      end

      it 'should return string representing the time' do
        expect(@event.time_string).to eq '5:30 PM'
      end
    end

    context 'when time is nil' do
      before(:all) do
        @event.time = nil
      end

      it 'should return nil' do
        expect(@event.time_string).to be nil
      end
    end
  end
end
