defmodule Util do
  def show_message(:error, message) do
    System.cmd("java", ["-cp", ".", "Mensaje", "Error: #{message}"])
  end

  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end

  def input(message, :string) do
    {output, _} =
      System.cmd("java", ["-cp", ".", "Mensaje", "input", message, "string"])

    String.trim(output)
  end

  def input(message, :integer) do
    try do
      message
      |> input(:string)
      |> String.to_integer()
    rescue
      ArgumentError ->
        show_message(:error, "El valor ingresado no es un entero válido.")
        input(message, :integer)
    end
  end

  def input(message, :float) do
    try do
      message
      |> input(:string)
      |> String.to_float()
    rescue
      ArgumentError ->
        show_message(:error, "El valor ingresado no es un número real válido.")
        input(message, :float)
    end
  end
end
