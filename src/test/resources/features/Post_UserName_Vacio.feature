Feature: endpoint user permite crear un usuario con userName vacío

  Scenario: No debería permitir registrar usuario con userName vacío
  Given url 'https://fakerestapi.azurewebsites.net/api/v1/Users'
  And request
    """
    {
      "id": 9999,
      "userName": "",
      "password": "PasswordInvalida"
    }
    """
  When method post
  Then status 400

