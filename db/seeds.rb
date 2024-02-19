# RECORDAR SIEMPRE HACER rails db:drop, rails db:create, rails db:migrate ANTES DE CORRER LA SEED
# Elimino todos los registros de la base de datos
puts 'Eliminando registros'
User.destroy_all
Bank.destroy_all
Client.destroy_all
Account.destroy_all
puts 'Registros eliminados'

# Creo usuario
puts 'Creando usuario'
User.create(email: 'admin@symplifica.com', password: '123456')
puts 'Usuario creado'

# Creo bancos
puts 'Creando bancos'
Bank.create!(name: 'Bancolombia', nit: '8909039388', phone: '01-800-0912345')
Bank.create!(name: 'Banco BBVA', nit: '8600030201', phone: '01 8000 912 227')
Bank.create!(name: 'Banco Caja Social', nit: '860007335', phone: '01 8000 910 038')
Bank.create!(name: 'Banco Coomeva', nit: '900406150', phone: '01 8000 930 932')
Bank.create!(name: 'Banco de Bogotá', nit: '860002964', phone: '6013820000 ')
Bank.create!(name: 'Banco de Occidente', nit: '890300279', phone: '01-800-0514652')
Bank.create!(name: 'Davivienda', nit: '860034313', phone: '01-800-0123838')
Bank.create!(name: 'Banco Pichincha', nit: '8902007567', phone: '01 8000 919918')
Bank.create!(name: 'Banco Popular', nit: '860007738', phone: '01-800-0523456')
Bank.create!(name: 'Banco Falabella', nit: '900047981', phone: '1 587 8000')
Bank.create!(name: 'Citibank', nit: '860051135', phone: '01 8000 523838')
Bank.create!(name: 'JP Morgan', nit: '900114346', phone: '6013269637')
Bank.create!(name: 'Banco Agrario', nit: '800037800', phone: '01-800-0915000')
Bank.create!(name: 'Banco Credifinanciera', nit: '900200960', phone: '01 8000 95 0303')
puts 'Bancos creados'

# Creamos clientes y cuentas apoyado de faker en un loop para 50 clientes y sus respectivas cuentas
puts 'Creando clientes y cuentas'
50.times do
  cliente = Client.create(name: Faker::Name.name, document_type: rand(7), document_number: Faker::IDNumber.valid, phone: (Faker::PhoneNumber.country_code + ' ' + Faker::PhoneNumber.cell_phone))
  cuenta = cliente.build_account(number: Faker::Bank.account_number, bank_id: rand(1..14))
  cuenta.save!
end
puts 'Clientes y cuentas creados'
