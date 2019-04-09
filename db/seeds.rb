# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Word.destroy_all
User.destroy_all
Dictionary.destroy_all

admin = User.create(
  email: "admin@admin.com", password: "password", status: "admin")
list1 = Liste.create(
  name: "List-test",
  user_id: admin.id)

japonais = Dictionary.create(
  lang: "japonais",
  welcome: "<span class='orange bold'>日仏辞典</span>へようこそ")

coréen = Dictionary.create(
  lang:"coréen",
  welcome: "<span class='orange bold'>한불사전</span>에 오실 것을 환영합니다")
chinois_t = Dictionary.create(
  lang:"chinois traditionnel",
  welcome: "歡迎到<span class='orange bold'>中法辭典</span>(繁體中文)")
chinois_s = Dictionary.create(
  lang:"chinois simplifié",
  welcome: "欢迎到<span class='orange bold'>中法辞典</span>（简体中文）")


# 10000.times do
#    Word.create(word: Faker::Verb.base, click: 0, dictionary_id: japonais.id)
# end

# 10000.times do
#    Word.create(word: Faker::Verb.base, click: 0, dictionary_id: chinois_s.id)
# end

# 10000.times do
#    Word.create(word: Faker::Verb.base, click: 0, dictionary_id: chinois_t.id)
# end

corée = Word.create(word: "한국", click: 0, dictionary_id: coréen.id)


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

mouchoir = Word.create(word: "휴지", click: 0, dictionary_id: coréen.id)

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



chanter = Word.create(word: "울다", click: 0, dictionary_id: coréen.id)

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

congé = Word.create(word: "휴일", click: 0, dictionary_id: coréen.id)

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

réunion= Word.create(word: "회의", click: 0, dictionary_id: coréen.id)

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


dixjours = Word.create(word: "열흘", click: 0, dictionary_id: coréen.id)

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



dénoncer = Word.create(word: "고발", click: 0, dictionary_id: coréen.id)

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

patient = Word.create(word: "끈질기다", click: 0, dictionary_id: coréen.id)

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



ricaner = Word.create(word: "히죽거리다", click: 0, dictionary_id: coréen.id)

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

cerfvolant = Word.create(word: "연", click: 0, dictionary_id: coréen.id)

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

nature = Word.create(word: "自然", click: 0, dictionary_id: japonais.id)

