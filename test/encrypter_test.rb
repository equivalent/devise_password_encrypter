require 'devise_password_encrypter'
require 'minitest/autorun'
require 'bcrypt'

describe described_class = DevisePasswordEncrypter::Encrypter do
  let(:subject) { described_class.new() }

  describe '#call' do
    let(:encrypted_password) { subject.call(password)  }
    let(:password) { 'abcd123' }

    it 'should generate encrypted password' do
      # bcrypted passowrds are 60 char in length
      encrypted_password.must_be_kind_of String
      encrypted_password.length.must_equal 60
    end
  end
end
