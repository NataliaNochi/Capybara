Before do
  @login_page = LoginPage.new
  @movie_page = MoviePage.new
  @sidebar = SideBarView.new
end

Before("@login") do
  user = CONFIG["users"]["manager"]
  @login_page.go
  @login_page.with(user["email"], user["pass"])
end
  
# After do |scenario|
#   if scenario.failed?
#     temp_shot = page.save_screenshot("log/temp_shot.png")
#     screenshot = Base64.encode64(File.open(temp_shot).read)
#     embed(screenshot, "image/png", "Screenshot")
#   end
# end

After do |scenario|
 screenshot = page.save_screenshot("log/screenshots/#{scenario.__id__}.png")
 embed(screenshot, "image/png", "Screenshot")
end