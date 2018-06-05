require 'pry'

module BleacherReportCliApp
  class CLI

    attr_accessor :league_input, :division_input, :team_input, :article_input

    def call
      puts ''
      puts '<============================================================================>'
      puts "  >--------------->  Welcome to Ben's Bleacher Report App  <---------------<"
      puts '<============================================================================>'
      puts ''
      start_league
    end

    def start_league
      print_leagues
      puts ""
      @league_input = gets.strip
      # binding.pry
      if @league_input.to_s.upcase == 'NBA' || 'NFL' || 'MLB' || 'NHL'
        start_division
      elsif @league_input.to_s.downcase == 'end' || 'exit'
        end_message
      else
        puts 'Please enter the name of a league or "end" to exit the program.'
        @league_input = gets.strip
      end
    end

    def start_division
      print_divisions(@league_input)
      puts ''
      @division_input = gets.strip
      if @division_input.to_s.downcase == divisions.to_s.downcase.any?
        start_team
      elsif @division_input.to_s.downcase == 'back'
        start_league
      elsif @division_input.to_s.downcase == 'end' || 'exit'
        end_message
      else
        puts 'Please enter the name of a division, "back" to see leagues, or "end" to exit the program.'
        @division_input = gets.strip
      end
    end

    def start_team
      print_teams(@division_input)
      puts ''
      @team_input = gets.strip
      if @team_input.to_s.downcase == teams.to_s.downcase.any?
        start_article
      elsif @team_input.to_s.downcase == 'back'
        start_division
      elsif @team_input.to_s.downcase == 'end' || 'exit'
        end_message
      else
        puts 'Please enter the name of a team, "back" to see divisions, or "end" to exit the program.'
        @team_input = gets.strip
      end
    end

    def start_article
      print_articles(@team_input)
      puts ''
      @article_input = gets.strip
      if @article_input.to_s.downcase == 'back'
        start_team
      elsif @article_input.to_s.downcase == 'end' || 'exit'
        end_message
      else
        puts 'Please enter "back" to see teams or "end" to exit the program.'
        @article_input = gets.strip
      end
    end

    def print_leagues
      puts '   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
      puts ''
      puts '        ---> NBA'
      puts '        ---> NFL'
      puts '        ---> MLB'
      puts '        ---> NHL'
      puts ''
      puts '   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
      puts '                    * Please enter the name of a league *'
    end

    def print_divisions(league)
      puts '   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
      puts ''
      puts '        #{league}:'
      # for each league, print divisions
      puts '            ---> #{division}'
      puts ''
      puts '   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'

      puts '                * Please enter the name of a division *'
      puts '                    OR enter "back" to see leagues'
    end

    def print_teams(division)
      puts '   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
      puts ''
      puts '        #{league}:'
      puts '            #{division} Division:'
      # for each division, print teams
      puts '                ---> #{team}'
      puts ''
      puts '   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'

      puts '                  * Please enter the name of a team *'
      puts '                    OR enter "back" to see divisions'
    end

    def print_articles(team)
      puts '   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
      puts ''
      puts '        Top 5 Articles for #{team}:'
      # for each team, print top 5 headlines
      puts "            ---> #{headline}"
      puts ''
      puts '   +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'

      puts '                    * Enter "back" to see teams *'
    end

    def end_message
      puts ''
      puts '+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
      puts "       Thank you for using Ben's Bleacher Report App! Come back soon!!        "
      puts '+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
      puts ''
    end

  end
end

