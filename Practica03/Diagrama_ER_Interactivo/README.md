# Diagrama ER interactivo · db_test_7b

Explorador local del esquema MySQL 8.0.46 verificado contra
`respaldo_111126_1794591103484.sql`.

Paleta visual: `#0B1320`, `#0F2A45`, `#1E4E6A`, `#8FB8C9` y `#F2EFE9`.

## Ejecutar localmente

1. Descomprime el ZIP.
2. Abre una terminal en esta carpeta.
3. Ejecuta `python3 -m http.server 8000`.
4. Abre `http://localhost:8000` en un navegador moderno.

También funciona con cualquier servidor estático local. Se necesita un servidor
porque el navegador no permite que `fetch()` lea `data/schema.json` al abrir
`index.html` directamente como archivo.

## Controles

- Buscar por tabla o columna; filtrar por grupo.
- Rueda del ratón y botones **+ / −** para zoom; arrastrar el lienzo para mover.
- Arrastrar el encabezado de una tabla para cambiar su posición.
- Seleccionar una tabla para ver descripción, conteo del respaldo, campos,
  restricciones e índices; las relaciones conectadas quedan resaltadas.
- Ver en el panel lateral una fila por tabla con su cantidad de registros
  incluida en el respaldo, incluso antes de seleccionar una tabla.
- Pulsar una relación o un enlace en el inspector para seleccionarla.
- **Ajustar**, **Restablecer**, **Mostrar todas**, pausar/reanudar animación y
  controlar la velocidad del flujo.

## Datos y alcance

El esquema incluye **25 tablas, 190 columnas y 33 claves foráneas declaradas**.
Los conteos por tabla se calcularon con las filas `INSERT` incluidas en el
respaldo y no representan una consulta en vivo. Las 25 tablas tienen una sección
de datos en el respaldo; cuando no hay filas `INSERT`, el conteo verificable es
0. El diagrama incluye descripciones editoriales redactadas a partir de los
nombres, tipos y relaciones del esquema. El SQL no contiene `COMMENT` de tabla
ni columna; estas descripciones no son comentarios oficiales ni reglas de
negocio confirmadas.

`data/schema.json` contiene la estructura documentada, los conteos y la huella
SHA-256 del respaldo utilizado. El SQL no se ejecuta y no se necesita una base
de datos para abrir el diagrama.
