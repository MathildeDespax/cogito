# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
LJUST_MAX = 50

print 'Destroying everything'.ljust(LJUST_MAX, '.')
models = [
  StudentEvaluation,
  Card,
  Share,
  Quizz,
  UserClassroom,
  Classroom,
  User
]
models.each { |model| model.destroy_all }
puts 'done'
puts 'Creating users ...'

teacher1 = User.create!(first_name: "Anthony", last_name: "Larzilliere", email: "anthony@cogito.com", password:"cogito1234")
teacher2 = User.create!(first_name: "Sylvain", last_name: "Peigney", email: "sylvain@cogito.com", password:"cogito1234")
teacher3 = User.create!(first_name: "Bobby", last_name: "Lapointe", email: "boby@cogito.com", password:"cogito1234")
student1 = User.create!(first_name: "Mathilde", last_name: "Despax", email: "mathilde@cogito.com", password:"cogito1234")
student2 = User.create!(first_name: "Bastien", last_name: "Pinot", email: "bastien@cogito.com", password:"cogito1234")
student3 = User.create!(first_name: "Gregory", last_name: "Debargue", email: "gregory@cogito.com", password:"cogito1234")
student4 = User.create!(first_name: "Josette", last_name: "Dupont", email: "Josette@cogito.com", password:"cogito1234")
student5 = User.create!(first_name: "Therese", last_name: "Martin", email: "therese@cogito.com", password:"cogito1234")
student6 = User.create!(first_name: "Julie", last_name: "Lapine", email: "julie@cogito.com", password:"cogito1234")
student7 = User.create!(first_name: "Fanny", last_name: "Robinet", email: "fanny@cogito.com", password:"cogito1234")
student8 = User.create!(first_name: "John", last_name: "Etti", email: "john@cogito.com", password:"cogito1234")
student9 = User.create!(first_name: "Steevy", last_name: "Jacket", email: "steeve@cogito.com", password:"cogito1234")

print 'Seeding quizzs'.ljust(LJUST_MAX, '.')
first_world_war = Quizz.create!(name:"First World War", subject: "History", teacher: teacher1)
plate_tectonic = Quizz.create!(name:"PLate Tectonic", subject: "SVT", teacher: teacher2)
maths = Quizz.create!(name:"Maths", subject: "MATHS", teacher: teacher3)
puts 'done'
print 'Seeding cards'.ljust(LJUST_MAX, '.')

