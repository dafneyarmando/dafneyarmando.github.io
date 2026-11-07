const GIFTS_API_URL =
  'https://dafne-armando-regalos-api.angulo-chavira90.workers.dev/api/gifts';
const CHECKOUT_API_URL =
  'https://dafne-armando-regalos-api.angulo-chavira90.workers.dev/api/checkout';
const ORDER_STATUS_API_URL =
  'https://dafne-armando-regalos-api.angulo-chavira90.workers.dev/api/order-status';

const CART_STORAGE_KEY = 'dafne-armando-regalos-cart-v1';
const TOUR_STORAGE_KEY = 'dafne-armando-regalos-tour-seen-v1';

const EXPERIENCE_CATEGORIES = new Set([
  'Viajes y transporte',
  'Hospedaje',
  'Comidas y bebidas'
]);

const VIEW_DEFINITIONS = {
  experiencias: {
    eyebrow: 'Nuestra luna de miel',
    title: 'Regálanos recuerdos',
    description:
      'Vuelos, hospedaje, recorridos y comidas que se convertirán en historias para toda la vida.',
    matches: (gift) => isExperience(gift)
  },
  libre: {
    eyebrow: 'Un detalle a tu manera',
    title: 'Aportación libre',
    description:
      'Elige el monto que prefieras en múltiplos de $100, sin asociarlo a un regalo específico.',
    matches: (gift) => gift.mode === 'Libre'
  },
  aventuras: {
    eyebrow: 'Para seguir explorando',
    title: 'Aventuras',
    description:
      'Objetos que nos acompañarán en campamentos, excursiones y escapadas futuras.',
    matches: (gift) => gift.category === 'Aventuras' && !isExperience(gift)
  },
  equipaje: {
    eyebrow: 'Para cada destino',
    title: 'Equipaje',
    description: 'Lo necesario para viajar con comodidad y llevar cada cosa en su lugar.',
    matches: (gift) => gift.category === 'Equipaje'
  },
  tecnologia: {
    eyebrow: 'Para nuestra vida cotidiana',
    title: 'Tecnología',
    description: 'Pequeñas herramientas para disfrutar, trabajar y cuidar nuestro hogar.',
    matches: (gift) => gift.category === 'Tecnología'
  },
  cocina: {
    eyebrow: 'Recetas para compartir',
    title: 'Cocina',
    description: 'Utensilios y detalles para cocinar juntos y recibir a quienes queremos.',
    matches: (gift) => gift.category === 'Cocina'
  },
  hogar: {
    eyebrow: 'Nuestra nueva etapa',
    title: 'Hogar',
    description: 'Objetos para construir un espacio cómodo, ordenado y lleno de recuerdos.',
    matches: (gift) => gift.category === 'Hogar'
  },
  bienestar: {
    eyebrow: 'Tiempo para nosotros',
    title: 'Descanso y bienestar',
    description: 'Detalles para descansar, cuidarnos y disfrutar de la tranquilidad en casa.',
    matches: (gift) => gift.category === 'Descanso y bienestar'
  }
};

const moneyFormatter = new Intl.NumberFormat('es-MX', {
  style: 'currency',
  currency: 'MXN',
  maximumFractionDigits: 0
});

const giftCatalogStatus = document.getElementById('giftCatalogStatus');
const giftCatalog = document.getElementById('giftCatalog');
const registryNavigation = document.getElementById('registryNavigation');
const catalogToolbar = document.getElementById('catalogToolbar');
const modeFilters = document.getElementById('modeFilters');
const viewEyebrow = document.getElementById('viewEyebrow');
const viewTitle = document.getElementById('viewTitle');
const viewDescription = document.getElementById('viewDescription');
const backToInvitation = document.getElementById('backToInvitation');

const openCartButton = document.getElementById('openCartButton');
const closeCartButton = document.getElementById('closeCartButton');
const cartDrawer = document.getElementById('cartDrawer');
const cartBackdrop = document.getElementById('cartBackdrop');
const cartItems = document.getElementById('cartItems');
const cartCount = document.getElementById('cartCount');
const cartTotal = document.getElementById('cartTotal');
const checkoutButton = document.getElementById('checkoutButton');
const guestNameInput = document.getElementById('guestName');
const dedicationInput = document.getElementById('dedication');
const checkoutError = document.getElementById('checkoutError');
const registryToast = document.getElementById('registryToast');
const paymentResult = document.getElementById('paymentResult');
const paymentResultCard = document.getElementById('paymentResultCard');
const paymentResultIcon = document.getElementById('paymentResultIcon');
const paymentResultEyebrow = document.getElementById('paymentResultEyebrow');
const paymentResultTitle = document.getElementById('paymentResultTitle');
const paymentResultMessage = document.getElementById('paymentResultMessage');
const paymentResultSummary = document.getElementById('paymentResultSummary');
const closePaymentResultButton = document.getElementById('closePaymentResult');
const continueAfterPaymentButton = document.getElementById('continueAfterPayment');
const startTourButton = document.getElementById('startTourButton');
const registryTour = document.getElementById('registryTour');
const tourFocus = document.getElementById('tourFocus');
const tourCard = document.getElementById('tourCard');
const tourStep = document.getElementById('tourStep');
const tourEyebrow = document.getElementById('tourEyebrow');
const tourTitle = document.getElementById('tourTitle');
const tourText = document.getElementById('tourText');
const tourLegend = document.getElementById('tourLegend');
const skipTourButton = document.getElementById('skipTourButton');
const previousTourButton = document.getElementById('previousTourButton');
const nextTourButton = document.getElementById('nextTourButton');

