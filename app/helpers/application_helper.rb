module ApplicationHelper

def user_avatar 
if  @tweet.user.avatar.thumb.url.present?
image_tag(@tweet.user.avatar.thumb.url)
else
image_tag('default.jpg', height: 50, width: 40)
end 
end

def user_avatar_profile
if  @tweet.user.avatar.thumb.url.present?
image_tag(@tweet.user.avatar.thumb.url)
else
image_tag('default.jpg', height: 150, width: 150)
end 
end

end 
