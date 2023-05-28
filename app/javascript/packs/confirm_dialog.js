document.addEventListener('DOMContentLoaded', function() {
  const links = document.querySelectorAll('[data-confirm]');

  links.forEach(function(link) {
    link.addEventListener('click', function(event) {
      const message = this.getAttribute('data-confirm');
      if (message && !confirm(message)) {
        event.preventDefault();
      }
    });
  });
});