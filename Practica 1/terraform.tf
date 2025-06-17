resource "local_file" "Productos" {
  content = "Lista de productos para el mes proximo"
  filename = "productos.txt"
}
