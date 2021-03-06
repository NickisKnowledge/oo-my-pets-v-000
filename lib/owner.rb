class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species
  
  @@all = []
  @@count = 0
  
  def initialize(species)
		@species = species
		@pets = {:fishes => [], :dogs => [], :cats => []}
  	@@all << self
  	@@count +=1
# binding.pry
  end
  
  def self.all
		@@all
  end
  
  def self.reset_all
		@@all.clear
		@@count = 0

  end
  
  def self.count
		@@count
  end

	def say_species
		"I am a #{@species}."
	end
	
	def buy_fish(name)
		new_fish = Fish.new(name)
		@pets[:fishes] << new_fish
	end
	
	def buy_cat(name)
		new_cat = Cat.new(name)
		@pets[:cats] << new_cat
	end
	
	def buy_dog(name)
		new_dog = Dog.new(name)
		@pets[:dogs] << new_dog
	end
	
	def walk_dogs
		self.pets[:dogs][0].mood = "happy"
	end
	
	def play_with_cats
		self.pets[:cats][0].mood = "happy"
	end
	 
	def feed_fish
		self.pets[:fishes][0].mood = "happy"
	end
	
	def sell_pets
	# need to access the obj in each key - need a loop w/in a loop
		self.pets.each { |k, v| @pets[k].each { |v| v.mood = 'nervous' } }
		@pets.clear
# binding.pry
	end
	
	def list_pets
	#count # of each pet and return the number
		fish_count = @pets[:fishes].count
		dog_count = @pets[:dogs].count
		cat_count = @pets[:cats].count
	"I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
# binding.pry
	end
end

