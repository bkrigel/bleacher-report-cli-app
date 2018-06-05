class BleacherReportCliApp::CLI

  def call
    puts ""
    puts "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
    puts "|------------//  Welcome to Ben's Bleacher Report App  \\\\------------|"
    puts "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
    puts ""
    start
  end

  def start
    print_leagues
    puts ""
    league_input = gets.strip
    print_divisions(league_input)
    puts ""
    division_input = gets.strip
    if division_input == "back"
      start
    else
      print_teams(division_input)
    end
    puts ""
    team_input = gets.strip
    if team_input == "back"
      #print_teams(division_input)
    else
      print_articles(team_input)
    end
    puts ""

  end

  def print_leagues
    puts "      ---> NBA"
    puts "      ---> NFL"
    puts "      ---> MLB"
    puts "      ---> NHL"
    puts ""
    puts "                * Please enter the name of a league *"
    puts "  +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
  end

  def print_divisions(league)
    puts "    #{league}:"
    # for each league, print divisions
    puts "      ---> #{division}"
    puts ""
    puts "                * Please enter the name of a division *"
    puts "                    OR enter \"back\" to see leagues"
    puts "  +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
  end

  def print_teams(division)
    puts "    #{division} Division:"
    # for each division, print teams
    puts "      ---> #{team}"
    puts ""
    puts "                  * Please enter the name of a team *"
    puts "                     OR enter \"back\" to see leagues"
    puts "  +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
  end

  def print_articles(team)
    puts "    Top 5 Articles for #{team}:"
    # for each team, print top 5 headlines
    # puts "      ---> #{headline}"
    puts ""
    puts "                    * Enter \"back\" to see teams *"
    puts "  +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
  end

end

