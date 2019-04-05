# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Word.destroy_all
User.destroy_all

admin = User.create(
  email: "admin@admin.com", password: "password", status: "admin")
list1 = Liste.create(
  name: "List-test",
  user_id: admin.id)
corée = Word.create(word: "한국", click: 0, dict: 2)

nuance1 = Nuance.create(
  word_id: corée.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "명사",
  commentaire: "Pays d’Asie, dont la langue officielle est le coréen",
  remarque: "Mot sino-coréen, diminutif de 대한민국")

trad1 = Traduction.create(
  nuance_id: nuance1.id,
  trad: "Corée du sud")

exemple1 = Exemple.create(
  nuance_id: nuance1.id,
  exemple_cb: "한국에는 산이 가득 차다.",
  exemple_fr: "La Corée du Sud est remplie de montagnes")

exemple2 = Exemple.create(
  nuance_id: nuance1.id,
  exemple_cb: "한국에는 산이 가득 차다.2",
  exemple_fr: "La Corée du Sud est remplie de montagnes2")

 Registre.create(
  nuance_id: nuance1.id,
  reg: "soutenu"
  )

registre2 = Registre.create(
  nuance_id: nuance1.id,
  reg: "littéraire"
  )
char1 = Special.create(
  nuance_id: nuance1.id,
  char: "韓國")

synonyme1 = Synonyme.create(
  nuance_id: nuance1.id,
  syno: "Synonyme1")

antonyme1 = Antonyme.create(
  nuance_id: nuance1.id,
  anto: "Antonyme1")

mouchoir = Word.create(word: "휴지", click: 0, dict: 2)

nuancemouchoir = Nuance.create(
  word_id: mouchoir.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "명사",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancemouchoir.id,
  trad: "mouchoir")

Traduction.create(
  nuance_id: nuancemouchoir.id,
  trad: "mouchoir en papier")

Exemple.create(
  nuance_id: nuancemouchoir.id,
  exemple_cb: "그 아이는 착하게도 휴지를 주워서 쓰레기통에 버렸다..",
  exemple_fr: " L'enfant a gentiment ramassé et jeté le mouchoir dans la poubelle. ")

Special.create(
  nuance_id: nuancemouchoir.id,
  char: "休紙")



chanter = Word.create(word: "울다", click: 0, dict: 2)

nuancechanter = Nuance.create(
  word_id: chanter.id,
  user_id: admin.id,
  nature_fr: "Verbe intransitif",
  nature_cb: "자동자",
  commentaire: "oiseaux, cigales",
  remarque: "")

Traduction.create(
  nuance_id: nuancechanter.id,
  trad: "chanter"
  )
Exemple.create(
  nuance_id: nuancechanter.id,
  exemple_cb: "하얀 새는 나뭇가지 위에서 울고 있다.",
  exemple_fr: " L'oiseau blanc chante sur la branche. ")

Registre.create(
  nuance_id: nuancechanter.id,
  reg: "mot coréen pur | 순우리말"
)

congé = Word.create(word: "휴일", click: 0, dict: 2)

nuancecongé = Nuance.create(
  word_id: congé.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "명사",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancecongé.id,
  trad: "congé"
  )
Traduction.create(
  nuance_id: nuancecongé.id,
  trad: "jour de congé"
  )

Exemple.create(
  nuance_id: nuancecongé.id,
  exemple_cb: "사장님은 너무 비곳해서 휴일로 유럽에 갔다.",
  exemple_fr: " Le patron étant très fatigué, il a pris un congé en Europe. ")

 Special.create(
  nuance_id: nuancecongé.id,
  char: "休日")

réunion= Word.create(word: "회의", click: 0, dict: 2)

nuanceréunion = Nuance.create(
  word_id: réunion.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "명사",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuanceréunion.id,
  trad: "réunion"
)
Traduction.create(
  nuance_id: nuanceréunion.id,
  trad: "conférence"
)

Exemple.create(
  nuance_id: nuanceréunion.id,
  exemple_cb: "회의가 너무 길어서 모든 원인들이 심심하기 시작했다.",
  exemple_fr: " La réunion étant trop longue, tous les employés ont commencé à s’ennuyer. ")

 Special.create(
  nuance_id: nuanceréunion.id,
  char: "會議")

Registre.create(
  nuance_id: nuanceréunion.id,
  reg: "mot sino-coréen, 한자어"
  )


dixjours = Word.create(word: "열흘", click: 0, dict: 2)

