// =========================
// 1. PREPORTADA / SOBRE
// =========================
const intro = document.getElementById('intro');
const introScene = document.getElementById('introScene');
const envelopeTrigger = document.getElementById('openInvitation');
const siteContent = document.getElementById('siteContent');
let invitationIsOpening = false;

function revealOnLoad() {
  document.querySelectorAll('.reveal').forEach((element) => observer.observe(element));
}

function openInvitation() {
  if (!intro || !introScene || !siteContent || invitationIsOpening) return;

  invitationIsOpening = true;
  introScene.classList.add('is-open');

  setTimeout(() => {
    introScene.classList.add('is-front');
  }, 1400);

  setTimeout(() => {
    introScene.classList.remove('is-front');
    introScene.classList.add('is-settled');
  }, 2400);

  setTimeout(() => {
    intro.style.opacity = '0';
    intro.style.transition = 'opacity 1.1s ease';

    setTimeout(() => {
      intro.style.display = 'none';
      siteContent.classList.remove('is-hidden');
      window.scrollTo({ top: 0, behavior: 'auto' });
      revealOnLoad();
    }, 1120);
  }, 4200);
}

if (envelopeTrigger) {
  envelopeTrigger.addEventListener('click', openInvitation);
  envelopeTrigger.addEventListener('keydown', (event) => {
    if (event.key === 'Enter' || event.key === ' ') {
      event.preventDefault();
      openInvitation();
    }
  });
}

// =========================
// 2. MENÚ MÓVIL
// =========================
const menuToggle = document.getElementById('menuToggle');
const navMenu = document.getElementById('navMenu');

if (menuToggle && navMenu) {
  menuToggle.addEventListener('click', () => {
    navMenu.classList.toggle('is-open');
  });

  navMenu.querySelectorAll('a').forEach((link) => {
    link.addEventListener('click', () => {
      navMenu.classList.remove('is-open');
    });
  });
}

// =========================
// 3. CARRUSELES MANUALES
// =========================
const carousels = document.querySelectorAll('[data-carousel]');

carousels.forEach((carousel) => {
  const track = carousel.querySelector('[data-carousel-track]');
  const slides = track ? Array.from(track.children) : [];
  const prevButton = carousel.querySelector('[data-carousel-prev]');
  const nextButton = carousel.querySelector('[data-carousel-next]');
  const dots = Array.from(carousel.querySelectorAll('[data-carousel-dots] button'));
  let currentSlide = 0;

  function updateCarousel() {
    if (!track || slides.length === 0) return;

    track.style.transform = `translateX(-${currentSlide * 100}%)`;

    dots.forEach((dot, index) => {
      dot.classList.toggle('is-active', index === currentSlide);
      dot.setAttribute('aria-pressed', index === currentSlide ? 'true' : 'false');
    });
  }

  if (slides.length <= 1) {
    if (prevButton) prevButton.hidden = true;
    if (nextButton) nextButton.hidden = true;
    const dotsWrap = carousel.querySelector('[data-carousel-dots]');
    if (dotsWrap) dotsWrap.hidden = true;
    return;
  }

  if (nextButton) {
    nextButton.addEventListener('click', () => {
      currentSlide = (currentSlide + 1) % slides.length;
      updateCarousel();
    });
  }

  if (prevButton) {
    prevButton.addEventListener('click', () => {
      currentSlide = (currentSlide - 1 + slides.length) % slides.length;
      updateCarousel();
    });
  }

  dots.forEach((dot, index) => {
    dot.addEventListener('click', () => {
      currentSlide = index;
      updateCarousel();
    });
  });

  updateCarousel();
});

// =========================
// 4. APARICIÓN SUAVE AL HACER SCROLL
// =========================
const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      entry.target.classList.add('is-visible');
      observer.unobserve(entry.target);
    }
  });
}, {
  threshold: 0.15
});

// =========================
// 5. AÑO AUTOMÁTICO EN FOOTER
// =========================
const currentYear = document.getElementById('currentYear');
if (currentYear) {
  currentYear.textContent = new Date().getFullYear();
}

// =========================
// 6. CUENTA REGRESIVA
// =========================
const countdown = document.getElementById('countdown');
const countdownDays = document.getElementById('countdownDays');
const countdownHours = document.getElementById('countdownHours');
const countdownMinutes = document.getElementById('countdownMinutes');
const countdownSeconds = document.getElementById('countdownSeconds');

// Fecha del evento
const weddingDate = new Date('2027-03-20T19:00:00');

function formatCountdownValue(value) {
  return String(value).padStart(2, '0');
}

function updateCountdown() {
  if (!countdown) return;

  const now = new Date();
  const difference = weddingDate - now;

  if (difference <= 0) {
    if (countdownDays) countdownDays.textContent = '00';
    if (countdownHours) countdownHours.textContent = '00';
    if (countdownMinutes) countdownMinutes.textContent = '00';
    if (countdownSeconds) countdownSeconds.textContent = '00';
    return;
  }

  const days = Math.floor(difference / (1000 * 60 * 60 * 24));
  const hours = Math.floor((difference / (1000 * 60 * 60)) % 24);
  const minutes = Math.floor((difference / (1000 * 60)) % 60);
  const seconds = Math.floor((difference / 1000) % 60);

  if (countdownDays) countdownDays.textContent = formatCountdownValue(days);
  if (countdownHours) countdownHours.textContent = formatCountdownValue(hours);
  if (countdownMinutes) countdownMinutes.textContent = formatCountdownValue(minutes);
  if (countdownSeconds) countdownSeconds.textContent = formatCountdownValue(seconds);
}

updateCountdown();
setInterval(updateCountdown, 1000);