const TOUR_STEPS = [
  {
    target: null,
    eyebrow: 'Bienvenidos',
    title: 'Una mesa, tres formas de regalar',
    text:
      'Puedes elegir un regalo completo, cooperar con una parte de una experiencia de mayor valor o hacer una aportación libre. Todo se agrega al mismo carrito.',
    showLegend: true
  },
  {
    target: '#registryNavigation',
    eyebrow: 'Paso 1',
    title: 'Explora por categorías',
    text:
      'Las experiencias aparecen primero. Desde este menú puedes visitar también hogar, cocina, tecnología, aventuras y las demás secciones.',
    showLegend: false
  },
  {
    target: '#modeFilters',
    eyebrow: 'Paso 2',
    title: 'Encuentra el tipo de regalo que prefieras',
    text:
      'Usa estos filtros para ver todos los regalos, solamente los completos o únicamente los cooperativos.',
    showLegend: false
  },
  {
    target: '.registry-card--collaborative',
    eyebrow: 'Paso 3',
    title: 'Así funciona un regalo cooperativo',
    text:
      'La barra muestra cuánto se ha reunido y cuánto falta. Puedes aportar cualquier múltiplo de $100 sin cubrir la meta completa.',
    showLegend: false
  },
  {
    target: '#openCartButton',
    eyebrow: 'Paso 4',
    title: 'Revisa todo antes de pagar',
    text:
      'Puedes combinar varios regalos y aportaciones. En el carrito podrás cambiar cantidades, quitar elementos y revisar el total.',
    showLegend: false
  }
];

let allGifts = [];
let activeView = 'experiencias';
let activeMode = 'Colaborativo';
let cart = loadCart();
let toastTimeout;
let activeTourStep = 0;
let tourPositionTimeout;
let checkoutInProgress = false;

function isExperience(gift) {
  return (
    EXPERIENCE_CATEGORIES.has(gift.category) ||
    gift.id.startsWith('tour-')
  );
}

function formatMoney(cents) {
  return moneyFormatter.format((Number(cents) || 0) / 100);
}

function getGiftGoalCents(gift) {
  const unitPrice = Math.max(0, Number(gift.unit_price_cents) || 0);
  const quantity = Math.max(1, Number(gift.target_quantity) || 1);
  return unitPrice * quantity;
}

function getGiftFundedCents(gift) {
  const goal = getGiftGoalCents(gift);
  const reported = Number(
    gift.funded_cents ??
    gift.received_cents ??
    gift.paid_cents ??
    0
  );

  return Math.min(goal, Math.max(0, Number.isFinite(reported) ? reported : 0));
}

function getGiftRemainingCents(gift) {
  return Math.max(0, getGiftGoalCents(gift) - getGiftFundedCents(gift));
}

function getGiftProgressPercent(gift) {
  const goal = getGiftGoalCents(gift);
  return goal > 0 ? Math.min(100, Math.round((getGiftFundedCents(gift) / goal) * 100)) : 0;
}

function getGiftRemainingQuantity(gift) {
  const reported = Number(gift.remaining_quantity);

  if (Number.isInteger(reported) && reported >= 0) {
    return reported;
  }

  return Math.max(0, Number(gift.target_quantity) || 1);
}

function giftMatchesMode(gift) {
  return activeMode === 'all' || gift.mode === activeMode;
}

function getContributionInCart(giftId) {
  return cart
    .filter((item) => item.kind === 'contribution' && item.giftId === giftId)
    .reduce((total, item) => total + item.amountCents, 0);
}

function loadCart() {
  try {
    const storedCart = JSON.parse(localStorage.getItem(CART_STORAGE_KEY));
    return Array.isArray(storedCart) ? storedCart : [];
  } catch {
    return [];
  }
}

function saveCart() {
  try {
    localStorage.setItem(CART_STORAGE_KEY, JSON.stringify(cart));
  } catch {
    // El carrito sigue funcionando durante la visita aunque el navegador
    // bloquee el almacenamiento local.
  }
}

function createElement(tag, className, text) {
  const element = document.createElement(tag);

  if (className) element.className = className;
  if (text !== undefined) element.textContent = text;

  return element;
}

