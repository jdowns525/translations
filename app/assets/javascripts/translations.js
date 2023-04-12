document.addEventListener("DOMContentLoaded", function() {
  const form = document.getElementById("translation_form");

  form.addEventListener("submit", function(event) {
    event.preventDefault();

    const formData = new FormData(form);
    const xhr = new XMLHttpRequest();

    xhr.open("POST", form.action, true);
    xhr.setRequestHeader("X-CSRF-Token", document.getElementsByName("csrf-token")[0].content);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onload = function() {
      if (xhr.status === 200) {
        const response = JSON.parse(xhr.responseText);
        document.getElementById("translated_text").innerText = response.translation;
      } else {
        console.error("Error in translation request:", xhr.statusText);
      }
    };

    xhr.send(new URLSearchParams(formData).toString());
  });
});
