
  Scenario: No se puede crear una actividad ya existente
  Given path 'Activities'
  And request
    """
    {
      "id": 3,
      "title": "string",
      "dueDate": "2025-07-14T22:16:51.408Z",
      "completed": true
    }
    """
  When method post
  Then status 409
  And match response contains { message: '#string' }

  Scenario: Crear una nueva actividad y luego intentar crearla nuevamente (conflicto)
  # Generar datos dinámicos
  * def randomId = Math.floor(Math.random() * 100000)
  * def newActivity =
    """
    {
      "id": #randomId,
      "title": "Actividad de prueba " + randomId,
      "dueDate": "2025-07-14T22:16:51.408Z",
      "completed": false
    }
    """

  # Crear la actividad por primera vez
  Given path 'Activities'
  And request newActivity
  When method post
  Then status 201
  And match response contains { id: '#number', title: '#string' }

  # Intentar crear la misma actividad nuevamente
  Given path 'Activities'
  And request newActivity
  When method post
  Then status 409
  And match response contains { message: '#string' }