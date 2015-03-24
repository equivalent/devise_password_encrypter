module DevisePasswordEncrypter

  # encrypter is trying to be as close as possible to 
  # devise passwor generator https://github.com/plataformatec/devise/blob/65700b22bab0746a40358dacb32197280acf2888/lib/devise/models/database_authenticatable.rb
  class Encrypter
    def call(password)
      ::BCrypt::Password.create(password+pepper, cost: stretches)
    end

    private

    def pepper
      # User.pepper
      nil.to_s
    end

    def stretches
      # User.stretches
      10
    end
  end
end
