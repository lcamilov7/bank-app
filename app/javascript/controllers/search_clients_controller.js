import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-clients"
export default class extends Controller {

  static targets = ["form", "input", "list"] // Nuestros targets
  connect() {
    console.log(this.formTarget) // Probamos que hayamos conectado con los targets con el metodo connect
    console.log(this.inputTarget)
    console.log(this.listTarget)
    console.log(this.formTarget.action)
  }

  update() { // Este metodo sera invocado cada vez que se teclee una tecla en nuestro target "input"
    // Construimos la url de nuestra solicitud http: "this.formTarget.action" equivale a localhost:3000/clients
    // porque es a donde dirige el form, this.inputTarget.value es igual al contenido de nuestro input y dentro de nuestra url
    // viene siendo la query. Luego con fetch realizamos la petición y convertimos la respuesta a formato text y la actualizamos con
    // el contenido de nuestro target list que contiene la tabla con los clientes.
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
    })
  }
}
