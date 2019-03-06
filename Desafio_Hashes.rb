# Ejercicio 1: Sintaxis básica

h = {claveuno: 10, clavedos: 20,clavetres:30}

# ______________________________________________________
# Ejercicio 2: Corrección de errores

productos={
  bebida:850,
  chocolate:1200,
  galletas:900,
  leche:750
}
productos.each do |key,producto|
  puts "#{key}:#{producto}"
end
productos[:cereal]=2200

#modificando el valor de bebida
productos[:bebida] = 2000

p productos

#eliminando galletas
productos.delete(:galletas)

p productos

# ______________________________________________________
# Ejercicio 3: Operaciones básicas

h = {'x' => 1 ,  'y' => 2}

#agregar el string z con el valor 3
h['z'] = 3

p h

#eliminar clave y
h.delete('y')
p h

#Si el hash tiene una clave llamada z mostrar en pantalla "yeeah".
puts 'yeaaah!'  if h.has_key?'z'

#Invertir el diccionario de forma que los valores sean las llaves y las llaves los valores
p h.invert()

# ______________________________________________________
# Ejercicio 4: Array y Hashes

personas = %w(Carolina Alejandro MariaJesus,Valentin)
edades  =[32,28,41,19]
union =  personas.zip(edades)
p union.to_h

# ______________________________________________________
# Ejercicio 5: Array y Hashes

meses = ['Enero','Febrero','Marzo','Abril','Mayo']
ventas = [2000,3000,1000,5000,4000]
hash = meses.zip(ventas).to_h

p hash

hash_i = hash.invert()
p hash_i


hash_i.each do |key,value|
  puts"#{value}" if key == hash_i.keys.max
end

# ______________________________________________________
# Ejercicio 6: Operaciones típicas sobre un hash

restaurant_menu = {
  "Ramen" => 300,
  "Dal Makhani" => 400,
  "Coffee" => 200,
  "Sushi" => 1000,
  "Gohan" => 500,
  "Ebi Mozzarella" => 700
}

#obtener el plato mas caro
valores = restaurant_menu.values
puts restaurant_menu.key(valores.max)

#obtener el plato mas barato
puts restaurant_menu.key(valores.min)

#obtener el promedio del valor de los platos
suma = valores.sum.to_f
promedio  =suma/valores.length
puts promedio.round(2)

#crear un arreglo solo con los nombres de los platos
array = restaurant_menu.values.map{|i| i}
p array
#crear un arreglo con solo los valores de los platos
array2 = restaurant_menu.keys.map{|i|i}
p array2
#modificar el hash y agregar el iva a los valores de los platos
valores_con_iva =[]
array.each do |valor|
  valores_con_iva.push(valor*1.19)
end
p valores_con_iva

restaurant_menu_1 = array2.zip(valores_con_iva)
restaurant_menu_1.to_h
restaurant_menu =restaurant_menu_1
p restaurant_menu.to_h





#dar descuento del 20% para los platos que tengan un nombre de mas de una palabra
restaurant_menu.each do |key,item|
  if key.include? ' '
      descuento  = item*20/100
      item_dec = item-descuento
      puts "#{key} tiene un descuento del 20 % #{item} -> ahora #{item_dec}"
    end

end

# ______________________________________________________
# Ejercicio 7: Ejercicio completo con un hash

inventario = {
  'Notebooks': 4,
  'Pc Escritorio': 6,
  'Routers': 10,
  'Impresora': 6
}


def menu
  puts '1)Agrega Item a Inventario'
  puts '2)Elminina Item  Inventario '
  puts '3)Actualiza Item Inventario '
  puts '4)Stock Total Inventario'
  puts '5)Item con mas Stock'
  puts '6) Busca Item'
  puts '7)Salir'
end

def agrega(inventario)
#si el usuario ingresa 1 podra agregar un item y su stock para separar el nombre del string el usuario debe usar una coma
  puts 'Ingrese un Producto,para ingresar separe el nombre el stock con una coma'
  new_prod = gets.chomp
  info  = new_prod.split(',')
  inventario[info[0]]=info[1]

  p inventario
