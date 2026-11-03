-- Mesa de regalos de Dafne y Armando
-- Paso 1: crear el catálogo central en Cloudflare D1.
-- Los importes se guardan en centavos para evitar errores de redondeo.

CREATE TABLE IF NOT EXISTS gifts (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  category TEXT NOT NULL,
  mode TEXT NOT NULL CHECK (mode IN ('Completo', 'Colaborativo', 'Libre')),
  unit_price_cents INTEGER,
  target_quantity INTEGER,
  image_path TEXT,
  display_order INTEGER NOT NULL UNIQUE,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CHECK (
    (mode = 'Libre' AND unit_price_cents IS NULL AND target_quantity IS NULL)
    OR
    (mode IN ('Completo', 'Colaborativo') AND unit_price_cents > 0 AND target_quantity >= 1)
  )
);

CREATE INDEX IF NOT EXISTS idx_gifts_category_order
  ON gifts(category, display_order);

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('alexa', 'Alexa', 'Asistente inteligente para música y control del hogar.', 'Tecnología', 'Completo', 99900, 1, 'images/regalos/0.webp', 1)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('aspiradora', 'Aspiradora', 'Para mantener nuestros espacios limpios y sin polvo.', 'Hogar', 'Completo', 22900, 1, 'images/regalos/1.webp', 2)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('batidora', 'Batidora', 'Para preparar postres, masas y nuevas recetas.', 'Cocina', 'Completo', 29800, 1, 'images/regalos/2.webp', 3)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cafetera', 'Cafetera', 'Para disfrutar de un buen café cada mañana.', 'Cocina', 'Completo', 39900, 1, 'images/regalos/3.webp', 4)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('casa-de-campana', 'Casa de campaña', 'Para nuestras escapadas a la naturaleza.', 'Aventuras', 'Completo', 52100, 1, 'images/regalos/4.webp', 5)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cesto-organizador', 'Cesto organizador', 'Para mantener nuestros espacios en orden.', 'Hogar', 'Completo', 25900, 1, 'images/regalos/5.webp', 6)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('contenedor-con-colador', 'Contenedor con colador', 'Para lavar, escurrir y conservar alimentos.', 'Cocina', 'Completo', 19800, 3, 'images/regalos/6.webp', 7)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('deshumificador', 'Deshumificador', 'Para reducir la humedad en casa.', 'Hogar', 'Completo', 56200, 1, 'images/regalos/7.webp', 8)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('especiero', 'Especiero', 'Para organizar las especias de nuestras recetas.', 'Cocina', 'Completo', 26900, 1, 'images/regalos/8.webp', 9)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('estante', 'Estante', 'Espacio adicional para organizar y decorar.', 'Hogar', 'Completo', 24900, 4, 'images/regalos/9.webp', 10)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('hidrolavadora', 'Hidrolavadora', 'Para limpiar patios y superficies exteriores.', 'Hogar', 'Completo', 94900, 1, 'images/regalos/10.webp', 11)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('humificador-aromaterapia', 'Humificador aromaterapia', 'Para crear un ambiente relajante y aromático.', 'Descanso y bienestar', 'Completo', 29400, 1, 'images/regalos/11.webp', 12)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('linterna-camping', 'Linterna camping', 'Para iluminar nuestras noches de campamento.', 'Aventuras', 'Completo', 27400, 1, 'images/regalos/12.webp', 13)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('linterna-multifuncional', 'Linterna multifuncional', 'Para viajes, excursiones y emergencias.', 'Aventuras', 'Completo', 43900, 1, 'images/regalos/13.webp', 14)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('frazada', 'Frazada', 'Para disfrutar de tardes acogedoras en casa.', 'Hogar', 'Completo', 24900, 1, 'images/regalos/14.webp', 15)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('manteles-individuales', 'Manteles individuales', 'Para decorar y proteger nuestra mesa.', 'Hogar', 'Completo', 26300, 4, 'images/regalos/15.webp', 16)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('maquina-de-coser', 'Máquina de coser', 'Para arreglos de ropa y proyectos de costura.', 'Hogar', 'Colaborativo', 110000, 1, 'images/regalos/16.webp', 17)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('marco-de-fotos', 'Marco de fotos', 'Para exhibir nuestros recuerdos favoritos.', 'Hogar', 'Completo', 29700, 12, 'images/regalos/17.webp', 18)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('masajeador', 'Masajeador', 'Para relajarnos después de un largo día.', 'Descanso y bienestar', 'Completo', 35900, 1, 'images/regalos/18.webp', 19)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('mochila-hielera', 'Mochila hielera', 'Para llevar alimentos y bebidas frescos de paseo.', 'Aventuras', 'Completo', 22200, 1, 'images/regalos/19.webp', 20)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('papel-fotografico', 'Papel fotografico', 'Para imprimir nuestros mejores recuerdos.', 'Tecnología', 'Completo', 37800, 1, 'images/regalos/20.webp', 21)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('parrilla-portatil', 'Parrilla portatil', 'Para cocinar al aire libre en nuestras escapadas.', 'Aventuras', 'Completo', 29800, 1, 'images/regalos/21.webp', 22)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('pila-portatil', 'Pila portatil', 'Para cargar dispositivos durante los viajes.', 'Tecnología', 'Completo', 25300, 1, 'images/regalos/22.webp', 23)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('plancha-de-cabello', 'Plancha de cabello', 'Para facilitar nuestro arreglo personal.', 'Descanso y bienestar', 'Colaborativo', 140000, 1, 'images/regalos/23.webp', 24)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('plancha-vertical', 'Plancha vertical', 'Para mantener la ropa libre de arrugas.', 'Hogar', 'Completo', 81800, 1, 'images/regalos/24.webp', 25)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('proyector', 'Proyector', 'Para disfrutar de noches de cine en casa.', 'Tecnología', 'Completo', 79900, 1, 'images/regalos/25.webp', 26)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('rack', 'Rack', 'Para organizar y aprovechar mejor el espacio.', 'Hogar', 'Completo', 67900, 1, 'images/regalos/26.webp', 27)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('recipientes-hermeticos', 'Recipientes hermeticos', 'Para conservar los alimentos frescos y ordenados.', 'Cocina', 'Completo', 25900, 1, 'images/regalos/27.webp', 28)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('ropa-termica', 'Ropa termica', 'Para abrigarnos durante viajes a lugares fríos.', 'Equipaje', 'Completo', 35900, 1, 'images/regalos/28.webp', 29)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('sandwichera', 'Sandwichera', 'Para preparar desayunos y comidas rápidas.', 'Cocina', 'Completo', 23900, 1, 'images/regalos/29.webp', 30)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('sellador-al-vacio', 'Sellador al vacio', 'Para conservar los alimentos por más tiempo.', 'Cocina', 'Completo', 27700, 1, 'images/regalos/30.webp', 31)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('silla-de-camping', 'Silla de camping', 'Para descansar durante nuestras aventuras.', 'Aventuras', 'Completo', 26900, 1, 'images/regalos/31.webp', 32)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tapete-picnic', 'Tapete picnic', 'Para disfrutar de comidas al aire libre.', 'Aventuras', 'Completo', 17800, 1, 'images/regalos/32.webp', 33)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('toallas-de-bano', 'Toallas de baño', 'Para nuestra rutina diaria en casa.', 'Hogar', 'Completo', 24900, 2, 'images/regalos/33.webp', 34)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('waflera', 'Waflera', 'Para preparar waffles en nuestros desayunos.', 'Cocina', 'Completo', 50300, 1, 'images/regalos/34.webp', 35)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('zapatero-percero', 'Zapatero percero', 'Para organizar zapatos, abrigos y accesorios.', 'Hogar', 'Completo', 15500, 1, 'images/regalos/35.webp', 36)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('nuestros-vuelos', 'Nuestros vuelos', 'Ida GDL–Tuxtla y regreso Villahermosa–CDMX, para dos.', 'Viajes y transporte', 'Colaborativo', 1180000, 1, 'images/regalos/36.webp', 37)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('traslado-a-san-cristobal', 'Traslado a San Cristóbal', 'Del aeropuerto de Tuxtla al hotel, para dos.', 'Viajes y transporte', 'Colaborativo', 140000, 1, 'images/regalos/37.webp', 38)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('camino-a-palenque', 'Camino a Palenque', 'Autobuses vía Villahermosa, para dos.', 'Viajes y transporte', 'Colaborativo', 190000, 1, 'images/regalos/38.webp', 39)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('traslado-al-aeropuerto-de-regreso', 'Traslado al aeropuerto de regreso', 'De Palenque al aeropuerto de Villahermosa, para dos.', 'Viajes y transporte', 'Completo', 84000, 1, 'images/regalos/39.webp', 40)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('una-noche-en-san-cristobal', 'Una noche en San Cristóbal', 'Hotel Sombra del Agua, habitación para dos.', 'Hospedaje', 'Colaborativo', 250000, 4, 'images/regalos/40.webp', 41)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('una-noche-en-palenque', 'Una noche en Palenque', 'Hotel Chan-Kah, habitación para dos.', 'Hospedaje', 'Colaborativo', 280000, 3, 'images/regalos/41.webp', 42)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tour-por-el-canon-del-sumidero', 'Tour por el Cañón del Sumidero', 'Lancha, miradores y Chiapa de Corzo; por persona.', 'Aventuras', 'Completo', 75000, 2, 'images/regalos/42.webp', 43)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tour-chamula-y-zinacantan', 'Tour Chamula y Zinacantán', 'Visita guiada a los pueblos; por persona.', 'Aventuras', 'Completo', 40000, 2, 'images/regalos/43.webp', 44)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tour-el-chiflon-y-montebello', 'Tour El Chiflón y Montebello', 'Cascadas y lagunas; por persona.', 'Aventuras', 'Completo', 75000, 2, 'images/regalos/44.webp', 45)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tour-palenque-y-roberto-barrios', 'Tour Palenque y Roberto Barrios', 'Ruinas mayas y cascadas; por persona.', 'Aventuras', 'Completo', 95000, 2, 'images/regalos/45.webp', 46)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('desayuno-en-las-lolas', 'Desayuno en Las Lolas', 'Chilaquiles y café para dos.', 'Comidas y bebidas', 'Completo', 41000, 1, 'images/regalos/46.webp', 47)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('desayuno-en-sarajevo-cafe-jardin', 'Desayuno en Sarajevo Café Jardín', 'Huevos y bebidas para dos.', 'Comidas y bebidas', 'Completo', 50000, 1, 'images/regalos/47.webp', 48)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('desayuno-en-sombra-del-agua', 'Desayuno en Sombra del Agua', 'Desayuno temprano antes de las cascadas, para dos.', 'Comidas y bebidas', 'Completo', 46000, 1, 'images/regalos/48.webp', 49)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('desayuno-en-casa-lum', 'Desayuno en Casa Lum', 'Huevos Lum y café para dos.', 'Comidas y bebidas', 'Completo', 48000, 1, 'images/regalos/49.webp', 50)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('desayunos-en-chan-kah', 'Desayunos en Chan-Kah', 'Dos desayunos de pareja en Palenque.', 'Comidas y bebidas', 'Completo', 66000, 2, 'images/regalos/50.webp', 51)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('desayuno-en-cafe-jade', 'Desayuno en Café Jade', 'Enmoladas y tascalate para dos.', 'Comidas y bebidas', 'Completo', 42000, 1, 'images/regalos/51.webp', 52)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('comidas-de-viaje-y-aeropuertos', 'Comidas de viaje y aeropuertos', 'Desayuno en GDL y comidas en dos traslados.', 'Comidas y bebidas', 'Colaborativo', 150000, 1, 'images/regalos/52.webp', 53)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('comida-de-bienvenida-en-casa-lum', 'Comida de bienvenida en Casa Lum', 'Platillos y bebidas para dos.', 'Comidas y bebidas', 'Completo', 78000, 1, 'images/regalos/53.webp', 54)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('comida-en-el-campanario', 'Comida en El Campanario', 'Cocina típica en Chiapa de Corzo, para dos.', 'Comidas y bebidas', 'Completo', 65000, 1, 'images/regalos/54.webp', 55)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('almuerzo-en-la-lupe', 'Almuerzo en La Lupe', 'Antojitos chiapanecos para dos.', 'Comidas y bebidas', 'Completo', 42000, 1, 'images/regalos/55.webp', 56)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('comida-en-el-chiflon', 'Comida en El Chiflón', 'Almuerzo junto a las cascadas, para dos.', 'Comidas y bebidas', 'Completo', 60000, 1, 'images/regalos/56.webp', 57)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('comida-durante-el-tour-en-palenque', 'Comida durante el tour en Palenque', 'Almuerzo regional durante la excursión, para dos.', 'Comidas y bebidas', 'Completo', 60000, 1, 'images/regalos/57.webp', 58)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('comida-en-maya-canada', 'Comida en Maya Cañada', 'Enchiladas palencanas y bebidas para dos.', 'Comidas y bebidas', 'Completo', 76000, 1, 'images/regalos/58.webp', 59)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cena-en-las-pichanchas', 'Cena en Las Pichanchas', 'Nuestra primera cena en Chiapas, para dos.', 'Comidas y bebidas', 'Completo', 90000, 1, 'images/regalos/59.webp', 60)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cena-romantica-en-casa-lum', 'Cena romántica en Casa Lum', 'Cena especial con postre para dos.', 'Comidas y bebidas', 'Completo', 97000, 1, 'images/regalos/60.webp', 61)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('clase-de-cocina-chiapaneca', 'Clase de cocina chiapaneca', 'Taller tradicional con cena incluida, para dos.', 'Comidas y bebidas', 'Colaborativo', 230000, 1, 'images/regalos/61.webp', 62)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cena-en-sombra-del-agua', 'Cena en Sombra del Agua', 'Cena en el hotel tras visitar Montebello, para dos.', 'Comidas y bebidas', 'Completo', 70000, 1, 'images/regalos/62.webp', 63)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cena-en-maya-canada', 'Cena en Maya Cañada', 'Platillos regionales y bebidas para dos.', 'Comidas y bebidas', 'Completo', 85000, 1, 'images/regalos/63.webp', 64)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cena-en-don-mucho-s', 'Cena en Don Mucho''s', 'Cena en un entorno selvático, para dos.', 'Comidas y bebidas', 'Completo', 80000, 1, 'images/regalos/64.webp', 65)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cena-especial-de-despedida', 'Cena especial de despedida', 'Menú de cinco tiempos en Chan-Kah, para dos.', 'Comidas y bebidas', 'Colaborativo', 220000, 1, 'images/regalos/65.webp', 66)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('masaje-relajante-en-pareja', 'Masaje relajante en pareja', 'Sesión de spa para ambos en Palenque.', 'Descanso y bienestar', 'Colaborativo', 210000, 1, 'images/regalos/66.webp', 67)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('juego-de-ollas', 'Juego de ollas', 'Para preparar nuestras comidas de todos los días.', 'Cocina', 'Completo', 44000, 1, 'images/regalos/67.webp', 68)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('juego-de-sartenes', 'Juego de sartenes', 'Para cocinar desde desayunos hasta cenas especiales.', 'Cocina', 'Completo', 43900, 1, 'images/regalos/68.webp', 69)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('licuadora', 'Licuadora', 'Para preparar licuados, salsas y bebidas.', 'Cocina', 'Completo', 61100, 1, 'images/regalos/69.webp', 70)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('freidora-de-aire', 'Freidora de aire', 'Para cocinar de forma práctica con menos aceite.', 'Cocina', 'Completo', 99000, 1, 'images/regalos/70.webp', 71)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('olla-de-presion-electrica', 'Olla de presión eléctrica', 'Para preparar guisos y cocinar en menos tiempo.', 'Cocina', 'Completo', 169900, 1, 'images/regalos/71.webp', 72)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('horno-tostador', 'Horno tostador', 'Para hornear y calentar porciones pequeñas.', 'Cocina', 'Completo', 64900, 1, 'images/regalos/72.webp', 73)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tostadora-de-pan', 'Tostadora de pan', 'Para preparar tostadas en nuestros desayunos.', 'Cocina', 'Completo', 55300, 1, 'images/regalos/73.webp', 74)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('hervidor-electrico', 'Hervidor eléctrico', 'Para calentar agua para té y café.', 'Cocina', 'Completo', 35900, 1, 'images/regalos/74.webp', 75)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('procesador-de-alimentos', 'Procesador de alimentos', 'Para picar, mezclar y preparar ingredientes.', 'Cocina', 'Completo', 22146, 1, 'images/regalos/75.webp', 76)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('arrocera', 'Arrocera', 'Para preparar arroz de forma sencilla.', 'Cocina', 'Completo', 36858, 1, 'images/regalos/76.webp', 77)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('bascula-de-cocina', 'Báscula de cocina', 'Para medir ingredientes con precisión.', 'Cocina', 'Completo', 9900, 1, 'images/regalos/77.webp', 78)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('juego-de-cuchillos', 'Juego de cuchillos', 'Para preparar nuestras recetas favoritas.', 'Cocina', 'Completo', 11000, 1, 'images/regalos/78.webp', 79)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tabla-de-picar', 'Tabla de picar', 'Para cortar alimentos de forma cómoda.', 'Cocina', 'Completo', 17500, 1, 'images/regalos/79.webp', 80)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('juego-de-utensilios-de-cocina', 'Juego de utensilios de cocina', 'Para cocinar con los utensilios esenciales.', 'Cocina', 'Completo', 16600, 1, 'images/regalos/80.webp', 81)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('vajilla', 'Vajilla', 'Para compartir comidas en nuestra nueva mesa.', 'Cocina', 'Completo', 36900, 1, 'images/regalos/81.webp', 82)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('juego-de-cubiertos', 'Juego de cubiertos', 'Para completar nuestra mesa de todos los días.', 'Cocina', 'Completo', 35900, 1, 'images/regalos/82.webp', 83)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('juego-de-vasos', 'Juego de vasos', 'Para compartir bebidas en casa.', 'Cocina', 'Completo', 20900, 1, 'images/regalos/83.webp', 84)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('copas-de-vino', 'Copas de vino', 'Para brindar en nuestras cenas especiales.', 'Cocina', 'Completo', 22945, 1, 'images/regalos/84.webp', 85)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('copas-de-champana', 'Copas de champaña', 'Para celebrar los momentos importantes.', 'Cocina', 'Completo', 24500, 1, 'images/regalos/85.webp', 86)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('juego-de-tazas', 'Juego de tazas', 'Para disfrutar de café o té juntos.', 'Cocina', 'Completo', 35520, 1, 'images/regalos/86.webp', 87)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tazones-para-mezclar', 'Tazones para mezclar', 'Para preparar y servir diferentes recetas.', 'Cocina', 'Completo', 15866, 1, 'images/regalos/87.webp', 88)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('refractarios-para-horno', 'Refractarios para horno', 'Para hornear y servir nuestros platillos.', 'Cocina', 'Completo', 18900, 1, 'images/regalos/88.webp', 89)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('charolas-para-hornear', 'Charolas para hornear', 'Para preparar galletas y recetas al horno.', 'Cocina', 'Completo', 17181, 1, 'images/regalos/89.webp', 90)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('moldes-para-reposteria', 'Moldes para repostería', 'Para hornear pasteles y postres caseros.', 'Cocina', 'Completo', 21803, 1, 'images/regalos/90.webp', 91)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('escurridor-de-platos', 'Escurridor de platos', 'Para mantener ordenada la cocina.', 'Cocina', 'Completo', 25900, 1, 'images/regalos/91.webp', 92)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('organizador-de-cubiertos', 'Organizador de cubiertos', 'Para aprovechar mejor los cajones.', 'Cocina', 'Completo', 9834, 1, 'images/regalos/92.webp', 93)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tazas-y-cucharas-medidoras', 'Tazas y cucharas medidoras', 'Para seguir recetas con mayor precisión.', 'Cocina', 'Completo', 9474, 1, 'images/regalos/93.webp', 94)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('jarra-para-agua', 'Jarra para agua', 'Para servir agua y bebidas en la mesa.', 'Cocina', 'Completo', 7900, 1, 'images/regalos/94.webp', 95)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('prensa-francesa', 'Prensa francesa', 'Para preparar café de forma artesanal.', 'Cocina', 'Completo', 19800, 1, 'images/regalos/95.webp', 96)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('dispensador-de-aceite', 'Dispensador de aceite', 'Para cocinar y servir con comodidad.', 'Cocina', 'Completo', 10355, 1, 'images/regalos/96.webp', 97)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('exprimidor-de-citricos', 'Exprimidor de cítricos', 'Para preparar jugos y aderezos frescos.', 'Cocina', 'Completo', 11797, 1, 'images/regalos/97.webp', 98)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('juego-de-sabanas', 'Juego de sábanas', 'Para renovar nuestra cama y descansar cómodos.', 'Hogar', 'Completo', 27900, 1, 'images/regalos/98.webp', 99)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('edredon', 'Edredón', 'Para mantenernos abrigados al dormir.', 'Hogar', 'Completo', 47900, 1, 'images/regalos/99.webp', 100)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('almohadas', 'Almohadas', 'Para descansar mejor cada noche.', 'Hogar', 'Completo', 19800, 1, 'images/regalos/100.webp', 101)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('protector-de-colchon', 'Protector de colchón', 'Para cuidar el colchón por más tiempo.', 'Hogar', 'Completo', 45900, 1, 'images/regalos/101.webp', 102)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cortinas', 'Cortinas', 'Para dar privacidad y comodidad a la casa.', 'Hogar', 'Completo', 25900, 1, 'images/regalos/102.webp', 103)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tapete-de-bano', 'Tapete de baño', 'Para complementar y proteger el baño.', 'Hogar', 'Completo', 11175, 1, 'images/regalos/103.webp', 104)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('alfombra-para-sala', 'Alfombra para sala', 'Para hacer más acogedora nuestra sala.', 'Hogar', 'Completo', 18089, 1, 'images/regalos/104.webp', 105)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tapete-de-entrada', 'Tapete de entrada', 'Para recibir visitas y mantener limpio el piso.', 'Hogar', 'Completo', 10900, 1, 'images/regalos/105.webp', 106)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cesto-para-ropa-sucia', 'Cesto para ropa sucia', 'Para organizar la ropa antes de lavarla.', 'Hogar', 'Completo', 13912, 1, 'images/regalos/106.webp', 107)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tendedero-plegable', 'Tendedero plegable', 'Para secar la ropa sin ocupar mucho espacio.', 'Hogar', 'Completo', 28900, 1, 'images/regalos/107.webp', 108)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('tabla-para-planchar', 'Tabla para planchar', 'Para facilitar el cuidado de la ropa.', 'Hogar', 'Completo', 46851, 1, 'images/regalos/108.webp', 109)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('organizadores-para-closet', 'Organizadores para clóset', 'Para mantener ordenada nuestra ropa.', 'Hogar', 'Completo', 19800, 1, 'images/regalos/109.webp', 110)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('juego-de-ganchos-para-ropa', 'Juego de ganchos para ropa', 'Para aprovechar mejor el espacio del clóset.', 'Hogar', 'Completo', 23907, 1, 'images/regalos/110.webp', 111)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('espejo-de-cuerpo-completo', 'Espejo de cuerpo completo', 'Para complementar nuestra habitación.', 'Hogar', 'Completo', 21900, 1, 'images/regalos/111.webp', 112)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('lampara-de-mesa', 'Lámpara de mesa', 'Para iluminar y decorar nuestros espacios.', 'Hogar', 'Completo', 22350, 1, 'images/regalos/112.webp', 113)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('lampara-de-pie', 'Lámpara de pie', 'Para crear un ambiente acogedor en casa.', 'Hogar', 'Completo', 48208, 1, 'images/regalos/113.webp', 114)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('reloj-de-pared', 'Reloj de pared', 'Para decorar y organizar nuestros horarios.', 'Hogar', 'Completo', 19287, 1, 'images/regalos/114.webp', 115)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('florero', 'Florero', 'Para decorar la casa con flores frescas.', 'Hogar', 'Completo', 9900, 1, 'images/regalos/115.webp', 116)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('macetas-decorativas', 'Macetas decorativas', 'Para llenar de plantas nuestros espacios.', 'Hogar', 'Completo', 27118, 1, 'images/regalos/116.webp', 117)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('juego-de-herramientas', 'Juego de herramientas', 'Para pequeños arreglos en casa.', 'Hogar', 'Completo', 11000, 1, 'images/regalos/117.webp', 118)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('taladro-inalambrico', 'Taladro inalámbrico', 'Para instalar muebles y realizar reparaciones.', 'Hogar', 'Completo', 68500, 1, 'images/regalos/118.webp', 119)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('escalera-plegable', 'Escalera plegable', 'Para alcanzar espacios altos con seguridad.', 'Hogar', 'Completo', 43900, 1, 'images/regalos/119.webp', 120)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('bote-de-basura-de-cocina', 'Bote de basura de cocina', 'Para mantener limpia y ordenada la cocina.', 'Hogar', 'Completo', 17999, 1, 'images/regalos/120.webp', 121)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('dispensador-de-jabon', 'Dispensador de jabón', 'Para organizar mejor el lavabo.', 'Hogar', 'Completo', 12672, 1, 'images/regalos/121.webp', 122)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('organizador-de-bano', 'Organizador de baño', 'Para mantener los productos en su lugar.', 'Hogar', 'Completo', 19839, 1, 'images/regalos/122.webp', 123)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('trapeador-con-cubeta', 'Trapeador con cubeta', 'Para facilitar la limpieza de los pisos.', 'Hogar', 'Completo', 76263, 1, 'images/regalos/123.webp', 124)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('ventilador', 'Ventilador', 'Para estar más cómodos en los días calurosos.', 'Hogar', 'Completo', 59000, 1, 'images/regalos/124.webp', 125)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('purificador-de-aire', 'Purificador de aire', 'Para mejorar la calidad del aire en casa.', 'Hogar', 'Completo', 116300, 1, 'images/regalos/125.webp', 126)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('purificador-de-agua', 'Purificador de agua', 'Para contar con agua filtrada en casa.', 'Hogar', 'Completo', 59900, 1, 'images/regalos/126.webp', 127)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('bocina-bluetooth', 'Bocina Bluetooth', 'Para escuchar música en cualquier habitación.', 'Tecnología', 'Completo', 12998, 1, 'images/regalos/127.webp', 128)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('barra-de-sonido', 'Barra de sonido', 'Para mejorar el sonido de películas y series.', 'Tecnología', 'Completo', 23900, 1, 'images/regalos/128.webp', 129)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('camara-de-seguridad', 'Cámara de seguridad', 'Para vigilar y cuidar nuestro hogar.', 'Tecnología', 'Completo', 26365, 1, 'images/regalos/129.webp', 130)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('focos-inteligentes', 'Focos inteligentes', 'Para ajustar la iluminación de nuestros espacios.', 'Tecnología', 'Completo', 16900, 1, 'images/regalos/130.webp', 131)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('enchufes-inteligentes', 'Enchufes inteligentes', 'Para controlar aparatos desde el celular.', 'Tecnología', 'Completo', 29900, 1, 'images/regalos/131.webp', 132)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cargador-inalambrico', 'Cargador inalámbrico', 'Para cargar nuestros dispositivos cómodamente.', 'Tecnología', 'Completo', 19900, 1, 'images/regalos/132.webp', 133)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('router-wi-fi', 'Router Wi-Fi', 'Para mejorar la conexión a Internet en casa.', 'Tecnología', 'Completo', 46900, 1, 'images/regalos/133.webp', 134)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('impresora-fotografica', 'Impresora fotográfica', 'Para imprimir nuestros recuerdos favoritos.', 'Tecnología', 'Colaborativo', 210000, 1, 'images/regalos/134.webp', 135)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('disco-duro-externo', 'Disco duro externo', 'Para respaldar fotos y archivos importantes.', 'Tecnología', 'Completo', 180100, 1, 'images/regalos/135.webp', 136)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('bolsa-de-dormir', 'Bolsa de dormir', 'Para descansar durante los campamentos.', 'Aventuras', 'Completo', 54709, 1, 'images/regalos/136.webp', 137)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('colchoneta-inflable', 'Colchoneta inflable', 'Para dormir más cómodos al acampar.', 'Aventuras', 'Completo', 24318, 1, 'images/regalos/137.webp', 138)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('hamaca-portatil', 'Hamaca portátil', 'Para relajarnos en nuestras escapadas.', 'Aventuras', 'Completo', 25742, 1, 'images/regalos/138.webp', 139)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('mesa-plegable-de-camping', 'Mesa plegable de camping', 'Para comer y convivir al aire libre.', 'Aventuras', 'Completo', 36083, 1, 'images/regalos/139.webp', 140)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('termo-para-bebidas', 'Termo para bebidas', 'Para llevar café o té a nuestras aventuras.', 'Aventuras', 'Completo', 9718, 1, 'images/regalos/140.webp', 141)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('botella-reutilizable', 'Botella reutilizable', 'Para mantenernos hidratados en cada paseo.', 'Aventuras', 'Completo', 20030, 1, 'images/regalos/141.webp', 142)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('juego-de-utensilios-para-picnic', 'Juego de utensilios para picnic', 'Para disfrutar de comidas fuera de casa.', 'Aventuras', 'Completo', 16696, 1, 'images/regalos/142.webp', 143)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('bastones-de-senderismo', 'Bastones de senderismo', 'Para acompañarnos en rutas y caminatas.', 'Aventuras', 'Completo', 19078, 1, 'images/regalos/143.webp', 144)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('impermeables', 'Impermeables', 'Para explorar incluso cuando llueve.', 'Aventuras', 'Completo', 9820, 1, 'images/regalos/144.webp', 145)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('binoculares', 'Binoculares', 'Para observar paisajes y vida silvestre.', 'Aventuras', 'Completo', 66261, 1, 'images/regalos/145.webp', 146)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('mochila-de-senderismo', 'Mochila de senderismo', 'Para llevar lo necesario en nuestras caminatas.', 'Aventuras', 'Completo', 27264, 1, 'images/regalos/146.webp', 147)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('maleta-de-cabina', 'Maleta de cabina', 'Para nuestras escapadas y viajes cortos.', 'Equipaje', 'Completo', 72500, 1, 'images/regalos/147.webp', 148)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('maleta-grande', 'Maleta grande', 'Para llevar todo lo necesario en viajes largos.', 'Equipaje', 'Completo', 109900, 1, 'images/regalos/148.webp', 149)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('organizadores-de-maleta', 'Organizadores de maleta', 'Para mantener ordenado nuestro equipaje.', 'Equipaje', 'Completo', 22749, 1, 'images/regalos/149.webp', 150)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('neceser-de-viaje', 'Neceser de viaje', 'Para organizar artículos personales al viajar.', 'Equipaje', 'Completo', 9750, 1, 'images/regalos/150.webp', 151)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('etiquetas-para-maletas', 'Etiquetas para maletas', 'Para identificar fácilmente nuestro equipaje.', 'Equipaje', 'Completo', 16046, 1, 'images/regalos/151.webp', 152)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('adaptador-universal-de-viaje', 'Adaptador universal de viaje', 'Para cargar dispositivos en otros países.', 'Equipaje', 'Completo', 24182, 1, 'images/regalos/152.webp', 153)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('almohada-de-viaje', 'Almohada de viaje', 'Para descansar mejor durante los traslados.', 'Equipaje', 'Completo', 9003, 1, 'images/regalos/153.webp', 154)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('candados-para-maleta', 'Candados para maleta', 'Para proteger nuestras pertenencias al viajar.', 'Equipaje', 'Completo', 18915, 1, 'images/regalos/154.webp', 155)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('batas-de-bano', 'Batas de baño', 'Para estar cómodos después de bañarnos.', 'Descanso y bienestar', 'Completo', 20808, 1, 'images/regalos/155.webp', 156)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('pantuflas', 'Pantuflas', 'Para descansar cómodamente en casa.', 'Descanso y bienestar', 'Completo', 11499, 1, 'images/regalos/156.webp', 157)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('secadora-de-cabello', 'Secadora de cabello', 'Para facilitar nuestra rutina de cuidado personal.', 'Descanso y bienestar', 'Completo', 63500, 1, 'images/regalos/157.webp', 158)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('cepillo-de-dientes-electrico', 'Cepillo de dientes eléctrico', 'Para complementar nuestra higiene diaria.', 'Descanso y bienestar', 'Completo', 20258, 1, 'images/regalos/158.webp', 159)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('bascula-personal', 'Báscula personal', 'Para llevar un registro de nuestro peso.', 'Descanso y bienestar', 'Completo', 14900, 1, 'images/regalos/159.webp', 160)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('velas-aromaticas', 'Velas aromáticas', 'Para crear un ambiente tranquilo y acogedor.', 'Descanso y bienestar', 'Completo', 27806, 1, 'images/regalos/160.webp', 161)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('almohada-cervical', 'Almohada cervical', 'Para mayor comodidad al descansar o viajar.', 'Descanso y bienestar', 'Completo', 26900, 1, 'images/regalos/161.webp', 162)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('espejo-de-aumento', 'Espejo de aumento', 'Para facilitar el arreglo y cuidado personal.', 'Descanso y bienestar', 'Completo', 25900, 1, 'images/regalos/162.webp', 163)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO gifts
  (id, name, description, category, mode, unit_price_cents, target_quantity, image_path, display_order)
VALUES
  ('aportacion-libre', 'Aportación libre', 'Elige una aportación en múltiplos de $100 para acompañarnos.', 'Aportación libre', 'Libre', NULL, NULL, NULL, 164)
ON CONFLICT(id) DO UPDATE SET
  name = excluded.name,
  description = excluded.description,
  category = excluded.category,
  mode = excluded.mode,
  unit_price_cents = excluded.unit_price_cents,
  target_quantity = excluded.target_quantity,
  image_path = excluded.image_path,
  display_order = excluded.display_order,
  updated_at = CURRENT_TIMESTAMP;

-- Comprobaciones: deben devolver 164 regalos y una sola aportación libre.
SELECT COUNT(*) AS total_regalos FROM gifts;
SELECT mode, COUNT(*) AS cantidad FROM gifts GROUP BY mode ORDER BY mode;
SELECT id, name, mode, unit_price_cents, target_quantity, image_path
FROM gifts
ORDER BY display_order;