nuancedixjours = Nuance.create(
  word_id: dixjours.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "명사",
  commentaire: "façon de compter les jours en coréen pur, soit « 열 /dix» et « 흘 /jour».",
  remarque: "")

Traduction.create(
  nuance_id: nuancedixjours.id,
  trad: "dix jours")

Exemple.create(
  nuance_id: nuancedixjours.id,
  exemple_cb: "당신은 벌써 열흘이나 침울한 병실에 누워 있는 몸이 되었기 때문에 꼭 병원에서 나가고 싶지오.",
  exemple_fr: " Cela fait déjà dix jours que tu restes allongé dans cette chambre déprimante ; tu dois sûrement avoir envie de sortir de l’hôpital. ")


Registre.create(
  nuance_id: nuancedixjours.id,
  reg: "mot coréen pur, 순우리말"
)



dénoncer = Word.create(word: "고발", click: 0, dict: 2)

nuancedénoncer =Nuance.create(
  word_id: dénoncer.id,
  user_id: admin.id,
  nature_fr: "Verbe transitif",
  nature_cb: "타동사",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancedénoncer.id,
  trad: "dénoncer")

Exemple.create(
  nuance_id: nuancedénoncer.id,
  exemple_cb: "사회의 인종차별 문제를 고발한 소설을 읽고 보자니, 참으로 인종차별을 완전히 멸절한 느낌이 들었다.",
  exemple_fr: "En lisant un roman dénonçant le racisme dans la société, j’ai eu vraiment envie de l’anéantir totalement. ")


Registre.create(
  nuance_id: nuancedénoncer.id,
  reg: "mot sino-coréen, 한자어"
  )
Special.create(
  nuance_id: nuancedénoncer.id,
  char: "告發")

patient=Word.create(word: "끈질기다", click: 0, dict: 2)

nuancepatient = Nuance.create(
  word_id: patient.id,
  user_id: admin.id,
  nature_fr: "Adjectif",
  nature_cb: "형용사",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancepatient.id,
  trad: "patient")

Traduction.create(
  nuance_id: nuancepatient.id,
  trad: "opiniâtre")

Traduction.create(
  nuance_id: nuancepatient.id,
  trad: "obstiné")

 Exemple.create(
  nuance_id: nuancepatient.id,
  exemple_cb: "어떤 언어를 잘 다루기에는 끈질기게 노력해야 한다.",
  exemple_fr: "Il faut faire des efforts obstinés pour bien maîtriser une langue. ")


Registre.create(
  nuance_id: nuancepatient.id,
  reg: "mot coréen pur, 순우리말"
  )



ricaner = Word.create(word: "히죽거리다", click: 0, dict: 2)

nuancericaner = Nuance.create(
  word_id: ricaner.id,
  user_id: admin.id,
  nature_fr: "Verbe intransitif",
  nature_cb: "자동사",
  commentaire: "peut aussi s’écrire « 희죽거리다 » et possède le même sens",
  remarque: "")

Traduction.create(
  nuance_id: nuancericaner.id,
  trad: "ricaner")

Traduction.create(
  nuance_id: nuancericaner.id,
  trad: "rire de façon satisfaite")

Exemple.create(
  nuance_id: nuancericaner.id,
  exemple_cb: "가끔 영화에서는 나이 많은 까마귀처럼 히죽거리는 인물을 볼 수 있다.",
  exemple_fr: "Parfois dans les films, on peut voir un personnage qui ricane comme un vieux corbeau. ")

Registre.create(
  nuance_id: nuancericaner.id,
  reg: "mot coréen pur, 순우리말"
  )

cerfvolant = Word.create(word: "연", click: 0, dict: 2)

nuancecerfvolant = Nuance.create(
  word_id: cerfvolant.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "명사",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancecerfvolant.id,
  trad: "cerf-volant")

Exemple.create(
  nuance_id: nuancecerfvolant.id,
  exemple_cb: "애들아, 아름다운 연이 하늘에서 날고 있어.",
  exemple_fr: "Regardez les enfants, il y a un beau cerf-volant qui vole dans le ciel. ")

Registre.create(
  nuance_id: nuancecerfvolant.id,
  reg: "mot coréen pur, 순우리말"
)
nuancearray = [nuancecerfvolant, nuancericaner, nuancemouchoir, nuancedixjours, nuancepatient, nuancedénoncer, nuanceréunion, nuancechanter, nuance1, nuancecongé]
2000.times do
  Selection.create(
    nuance_id: (nuancearray.sample(1)).first.id,
    liste_id: list1.id
    )
end
