#1 - Pull the json from the reddit API via http://www.reddit.com/.json
  # - http://mashable.com/stories.json (homework)

#2 - Parse it using the JSON library
#3 - Find the stories based on techniques used in the code_along (max of 25 provided)
#4 - Create a new story hash out of each story with the following keys :title, :upvotes and :category
    #title, #category and #upvotes may not be the names use
#5 - Add each story to an array
#6 - Print each story from the array on your "Front Page"
#7 - BONUS ### create an 'csv' file using the api data & Ruby's CSV library
     # -> http://ruby-doc.org/stdlib-2.2.2/libdoc/csv/rdoc/CSV.html
         #title, upvote, category are the required columns

require 'rest-client'
require 'pry'
require 'json'

def connect_to_api(url)
  response = RestClient.get(url)
  json_response = JSON.parse(response)
  find_stories(json_response)
end

def find_stories(response)
  stories = response ["data"]["children"]
  puts "Reddit has blessed us with #{stories.count} stories"
  print_stories(stories)
end

def print_stories(stories)
  stories.each do |story|
  story = create_story_hash(story)
  puts "Title: #{story[:title]}. Category: #{story[:category]}. Upvotes: #{story[:upvotes]}"
end

end

def create_story_hash(story)
  {title: story["data"]["title"], upvotes: story["data"]["ups"],  category: story["data"]["subreddit"]}
end

## take hash and put into array


url = "http://www.reddit.com/.json"
response = connect_to_api(url)
