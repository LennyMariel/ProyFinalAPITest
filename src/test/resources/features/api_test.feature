Feature: Pruebas de la API FakeRest

  Background:
    * url 'https://fakerestapi.azurewebsites.net/api/v1'

  Scenario: Obtener todos los usuarios
    Given path 'Users'
    When method get
    Then status 200
    And match response contains deep { id: 1, userName: '#string' }

  Scenario: Verificar usuario con ID específico
    Given path 'Users', 1
    When method get
    Then status 200
    And match response.userName == 'User 1'

  Scenario: Verificar lista de libros
    Given path 'Books'
    When method get
    Then status 200
    And match response[0].title != null
