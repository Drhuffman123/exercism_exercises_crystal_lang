class PasswordLock
  # digit password uses an Int32
  # the alphanumeric password uses a String
  # the fingerprint password uses a Float64

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
    if pw == @b4locked_password
      "Unlocked"
    else
      nil
    end
  end
end
