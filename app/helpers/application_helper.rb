module ApplicationHelper

def user_avatar 

if  @tweet.user.avatar.thumb.url.present?
image_tag(@tweet.user.avatar.s_thumb.url)
else
image_tag('default.jpg', height: 50, width: 40)
end 
end

def user_avatar_large
if  @tweet.user.avatar.thumb.url.present?
image_tag(@tweet.user.avatar.thumb.url, class: "img-responsive")
else
image_tag('default.jpg', height: 150, width: 150)
end 
end




end 
