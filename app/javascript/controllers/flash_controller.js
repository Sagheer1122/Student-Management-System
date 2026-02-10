import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
    connect() {
        // Set a timeout to remove the flash message after 3 seconds
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
        // Add the Bootstrap fade class logic if needed, or just remove
        this.element.classList.remove('show')

        // Wait for the fade animation to complete before removing the element
        setTimeout(() => {
            this.element.remove()
        }, 300)
    }
}
