require("minitest/autorun")
require_relative("../classes_lab.rb")

class TestStudent < MiniTest::Test

  def setup
    @student_one = Student.new("Verity", 1)
  end

  def test_name()
    student_name = @student_one.name()
    assert_equal("Verity", student_name)
  end

  def test_cohort()
    student_cohort = @student_one.cohort()
    assert_equal(1, student_cohort)
  end

  def test_change_name()
    @student_one.change_name("David")
    new_name = @student_one.name()
    assert_equal("David", new_name)
  end

  def test_change_cohort
    @student_one.change_cohort(19)
    new_cohort = @student_one.cohort()
    assert_equal(19, new_cohort)
  end

  def test_talk
    speach = @student_one.talk()
    assert_equal("I can talk!", speach)
  end

  def test_fave_language
    fave_language = @student_one.fave_language("Ruby")
    assert_equal("I love Ruby", fave_language)
  end

end

class TestTeam < MiniTest::Test

  def setup
    @team_one = Team.new("CodeClan", ["Verity", "Dan", "Bert", "Rob"], "Jarrod")
  end

  def test_team_name
    team_name = @team_one.team_name()
    assert_equal("CodeClan", team_name)
  end

  def test_players
    players = @team_one.players()
    assert_equal(["Verity", "Dan", "Bert", "Rob"], players)
  end

  def test_coach
    team_coach = @team_one.team_coach()
    assert_equal("Jarrod", team_coach)
  end

  def test_change_team_name
    @team_one.team_name="CodeBase"
    new_team_name = @team_one.team_name()
    assert_equal("CodeBase", new_team_name)
  end

  def test_change_players
    @team_one.players=["Kash", "Amy", "Jane", "Kishan"]
    new_players = @team_one.players()
    assert_equal(["Kash", "Amy", "Jane", "Kishan"], new_players)
  end

  def test_change_team_coach
    @team_one.team_coach="Darren"
    new_team_coach = @team_one.team_coach()
    assert_equal("Darren", new_team_coach)
  end

  def test_add_player
    @team_one.add_player("Paul")
    players = @team_one.players()
    assert_equal(["Verity", "Dan", "Bert", "Rob", "Paul"], players)
  end

  def test_players_check__are_in
    player_check = @team_one.players_check("Verity")
    assert_equal(true, player_check)
  end

  def test_players_check__are_out
    player_check = @team_one.players_check("Oli")
    assert_equal(false, player_check)
  end

  def test_points_start_at_zero
    points = @team_one.points()
    assert_equal(0, points)
  end

  def test_change_points__win
    @team_one.change_points("win")
    points = @team_one.points()
    assert_equal(1, points)
  end

  def test_change_points__loss
    @team_one.change_points("loss")
    points = @team_one.points()
    assert_equal(0, points)
  end


end

class TestLibrary < MiniTest::Test

  def setup
    @library = Library.new([
       {
    title: "lord_of_the_rings",
    rental_details: {
     student_name: "Jeff",
     date: "01/12/16"
    }
  },
  {
   title: "harry_potter",
   rental_details: {
    student_name: "Verity",
    date: "05/02/18"
   }
  },
  {
   title: "lord_of_the_flies",
   rental_details: {
    student_name: "Calum",
    date: "14/10/17"
   }
  }
    ])

  end

  def test_books
    books = @library.books()
    assert_equal([
       {
    title: "lord_of_the_rings",
    rental_details: {
     student_name: "Jeff",
     date: "01/12/16"
    }
  },
  {
   title: "harry_potter",
   rental_details: {
    student_name: "Verity",
    date: "05/02/18"
   }
 },
 {
   title: "lord_of_the_flies",
   rental_details: {
    student_name: "Calum",
    date: "14/10/17"
   }
 }
    ], books)
  end


  def test_book_info
    info = @library.book_info("harry_potter")
    assert_equal({
     title: "harry_potter",
     rental_details: {
      student_name: "Verity",
      date: "05/02/18"
     }}, info)
  end

  def test_rental_dets
    rental_dets = @library.rental_dets("harry_potter")
    assert_equal({
     student_name: "Verity",
     date: "05/02/18"
    }, rental_dets)
  end

  def test_add_new_book
    @library.add_new_book("the_twits")
    books = @library.books()
    assert_equal([
       {
    title: "lord_of_the_rings",
    rental_details: {
     student_name: "Jeff",
     date: "01/12/16"
    }
  },
  {
   title: "harry_potter",
   rental_details: {
    student_name: "Verity",
    date: "05/02/18"
   }
 },
 {
   title: "lord_of_the_flies",
   rental_details: {
    student_name: "Calum",
    date: "14/10/17"
   }
 },
 {
     title: "the_twits",
     rental_details: {
      student_name: "",
      date: ""
     }
  }], books)

  end

 #  def test_book_entry_change
 #    @library.book_entry_change("harry_potter", "George", "31/03/17")
 #    books = @library.books()
 #    assert_equal([
 #       {
 #    title: "lord_of_the_rings",
 #    rental_details: {
 #     student_name: "Jeff",
 #     date: "01/12/16"
 #    }
 #  },
 #  {
 #   title: "harry_potter",
 #   rental_details: {
 #    student_name: "George",
 #    date: "31/03/17"
 #   }
 # },
 # {
 #   title: "lord_of_the_flies",
 #   rental_details: {
 #    student_name: "Calum",
 #    date: "14/10/17"
 #   }
 # }
 #    ], books)
 #
 #  end

  def test_book_entry_change
    @library.book_entry_change("harry_potter", "George", "31/03/17")
    book_dets = @library.rental_dets("harry_potter")
    assert_equal(
      {
        student_name: "George",
        date: "31/03/17"
      }, book_dets)
  

  end

end
