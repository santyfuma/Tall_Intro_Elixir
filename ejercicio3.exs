defmodule Main do
  import Util

  def main do
    nombre = pedir_nombre()
    celsius = pedir_celsius()
    fahrenheit = convertir_a_fahrenheit(celsius)
    kelvin = convertir_a_kelvin(celsius)

    mostrar_resultados(nombre, celsius, fahrenheit, kelvin)
  end

  # Auxiliares
  defp pedir_nombre do
    input("Ingrese su nombre:", :string)
  end

  defp pedir_celsius do
    input("Ingrese la temperatura en °C:", :float)
  end

  defp convertir_a_fahrenheit(celsius) do
    (celsius * 9 / 5) + 32
  end

  defp convertir_a_kelvin(celsius) do
    celsius + 273.15
  end

  defp mostrar_resultados(nombre, celsius, fahrenheit, kelvin) do
    show_message("""
    #{nombre}, la temperatura es:
    - #{Float.round(fahrenheit, 1)} °F
    - #{Float.round(kelvin, 1)} K
    """)
  end
end

# Ejecutar automáticamente
Main.main()
