module DevisePasswordEncrypter

  # password compare stolen from devies password_valid? 
  # https://github.com/plataformatec/devise/blob/65700b22bab0746a40358dacb32197280acf2888/lib/devise/models/database_authenticatable.rb
  class Compare
    attr_reader :encrypted_password

    # constant-time comparison algorithm to prevent timing attacks stolen from Devise.secure_compare
    def self.secure_compare(a, b)
      return false if a.blank? || b.blank? || a.bytesize != b.bytesize
      l = a.unpack "C#{a.bytesize}"
      res = 0
      b.each_byte { |byte| res |= byte ^ l.shift }
      res == 0
    end

    def call(encrypted_password, password)
      return false if encrypted_password.blank?
      bcrypt = ::BCrypt::Password.new(encrypted_password)
      password = "#{password}#{pepper}"
      password = ::BCrypt::Engine.hash_secret(password, bcrypt.salt)
      self.class.secure_compare(password, encrypted_password)
    end

    private

    def pepper
      nil.to_s
    end
  end
end
