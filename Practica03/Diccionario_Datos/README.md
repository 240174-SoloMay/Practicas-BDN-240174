# Diccionario de Datos · db_test_7b

Documento estático que conserva la versión Markdown y agrega una página HTML
lista para imprimir o guardar como PDF. Usa el mismo esquema y paleta del
Diagrama ER interactivo.

## Abrir y exportar

- Abre `index.html` directamente en un navegador moderno.
- Pulsa **Imprimir / guardar como PDF** y selecciona **Guardar como PDF** en el
  diálogo del navegador.
- `Diccionario_de_Datos.md` es la versión en Markdown.

No requiere servidor, conexión a base de datos ni dependencias externas. El
documento no tiene animaciones.

## Verificación

El inventario se contrastó contra `respaldo_111126_1794591103484.sql`:
25 tablas, 190 columnas y 33 relaciones de clave foránea. Los conteos son las
filas incluidas en las sentencias `INSERT` del respaldo; las 25 tablas tienen
una sección de datos y las que no contienen filas se reportan como 0. No es una
consulta en vivo.

El respaldo no incluye comentarios `COMMENT` en tablas ni columnas. Por eso el
documento señala que la descripción no está declarada, sin inventar
descripciones funcionales.

`data/schema.json` contiene los metadatos contrastados y la huella SHA-256 del
respaldo de referencia. No se ejecuta el SQL.
