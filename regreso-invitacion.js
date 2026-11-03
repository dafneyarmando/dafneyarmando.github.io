/*
  Permite regresar desde regalos.html a la invitación ya abierta.
  Incluye este archivo después de script.js en index.html.
*/

(() => {
  const params = new URLSearchParams(window.location.search);

  if (params.get('vista') !== 'interior') return;

  const intro = document.getElementById('intro');
  const siteContent = document.getElementById('siteContent');

  if (intro) {
    intro.style.display = 'none';
    intro.setAttribute('aria-hidden', 'true');
  }

  if (siteContent) {
    siteContent.classList.remove('is-hidden');
  }

  document.querySelectorAll('.reveal').forEach((element) => {
    element.classList.add('is-visible');
  });

  window.requestAnimationFrame(() => {
    const destination = document.querySelector(window.location.hash || '#regalos');
    destination?.scrollIntoView({ behavior: 'auto', block: 'start' });
  });

  window.history.replaceState(
    null,
    '',
    `${window.location.pathname}${window.location.hash}`
  );
})();
