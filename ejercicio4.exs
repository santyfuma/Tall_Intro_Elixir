defmodule Main do
  import Util

  def main do
    nombre = pedir_nombre()
    salario_base = pedir_salario()
    horas_extras = pedir_horas_extras()
    salario_total = calcular_salario_total(salario_base, horas_extras)

    mostrar_resultados(nombre, salario_total)
  end

  # Auxiliares
  defp pedir_nombre do
    input("Ingrese el nombre del empleado:", :string)
  end

  defp pedir_salario do
    input("Ingrese el salario base:", :float)
  end

  defp pedir_horas_extras do
    input("Ingrese las horas extras trabajadas:", :integer)
  end

  defp calcular_salario_total(salario_base, horas_extras) do
    valor_hora = salario_base / 160
    pago_extras = horas_extras * valor_hora * 1.5
    salario_base + pago_extras
  end

  defp mostrar_resultados(nombre, salario_total) do
    show_message("""
    El salario total de #{nombre} es de $#{formatear_numero(salario_total)}
    """)
  end

  # Formateo con separadores de miles y 2 decimales
  defp formatear_numero(numero) do
    numero
    |> Float.round(2)
    |> :erlang.float_to_binary(decimals: 2)
    |> String.replace(~r/(\d)(?=(\d{3})+\.)/, "\\1,")
  end
end

# Ejecutar automáticamente
Main.main()
