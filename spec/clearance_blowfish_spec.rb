require 'spec_helper'
require 'clearance_blowfish'

describe Clearance::PasswordStrategies::Blowfish do

  subject do
    fake_model_with_password_strategy(Clearance::PasswordStrategies::Blowfish)
  end

  let(:salt) { 'salt' }
  let(:password) { 'password' }

  before do
    subject.salt = salt
    subject.password = password
  end

  it 'does not initialize the salt' do
    expect(subject.salt).to eq salt
  end

  it 'encrypts the password using Blowfish and the existing salt' do
    cipher = OpenSSL::Cipher::Cipher.new('bf-cbc').encrypt
    cipher.key = Digest::SHA256.digest(salt)
    expected = cipher.update("--#{salt}--#{password}--") << cipher.final
    expect(subject.encrypted_password).to eq expected
  end

  it "should have a VERSION constant" do
    version = Clearance::PasswordStrategies::Blowfish.const_get('VERSION')
    expect(version).to_not be_empty
  end

  context 'when the salt is not set' do
    before do
      subject.salt = nil
      subject.password = 'whatever'
    end
    it 'initializes the salt' do
      expect(subject.salt).not_to be_nil
    end
  end

end