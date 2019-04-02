# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

KorWord.destroy_all

corée = KorWord.create(word: "한국", click: 0)

nuance1 = KorNuance.create(
  kor_word_id: corée.id,
  user_id: 1,
  nature_francais: "Nom commun",
  nature_cible: "명사",
  traduction: "Corée du sud",
  commentaire: "Pays d’Asie, dont la langue officielle est le coréen",
  remarque: "Mot sino-coréen, diminutif de 대한민국")

exemple1 = KorExemple.create(
  kor_nuance_id: nuance1.id,
  exemple_cible: "한국에는 산이 가득 차다.",
  exemple_traduction: "La Corée du Sud est remplie de montagnes")

exemple2 = KorExemple.create(
  kor_nuance_id: nuance1.id,
  exemple_cible: "한국에는 산이 가득 차다.2",
  exemple_traduction: "La Corée du Sud est remplie de montagnes2")

registre1 = KorRegistre.create(
  kor_nuance_id: nuance1.id,
  registre: "soutenu"
  )

registre2 = KorRegistre.create(
  kor_nuance_id: nuance1.id,
  registre: "littéraire"
  )
hanja1 = Hanja.create(
  kor_nuance_id: nuance1.id,
  hanja: "韓國")

synonyme1 = KorSynonyme.create(
  kor_nuance_id: nuance1.id,
  synonyme: "Synonyme1")

antonyme1 = KorAntonyme.create(
  kor_nuance_id: nuance1.id,
  antonyme: "Antonyme1")
