defmodule DesafioOincWeb.SchemaTest do
  use DesafioOincWeb.ConnCase
  use Builders

  import GraphqlQueries
  import Parses

  describe "query: getUser" do
    test "Should return the user when a valid ID is given", %{conn: conn} do
      {:ok, user} = create_user()

      conn =
        post(conn, "/api/graphql", %{
          "query" => user_query_with_id(),
          "variables" => %{userId: user.id}
        })

      assert json_response(conn, 200) == parse_user(user)
    end

    test "Should return the user when a valid cpf is given", %{conn: conn} do
      {:ok, user} = create_user()

      conn =
        post(conn, "/api/graphql", %{
          "query" => user_query_with_cpf(),
          "variables" => %{cpf: user.cpf}
        })

      assert json_response(conn, 200) == parse_user(user)
    end

    test "Should return an error user when a invalid id is given", %{conn: conn} do
      invalid_id = "invalid_id"

      conn =
        post(conn, "/api/graphql", %{
          "query" => user_query_with_id(),
          "variables" => %{userId: invalid_id}
        })

      assert %{"errors" => [%{"message" => "Invalid user ID", "path" => ["getUser"]}]} =
               json_response(conn, 200)
    end

    test "Should return an error user when a non existent id is given", %{conn: conn} do
      non_existent_id = "bb4ccff2-fede-465e-a7a6-d2be3554fe10"

      conn =
        post(conn, "/api/graphql", %{
          "query" => user_query_with_id(),
          "variables" => %{userId: non_existent_id}
        })

      assert %{"errors" => [%{"message" => "User not found", "path" => ["getUser"]}]} =
               json_response(conn, 200)
    end

    test "Should return an error user when a non existent cpf is given", %{conn: conn} do
      non_existent_cpf = "123"

      conn =
        post(conn, "/api/graphql", %{
          "query" => user_query_with_cpf(),
          "variables" => %{cpf: non_existent_cpf}
        })

      assert %{"errors" => [%{"message" => "User not found", "path" => ["getUser"]}]} =
               json_response(conn, 200)
    end
  end
end
