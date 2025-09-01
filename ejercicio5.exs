defmodule Main do
  import Util

  def main do
    placa = pedir_placa()
    tipo = pedir_tipo()
    peso = pedir_peso()

    tarifa = calcular_tarifa(tipo, peso)
    mostrar_resultados(placa, tipo, tarifa)

    {placa, tipo, tarifa} # retorna la tupla
  end

  # Auxiliares
  defp pedir_placa do
    input("Ingrese la placa del vehículo:", :string)
  end

  defp pedir_tipo do
    input("Ingrese el tipo de vehículo (Carro, Moto, Camión):", :string)
    |> String.capitalize()
  end

  defp pedir_peso do
    input("Ingrese el peso del vehículo (toneladas):", :float)
  end

  defp calcular_tarifa("Carro", _peso), do: 10_000
  defp calcular_tarifa("Moto", _peso), do: 5_000
  defp calcular_tarifa("Camión", peso), do: 20_000 + (peso * 2000)
  defp calcular_tarifa(_, _), do: 0

  defp mostrar_resultados(placa, tipo, tarifa) do
    show_message("""
    Vehículo #{placa} (#{tipo}) debe pagar $#{formatear_numero(tarifa)}.
    """)
  end

  # Formateo con separadores de miles
  defp formatear_numero(numero) do
    numero
    |> Float.round(0)
    |> :erlang.float_to_binary(decimals: 0)
    |> String.replace(~r/(\d)(?=(\d{3})+$)/, "\\1,")
  end
end

# Ejecutar automáticamente
Main.main()
