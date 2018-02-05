class Student

  def initialize(name, cohort)
    @name = name
    @cohort = cohort
  end

  def name
    return @name
  end

  def cohort
    return @cohort
  end

  def change_name(name)
    @name = name
  end

  def change_cohort(cohort)
    @cohort = cohort
  end

  def talk()
    return "I can talk!"
  end

  def fave_language(language)
    return "I love #{language}"
  end

end

class Team

  attr_accessor :team_name, :players, :team_coach
  attr_reader :points


  def initialize(team_name, players, team_coach)
    @team_name = team_name
    @players = players
    @team_coach = team_coach
    @points = 0
  end

  def add_player(name)
    @players.push(name)
  end

  def players_check(player)
    return @players.include? player
  end

  def points()
    return @points
  end

  def change_points(result)
    @points += 1 if result == "win"
  end
  # def team_name()
  #   return @team_name
  # end
  #
  # def players()
  #   return @players
  # end
  #
  # def team_coach()
  #   return @team_coach
  # end

  # def change_team_name(new_name)
  #   @team_name = new_name
  # end
  #
  # def change_players(new_players)
  #   @players = new_players
  # end
  #
  # def change_team_coach(new_team_coach)
  #   @team_coach = new_team_coach
  # end

end

class Library

  def initialize(books)
    @books = books
  end


  def books()
    return @books
  end


  def book_info(name)
    for book in @books
      if book[:title] == name
        return book
      end
    end
  end

  def rental_dets(name)
    for book in @books
      if book[:title] == name
        return book[:rental_details]
      end
    end
  end

  def add_new_book(name)
    new_book = {
      title: name,
      rental_details: {
        student_name: "",
        date: ""
      }
    }
    @books.push(new_book)
  end

  def book_entry_change(book_name, student_name, date)
    for book in @books
      if book[:title] == book_name
        book[:rental_details] = {
          student_name: student_name,
          date: date
        }
      end
    end
  end

end
