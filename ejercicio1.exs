defmodule Main do

  import Util   #esto me quita la necesidad de hacer el main.algo

  # Método principal
  def main do
    nombre = pedir_nombre()
    distancia = pedir_distancia()
    litros = pedir_litros()
    rendimiento = calcular_rendimiento(distancia, litros)

    mostrar_resultados(nombre, distancia, litros, rendimiento)
  end

  # Métodos auxiliares
  defp pedir_nombre do
    input("Ingrese el nombre del conductor:", :string)
  end

  defp pedir_distancia do
    input("Ingrese la distancia recorrida en kilómetros:", :float) #el atomo asegura que se llame el input de los reales
  end

  defp pedir_litros do
    input("Ingrese la cantidad de combustible consumido en litros:", :float)
  end

  defp calcular_rendimiento(distancia, litros) do
    distancia / litros
  end

  defp mostrar_resultados(nombre, distancia, litros, rendimiento) do
    show_message("Conductor: #{nombre}")
    show_message("Distancia: #{Float.round(distancia, 2)} km")
    show_message("Combustible: #{Float.round(litros, 2)} L")
    show_message("Rendimiento: #{Float.round(rendimiento, 2)} km/L")
  end
end

# Llamada automática al programa
Main.main()