function createGiftMedia(gift) {
  const media = createElement('div', 'registry-card__media');

  if (!gift.image_path) {
    media.classList.add('registry-card__media--missing');
    media.textContent = 'Imagen pendiente';
    return media;
  }

  const image = document.createElement('img');
  image.src = gift.image_path;
  image.alt = gift.name;
  image.loading = 'lazy';
  image.decoding = 'async';

  image.addEventListener('error', () => {
    image.remove();
    media.classList.add('registry-card__media--missing');
    media.textContent = 'Imagen pendiente';
  });

  media.appendChild(image);
  return media;
}

function createCardLabels(gift) {
  const labels = createElement('div', 'registry-card__labels');
  labels.appendChild(createElement('span', 'registry-card__category', gift.category));

  if (gift.mode === 'Colaborativo') {
    labels.appendChild(createElement('span', 'registry-card__mode registry-card__mode--collaborative', 'Cooperativo'));
  }

  return labels;
}

function createCompleteControls(gift) {
  const controls = createElement('div', 'registry-card__controls');
  const information = createElement('div', 'registry-card__price-group');
  const price = createElement('strong', 'registry-card__price', formatMoney(gift.unit_price_cents));
  const remainingQuantity = getGiftRemainingQuantity(gift);
  information.appendChild(price);

  if (remainingQuantity > 1) {
    information.appendChild(
      createElement('small', '', `${remainingQuantity} disponibles`)
    );
  } else if (remainingQuantity === 0) {
    information.appendChild(createElement('small', '', 'Regalo completado'));
  }

  const button = createElement(
    'button',
    'registry-card__add',
    remainingQuantity === 0 ? 'Completado' : 'Agregar'
  );
  button.type = 'button';
  button.disabled = remainingQuantity === 0;
  button.addEventListener('click', () => addCompleteGift(gift));

  controls.append(information, button);
  return controls;
}

function createContributionProgress(gift) {
  const goal = getGiftGoalCents(gift);
  const funded = getGiftFundedCents(gift);
  const remaining = getGiftRemainingCents(gift);
  const percent = getGiftProgressPercent(gift);

  const progress = createElement('div', 'registry-progress');
  const header = createElement('div', 'registry-progress__header');
  header.append(
    createElement('span', '', `${percent}% reunido`),
    createElement('strong', '', formatMoney(goal))
  );

  const track = createElement('div', 'registry-progress__track');
  track.setAttribute('role', 'progressbar');
  track.setAttribute('aria-label', `Progreso de ${gift.name}`);
  track.setAttribute('aria-valuemin', '0');
  track.setAttribute('aria-valuemax', '100');
  track.setAttribute('aria-valuenow', String(percent));

  const fill = createElement('span', 'registry-progress__fill');
  fill.style.width = `${percent}%`;
  track.appendChild(fill);

  const detail = createElement(
    'p',
    'registry-progress__detail',
    remaining > 0
      ? `${formatMoney(funded)} aportados · faltan ${formatMoney(remaining)}`
      : 'Meta completada. Gracias por hacerlo posible.'
  );

  progress.append(header, track, detail);
  return progress;
}

function createContributionControls(gift) {
  const wrapper = createElement('div', 'registry-contribution');
  const serverRemaining = getGiftRemainingCents(gift);
  const cartContribution = getContributionInCart(gift.id);
  const availableToAdd = Math.max(0, serverRemaining - cartContribution);

  const label = createElement('label', 'registry-contribution__field');
  label.appendChild(createElement('span', '', 'Tu aportación'));

  const inputWrapper = createElement('div', 'registry-amount-input');
  inputWrapper.appendChild(createElement('span', '', '$'));

  const input = document.createElement('input');
  input.type = 'number';
  input.min = '100';
  input.step = '100';
  input.value = '100';
  input.max = String(Math.floor(availableToAdd / 100));
  input.inputMode = 'numeric';
  input.setAttribute('aria-label', `Aportación para ${gift.name}`);
  input.disabled = availableToAdd < 10000;

  inputWrapper.appendChild(input);
  label.appendChild(inputWrapper);

  const button = createElement(
    'button',
    'registry-card__add registry-card__add--wide',
    availableToAdd < 10000 ? 'Meta completada' : 'Agregar aportación'
  );
  button.type = 'button';
  button.disabled = availableToAdd < 10000;
  button.addEventListener('click', () => {
    const amountPesos = validateContribution(input.value);

    if (!amountPesos) {
      showToast('La aportación debe ser un múltiplo de $100.');
      input.focus();
      return;
    }

    if (amountPesos * 100 > availableToAdd) {
      showToast(`Para esta meta puedes agregar hasta ${formatMoney(availableToAdd)}.`);
      input.focus();
      return;
    }

    addContribution(gift, amountPesos * 100, 'contribution');
  });

  wrapper.append(createContributionProgress(gift), label, button);
  return wrapper;
}

