Feature: Pruebas de la API FakeRest

    Background:
        * url 'https://fakerestapi.azurewebsites.net/api/v1'

    Scenario: Crea una nueva portada valida
        Given path 'CoverPhotos'
        And request
            """
            {
                "id": 150,
                "idBook": 150,
                "url": "https://placeholdit.imgix.net/~text?txtsize=33&txt=Book150&w=250&h=350"
            }
            """
        When method post
        Then status 200

    Scenario: Crear portada con campo url_ vacío
        Given path 'CoverPhotos'
        And request
            """
            {
                "idBook": 150,
                "url": ""
            }
            """
        When method post
        Then status 400
       



  