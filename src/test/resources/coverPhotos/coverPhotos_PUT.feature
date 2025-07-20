Feature: Pruebas de la API FakeRest

    Background:
        * url 'https://fakerestapi.azurewebsites.net/api/v1'


    Scenario: Actualizar portada con id inexistente
        Given path 'CoverPhotos'
        And request
            """
            {
                "id": 567,
                "idBook": 567,
                "url": "https://placeholdit.imgix.net/~text?txtsize=33&txt=Book167&w=250&h=350"
            }
            """
        When method put
        Then status 404

