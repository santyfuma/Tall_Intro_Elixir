defmodule Main do
  import Util

  def main do
    cliente = pedir_cliente()
    peso = pedir_peso()
    tipo = pedir_tipo()

    costo = calcular_costo(tipo, peso)
    mostrar_resultados(cliente, peso, tipo, costo)

    {cliente, peso, tipo, costo} # retorna la tupla
  end

  # Auxiliares
  defp pedir_cliente do
    input("Ingrese el nombre del cliente:", :string)
  end

  defp pedir_peso do
    input("Ingrese el peso del paquete (kg):", :float)
  end

  defp pedir_tipo do
    input("Ingrese el tipo de envío (Económico, Express, Internacional):", :string)
    |> String.capitalize()
  end

  # Lógica de tarifas con cond + case
  defp calcular_costo(tipo, peso) do
    case tipo do
      "Económico" -> 5000 * peso
      "Express" -> 8000 * peso
      "Internacional" ->
        cond do
          peso <= 5 -> 15000 * peso
          peso > 5 -> 12000 * peso
        end
      _ -> 0
    end
  end

  defp mostrar_resultados(cliente, peso, tipo, costo) do
    show_message("""
    Cliente: #{cliente}
    Tipo de envío: #{tipo}
    Peso: #{peso} kg
    Costo total: $#{formatear_numero(costo)}
    """)
  end

  # Formatear números con separadores
  defp formatear_numero(numero) do
    numero
    |> Float.round(0)
    |> :erlang.float_to_binary(decimals: 0)
    |> String.replace(~r/(\d)(?=(\d{3})+$)/, "\\1,")
  end
end

# Ejecutar automáticamente
Main.main()
