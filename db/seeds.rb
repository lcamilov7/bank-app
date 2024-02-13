puts 'Eliminando registros'
User.destroy_all
Bank.destroy_all
Client.destroy_all
Account.destroy_all
puts 'Registros eliminados'

puts 'Creando usuario'
User.create(email: 'luiscamilov@symplifica.com', password: '123456')
puts 'Usuario creado'

puts 'Creando bancos'
bancolombia = Bank.create!(name: 'Bancolombia', nit: '890.903.938-8', phone: '01-800-0912345')
bbva = Bank.create!(name: 'Banco BBVA', nit: '01-8000-912-227', phone: '01-8000-912-227')
puts 'Bancos creados'

puts 'Creando clientes'
luis = Client.create(name: 'Luis Camilo Valencia', document_type: 3, document_number: '1037670493', phone: '+573046760899')
sara = Client.create(name: 'Sara Posada', document_type: 2, document_number: '1039470392', phone: '+57379366787')
laura = Client.create(name: 'Laura Posada', document_type: 2, document_number: '16874907734', phone: '+573004934577')
puts 'Clientes creados'

puts 'Creando cuentas'
Account.create(number: '892094638', bank_id: bancolombia.id, client_id: luis.id)
Account.create(number: '123289738', bank_id: bbva.id, client_id: sara.id)
Account.create(number: '455278438', bank_id: bbva.id, client_id: laura.id)
puts 'Cuentas creadas'
