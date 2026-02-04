import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "label"]

    connect() {
        this.timeout = null
    }

    preview(event) {
        const value = event.target.dataset.value
        const label = event.target.textContent

        this.inputTarget.value = value

        if (this.hasLabelTarget) {
            this.labelTarget.textContent = label
        }

        this.element.closest("form").requestSubmit()
    }
}
