Feature: contiene pruebas Post de Author

Scenario: Crear un nuevo autor 
  Given url 'https://fakerestapi.azurewebsites.net/api/v1'
    And path 'Authors'
    * def author = 
    """
    {
      "id": 5098,
      "idBook": 4,
      "firstName": "Jonny",
      "lastName": "Bravo",
      
    }
    """
    When method Post
    Then status 201
  
    