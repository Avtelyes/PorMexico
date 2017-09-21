# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Requirement.create([{ name: 'Voluntario(s)'},{ name: 'Profesionista(s)'},{ name: 'Combustible'},
                                 { name: 'Alimentos'}, { name: 'Herramientas'}, { name: 'Transporte'}, { name: 'Maquinaria'},
                                 { name: 'Sangre'}, { name: 'Hospedaje'}, { name: 'Medicamento'}, { name: 'Ropa'}, { name: 'Otro'}]
            )
