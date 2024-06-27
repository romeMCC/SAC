import { Controller } from "@hotwired/stimulus"
//import { Modal } from "bootstrap"

export default class extends Controller {
  connect() {
    //console.log($(this.element).modal());
    //this.modal = new Modal(this.element);
    debugger;
    $(this.element).modal();
    //var myModalEl = document.getElementById('shareRecipeModal')
    //this.modal = bootstrap.Modal.getInstance(myModalEl);
    this.modal = bootstrap.Modal.getInstance(this.element);
    this.modal.show();
  }

  hideBeforeRender(event) {
    if (this.isOpen()) {
      event.preventDefault();
      this.element.addEventListener('hidden.bs.modal', event.detail.resume);
      this.modal.hide();
    }
  }

  isOpen() {
    return this.element.classList.contains("show");
  }
}