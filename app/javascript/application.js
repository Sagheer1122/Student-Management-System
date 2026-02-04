// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap

document.addEventListener('turbo:load', function () {
  console.log("Turbo load: managing toasts");
  const toastElements = document.querySelectorAll('.toast');

  toastElements.forEach(function (toastElement) {
    toastElement.classList.add('show');

    setTimeout(() => {
      console.log("Fading out toast...");
      toastElement.classList.remove('show');

      setTimeout(() => {
        toastElement.style.display = 'none';
      }, 500);
    }, 2000);
  });
});
