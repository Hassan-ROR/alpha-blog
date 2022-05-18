module ApplicationHelper
  def gravatar_for(user)                                     # gravatar are use md5 algorithm wich uses the hexdigest 
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase) 
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class:"img-circle")  

  end

end
