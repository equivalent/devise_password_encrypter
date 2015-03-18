require 'devise_password_encrypter'
require 'minitest/autorun'
require 'bcrypt'

describe described_class = DevisePasswordEncrypter::PasswordEncrypter do
  describe '#call' do
    let(:encrypted_password) { described_class.new().call(password)  }
    let('password') { 'abcd123' }

    it 'should generate encrypted password' do
      encrypted_password.must_be_kind_of String
      encrypted_password.length.must_equal 60
    end
  end
end
