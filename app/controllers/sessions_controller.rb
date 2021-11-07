class SessionsController < ApplicationController
  # This method, we're setting values on the session hash and the cookies hash, serializing them in the response so we can view 
  # their values in the browser
  # ||= is shorthand to assign a value if the current value is nil or false. 
  # so if session[:session_hello] has not already been assigned a value, it will be assigned a value of "World" 
  # otherwise it wont get assigned a new value
  def index
    #byebug
    session[:session_hello] ||= "World"
    cookies[:cookies_hello] ||= "World"
    render json: { session: session, cookies: cookies.to_hash }
  end
end

# Make a request to localhost/sessions, you'll see session and hookies hashes
# that can store key-value pairs of data. 
# the entire session hash is actually stored in that _session_id cookie, in 
# a signed and encrypted format, which makes it inpossible for a user to tamper with 

# View cookie info directly in the browser in 
# dev tools => Application => cookies (under storage" in the pane on the left)
