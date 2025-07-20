Feature: Pruebas de la API FakeRest

    Background:
        * url 'https://fakerestapi.azurewebsites.net/api/v1'

    Scenario: Obtener todos las portadas
        Given path 'CoverPhotos'
        When method get
        Then status 200

Scenario: Obtener portadas por idBook existente
    Given path 'CoverPhotos', 'books', 'covers', 150
    When method get
    Then status 200
    And assert response.length >= 1
    And match response[0] contains { id: '#number', url: '#string', idBook: 150 }

Scenario: Obtener portadas con idBook negativo
    Given path 'CoverPhotos', 'books', 'covers', -5
    When method get
    Then status 400

