class Poster < User
  devise :registerable, :validatable, :confirmable
end
