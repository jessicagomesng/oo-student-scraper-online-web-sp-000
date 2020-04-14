require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)

    html = open(index_url)
    doc = Nokogiri::HTML(html)

    students = []
    #create a new hash for each student
    #push each hash onto the array

    doc.css("div.student-card").each do |student|
      student = {:name => student.css("a div.card-text-container h4.student-name").text,
      :location => student.css("a div.card-text-container p.student-location").text,
      :profile_url => student.css("a").attribute("href").value}

      students << student
    end

    students
  end

  def self.scrape_profile_page(profile_url)

    html = open(profile_url)
    profile = Nokogiri::HTML(html)
    binding.pry

    #iterate over the socials and return an array with the link for each social
    #create a new array with the socials, with the icon link => link
    student_profile = {}
    social_icons = []
    social_links = []

    profile.css(".social-icon-container a").each do | social|
      social_icon = social.css("img.social-icon").attribute("src").value
      social_icons << social_icon
      social_link = social.attribute("href").value
      social_links << social_link
    end

    if social_icons.any? { |icon| icon.downcase.include?("twitter") }
      social_icons.index { |icon| icon.include?("twitter") }


    #social_array = profile.css(".social-icon-container a").collect { |social| social.attribute("href").value }
    #social_icons = profile.css(".social-icon-container a img.social-icon"). collect { |social| social.attribute("src").value }

    #if the Twitter exists
    #if social_icons.any? { |link| link.downcase.include?("twitter") }
      #create a Twitter key with the link as the value
    #end

    #if social_icons.any? { |link| link.downcase.include?("linkedin") }
    #  student_profile[:linkedin] = social_array.select { |link| link.downcase.include?("linkedin")}.join
    #end

    #if social_icons.any? { |link| link.downcase.include?("github") }
    #  student_profile[:github] = social_array.select { |link| link.downcase.include?("github")}.join
    #end

    #if social_icons.any? { |link| link.downcase.include?("rss") }
    #  student_profile[:blog] = social_array.select { |link| link.downcase.include?("github")}.join



    #student_profile[:profile_quote] = profile.css(".profile-quote").text

    #student_profile[:bio] = profile.css(".bio-content .description-holder p").text

    #student_profile

  end

end

Scraper.scrape_profile_page("https://learn-co-curriculum.github.io/student-scraper-test-page/students/ryan-johnson.html")

#grab each social section: doc.css(".social-icon-container a")[index]
#Twitter, Linkedin, Github, Youtube
#link for twitter: doc.css(".social-icon-container a")[index].attribute("href").value
#profile quote: doc.css(".profile-quote").text
#bio: doc.css(".bio-content .description-holder p").text

#icon = profile.css(".social_icon_container a img.social-icon")
