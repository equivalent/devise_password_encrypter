require 'devise_password_encrypter'
require 'minitest/autorun'

describe 'Integration of password encrypter and password comparer' do
  it do
    enc = DevisePasswordEncrypter::Encrypter.new().call('myPass')
    result = DevisePasswordEncrypter::Compare.new.call(enc, 'myPass')
    result.must_equal true
  end
end
