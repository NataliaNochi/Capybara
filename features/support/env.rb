require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "os"

require_relative "helpers"

World(Helpers)

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))

case ENV["BROWSER"]
when "firefox"
    @driver = :selenium
when "chrome"
    @driver = :selenium_chrome
when "headless"
  Capybara.register_driver :selenium_chrome_headless do |app|
    option.add_argument "--headless"
    option.add_argument "--disable-gpu"
    option.add_argument "--no-sandbox"
    option.add_argument "--disable-site-isolation-trials"
  end
  Capybara::Selenium::Driver.new(app, browser: :chrome, option: chrome_options)
end
@driver = :selenium_chrome_headless
else
    puts "Invalid Browser"
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG["url"] 
  config.default_max_wait_time = 10
end
