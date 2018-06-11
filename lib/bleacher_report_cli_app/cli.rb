require 'pry'
require_relative './scraper.rb'

module BleacherReportCliApp
  class CLI

    attr_accessor :league_input, :division_input, :team_input, :article_input

    def call
      puts ""
      puts "<============================================================================>"
      puts "  >--------------->  Welcome to Ben's Bleacher Report App  <---------------<"
      puts "<============================================================================>"
      puts ''
      start_league_with_print
    end

    def start_league_with_print
      print_leagues
      start_league
    end

    def start_league
      puts ""
      @league_input = gets.strip
      s_lg_npt = @league_input.to_s.upcase
      if s_lg_npt == "NHL"
        start_division_with_print
      elsif s_lg_npt == "NBA" || s_lg_npt == "NFL" || s_lg_npt == "MLB"
        puts ""
        puts "         * Sorry, functionality only available for NHL right now... "
        puts "       Please enter the name of a league or \"end\" to exit the program *"
        puts ""
        start_league
      elsif s_lg_npt.downcase == "end" || s_lg_npt.downcase == "exit"
        end_message
      else
        puts ""
        puts "      * Please enter the name of a league or \"end\" to exit the program *"
        puts ""
        start_league
      end
    end

    def start_division_with_print
      print_divisions
      start_division
    end

    def start_division
      puts ""
      @division_input = gets.strip
      s_dvsn_npt = @division_input.to_s.downcase
      if Scraper.scrape_divisions.any? {|division| division.split(" ")[0].downcase == s_dvsn_npt || division.downcase == s_dvsn_npt}
        start_team_with_print
      elsif s_dvsn_npt == "back"
        start_league_with_print
      elsif s_dvsn_npt == "end" || s_dvsn_npt == "exit"
        end_message
      else
        puts ""
        puts "                * Please enter the name of a division,"
        puts "         \"back\" to see leagues, or \"end\" to exit the program. *"
        puts ""
        start_division
      end
    end

    def start_team_with_print
      print_teams(@division_input)
      start_team
    end

    def start_team
      puts ''
      @team_input = gets.strip
      s_tm_npt = @team_input.to_s.downcase
      # if s_tm_npt == teams.to_s.downcase.any?
      #   start_article_with_print
      if s_tm_npt == "back"
        start_division_with_print
      elsif s_tm_npt == "end" || s_tm_npt == "exit"
        end_message
      else
        puts ""
        puts "      * Please enter the name of a team, \"back\" to see divisions, or \"end\" to exit the program. *"
        puts ''
        start_team
      end
    end

    def start_article_with_print
      print_articles(@team_input)
      start_article
    end

    def start_article
      puts ""
      @article_input = gets.strip
      s_rtcl_npt = @article_input.to_s.downcase
      if s_rtcl_npt == "back"
        start_team_with_print
      elsif s_rtcl_npt == "end" || s_rtcl_npt == "exit"
        end_message
      else
        puts ""
        puts "        Please enter \"back\" to see teams or \"end\" to exit the program."
        puts ""
        start_article
      end
    end

    def print_leagues
      puts "   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
      puts ""
      puts "        ---> NBA"
      puts "        ---> NFL"
      puts "        ---> MLB"
      puts "        ---> NHL"
      puts ""
      puts "   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
      puts "                    * Please enter the name of a league *"
    end

    def print_divisions
      puts "   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
      puts ""
      puts "        NHL:"
      Scraper.scrape_divisions.each do |division|
        puts "            ---> #{division}"
      end
      puts ""
      puts "   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"

      puts "                * Please enter the name of a division *"
      puts "                    OR enter \"back\" to see leagues"
    end

    def print_teams(division)
      puts "   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
      puts ""
      puts "        #{league_input.upcase}:"
      if division_input.downcase.include?("division")
        puts "            #{division_input.split(/ |\_/).map(&:capitalize).join(" ")}:"
      else puts "            #{division_input.split(/ |\_/).map(&:capitalize).join(" ")} Division:"
      end
      if division_input.downcase.include?("metropolitan")
        Scraper.scrape_teams[0..7].each do |team|
          puts "                ---> #{team}"
        end
      elsif division_input.downcase.include?("atlantic")
        Scraper.scrape_teams[8..15].each do |team|
          puts "                ---> #{team}"
        end
      elsif division_input.downcase.include?("central")
        Scraper.scrape_teams[16..22].each do |team|
          puts "                ---> #{team}"
        end
      elsif division_input.downcase.include?("pacific")
        Scraper.scrape_teams[23..30].each do |team|
          puts "                ---> #{team}"
        end
      end
      puts ""
      puts "   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"

      puts "                  * Please enter the name of a team *"
      puts "                    OR enter \"back\" to see divisions"
    end

    # def print_articles(team)
    #   puts "   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
    #   puts ""
    #   puts "        Top 5 Articles for #{team}:"
    #   # for each team, print top 5 headlines
    #   puts "            ---> 5 headlines"
    #   puts ""
    #   puts "   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"

    #   puts "                    * Enter \"back\" to see teams *"
    # end

    def end_message
      puts ""
      puts "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
      puts "       Thank you for using Ben's Bleacher Report App! Come back soon!!        "
      puts "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
      puts ""
    end

  end
end

