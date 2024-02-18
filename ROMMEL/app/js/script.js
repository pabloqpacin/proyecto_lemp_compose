// Function to search for tickets by ID
async function buscarTicket(id) {
    try {
      // Make API request with the ticket ID
      const response = await fetch(`/api/tickets/${id}`);
      const data = await response.json();

      // Show the search results in the interface
      // ...

    } catch (error) {
      // Handle API request error
      mostrarError('Error al buscar el ticket.');
    }
  }

  // Add event listener to the search button
  document.querySelector("#buscador button").addEventListener("click", function() {
    const id = document.querySelector("#buscador input").value;
    buscarTicket(id);
  });

  // Function to show an error message
  function mostrarError(mensaje) {
    // Show the error message in the interface
    // ...
  }

  // Function to validate the data in the ticket creation form
  function validarFormulario(formulario) {
    // Validate that all fields are completed
    // Show error messages if there are incomplete fields
    // Return true if the form is valid, false if it is not
  }

  // Add event listener to the submit button of the ticket creation form
  document.querySelector("#crear-ticket form button").addEventListener("click", async function(e) {
    e.preventDefault();

    const formulario = document.querySelector("#crear-ticket form");

    if (!validarFormulario(formulario)) {
      return;
    }

    try {
      // Send the form data to the API
      const response = await fetch('/api/tickets', {
        method: 'POST',
        body: new FormData(formulario),
      });

      if (response.ok) {
        // Show a success message if the ticket is created successfully
        // ...
      } else {
        // Handle API request error
        mostrarError('Error al crear el ticket.');
      }
    } catch (error) {
      // Handle unexpected errors
      mostrarError('Error inesperado al crear el ticket.');
    }
  });


/*
    // Función para buscar tickets por ID
    function buscarTicket(id) {
    // Consultar la API con el ID del ticket
    // Mostrar los resultados de la búsqueda
    }

    // Añadir evento al botón de búsqueda
    document.querySelector("#buscador button").addEventListener("click", function() {
    const id = document.querySelector("#buscador input").value;
    buscarTicket(id);
    });

    // Función para mostrar un mensaje de error
    function mostrarError(mensaje) {
    // Mostrar el mensaje de error en la interfaz
    }

    // Función para validar los datos del formulario de creación de tickets
    function validarFormulario(formulario) {
    // Validar que todos los campos estén completos
    // Mostrar mensajes de error si hay campos incompletos
    // Devolver true si el formulario es válido, false si no lo es
    }

    // Añadir evento al botón de enviar del formulario de creación de tickets
    document.querySelector("#crear-ticket form button").addEventListener("click", function(e) {
    e.preventDefault();

    const formulario = document.querySelector("#crear-ticket form");

    if (!validarFormulario(formulario)) {
        return;
    }

    // Enviar los datos del formulario a la API
    // Mostrar un mensaje de éxito si el ticket se crea correctamente
    // Mostrar un mensaje de error si hay algún problema al crear el ticket
    });
*/
