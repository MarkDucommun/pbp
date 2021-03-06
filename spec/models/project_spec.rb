require 'spec_helper'

describe Project do

  around(:each) do |example|
    VCR.use_cassette('balanced') do
      example.run
    end
  end

  let!(:project) { FactoryGirl.create(:project) }
  let(:donation) { FactoryGirl.create(:donation) }

  it 'has a valid factory' do
    project.should be_valid
  end

  it { should belong_to(:owner) }
  it { should have_many(:donations) }
  it { should have_many(:donators).through(:donations) }

  it { should validate_uniqueness_of(:title) }

  context "has a method hours donated" do
    it { should respond_to(:hours_donated) }

    it "should call method hours on all associated donations" do
      project.donations << donation
      expect(project.hours_donated).to eq donation.hours
    end
  end

  context "has a method hours remaining" do
    it { should respond_to(:hours_remaining) }

    it "should subtract hours goal from hours donated" do
      project.donations << donation
      expected = project.hour_goal - donation.hours
      expect(project.hours_remaining).to eq expected
    end
  end

  context "has a method dollars donated" do
    it { should respond_to(:get_dollars_donated) }

    it "should call method dollar_amount on each associated donation" do
      project.donations << donation
      expect(project.get_dollars_donated).to eq donation.get_dollar_amount
    end
  end

  context "has a method dollars remaining" do
    it { should respond_to(:get_dollars_remaining) }

    it "should subtract dollars goal from dollars donated" do
      project.donations << donation
      expected = project.get_dollar_goal - donation.get_dollar_amount
      expect(project.get_dollars_remaining).to eq expected
    end
  end

  context "has a method time remaining" do
    it { should respond_to(:time_remaining) }

    it "should return how many days are left until the deadline" do
      expect(project.time_remaining).to be_between(29, 30)
    end
  end

  context "has a method funded?" do
    it { should respond_to(:funded?) }

    it "should return a boolean" do
      expect( project.funded? ).to be_false
    end

    it "should return true when a project is funded" do
      donation.dollar_amount = 100_000
      donation.hours = 100_000
      donation.save
      project.donations << donation
      expect( project.funded? ).to be_true
    end
  end
end
