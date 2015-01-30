require 'date'
require 'rubygems'
require 'json'
require 'rest-client' 
require 'digest'
require 'rpi_gpio'

# Run `gpio readall` to confirm BCM pin number(s)
pin_out = 17  # LED

RPi::GPIO.set_numbering(:bcm)
RPi::GPIO.set_warnings(0)
RPi::GPIO.setup(pin_out, as: :output)

# Go to https://console.developers.google.com/project to create a new project,
# enable the Calendar API, and create an API access key
CALENDAR_ID = "__YOUR_CALENDAR_ID__"
API_KEY = "__YOUR_API_KEY__"
source_url = "https://www.googleapis.com/calendar/v3/calendars/#{CALENDAR_ID}/events?key=#{API_KEY}"

def get_feed(url, expiry_sec = 60)
  filename = Digest::MD5.hexdigest(url)
  file_path = File.join(File.dirname(__FILE__), "tmp", filename)
  # Write a new cache file if one doesn't exist or the existing one is expired
  if !File.exists?(file_path) || (Time.now - File.mtime(file_path)) > expiry_sec
    File.open(file_path, "w") do |data|
      puts "writing cache file to #{file_path}"
      data << RestClient.get(url)
    end
  end
  # Read file contents into memory and close stream
  contents = ""
  File.open(file_path, "r") do |file|
    puts "reading cache file from #{file_path}"
    contents = file.read
  end
  contents
end

def room_reserved?(data)
  puts "checking if room is reserved"
  data['items'].any? do |event|
    start_date = DateTime.parse(event['start']['dateTime'])
    end_date = DateTime.parse(event['end']['dateTime'])
    (start_date..end_date).cover?(DateTime.now)
  end
end

begin
  loop do
    raw_data = get_feed(source_url)
    json = JSON.parse(raw_data)
    if room_reserved?(json)
      RPi::GPIO.set_high(pin_out)
    else
      RPi::GPIO.set_low(pin_out)
    end
    sleep(30)
  end
rescue Interrupt
  puts 'Done'
ensure
  RPi::GPIO.set_low(pin_out)
  RPi::GPIO.clean_up
end
