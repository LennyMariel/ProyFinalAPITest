Scenario: Obtener todas las actividades
    Given path 'Activities'
    When method get
    Then status 200
    And match response contains deep { id: 1, title: '#string' }
