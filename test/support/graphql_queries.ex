defmodule GraphqlQueries do
  def user_query_with_id do
    """
      query getUser($userId: String!) {
        getUser(userId: $userId) {
          id
          name
          cpf
          contact {
            id
            email
            userId
          }
          phones {
            id
            contactId
            ddd
            phoneNumber
          }
        }
      }
    """
  end

  def user_query_with_cpf do
    """
    query getUser($cpf: String!) {
      getUser(cpf: $cpf) {
        id
        name
        cpf
        contact {
          id
          email
          userId
        }
        phones {
          id
          contactId
          ddd
          phoneNumber
        }
      }
    }
    """
  end

end