function createGiftCard(gift) {
  const card = createElement('article', 'registry-card');
  if (gift.mode === 'Colaborativo') {
    card.classList.add('registry-card--collaborative');
    if (getGiftRemainingCents(gift) === 0) card.classList.add('is-completed');
  } else if (getGiftRemainingQuantity(gift) === 0) {
    card.classList.add('is-completed');
  }

  const body = createElement('div', 'registry-card__body');
  const title = createElement('h3', 'registry-card__title', gift.name);
  const description = createElement('p', 'registry-card__description', gift.description || '');

  body.append(createCardLabels(gift), title, description);

  if (gift.mode === 'Colaborativo') {
    body.appendChild(createContributionControls(gift));
  } else {
    body.appendChild(createCompleteControls(gift));
  }

  card.append(createGiftMedia(gift), body);
  return card;
}

function createFreeContributionView(gift) {
  const panel = createElement('article', 'registry-free');

  const illustration = createElement('div', 'registry-free__illustration');
  const illustrationImage = document.createElement('img');
  illustrationImage.src = 'images/aportacion-libre.webp';
  illustrationImage.alt = '';
  illustrationImage.loading = 'eager';
  illustrationImage.decoding = 'async';
  illustration.appendChild(illustrationImage);

  const copy = createElement('div', 'registry-free__copy');
  copy.append(
    createElement('p', 'eyebrow', 'Gracias por acompañarnos'),
    createElement('h3', '', 'Un detalle elegido por ti'),
    createElement(
      'p',
      '',
      gift?.description || 'Elige una aportación en múltiplos de $100 para acompañarnos.'
    )
  );

  const form = createElement('div', 'registry-free__form');
  const label = createElement('label', 'registry-contribution__field');
  label.appendChild(createElement('span', '', 'Monto de la aportación'));

  const inputWrapper = createElement('div', 'registry-amount-input registry-amount-input--large');
  inputWrapper.appendChild(createElement('span', '', '$'));

  const input = document.createElement('input');
  input.type = 'number';
  input.min = '100';
  input.step = '100';
  input.value = '100';
  input.inputMode = 'numeric';
  input.setAttribute('aria-label', 'Monto de aportación libre');

  inputWrapper.appendChild(input);
  label.appendChild(inputWrapper);

  const button = createElement('button', 'registry-card__add registry-card__add--wide', 'Agregar al carrito');
  button.type = 'button';
  button.addEventListener('click', () => {
    const amountPesos = validateContribution(input.value);

    if (!amountPesos) {
      showToast('La aportación debe ser un múltiplo de $100.');
      input.focus();
      return;
    }

    addContribution(gift, amountPesos * 100, 'free');
  });

  form.append(label, button, createElement('small', '', 'Monto mínimo: $100 MXN'));
  panel.append(illustration, copy, form);
  return panel;
}

function validateContribution(value) {
  const amount = Number(value);
  return Number.isInteger(amount) && amount >= 100 && amount % 100 === 0
    ? amount
    : null;
}

function renderActiveView() {
  const definition = VIEW_DEFINITIONS[activeView] || VIEW_DEFINITIONS.experiencias;
  const matchingGifts = allGifts
    .filter(definition.matches)
    .filter((gift) => activeView === 'libre' || giftMatchesMode(gift))
    .sort((a, b) => a.display_order - b.display_order);

  viewEyebrow.textContent = definition.eyebrow;
  viewTitle.textContent = definition.title;
  viewDescription.textContent = definition.description;
  catalogToolbar.hidden = activeView === 'libre';
  giftCatalog.replaceChildren();

  if (activeView === 'libre') {
    giftCatalog.className = 'registry-results registry-results--single';
    giftCatalog.appendChild(createFreeContributionView(matchingGifts[0]));
    return;
  }

  giftCatalog.className = 'registry-results';

  if (matchingGifts.length === 0) {
    const empty = createElement('div', 'registry-empty');
    empty.append(
      createElement('h3', '', 'No hay regalos con este filtro'),
      createElement('p', '', 'Elige “Todos” o “Completos” para ver las demás opciones de esta sección.')
    );
    giftCatalog.appendChild(empty);
    return;
  }

  const fragment = document.createDocumentFragment();
  matchingGifts.forEach((gift) => fragment.appendChild(createGiftCard(gift)));
  giftCatalog.appendChild(fragment);
}

function setActiveView(viewId) {
  if (!VIEW_DEFINITIONS[viewId]) return;

  activeView = viewId;

  document.querySelectorAll('.registry-nav__item').forEach((button) => {
    const isActive = button.dataset.view === activeView;
    button.classList.toggle('is-active', isActive);
    button.setAttribute('aria-pressed', String(isActive));
  });

  updateModeFilterButtons();

  renderActiveView();

  if (window.innerWidth <= 820) {
    document.querySelector('.registry-main')?.scrollIntoView({ behavior: 'smooth' });
  }
}

function setActiveMode(mode) {
  if (!['all', 'Completo', 'Colaborativo'].includes(mode)) return;
  activeMode = mode;
  updateModeFilterButtons();
  renderActiveView();
}

