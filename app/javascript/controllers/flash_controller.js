import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.timeout = setTimeout(() => {
            this.dismiss()
        }, 3000)
    }

    disconnect() {
        if (this.timeout) {
            clearTimeout(this.timeout)
        }
    }

    dismiss() {
        this.element.classList.remove('show')

        setTimeout(() => {
            this.element.remove()
        }, 300)
    }
}
