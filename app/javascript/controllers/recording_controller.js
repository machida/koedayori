import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [
        "startBtn",
        "stopBtn",
        "player"
    ]

    static values = { slug: String }

    connect() {
    }

    start(){
        navigator.mediaDevices.getUserMedia({ audio: true })
          .then((stream) => {
            this.chunks = [];
            this.recorder = new MediaRecorder(stream);

            this.recorder.ondataavailable = (event) => {
              this.chunks.push(event.data);
            };

            this.recorder.onstop = () => {
            this.blob = new Blob(this.chunks, { type: 'audio/webm' });

            const formData = new FormData();
            const csrfToken = document.querySelector('meta[name="csrf-token"]')?.content;

            formData.append("audio", this.blob, "recording.webm");

            fetch(`/speakers/${this.slugValue}/posts`, {
            method: "POST",
            headers: {
                "X-CSRF-Token": csrfToken
            },
            body: formData,
            });

            this.playerTarget.src = URL.createObjectURL(this.blob);
            this.playerTarget.play();
            }
        this.recorder.start();
        });
    }

    stop() {
        this.recorder.stop();
    }
}
