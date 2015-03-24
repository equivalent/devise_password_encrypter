require 'devise_password_encrypter'
require 'minitest/autorun'

describe described_class = DevisePasswordEncrypter::Compare do
  let(:subject) { described_class.new() }

  describe '#call' do
    let(:raw_password) { 'Password1@#' }
    let(:encrypted_password) { '$2a$10$Am7wMUw4vzRoXi8Jn5gOwu9mFpWRAu/99cHfQQ4ZfX1Ot3VWXU1Ly' }

    describe 'when raw password match encrypted password' do
      it 'should be true' do
        subject
          .call(encrypted_password, raw_password)
          .must_equal true
      end
    end


    describe "when raw password don't match encrypted password" do
      let(:raw_password) { 'Password6@#' }

      it 'should be true' do
        subject
          .call(encrypted_password, raw_password)
          .must_equal false
      end
    end
  end
end
      #puts DevisePasswordEncrypter::Encrypter.new.call raw_password
