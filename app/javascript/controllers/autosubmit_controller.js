import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["form"]

    connect() {
    }

    submit(event) {
        clearTimeout(this.timeout)
        this.timeout = setTimeout(() => {
            this.element.requestSubmit()
        }, 200)
    }
}
