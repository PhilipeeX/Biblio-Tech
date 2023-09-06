FactoryBot.define do
  factory :assembly do
    name {
  [
    'Edição Padrão',
    'Capa Dura Clássica',
    'Edição Premium',
    'Montagem de Capa Personalizada',
    'Livro de Bolso',
    'Edição de Colecionador',
    'Montagem de Folhas Resistentes',
    'Capa de Tecido',
    'Edição Limitada',
    'Livro de Capa Mole',
    'Edição de Luxo',
    'Montagem de Folhas de Alta Qualidade'
  ].sample
}
  end
end