nuancenature = Nuance.create(
  word_id: nature.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")
Special.create(
  nuance_id: nuancenature.id,
  char: "自然[しぜん]"
  )

Traduction.create(
  nuance_id: nuancenature.id,
  trad: "nature")

Traduction.create(
  nuance_id: nuancenature.id,
  trad: "Mère nature")

Exemple.create(
  nuance_id: nuancenature.id,
  exemple_cb: "日本は自然が豊かだと言われている。",
  exemple_fr: "On dit que la nature est abondante au Japon. ")

arbre = Word.create(word: "木", click: 0, dictionary_id: japonais.id)

nuancearbre = Nuance.create(
  word_id: arbre.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Special.create(
  nuance_id: nuancearbre.id,
  char: "木[き]"
  )

Traduction.create(
  nuance_id: nuancearbre.id,
  trad: "arbre")

Exemple.create(
  nuance_id: nuancearbre.id,
  exemple_cb: "木の上に猫が鳴いている。",
  exemple_fr: "Il y a un chat qui miaule sur l'arbre. ")

manger = Word.create(word: "食べる", click: 0, dictionary_id: japonais.id)

nuancemanger = Nuance.create(
  word_id: manger.id,
  user_id: admin.id,
  nature_fr: "Verbe transitif",
  nature_cb: "他動詞",
  commentaire: "",
  remarque: "")

Special.create(
  nuance_id: nuancemanger.id,
  char: "食[た]べる"
  )

Traduction.create(
  nuance_id: nuancemanger.id,
  trad: "manger")

Exemple.create(
  nuance_id: nuancemanger.id,
  exemple_cb: "この赤ちゃんは美味しそうに食べていますね。",
  exemple_fr: "Il mange avec appétit ce bébé. ")

fertile = Word.create(word: "多産", click: 0, dictionary_id: japonais.id)

nuancefertile = Nuance.create(
  word_id: fertile.id,
  user_id: admin.id,
  nature_fr: "Adjectif",
  nature_cb: "形容詞",
  commentaire: "",
  remarque: "")
Special.create(
  nuance_id: nuancefertile.id,
  char: "多産[たさん]"
  )
Traduction.create(
  nuance_id: nuancefertile.id,
  trad: "fertile")

Exemple.create(
  nuance_id: nuancefertile.id,
  exemple_cb: "この多産な地には野菜や果物がいっぱい生っている。",
  exemple_fr: "Il pousse plein de fruits et légumes sur cette terre fertile. ")

refléter = Word.create(word: "反映", click: 0, dictionary_id: japonais.id)

nuancerefléter = Nuance.create(
  word_id: refléter.id,
  user_id: admin.id,
  nature_fr: "Nom verbal",
  nature_cb: "する名詞",
  commentaire: "",
  remarque: "")

Special.create(
  nuance_id: nuancerefléter.id,
  char: "反映[はんえい]"
  )

Traduction.create(
  nuance_id: nuancerefléter.id,
  trad: "refléter")

Exemple.create(
  nuance_id: nuancerefléter.id,
  exemple_cb: "この作品は作者の作風を全く反映しない。",
  exemple_fr: "Cette oeuvre ne reflète absolument pas le style de l'auteur. ")

eau = Word.create(word: "水", click: 0, dictionary_id: japonais.id)

nuanceeau = Nuance.create(
  word_id: eau.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")
Special.create(
  nuance_id: nuanceeau.id,
  char: "水[みず]"
  )
Traduction.create(
  nuance_id: nuanceeau.id,
  trad: "eau")

Exemple.create(
  nuance_id: nuanceeau.id,
  exemple_cb: "水を飲めば元気になるよ。",
  exemple_fr: "Tu vas reprendre des forces si tu bois de l'eau. ")

feu = Word.create(word: "火", click: 0, dictionary_id: japonais.id)

nuancefeu = Nuance.create(
  word_id: feu.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Special.create(
  nuance_id: nuancefeu.id,
  char: "火[ひ]"
  )
Traduction.create(
  nuance_id: nuancefeu.id,
  trad: "feu")

Exemple.create(
  nuance_id: nuancefeu.id,
  exemple_cb: "危ないから火に近づかないで。",
  exemple_fr: "Ne t'approche pas du feu, c'est dangereux. ")

vent = Word.create(word: "風", click: 0, dictionary_id: japonais.id)

nuancevent = Nuance.create(
  word_id: vent.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")
Special.create(
  nuance_id: nuancevent.id,
  char: "風[かぜ]"
  )
Traduction.create(
  nuance_id: nuancevent.id,
  trad: "vent")

Exemple.create(
  nuance_id: nuancevent.id,
  exemple_cb: "昨夜、風が強く吹いていたから中々眠れなかった。",
  exemple_fr: "Le vent soufflait fort hier soir, donc j'ai eu du mal à m'endormir. ")

mer = Word.create(word: "海", click: 0, dictionary_id: japonais.id)

nuancemer = Nuance.create(
  word_id: mer.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")
Special.create(
  nuance_id: nuancemer.id,
  char: "海[うみ]"
  )
Traduction.create(
  nuance_id: nuancemer.id,
  trad: "mer")

Exemple.create(
  nuance_id: nuancemer.id,
  exemple_cb: "プールの中ではなくて海の中で泳ぎたいね。",
  exemple_fr: "J'ai envie de nager dans la mer, pas dans une piscine. ")

hawai = Word.create(word: "ハワイ", click: 0, dictionary_id: japonais.id)

nuancehawai = Nuance.create(
  word_id: hawai.id,
  user_id: admin.id,
  nature_fr: "Nom propre",
  nature_cb: "固有名詞",
  commentaire: "",
  remarque: "")
Special.create(
  nuance_id: nuancehawai.id,
  char: "ハワイ"
  )
Traduction.create(
  nuance_id: nuancehawai.id,
  trad: "Hawaï")

Exemple.create(
  nuance_id: nuancehawai.id,
  exemple_cb: "ハワイに行けたら最高だね。",
  exemple_fr: "Ce serait vraiment génial d'aller à Hawaï. ")

ciel = Word.create(word: "空", click: 0, dictionary_id: japonais.id)

nuanceciel = Nuance.create(
  word_id: ciel.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")
Special.create(
  nuance_id: nuanceciel.id,
  char: "空[そら]"
  )
Traduction.create(
  nuance_id: nuanceciel.id,
  trad: "ciel")

Traduction.create(
  nuance_id: nuanceciel.id,
  trad: "firmament")

Exemple.create(
  nuance_id: nuanceciel.id,
  exemple_cb: "少年は空を飛ぶ鳥達を眺めた。",
  exemple_fr: "Le garçon regarda les oiseaux qui volaient dans le ciel. ")

nuage = Word.create(word: "雲", click: 0, dictionary_id: japonais.id)

nuancenuage = Nuance.create(
  word_id: nuage.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Special.create(
  nuance_id: nuancenuage.id,
  char: "雲[くも]"
  )
Traduction.create(
  nuance_id: nuancenuage.id,
  trad: "nuage")

Exemple.create(
  nuance_id: nuancenuage.id,
  exemple_cb: "青空には雲がたくさん浮いていて綺麗ですね。",
  exemple_fr: "C'est si beau tous ces nuages qui flottent dans le ciel bleu. ")

fleur = Word.create(word: "花", click: 0, dictionary_id: japonais.id)

nuancefleur = Nuance.create(
  word_id: fleur.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")
Special.create(
  nuance_id: nuancefleur.id,
  char: "花[はな]
"
  )
Traduction.create(
  nuance_id: nuancefleur.id,
  trad: "fleur")

Exemple.create(
  nuance_id: nuancefleur.id,
  exemple_cb: "花の蜜をすする蜂が何匹もいるね。",
  exemple_fr: "Il y a pas mal d'abeilles qui boivent le nectar des fleurs.")


nature = Word.create(word: "自然", click: 0, dictionary_id: chinois_t.id)

nuancenature = Nuance.create(
  word_id: nature.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancenature.id,
  trad: "nature")

Traduction.create(
  nuance_id: nuancenature.id,
  trad: "Mère nature")

Exemple.create(
  nuance_id: nuancenature.id,
  exemple_cb: "我有時候只想要在自然裡散步。",
  exemple_fr: "Parfois j'ai juste envie de me promener dans la nature. ")

Special.create(
  nuance_id: nuancenature.id,
  char: "zìrán")

arbre = Word.create(word: "樹", click: 0, dictionary_id: chinois_t.id)

nuancearbre = Nuance.create(
  word_id: arbre.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancearbre.id,
  trad: "arbre")

Exemple.create(
  nuance_id: nuancearbre.id,
  exemple_cb: "男孩爬樹到頂上，沒有辦法抓他。",
  exemple_fr: "Le garçon avait grimpé au sommet de l'arbre et on ne pouvait pas l'attraper. ")

Special.create(
  nuance_id: nuancearbre.id,
  char: "shù")

manger = Word.create(word: "吃", click: 0, dictionary_id: chinois_t.id)

nuancemanger = Nuance.create(
  word_id: manger.id,
  user_id: admin.id,
  nature_fr: "Verbe",
  nature_cb: "動詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancemanger.id,
  trad: "manger")

Exemple.create(
  nuance_id: nuancemanger.id,
  exemple_cb: "他雖然說餓死了，但他沒有吃完飯。",
  exemple_fr: "Il n'a pas fini son repas alors qu'il disait qu'il avait super faim.")

Special.create(
  nuance_id: nuancemanger.id,
  char: "chī")

partenaire = Word.create(word: "夥伴", click: 0, dictionary_id: chinois_t.id)

nuancepartenaire = Nuance.create(
  word_id: partenaire.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancepartenaire.id,
  trad: "partenaire")

Exemple.create(
  nuance_id: nuancepartenaire.id,
  exemple_cb: "我的語言夥伴總是教我常用的詞。",
  exemple_fr: "Mon partenaire linguistique m'apprend toujours des mots utiles. ")

refléter = Word.create(word: "反映", click: 0, dictionary_id: chinois_t.id)

nuancerefléter = Nuance.create(
  word_id: refléter.id,
  user_id: admin.id,
  nature_fr: "Verbe",
  nature_cb: "動詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancerefléter.id,
  trad: "refléter")

Exemple.create(
  nuance_id: nuancerefléter.id,
  exemple_cb: "這部作品很好地反映出作者的諷刺。",
  exemple_fr: "Cette oeuvre reflète bien l'ironie de l'auteur. ")

eau = Word.create(word: "水", click: 0, dictionary_id: chinois_t.id)

nuanceeau = Nuance.create(
  word_id: eau.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuanceeau.id,
  trad: "eau")

Exemple.create(
  nuance_id: nuanceeau.id,
  exemple_cb: "你別忘喝一點水啊！",
  exemple_fr: "N'oublie pas de boire un peu d'eau ! ")

feu = Word.create(word: "火", click: 0, dictionary_id: chinois_t.id)

nuancefeu = Nuance.create(
  word_id: feu.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancefeu.id,
  trad: "feu")

Exemple.create(
  nuance_id: nuancefeu.id,
  exemple_cb: "快把桶子裝滿水去救火！",
  exemple_fr: "Dépêche-toi de remplir le seau d'eau pour éteindre le feu !")

vent = Word.create(word: "風", click: 0, dictionary_id: chinois_t.id)

nuancevent = Nuance.create(
  word_id: vent.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancevent.id,
  trad: "vent")

Exemple.create(
  nuance_id: nuancevent.id,
  exemple_cb: "起風了，你好主意不感冒了啊。",
  exemple_fr: "Le vent se lève : fait bien attention à ne pas attraper de rhume.")

mer = Word.create(word: "海", click: 0, dictionary_id: chinois_t.id)

nuancemer = Nuance.create(
  word_id: mer.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancemer.id,
  trad: "mer")

Exemple.create(
  nuance_id: nuancemer.id,
  exemple_cb: "海是，所有人喜歡的快樂之地。",
  exemple_fr: "La mer, cet endroit réjouissant que tout le monde aime. ")

hawai = Word.create(word: "夏威夷", click: 0, dictionary_id: chinois_t.id)

nuancehawai = Nuance.create(
  word_id: hawai.id,
  user_id: admin.id,
  nature_fr: "Nom propre",
  nature_cb: "專有名詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancehawai.id,
  trad: "Hawaï")

Exemple.create(
  nuance_id: nuancehawai.id,
  exemple_cb: "誰沒有夢到去夏威旅遊呢？",
  exemple_fr: "Qui n'a pas rêvé de voyager à Hawaï. ")

ciel = Word.create(word: "天空", click: 0, dictionary_id: chinois_t.id)

nuanceciel = Nuance.create(
  word_id: ciel.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuanceciel.id,
  trad: "ciel")

Traduction.create(
  nuance_id: nuanceciel.id,
  trad: "firmament")

Exemple.create(
  nuance_id: nuanceciel.id,
  exemple_cb: "天空充滿奇怪的鳥。",
  exemple_fr: "Le ciel est rempli d'oiseaux bizarres. ")

nuage = Word.create(word: "雲", click: 0, dictionary_id: chinois_t.id)

nuancenuage = Nuance.create(
  word_id: nuage.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancenuage.id,
  trad: "nuage")

Exemple.create(
  nuance_id: nuancenuage.id,
  exemple_cb: "藍色的天空和白雲是不是我們的夏天的理想",
  exemple_fr: "Le ciel bleu et les nuages blancs ne font-ils pas pour nous l'été idéal ? ")

fleur = Word.create(word: "花", click: 0, dictionary_id: chinois_t.id)

nuancefleur = Nuance.create(
  word_id: fleur.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名詞",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancefleur.id,
  trad: "fleur")

Exemple.create(
  nuance_id: nuancefleur.id,
  exemple_cb: "我們的花園裡有特別多的漂亮的花。",
  exemple_fr: "Il y a tant de jolies fleurs dans notre jardin. ")


nature = Word.create(word: "自然", click: 0, dictionary_id: chinois_s.id)

nuancenature = Nuance.create(
  word_id: nature.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancenature.id,
  trad: "nature")

Traduction.create(
  nuance_id: nuancenature.id,
  trad: "Mère nature")

Exemple.create(
  nuance_id: nuancenature.id,
  exemple_cb: "我有时候只想要在自然里散步。",
  exemple_fr: "Parfois j'ai juste envie de me promener dans la nature. ")

Special.create(
  nuance_id: nuancenature.id,
  char: "zìrán")

arbre = Word.create(word: "树", click: 0, dictionary_id: chinois_s.id)

nuancearbre = Nuance.create(
  word_id: arbre.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancearbre.id,
  trad: "arbre")

Exemple.create(
  nuance_id: nuancearbre.id,
  exemple_cb: "男孩爬树到顶上，没有办法抓他。",
  exemple_fr: "Le garçon avait grimpé au sommet de l'arbre et on ne pouvait pas l'attraper. ")

Special.create(
  nuance_id: nuancearbre.id,
  char: "shù")


manger = Word.create(word: "吃", click: 0, dictionary_id: chinois_s.id)

nuancemanger = Nuance.create(
  word_id: manger.id,
  user_id: admin.id,
  nature_fr: "Verbe",
  nature_cb: "动词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancemanger.id,
  trad: "manger")

Exemple.create(
  nuance_id: nuancemanger.id,
  exemple_cb: "他虽然说饿死了，但他没有吃完饭。",
  exemple_fr: "Il n'a pas fini son repas alors qu'il disait qu'il avait super faim.")

Special.create(
  nuance_id: nuancemanger.id,
  char: "chī")

partenaire = Word.create(word: "伙伴", click: 0, dictionary_id: chinois_s.id)

nuancepartenaire = Nuance.create(
  word_id: partenaire.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancepartenaire.id,
  trad: "partenaire")

Exemple.create(
  nuance_id: nuancepartenaire.id,
  exemple_cb: "我的语言伙伴总是教我常用的词。",
  exemple_fr: "Mon partenaire linguistique m'apprend toujours des mots utiles. ")

refléter = Word.create(word: "反映", click: 0, dictionary_id: chinois_s.id)

nuancerefléter = Nuance.create(
  word_id: refléter.id,
  user_id: admin.id,
  nature_fr: "Verbe",
  nature_cb: "动词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancerefléter.id,
  trad: "refléter")

Exemple.create(
  nuance_id: nuancerefléter.id,
  exemple_cb: "这部作品很好地反映出作者的讽刺。",
  exemple_fr: "Cette oeuvre reflète bien l'ironie de l'auteur. ")

eau = Word.create(word: "水", click: 0, dictionary_id: chinois_s.id)

nuanceeau = Nuance.create(
  word_id: eau.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuanceeau.id,
  trad: "eau")

Exemple.create(
  nuance_id: nuanceeau.id,
  exemple_cb: "你别忘喝一点水啊！",
  exemple_fr: "N'oublie pas de boire un peu d'eau ! ")

feu = Word.create(word: "火", click: 0, dictionary_id: chinois_s.id)

nuancefeu = Nuance.create(
  word_id: feu.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancefeu.id,
  trad: "feu")

Exemple.create(
  nuance_id: nuancefeu.id,
  exemple_cb: "快把桶子装满水去救火！",
  exemple_fr: "Dépêche-toi de remplir le seau d'eau pour éteindre le feu !")

vent = Word.create(word: "风", click: 0, dictionary_id: chinois_s.id)

nuancevent = Nuance.create(
  word_id: vent.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancevent.id,
  trad: "vent")

Exemple.create(
  nuance_id: nuancevent.id,
  exemple_cb: "起风了，你好主意不感冒了啊。",
  exemple_fr: "Le vent se lève : fait bien attention à ne pas attraper de rhume. ")

mer = Word.create(word: "海", click: 0, dictionary_id: chinois_s.id)

nuancemer = Nuance.create(
  word_id: mer.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancemer.id,
  trad: "mer")

Exemple.create(
  nuance_id: nuancemer.id,
  exemple_cb: "海是，所有人喜欢的快乐之地。",
  exemple_fr: "La mer, cet endroit réjouissant que tout le monde aime. ")

hawai = Word.create(word: "夏威夷", click: 0, dictionary_id: chinois_s.id)

nuancehawai = Nuance.create(
  word_id: hawai.id,
  user_id: admin.id,
  nature_fr: "Nom propre",
  nature_cb: "专有名词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancehawai.id,
  trad: "Hawaï")

Exemple.create(
  nuance_id: nuancehawai.id,
  exemple_cb: "谁没有梦到去夏威夷旅游呢？",
  exemple_fr: "Qui n'a pas rêvé de voyager à Hawaï. ")

ciel = Word.create(word: "天空", click: 0, dictionary_id: chinois_s.id)

nuanceciel = Nuance.create(
  word_id: ciel.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuanceciel.id,
  trad: "ciel")

Traduction.create(
  nuance_id: nuanceciel.id,
  trad: "firmament")

Exemple.create(
  nuance_id: nuanceciel.id,
  exemple_cb: "天空充满奇怪的鸟。",
  exemple_fr: "Le ciel est rempli d'oiseaux bizarres. ")

nuage = Word.create(word: "云", click: 0, dictionary_id: chinois_s.id)

nuancenuage = Nuance.create(
  word_id: nuage.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancenuage.id,
  trad: "nuage")

Exemple.create(
  nuance_id: nuancenuage.id,
  exemple_cb: "蓝色的天空和白云是不是我们的夏天的理想？",
  exemple_fr: "Le ciel bleu et les nuages blancs ne font-ils pas pour nous l'été idéal ? ")

fleur = Word.create(word: "花", click: 0, dictionary_id: chinois_s.id)

nuancefleur = Nuance.create(
  word_id: fleur.id,
  user_id: admin.id,
  nature_fr: "Nom commun",
  nature_cb: "名词",
  commentaire: "",
  remarque: "")

Traduction.create(
  nuance_id: nuancefleur.id,
  trad: "fleur")

Exemple.create(
  nuance_id: nuancefleur.id,
  exemple_cb: "我们的花园里有特别多的漂亮的花。",
  exemple_fr: "Il y a tant de jolies fleurs dans notre jardin.")


