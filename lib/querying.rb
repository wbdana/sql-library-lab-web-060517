def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT Books.title, Books.year
  FROM Books JOIN Series ON Books.series_id = Series.id
  WHERE Series.id = 1
  ORDER BY Books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT Characters.name, Characters.motto
  FROM Characters
  ORDER BY LENGTH(motto) DESC LIMIT(1);"
end

def select_value_and_count_of_most_prolific_species
  "SELECT Characters.species, COUNT(Characters.species) as count
  FROM Characters
  GROUP BY Characters.species
  ORDER BY count DESC LIMIT (1);"
end

def select_name_and_series_subgenres_of_authors
  "SELECT Authors.name, Subgenres.name
  FROM Authors JOIN Series JOIN Subgenres
  ON Authors.id = Series.Author_id AND
  Series.subgenre_id = Subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT Series.title
  FROM Series JOIN Characters
  ON Series.id = Characters.series_id
  GROUP BY Series.title, Characters.species
  HAVING Characters.species = 'human'
  ORDER BY COUNT(Characters.species) DESC LIMIT(1);"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT Characters.name, COUNT(Books.title) AS count
  FROM Characters JOIN character_books JOIN Books
  ON Characters.id = character_books.character_id AND
  character_books.book_id = Books.id
  GROUP BY Characters.name
  ORDER BY count DESC, Characters.name ASC;"
end
