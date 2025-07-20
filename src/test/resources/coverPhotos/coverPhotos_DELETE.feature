Feature: Pruebas de la API FakeRest


    Background:
        * url 'https://fakerestapi.azurewebsites.net/api/v1'

    Scenario: Validar que no se permite eliminar una portada inexistente por id
        Given path 'CoverPhotos', 999
        When method delete
        Then status 404
