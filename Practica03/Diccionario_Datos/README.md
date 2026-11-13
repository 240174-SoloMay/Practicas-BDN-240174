# Diccionario de Datos · db_test_7b

Documento estático que conserva la versión Markdown y agrega una página HTML
lista para imprimir o guardar como PDF. Usa el mismo esquema y paleta del
Diagrama ER interactivo.

Paleta visual compartida: `#0B1320`, `#0F2A45`, `#1E4E6A`, `#8FB8C9` y
`#F2EFE9`.

## Abrir y exportar

- Abre `index.html` directamente en un navegador moderno.
- Pulsa **Imprimir / guardar como PDF** y selecciona **Guardar como PDF** en el
  diálogo del navegador.
- `Diccionario_de_Datos.md` es la versión en Markdown.
- La tabla **Conteo de registros por tabla** muestra una fila con el número de
  registros de cada tabla antes del resumen estructural; cada sección
  individual repite su conteo.

No requiere servidor, conexión a base de datos ni dependencias externas. El
documento no tiene animaciones.

## Verificación

El inventario se contrastó contra `respaldo_111126_1794591103484.sql`:
25 tablas, 190 columnas, 33 relaciones de clave foránea y 97,472 filas en el
respaldo. Los conteos son las filas incluidas en las sentencias `INSERT`; las 25 tablas tienen
una sección de datos y las que no contienen filas se reportan como 0. No es una
consulta en vivo.

El respaldo no incluye comentarios `COMMENT` en tablas ni columnas. El
documento agrega descripciones editoriales redactadas a partir de los nombres,
tipos y relaciones declaradas; las identifica como documentación inferida, no
como comentarios oficiales o reglas de negocio confirmadas.

`data/schema.json` contiene los metadatos contrastados y la huella SHA-256 del
respaldo de referencia. No se ejecuta el SQL.
