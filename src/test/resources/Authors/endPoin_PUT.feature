Feature: Actualiza Author por id existente
  Scenario: Actualiza autor por id
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/'
    And path 'Authors/4'
      """
      {
        "id": 4,
        "idBook": 100,
        "firstName": "Juan",
        "lastName": "Perez"
      }
      """
    When method Put
  Then status 200
  And match response.firstName == "Juan"
  And match response.lastName == "Perez"
  And match response.idBook == 100
  And match response.id == 4