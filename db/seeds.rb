%w(registered, editor, admin).each do |role|
  Role.find_or_create_by(name: role)
end

Option.create(
  title: "Blog",
  subtitle: "Il mio blog",
  footer: "Koodit.srl",
  copyright: "è di Koodit.srl!!!",
  analitics: "non lo so",
  number_per_page: 10
)
