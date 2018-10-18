require 'faker'

User.create(
  name: "MegaMoonManMarvin94",
  email_address: "marvin",
  password: "moon"
)

p "*"*30
p "Marvin account created"

30.times do
  User.create(
    name: Faker::Name.name,
    email_address: Faker::LeagueOfLegends.champion,
    password: "moon"
  )
end
p "Dummy users created"

# Challenges
# 1
Challenge.create(
  name: "Extraction",
  description: "Extract the first 4 characters from the string.",
  content: "// Robin Singh\n",
  test: "Robi"
)

# 2
Challenge.create(
  name: "Abbreviation",
  description: "Convert the string into an abbreviated form.",
  content: "// Robin Singh -> Robin S.\n",
  test: "Robin S."
)

# 3
Challenge.create(
  name: "Protected Emails",
  description: "Only show the first five letters of the email address",
  content: "// robin_singh@example.com -> robin...@example.com\n",
  test: "robin...@example.com"
)

# 4
Challenge.create(
  name: "Parametrized Strings",
  description: "Parameterize the given string.",
  content: "// Robin Singh from USA. -> robin-singh-from-usa\n",
  test: "robin-singh-from-usa"
)

# 6
Challenge.create(
  name: "Capitalization",
  description: "Capitalize the first letter of the string",
  content: "// js string exercises\n",
  test: "Js String Exercises"
)

# 7
Challenge.create(
  name: "Capitalization 2",
  description: "Capitalize the first letter of each word in the string.",
  content: "// js string exercises\n",
  test: "Js String Exercises"
)

# 8
Challenge.create(
  name: "Reversed Strigns",
  description: "Convert the upper case letters to lower case, and lower case letters to upper case.",
  content: "// AaBbc\n",
  test: "aAbBC"
)

# 9
Challenge.create(
  name: "Camel Casing",
  description: "Convert the given string into camel case",
  content: "// JavaScript exercises\n",
  test: "JavaScriptExercises"
)

# 10
Challenge.create(
  name: "Snake Case Conversion",
  description: "Convert the given camel cased string into snake case",
  content: "// JavaScriptExercises\n",
  test: "javaScript_exercises"
)

p "Challenges created"

user_count = User.all.count
challenge_count = Challenge.all.count

40.times do
  UserChallenge.find_or_create_by(
    user_id: rand(1..user_count),
    challenge_id: rand(1..challenge_count)
  )
end

p "UserChallenges created"

p "*"*30
