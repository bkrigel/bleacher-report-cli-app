module BleacherReportCliApp
  class Scraper

    def self.scrape_divisions
      division_names = []
      page = Nokogiri::HTML(open("https://www.nhl.com/info/teams/"))
      @divisions = page.css("div.division").each do |division|
        division_name = division.css("h3").text
        division_names << division_name
      end
      division_names
    end

    # def scrape_conference
    #   conference_names = []
    #   page = Nokogiri::HTML(open("https://www.nhl.com/info/teams/"))
    #   # binding.pry
    #   @conferences = page.css("section.marketing-block marketing-body teams").each do |conference|
    #     conference_name = conference.css("h2").text
    #     conference_names << conference_name
    #   end
    #   conference_names
    #   binding.pry
    # end

    def self.scrape_teams
      team_names = []
      page = Nokogiri::HTML(open("https://www.nhl.com/info/teams/"))
      @teams = page.css("div.division div.ticket-team").each do |team|
        team_name = team.css("div.ticket-team_details a span[class='team-name']").text
        team_city = team.css("div.ticket-team_details a span[class='team-city']").text
        full_team_name = team_city + " " + team_name
        team_names << full_team_name
      end
      team_names
    end

  end
end


# try .first.text



# scraper_teams is a mix of conference and teams. Do not try to scrape conferences if proves too difficult... do teams first.