end

#eliminar item
def elimina(inventario)
  puts 'ingrese  key para eliminar producto'
  llave = gets.chomp.to_s
  inventario.delete(llave)
  p inventario
end
def actualiza(inventario)
#actualizar elementos de inventario
  p inventario
  puts 'desea Modificar la key de un producto?S/n'
  opcion  = gets.chomp
  if opcion  == 'S'
    puts 'ingrese key del producto a modificar'
    key = gets.chomp.to_sym
    puts 'ingrese nueva key para el producto '
    new_key = gets.chomp.to_s
    puts 'ingrese valor asociado'
    var = gets.chomp.to_i
    inventario.delete(key)
    inventario[new_key]=var
    p inventario
  else
    puts 'ingrese key del producto a modificar'
    key = gets.chomp.to_sym
    puts 'ingrese nuevo stock para el producto'
    new_stock = gets.chomp.to_i
    inventario[key]=new_stock
    p inventario
  end
end
def stock_total(inventario)
#stock total
  total  = inventario.values.sum
  puts "total stock: #{total}"
end

def item_max_stock(inventario)
#item con mas stock
  product_max_stock = inventario.key(inventario.values.max)
  puts "el producto con mayor stock es #{product_max_stock}"
end
def busca(inventario)
#consulta si item existe en inventario
  puts 'ingrese Producto a buscar'
  key = gets.chomp.to_sym
  existe =  inventario.has_key?(key)
  if existe
    puts 'Si'
  else
    puts 'No'
  end
end
verdadero = true
while verdadero
  puts 'Ingrese Opcion'
  menu()
  opcion  = gets.chomp.to_i
  if opcion    == 1
    agrega(inventario)
  elsif opcion == 2
    elimina(inventario)
  elsif opcion == 3
    actualiza(inventario)
  elsif opcion == 4
    stock_total(inventario)
  elsif opcion == 5
    item_max_stock(inventario)
  elsif opcion == 6
    busca(inventario)
  elsif opcion == 7
    verdadero = false

  end
end



# ______________________________________________________
# Desafíos Opcionales
# Ejercicio 1: Ejercicios de bloques en Arrays

#dado el array

a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]

# Utilizando map generar un nuevo arreglo con cada valor aumentado en 1.

b = a.map{|i| i+1}
p b

#utilizando map generar un nuevo arreglo que contenga todos los valores convertidos a float

c = a.map{|i|i.to_f}
p c
#Utilizando map generar un nuevo arreglo que contenga todos los valores convertidos a string

d = a.map{|i|i.to_s}

#Utilizando reject descartar todos los elementos menores a 5 en el array

e = a.reject { |i| i<5 }
p e

f = a.select{|i| i<5}
p f

#Utilizando inject obtener la suma de todos los elementos del array

g = a.inject{|sum,i| sum +i}
p g

# Utilizando group_by agrupar todos los números por paridad (si son pares, es un grupos, si son impares es otro grupo)
h =a.group_by{|i| i %2 == 0 }
p h

#Utilizando group_by agrupar todos los números mayores y menores que 6.
i  = a.group_by{|i| i>6}

p i

# ______________________________________________________
# Ejercicio 2: Arrays y strings
# Dado el arreglo:

nombres = [
  'Violeta', 'Andino', 'Clemente', 'Javiera', 'Paula', 'Pia', 'Ray'
]

#Extraer todos los elementos que excedan mas de 5 caracteres utilizando el método .select.

a = nombres.select{|string| string.length<=5}
p a


#utilizando map crear un arreglo con los nombres en minuscula

b = nombres.map{|nombre| nombre.downcase}
p b

#utilizando select crear un arreglo con todos los nombres que empiecen con P

c = nombres.map{|nombre| nombre  if nombre[0]=='P'}
p c.compact

#utilizando map crea un arreglo unico con la cantidad de letras que tiene cada nombre
d = nombres.map{|letras| letras.length}
p d

#utilizando map y gsub eliminar las vocales de todos los nombres

e = nombres.map do
  |nombre| nombre.gsub(/[aeiou]/,'')
end


p e

