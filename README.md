Documentación BankApp

* Versión de Ruby: Ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]

* Versión de Rails: Rails 7.1.3

* Set Up: Para poder correr la aplicación localmente es necesario crear su base
  de datos con rails db:create, correr las migraciones con rails db:migrate y
  correr las seeds con rails db:seed.
  Seguido es necesario correr un bundle install para instalar las gemas, el
  servidor se levanta mediante el comando 'dev'
  Para el login de la cuenta está el usuario creado en la seed: [email: 'admin@symplifica.com',
  password: '123456']

* La aplicación cuenta con cacheado que deberá ser activado con rails dev:cache

* A la fecha no se han creado test (17-02-2024), pero se planean incluir

* Como usuario de la aplicación se puede:

  - Ingresar al contenido de la aplicación mediante un login con un email y
  password ya establecidos

  - Ver un listado de todos los bancos actuales con su número de cuenta

  - Ver cada uno de los bancos con sus respectivas NIT, número de teléfono y cantidad
  de cuentas asociadas al banco junto con un listado de clientes asociados al banco
  y ver datos del cliente como número de cuenta, número de identificación, nombre,
  y fecha de la creación de la cuenta.

  - Crear un registro de banco y poner los datos obligatorios de nombre, número
  de NIT y número de teléfono

  - Editar un registro de los bancos pudiendo cambiar su nombre, número de NIT y número
  de teléfono.

  - Eliminar un registro de banco con sus cuentas asociadas

  - Ver un listado de los clientes en una tabla con información que contiene:
  nombre del cliente, número de identificación, tipo de identificación, número de cuenta,
  banco asociado, teléfono y creación de la cuenta

  - Crear un registro de cliente y poner los datos obligatorios de nombre, tipo de
  identificación, número de identificación, teléfono, y banco asociado, la cuenta será
  generada automáticamente por el sistema

  - Editar un registro de cliente pudiendo cambiar su nombre, tipo de identificación
  número de identificación, teléfono y banco asociado

  - Eliminar un registro de cliente con su respectiva cuenta asociada

  - Filtrar registros de clientes pudiento filtrar por: nombre, número de identificación,
  número de teléfono y número de cuenta

  - Hacer Log Out
