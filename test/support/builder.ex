defmodule Builders do
  defmacro __using__(_options) do
    quote do
      def create_user(opts \\ []) do
        user = %{
          name: "user_test",
          cpf: "01234567890",
          contact: %{email: "email@test"},
          phones: [
            %{ddd: 11, phone_number: "000000000"},
            %{ddd: 11, phone_number: "000000001"},
            %{ddd: 11, phone_number: "000000003"}
          ]
        }

        DesafioOinc.Application.User.Create.call(user)
      end
    end
  end
end