function updateModeFilterButtons() {
  modeFilters.querySelectorAll('[data-mode]').forEach((button) => {
    const isActive = button.dataset.mode === activeMode;
    button.classList.toggle('is-active', isActive);
    button.setAttribute('aria-pressed', String(isActive));
  });
}

function updateViewCounts() {
  Object.entries(VIEW_DEFINITIONS).forEach(([viewId, definition]) => {
    const count = allGifts.filter(definition.matches).length;
    const counter = document.querySelector(`[data-view-count="${viewId}"]`);
    if (counter) counter.textContent = count;
  });
}

function addCompleteGift(gift) {
  const key = `complete:${gift.id}`;
  const existing = cart.find((item) => item.key === key);
  const remainingQuantity = getGiftRemainingQuantity(gift);

  if (remainingQuantity === 0) {
    showToast(`${gift.name} ya fue completado.`);
    return;
  }

  if (existing) {
    const maximum = remainingQuantity;

    if (existing.quantity >= maximum) {
      showToast(`Ya agregaste la cantidad máxima de ${gift.name}.`);
      return;
    }

    existing.quantity += 1;
  } else {
    cart.push({
      key,
      giftId: gift.id,
      name: gift.name,
      kind: 'complete',
      unitPriceCents: gift.unit_price_cents,
      quantity: 1,
      maximumQuantity: remainingQuantity
    });
  }

  finishCartChange(`${gift.name} se agregó al carrito.`);
}

function addContribution(gift, amountCents, kind) {
  const giftId = gift?.id || 'aportacion-libre';
  const name = kind === 'free' ? 'Aportación libre' : gift.name;
  const key = `${kind}:${giftId}`;
  const existing = cart.find((item) => item.key === key);

  if (existing) {
    existing.amountCents += amountCents;
  } else {
    cart.push({
      key,
      giftId,
      name,
      kind,
      amountCents,
      quantity: 1
    });
  }

  finishCartChange(`${name} se agregó al carrito.`);
}

function finishCartChange(message) {
  saveCart();
  renderCart();
  if (allGifts.length > 0) renderActiveView();
  showToast(message);
}

function getItemSubtotal(item) {
  return item.kind === 'complete'
    ? item.unitPriceCents * item.quantity
    : item.amountCents;
}

function getCartTotal() {
  return cart.reduce((total, item) => total + getItemSubtotal(item), 0);
}

function getCartUnitCount() {
  return cart.reduce(
    (total, item) => total + (item.kind === 'complete' ? item.quantity : 1),
    0
  );
}

function changeCompleteQuantity(item, difference) {
  item.quantity = Math.min(
    item.maximumQuantity,
    Math.max(1, item.quantity + difference)
  );
  saveCart();
  renderCart();
}

function removeCartItem(key) {
  cart = cart.filter((item) => item.key !== key);
  saveCart();
  renderCart();
  if (allGifts.length > 0) renderActiveView();
}

function createCartItem(item) {
  const article = createElement('article', 'registry-cart-item');
  const copy = createElement('div', 'registry-cart-item__copy');
  copy.append(
    createElement('h3', '', item.name),
    createElement(
      'p',
      '',
      item.kind === 'complete'
        ? `${formatMoney(item.unitPriceCents)} por unidad`
        : item.kind === 'free'
          ? 'Aportación libre'
          : 'Aportación cooperativa'
    )
  );

  const price = createElement('strong', 'registry-cart-item__price', formatMoney(getItemSubtotal(item)));
  article.append(copy, price);

  const actions = createElement('div', 'registry-cart-item__actions');

  if (item.kind === 'complete') {
    const quantity = createElement('div', 'registry-quantity');
    const decrease = createElement('button', '', '−');
    decrease.type = 'button';
    decrease.setAttribute('aria-label', `Disminuir cantidad de ${item.name}`);
    decrease.addEventListener('click', () => changeCompleteQuantity(item, -1));

    const value = createElement('span', '', item.quantity);

    const increase = createElement('button', '', '+');
    increase.type = 'button';
    increase.setAttribute('aria-label', `Aumentar cantidad de ${item.name}`);
    increase.disabled = item.quantity >= item.maximumQuantity;
    increase.addEventListener('click', () => changeCompleteQuantity(item, 1));

    quantity.append(decrease, value, increase);
    actions.appendChild(quantity);
  }

  const remove = createElement('button', 'registry-cart-item__remove', 'Quitar');
  remove.type = 'button';
  remove.addEventListener('click', () => removeCartItem(item.key));
  actions.appendChild(remove);
  article.appendChild(actions);

  return article;
}

