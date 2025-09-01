defmodule Main do
  import Util

  def main do
    titulo = pedir_titulo()
    unidades = pedir_unidades()
    precio = pedir_precio()
    total = calcular_total(unidades, precio)

    mostrar_resultados(titulo, unidades, precio, total)
  end

  # Métodos auxiliares
  defp pedir_titulo do
    input("Ingrese el título del libro:", :string)
  end

  defp pedir_unidades do
    input("Ingrese la cantidad de unidades disponibles:", :integer)
  end

  defp pedir_precio do
    input("Ingrese el precio unitario:", :float)
  end

  defp calcular_total(unidades, precio) do
    unidades * precio
  end

  defp mostrar_resultados(titulo, unidades, precio, total) do
    show_message("""
    El libro "#{titulo}" tiene #{unidades} unidades,
    con un precio unitario de $#{formatear_numero(precio)},
    y un valor total de $#{formatear_numero(total)}.
    """)
  end

  # Formatear con separadores de miles
  defp formatear_numero(numero) do
    numero
    |> Float.round(2)
    |> :erlang.float_to_binary(decimals: 2)
    |> String.replace(~r/(\d)(?=(\d{3})+\.)/, "\\1,")
  end
end

# Ejecutar automáticamente
Main.main()
