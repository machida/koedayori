import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { postId: Number}

    markPlayed() {
        const csrfToken = document.querySelector('meta[name="csrf-token"]')?.content;
        fetch(`/families/playbacks/${this.postIdValue}`, {
            method: "POST",
            headers: {
                "X-CSRF-Token": csrfToken,
            }
        });
    }
}
