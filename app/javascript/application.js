// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

/* 
    This script is for the icons popup.
    Here I: 
        - add event listeners to the popup's open and close buttons
        - Retrieve the class of each icon e.g:  'arrow-fs fb' which will be used as a refecence in the Database.
*/

if (window.location.toString().includes("/groups/new")) {
  let openBtn = document.querySelector(".select-icon");
  openBtn.addEventListener("click", () => {
    let popupSection = document.querySelector(".icon-container ");
    if (popupSection.classList.contains("hidden")) {
      popupSection.classList.remove("hidden");
    }
  });

  let closeBtn = document.querySelector(".popup-close-btn");
  closeBtn.addEventListener("click", () => {
    let popupSection = document.querySelector(".icon-container ");
    if (!popupSection.classList.contains("hidden")) {
      popupSection.classList.add("hidden");
    }
  });

  let icons = Array.from(document.querySelectorAll(".icon"));
  icons.forEach((icon) => {
    icon.addEventListener("click", () => {
      let iconInput = document.querySelector(".icon-input");
      let iconElement = icon.querySelector("i");
      iconInput.value = Array.from(iconElement.classList).join(" ");
      let popupSection = document.querySelector(".icon-container");
      popupSection.classList.add("hidden");
    });
  });
}