function renderCart() {
  const unitCount = getCartUnitCount();
  cartCount.textContent = unitCount;
  cartCount.setAttribute('aria-label', `${unitCount} artículos`);
  cartTotal.textContent = `${formatMoney(getCartTotal())} MXN`;
  checkoutButton.disabled = cart.length === 0 || checkoutInProgress;
  cartItems.replaceChildren();

  if (cart.length === 0) {
    const empty = createElement('div', 'registry-cart__empty');
    empty.append(
      createElement('span', '', '♡'),
      createElement('h3', '', 'Tu carrito está vacío'),
      createElement('p', '', 'Elige una experiencia, un regalo o una aportación para comenzar.')
    );
    cartItems.appendChild(empty);
    return;
  }

  const fragment = document.createDocumentFragment();
  cart.forEach((item) => fragment.appendChild(createCartItem(item)));
  cartItems.appendChild(fragment);
}

function openCart() {
  cartBackdrop.hidden = false;
  cartDrawer.classList.add('is-open');
  cartDrawer.setAttribute('aria-hidden', 'false');
  document.body.classList.add('registry-cart-open');
  closeCartButton.focus();
}

function closeCart() {
  cartDrawer.classList.remove('is-open');
  cartDrawer.setAttribute('aria-hidden', 'true');
  document.body.classList.remove('registry-cart-open');

  window.setTimeout(() => {
    cartBackdrop.hidden = true;
  }, 250);
}

function showToast(message) {
  window.clearTimeout(toastTimeout);
  registryToast.textContent = message;
  registryToast.hidden = false;
  registryToast.classList.add('is-visible');

  toastTimeout = window.setTimeout(() => {
    registryToast.classList.remove('is-visible');
    window.setTimeout(() => {
      registryToast.hidden = true;
    }, 200);
  }, 2600);
}

function getPaymentReturn() {
  const parameters = new URLSearchParams(window.location.search);
  const expectedState = parameters.get('pago');
  const orderToken = parameters.get('orden');

  if (!expectedState || !orderToken) return null;
  return { expectedState, orderToken };
}

function wait(milliseconds) {
  return new Promise((resolve) => window.setTimeout(resolve, milliseconds));
}

function openPaymentResult() {
  paymentResult.hidden = false;
  document.body.classList.add('registry-payment-open');
  paymentResultCard.focus({ preventScroll: true });
}

function closePaymentResult() {
  paymentResult.hidden = true;
  document.body.classList.remove('registry-payment-open');
}

function setPaymentResult({ state, eyebrow, title, message, summary = '' }) {
  paymentResult.dataset.state = state;
  paymentResultIcon.textContent = state === 'approved'
    ? '✓'
    : state === 'pending'
      ? '…'
      : state === 'failed'
        ? '×'
        : '!';
  paymentResultEyebrow.textContent = eyebrow;
  paymentResultTitle.textContent = title;
  paymentResultMessage.textContent = message;
  paymentResultSummary.textContent = summary;
  paymentResultSummary.hidden = !summary;
}

async function requestOrderStatus(orderToken) {
  const response = await fetch(
    `${ORDER_STATUS_API_URL}?token=${encodeURIComponent(orderToken)}`,
    { cache: 'no-store' }
  );
  const data = await response.json().catch(() => ({}));

  if (!response.ok || !data.ok || !data.order) {
    throw new Error(data.message || 'No fue posible verificar el pago.');
  }

  return data.order;
}

function describeOrder(order) {
  const names = Array.isArray(order.items)
    ? order.items.map((item) => item.name).filter(Boolean)
    : [];
  const itemText = names.length === 0
    ? 'tu regalo'
    : names.length === 1
      ? names[0]
      : `${names.slice(0, 2).join(' y ')}${names.length > 2 ? ` y ${names.length - 2} más` : ''}`;

  return `${formatMoney(order.totalAmountCents)} MXN · ${itemText}`;
}

async function handlePaymentReturn(paymentReturn) {
  openPaymentResult();
  setPaymentResult({
    state: 'checking',
    eyebrow: 'Verificando tu regalo',
    title: 'Un momento, por favor',
    message: 'Estamos consultando el estado real del pago con nuestra mesa de regalos.'
  });

  try {
    let order;

    // Mercado Pago puede regresar al sitio unos segundos antes de que llegue el
    // webhook. Si esperaba un pago aprobado, damos tiempo a que ambos coincidan.
    for (let attempt = 0; attempt < 5; attempt += 1) {
      order = await requestOrderStatus(paymentReturn.orderToken);
      if (order.status === 'approved' || paymentReturn.expectedState !== 'aprobado') break;
      await wait(1400 + attempt * 500);
    }

    if (order.status === 'approved') {
      cart = [];
      saveCart();
      renderCart();
      setPaymentResult({
        state: 'approved',
        eyebrow: 'Pago confirmado',
        title: '¡Gracias por acompañarnos!',
        message: 'Recibimos tu regalo correctamente. Tu detalle ya forma parte de nuestra nueva etapa.',
        summary: describeOrder(order)
      });
      await loadGiftCatalog(false);
    } else if (['pending', 'authorized', 'in_process'].includes(order.status)) {
      setPaymentResult({
        state: 'pending',
        eyebrow: 'Pago en proceso',
        title: 'Estamos esperando la confirmación',
        message: 'Mercado Pago todavía está procesando el pago. Conservaremos tu carrito hasta recibir la confirmación.',
        summary: describeOrder(order)
      });
    } else {
      setPaymentResult({
        state: 'failed',
        eyebrow: 'Pago no completado',
        title: 'Tu carrito sigue disponible',
        message: 'No se registró un pago aprobado. Puedes revisar tu selección e intentarlo nuevamente.',
        summary: describeOrder(order)
      });
    }

    window.history.replaceState({}, document.title, `${window.location.pathname}${window.location.hash}`);
  } catch (error) {
    console.error('No se pudo verificar el pedido:', error);
    setPaymentResult({
      state: 'error',
      eyebrow: 'No pudimos verificarlo',
      title: 'Tu carrito permanece intacto',
      message: 'Hubo un problema al consultar el estado del pago. Recarga esta página en unos momentos para intentarlo otra vez.'
    });
  }
}

