class BotNameGenerator
  include Singleton

  TITLES = ['fleet admiral', 'admiral', 'sergeant', 'captain', 'commander', 'lieutenant', 'ensign']
  NAMES = ['lovelace', 'turing', 'curie', 'hopper', 'bardeen']

  def execute
    "#{title.capitalize} #{name.capitalize} #{Random.new.rand(100)}"
  end

  def name
    NAMES.sample
  end

  def title
    TITLES.sample
  end
end
