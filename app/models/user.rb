class User < ApplicationRecord
  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x.freeze

  REGEX_PATTERN = /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 25 }
  validates :email, presence: true, format: { with: REGEX_PATTERN },
                    uniqueness: true, length: { minimum: 5, maximum: 25 }
  validates :password, presence: true, format: { with: PASSWORD_FORMAT }, length: { minimum: 8, maximum: 20 }
end