function hasSeenTour() {
  try {
    return localStorage.getItem(TOUR_STORAGE_KEY) === 'true';
  } catch {
    return false;
  }
}

function rememberTour() {
  try {
    localStorage.setItem(TOUR_STORAGE_KEY, 'true');
  } catch {
    // El recorrido puede cerrarse aunque no sea posible guardar la preferencia.
  }
}

function positionTourCard(step) {
  const target = step.target ? document.querySelector(step.target) : null;
  const viewportPadding = 18;
  const spacing = 18;

  tourCard.classList.toggle('is-centered', !target);
  tourFocus.hidden = !target;

  if (!target) {
    tourCard.style.left = '50%';
    tourCard.style.top = '50%';
    tourCard.style.transform = 'translate(-50%, -50%)';
    return;
  }

  const targetRect = target.getBoundingClientRect();
  const focusPadding = 8;
  tourFocus.style.left = `${Math.max(4, targetRect.left - focusPadding)}px`;
  tourFocus.style.top = `${Math.max(4, targetRect.top - focusPadding)}px`;
  tourFocus.style.width = `${Math.min(window.innerWidth - 8, targetRect.width + focusPadding * 2)}px`;
  tourFocus.style.height = `${Math.min(window.innerHeight - 8, targetRect.height + focusPadding * 2)}px`;

  tourCard.style.transform = 'none';
  const cardRect = tourCard.getBoundingClientRect();
  let left;
  let top;

  if (window.innerWidth <= 720) {
    left = viewportPadding;
    top = targetRect.bottom + spacing;

    if (top + cardRect.height > window.innerHeight - viewportPadding) {
      top = Math.max(viewportPadding, window.innerHeight - cardRect.height - viewportPadding);
    }
  } else if (targetRect.right + spacing + cardRect.width <= window.innerWidth - viewportPadding) {
    left = targetRect.right + spacing;
    top = targetRect.top + (targetRect.height - cardRect.height) / 2;
  } else if (targetRect.left - spacing - cardRect.width >= viewportPadding) {
    left = targetRect.left - spacing - cardRect.width;
    top = targetRect.top + (targetRect.height - cardRect.height) / 2;
  } else {
    left = Math.min(
      Math.max(viewportPadding, targetRect.left),
      window.innerWidth - cardRect.width - viewportPadding
    );
    top = targetRect.bottom + spacing;
  }

  left = Math.min(
    Math.max(viewportPadding, left),
    window.innerWidth - cardRect.width - viewportPadding
  );
  top = Math.min(
    Math.max(viewportPadding, top),
    window.innerHeight - cardRect.height - viewportPadding
  );

  tourCard.style.left = `${left}px`;
  tourCard.style.top = `${top}px`;
}

function renderTourStep() {
  const step = TOUR_STEPS[activeTourStep];
  const target = step.target ? document.querySelector(step.target) : null;

  tourStep.textContent = `${activeTourStep + 1} de ${TOUR_STEPS.length}`;
  tourEyebrow.textContent = step.eyebrow;
  tourTitle.textContent = step.title;
  tourText.textContent = step.text;
  tourLegend.hidden = !step.showLegend;
  previousTourButton.hidden = activeTourStep === 0;
  nextTourButton.textContent =
    activeTourStep === TOUR_STEPS.length - 1 ? 'Entendido' : 'Siguiente';

  window.clearTimeout(tourPositionTimeout);

  if (target) {
    target.scrollIntoView({ behavior: 'smooth', block: 'center', inline: 'nearest' });
    tourPositionTimeout = window.setTimeout(() => positionTourCard(step), 380);
  } else {
    positionTourCard(step);
  }

  tourCard.focus({ preventScroll: true });
}

function openTour(force = false) {
  if (!allGifts.length || (!force && hasSeenTour())) return;

  setActiveView('experiencias');
  setActiveMode('Colaborativo');
  activeTourStep = 0;
  registryTour.hidden = false;
  document.body.classList.add('registry-tour-open');
  renderTourStep();
}

