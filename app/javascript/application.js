// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Application } from '@hotwired/stimulus';
import { registerControllers } from '@hotwired/stimulus-loading';
import "@hotwired/turbo-rails"
import "../controllers"

const application = Application.start();
registerControllers(application);

document.addEventListener('turbolinks:load', () => {
    window.alert('DOM LOADED')
})