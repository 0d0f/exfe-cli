require "spec_helper"

describe ExfeCli::Engine do
  subject { ExfeCli::Engine.new }
  it { should respond_to :login }
  let(:engine) { subject }

  context 'login' do
    it "should return nil if login failed" do
      engine.stub(:post).and_return(fixture('login_failed.json'))
      engine.login('afu@forresty.com', 'secret').should == nil
    end

    it "should return auth token if login success" do
      engine.stub(:post).and_return(fixture('login_success.json'))
      engine.login('afu@forresty.com', 'secret')[:token].length.should > 0
    end
  end

  context 'crosses' do
    it "should return an Array" do
      engine.stub(:get).and_return(fixture('crosses.json'))
      engine.crosses.should be_an Array
    end
  end

  context 'cross' do
    it "should return a Hash" do
      engine.stub(:get).and_return(fixture('100002.json'))
      engine.cross(100002).should be_a Hash
    end
  end

  # context "profile" do
  #   it "should return a hash" do
  #     engine.stub(:get).and_return(fixture('profile.json'))
  #     engine.profile.should be_a Hash
  #   end
  # end
end