quizzs_data = [
  {
    quizz: first_world_war,
    question: "Quels sont les trois pays formant la Triple Entente ?", answer:"France, Royaume-Uni, Russie"
  },
  {
    quizz: first_world_war,
    question: "Quels sont les trois pays formant la Triple Alliance ?", answer:"Allemagne, Autriche-Hongrie et Italie"
  },
  {
    quizz: first_world_war,
    question: "La Triple Entente et la Triple Alliance sont deux alliances défensives ou offensives", answer:"défensive"
  },
  {
    quizz: first_world_war,
    question: "Quel événement est l'étincelle qui, par l'engrenage des alliances va aboutir à la Première Guerre mondiale ?", answer:"L'assassinat de l'archiduc François-Ferdinand à Sarajevo"
  },
  {
    quizz: first_world_war,
    question: "Quand débute la première guerre mondiale", answer:"Aout 1914"
  },
  {
    quizz: first_world_war,
    question: "Combien d'étapes y a-t-il pendant la Première Guerre mondiale ?", answer:"3 : une guerre de mouvement en 1914, puis une guerre de position de 1915 à mars 1918, puis une guerre de mouvement"
  },
  {
    quizz: first_world_war,
    question: "Qu'est-ce qu'un front en temps de guerre?", answer:"La zone des combats que l'on oppose à l'arrière où vivent les populations civiles"
  },
  {
    quizz: first_world_war,
    question: "Quelles sont les 4 nouvelles armes utilisées durant la Première Guerre mondiale ?", answer:"Aviation, Sous-marins, chars, gaz"
  },
  {
    quizz: first_world_war,
    question: "Quels sont les trois événements marquants de l'année 1917 ?", answer:"Les mutineries des combattants, Armistice germano-russe, Entrée en guerre des Etats-Unis aux côtés des Français, des Anglais et des Italiens"
  },
  {
    quizz: first_world_war,
    question: "Qui gagne la seconde bataille de la Marne en 1918 ?", answer:"Les Français, les Anglais, les Américains et les Italiens"
  },
  {
    quizz: first_world_war,
    question: "Qui gagne la Première Guerre mondiale ?", answer:" Les Français, les Anglais, les Américains et les Italiens"
  },
  { quizz: plate_tectonic,
    question: " Qu’est-ce que la subduction ?", answer:" C’est l’enfoncement de la plaque lithosphérique océanique dans le manteau lithosphérique"
  },
  { quizz: plate_tectonic,
    question: " De quels fragments les ophiolites présents dans une chaîne de montagnes sont-ils à l’origine?", answer:" La croûte continentale"
  },
  { quizz: plate_tectonic,
    question: " Sous quel état les roches métamorphiques subissent-elles des changements ? ", answer:"à l’état solide"
  },
  { quizz: plate_tectonic,
    question: " Sous quel état les roches métamorphiques subissent-elles des changements ? ", answer:" La croûte continentale"
  },
  { quizz: plate_tectonic,
    question: " Une ancienne marge continentale passive est caractérisée par ?", answer:"faille normale + roches sédimentaires"
  },
  { quizz: plate_tectonic,
    question: " Quel est le type des chaînes alpines?", answer:"des chaînes de collision"
  },
  { quizz: plate_tectonic,
    question: " Qu’est-ce que l’obduction?", answer:" C’est la collision entre deux croûtes continentales"
  },
  { quizz: plate_tectonic,
    question: " Quel est le type des chaînes alpines?", answer:"des chaînes de collision"
  },
  { quizz: plate_tectonic,
    question: " Qu’est-ce que le moteur de la subduction ?", answer:" c’est la différence de densité entre l’asthénosphère et la croûte océanique"
  },
  { quizz: plate_tectonic,
    question: " Quelles sont les étapes mécaniques de la formation des chaînes alpines ?", answer:" Extension+ subduction+obduction+sédimentation"
  },
  { quizz: plate_tectonic,
    question: " Quels sont les témoins d’une collision ?", answer:" Les failles inverses, pli, nappe de charriage"
  },
  { quizz: plate_tectonic,
    question: " Quels sont les indices minéralogiques d’une collision ?", answer:" Les roches métamorphiques"
  },
  {  quizz: maths,
    question: "Comment calcule-t-on l'aire d'un triangle ?",
    answer:"(base x hauteur) : 2"
    },
  { quizz: maths,
    question: "Quel est le périmètre d'un carré de 7 cm de côté ?", answer:"28 cm (explications : 7 x 4 = 28)"
  },
  { quizz: maths,
    question: "Combien de côtés a un dodécagone ?", answer:"12 (explications : Un polygone a 9 côtés est un ennéagone ou nonagone. | U n polygone a 10 côtés est un décagone)"
  },
  { quizz: maths,
    question: "Comment appelle-t-on des droites du plan qui ne se coupent pas ?", answer:"Des droites parallèles"
  },
  { quizz: maths,
    question: "Quel est le deuxième nom du pavé ?", answer:"Parallélépipède rectangle"
  },
  { quizz: maths,
    question: "Quelle est la forme des faces d'un tétraèdre ?", answer:"Triangulaire"
  },
  { quizz: maths,
    question: "Combien de côtés a un heptagone ?", answer:"7 (explications : Un polygone a 6 côtés est un hexagone. Un polygone a 8  côtés est un octogone)"
  },
  { quizz: maths,
    question: "Peut-on construire un angle droit avec un compas et une règle ?", answer: "Oui"
  },
  { quizz: maths,
    question: "Combien de chèvres ?", answer:"12"
  }
]

Card.create!(quizzs_data)
puts 'Seeding Classrooms...'
classrooms_attributes = [
  {
    name: "1èreA",
    teacher: teacher1
  },
  {
    name: "TerminalC",
    teacher: teacher1
  },
  {
    name: "TerminalA",
    teacher: teacher1
  },
  {
    name: "TerminalB",
    teacher: teacher3
  },
  {
    name: "Seconde3",
    teacher: teacher2
  }
]

Classroom.create!(classrooms_attributes)


puts 'Seeding join table user classrooms...'
user_classrooms_attributes = [
  {
    classroom: Classroom.first,
    user: student1
  },
  {
    classroom: Classroom.first,
    user: student2
  },
  {
    classroom: Classroom.first,
    user: student3
  },
  {
    classroom: Classroom.first,
    user: student4
  },
  {
    classroom: Classroom.second,
    user: student5
  },
  {
    classroom: Classroom.second,
    user: student6
  },
  {
    classroom: Classroom.second,
    user: student7
  },
  {
    classroom: Classroom.third,
    user: student8
  },
  {
    classroom: Classroom.third,
    user: student9
  }
]

UserClassroom.create!(user_classrooms_attributes)

puts 'done'
