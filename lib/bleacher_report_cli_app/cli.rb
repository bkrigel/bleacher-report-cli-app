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
      start_league_with_print
    end

    def start_league_with_print
      print_leagues
      start_league
    end

    def start_league
      puts ""
      @league_input = gets.strip
      # binding.pry
      s_lg_npt = @league_input.to_s.upcase
      if s_lg_npt == 'NBA' || s_lg_npt == 'NFL' || s_lg_npt == 'MLB' || s_lg_npt == 'NHL'
        start_division_with_print
      elsif s_lg_npt.downcase == 'end' || s_lg_npt.downcase == 'exit'
        end_message
      else
        puts ''
        puts '      * Please enter the name of a league or "end" to exit the program *'
        puts ''
        start_league
      end
    end

    def start_division_with_print
      print_divisions(@league_input)
      start_division
    end

    def start_division
      puts ''
      @division_input = gets.strip
      s_dvsn_npt = @division_input.to_s.downcase
      if s_dvsn_npt == divisions.to_s.downcase.any?
        start_team_with_print
      elsif s_dvsn_npt == 'back'
        start_league_with_print
      elsif s_dvsn_npt == 'end' || s_dvsn_npt == 'exit'
        end_message
      else
        puts ''
        puts '        Please enter the name of a division, "back" to see leagues, or "end" to exit the program.'
        puts ''
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
      if s_tm_npt == teams.to_s.downcase.any?
        start_article_with_print
      elsif s_tm_npt == 'back'
        start_division_with_print
      elsif s_tm_npt == 'end' || s_tm_npt == 'exit'
        end_message
      else
        puts ''
        puts '        Please enter the name of a team, "back" to see divisions, or "end" to exit the program.'
        puts ''
        start_team
      end
    end

    def start_article_with_print
      print_articles(@team_input)
      start_article
    end

    def start_article
      puts ''
      @article_input = gets.strip
      s_rtcl_npt = @article_input.to_s.downcase
      if s_rtcl_npt == 'back'
        start_team_with_print
      elsif s_rtcl_npt == 'end' || s_rtcl_npt == 'exit'
        end_message
      else
        puts ''
        puts '        Please enter "back" to see teams or "end" to exit the program.'
        puts ''
        start_article
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

