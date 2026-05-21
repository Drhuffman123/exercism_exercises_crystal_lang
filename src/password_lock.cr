class PasswordLock
  # Digit password uses an Int32.
  # The alphanumeric password uses a String.
  # The fingerprint password uses a Float64.

  property b4locked_password : Float64 | Int32 | String
  property password : Float64 | Int32 | String

  def initialize(password)
    @b4locked_password = @password = password
  end

  def encrypted(password)
    if password.is_a?(Int32)
      (password.to_i/2).round
    elsif password.is_a?(String)
      "#{password}".reverse
    else
      Float64.new(password)*4
    end
  end

  def encrypt
    @password = encrypted(@password)
    self
  end

  def unlock?(pw : Float64 | Int32 | String)
    # encrypted(pw) # sorry, it can't be reused, at leasst not directly.
    if pw == @b4locked_password
      "Unlocked"
    else
      nil
    end
  end
end