function closeTour(shouldRemember = true) {
  window.clearTimeout(tourPositionTimeout);
  registryTour.hidden = true;
  document.body.classList.remove('registry-tour-open');
  if (shouldRemember) rememberTour();
  startTourButton.focus({ preventScroll: true });
}

function goToNextTourStep() {
  if (activeTourStep >= TOUR_STEPS.length - 1) {
    closeTour(true);
    return;
  }

  activeTourStep += 1;
  renderTourStep();
}

function goToPreviousTourStep() {
  if (activeTourStep === 0) return;
  activeTourStep -= 1;
  renderTourStep();
}

function buildCheckoutPayload() {
  return {
    guestName: guestNameInput.value.trim(),
    dedication: dedicationInput.value.trim(),
    items: cart.map((item) => {
      const checkoutItem = {
        giftId: item.giftId,
        type: item.kind,
        quantity: item.kind === 'complete' ? item.quantity : 1
      };

      if (item.kind !== 'complete') {
        checkoutItem.contributionCents = item.amountCents;
      }

      return checkoutItem;
    })
  };
}

function showCheckoutError(message) {
  checkoutError.textContent = message;
  checkoutError.hidden = !message;
}

async function startCheckout() {
  const guestName = guestNameInput.value.trim();
  const dedication = dedicationInput.value.trim();

  showCheckoutError('');

  if (!guestName) {
    showCheckoutError('Escribe de parte de quién es el regalo.');
    guestNameInput.focus();
    return;
  }

  if (guestName.length > 100 || dedication.length > 500) {
    showCheckoutError('Revisa la longitud del nombre o del mensaje.');
    return;
  }

  if (cart.length === 0 || checkoutInProgress) return;

  checkoutInProgress = true;
  checkoutButton.textContent = 'Preparando pago…';
  checkoutButton.setAttribute('aria-busy', 'true');
  renderCart();

  try {
    const response = await fetch(CHECKOUT_API_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(buildCheckoutPayload())
    });

    const data = await response.json().catch(() => ({}));

    if (!response.ok || !data.ok || !data.checkoutUrl) {
      throw new Error(data.message || 'No fue posible preparar el pago.');
    }

    window.location.assign(data.checkoutUrl);
  } catch (error) {
    console.error('No se pudo iniciar el pago:', error);
    showCheckoutError(
      error.message || 'No fue posible preparar el pago. Intenta nuevamente.'
    );
    checkoutInProgress = false;
    checkoutButton.textContent = 'Continuar con Mercado Pago';
    checkoutButton.removeAttribute('aria-busy');
    renderCart();
  }
}

async function loadGiftCatalog(allowTour = true) {
  try {
    const response = await fetch(GIFTS_API_URL);

    if (!response.ok) {
      throw new Error(`Error HTTP ${response.status}`);
    }

    const data = await response.json();

    if (!data.ok || !Array.isArray(data.gifts)) {
      throw new Error('La respuesta no contiene una lista válida');
    }

    allGifts = data.gifts;
    updateViewCounts();
    renderActiveView();
    giftCatalogStatus.hidden = true;

    if (allowTour) window.setTimeout(() => openTour(false), 650);
  } catch (error) {
    console.error('No se pudo cargar la mesa de regalos:', error);
    giftCatalogStatus.hidden = false;
    giftCatalogStatus.textContent =
      'No fue posible cargar la mesa de regalos. Intenta nuevamente en unos minutos.';
  }
}

registryNavigation.addEventListener('click', (event) => {
  const button = event.target.closest('[data-view]');
  if (button) setActiveView(button.dataset.view);
});

modeFilters.addEventListener('click', (event) => {
  const button = event.target.closest('[data-mode]');
  if (button) setActiveMode(button.dataset.mode);
});

openCartButton.addEventListener('click', openCart);
closeCartButton.addEventListener('click', closeCart);
cartBackdrop.addEventListener('click', closeCart);

document.addEventListener('keydown', (event) => {
  if (event.key === 'Escape' && !paymentResult.hidden) {
    closePaymentResult();
  } else if (event.key === 'Escape' && cartDrawer.classList.contains('is-open')) {
    closeCart();
  } else if (event.key === 'Escape' && !registryTour.hidden) {
    closeTour(true);
  }
});

startTourButton.addEventListener('click', () => openTour(true));
skipTourButton.addEventListener('click', () => closeTour(true));
previousTourButton.addEventListener('click', goToPreviousTourStep);
nextTourButton.addEventListener('click', goToNextTourStep);

window.addEventListener('resize', () => {
  if (!registryTour.hidden) positionTourCard(TOUR_STEPS[activeTourStep]);
});

checkoutButton.addEventListener('click', startCheckout);
closePaymentResultButton.addEventListener('click', closePaymentResult);
continueAfterPaymentButton.addEventListener('click', closePaymentResult);

renderCart();
const paymentReturn = getPaymentReturn();
loadGiftCatalog(!paymentReturn);
if (paymentReturn) handlePaymentReturn(paymentReturn);
