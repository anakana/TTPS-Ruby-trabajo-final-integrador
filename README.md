# README
Instalar todo lo necesario:
bundle install 

Para crear la db y llenarla:
rake db:drop:_unsafe db:create db:migrate db:seed 

Ejecutar:
rails server

Cosas Faltantes:
Falto agregar el comentario al atender un turno.
Falto verificar que el turno cumpla con los horarios de la sucursal.