const $ = (selector) => document.querySelector(selector);
const canvas = $("#canvas");
const world = $("#world");
const nodes = $("#nodes");
const edges = $("#edges");

const NODE_WIDTH = 300;
const GRID_COLUMNS = 5;
const X_GAP = 58;
const Y_GAP = 74;
const HEADER_ANCHOR = 20;
const MIN_SCALE = 0.16;
const MAX_SCALE = 2.6;

let data;
let scale = 1;
let tx = 0;
let ty = 0;
let selectedTable = null;
let selectedRelation = null;
let paused = false;
let speed = 1;
let positions = {};
let defaultPositions = {};
let nodeElements = new Map();
let dragged = false;

fetch("data/schema.json")
  .then((response) => {
    if (!response.ok) throw new Error("No se pudo leer data/schema.json");
    return response.json();
  })
  .then((schema) => {
    data = schema;
    initialize();
  })
  .catch(() => {
    $("#load-error").hidden = false;
  });

function initialize() {
  $("#counts").textContent =
    `${data.tables.length} tablas · ${data.relations.length} relaciones · ` +
    `${data.tables.reduce((sum, table) => sum + table.columns.length, 0)} columnas`;

  [...new Set(data.tables.map((table) => table.group))].forEach((group) => {
    const option = document.createElement("option");
    option.value = group;
    option.textContent = group;
    $("#groups").append(option);
  });

  layoutTables();
  renderTables();
  renderEdges();
  bindControls();
  bindPanAndZoom();
  fitToView();
}

function estimatedHeight(table) {
  return 142 + table.columns.length * 27;
}

function layoutTables() {
  const rowHeights = [];
  data.tables.forEach((table, index) => {
    const row = Math.floor(index / GRID_COLUMNS);
    rowHeights[row] = Math.max(rowHeights[row] || 0, estimatedHeight(table));
  });

  let rowY = 44;
  data.tables.forEach((table, index) => {
    const row = Math.floor(index / GRID_COLUMNS);
    const col = index % GRID_COLUMNS;
    if (col === 0 && row > 0) rowY += rowHeights[row - 1] + Y_GAP;
    positions[table.name] = {
      x: 44 + col * (NODE_WIDTH + X_GAP),
      y: rowY,
    };
  });
  defaultPositions = structuredClone(positions);
}

function renderTables() {
  nodes.replaceChildren();
  nodeElements.clear();

  data.tables.forEach((table, index) => {
    const position = positions[table.name];
    const card = document.createElement("article");
    card.className = "node";
    card.dataset.name = table.name;
    card.style.left = `${position.x}px`;
    card.style.top = `${position.y}px`;
    card.style.animationDelay = `${Math.min(index * 22, 420)}ms`;

    const heading = document.createElement("button");
    heading.type = "button";
    heading.className = "node-heading";
    heading.setAttribute("aria-label", `Inspeccionar tabla ${table.name}`);
    const title = document.createElement("span");
    title.className = "node-title";
    title.textContent = table.name;
    const columnCount = document.createElement("span");
    columnCount.className = "node-column-count";
    columnCount.textContent = `${table.columns.length} columnas`;
    heading.append(title, columnCount);

    const summary = document.createElement("div");
    summary.className = "node-summary";
    const recordCount = document.createElement("span");
    recordCount.className = "record-count";
    recordCount.textContent = table.rowCountVerifiable
      ? `${formatCount(table.rowCount)} registros en respaldo`
      : "Registros no verificables";
    const description = document.createElement("p");
    description.className = "node-description";
    description.textContent = table.description;
    summary.append(recordCount, description);

    const columnList = document.createElement("div");
    columnList.className = "column-list";
    table.columns.forEach((column) => {
      const row = document.createElement("div");
      row.className = "column-row";
      row.dataset.column = column.name.toLowerCase();
      const badge = document.createElement("b");
      badge.className = `column-badge ${column.primaryKey ? "pk" : ""} ${
        column.foreignKeys.length ? "fk" : ""
      }`;
      badge.textContent = column.primaryKey
        ? "PK"
        : column.foreignKeys.length
          ? "FK"
          : "";
      const name = document.createElement("span");
      name.className = "column-name";
      name.textContent = column.name;
      const type = document.createElement("em");
      type.className = "column-type";
      type.textContent = column.type;
      row.append(badge, name, type);
      columnList.append(row);
    });

    card.append(heading, summary, columnList);
    card.addEventListener("click", () => {
      if (!dragged) selectTable(table.name);
    });
    heading.addEventListener("pointerdown", (event) =>
      beginNodeDrag(event, card, table.name),
    );
    nodes.append(card);
    nodeElements.set(table.name, card);
  });
}

function renderEdges() {
  const width = Math.max(
    ...Object.values(positions).map((position) => position.x + NODE_WIDTH + 60),
    1200,
  );
  const height = Math.max(
    ...data.tables.map(
      (table) => positions[table.name].y + estimatedHeight(table) + 80,
    ),
    900,
  );
  edges.setAttribute("width", width);
  edges.setAttribute("height", height);
  edges.setAttribute("viewBox", `0 0 ${width} ${height}`);
  edges.replaceChildren();

  const defs = document.createElementNS(edges.namespaceURI, "defs");
  const marker = document.createElementNS(edges.namespaceURI, "marker");
  marker.setAttribute("id", "edge-arrow");
  marker.setAttribute("viewBox", "0 0 10 10");
  marker.setAttribute("refX", "8");
  marker.setAttribute("refY", "5");
  marker.setAttribute("markerWidth", "6");
  marker.setAttribute("markerHeight", "6");
  marker.setAttribute("orient", "auto-start-reverse");
  const arrow = document.createElementNS(edges.namespaceURI, "path");
  arrow.setAttribute("d", "M 0 0 L 10 5 L 0 10 z");
  arrow.setAttribute("class", "edge-arrow");
  marker.append(arrow);
  defs.append(marker);
  edges.append(defs);

  data.relations.forEach((relation, index) => {
    const source = positions[relation.fromTable];
    const target = positions[relation.toTable];
    if (!source || !target) return;

    const sourceOnLeft = source.x <= target.x;
    const startX = source.x + (sourceOnLeft ? NODE_WIDTH : 0);
    const endX = target.x + (sourceOnLeft ? 0 : NODE_WIDTH);
    const startY = source.y + HEADER_ANCHOR;
    const endY = target.y + HEADER_ANCHOR;
    const curve = Math.max(70, Math.abs(endX - startX) * 0.38);
    const direction = sourceOnLeft ? 1 : -1;
    const pathData =
      relation.fromTable === relation.toTable
        ? `M ${source.x + NODE_WIDTH} ${startY} C ${source.x + NODE_WIDTH + 150} ${startY - 80}, ${source.x + NODE_WIDTH + 150} ${startY + 90}, ${source.x + NODE_WIDTH} ${startY + 55}`
        : `M ${startX} ${startY} C ${startX + curve * direction} ${startY}, ${endX - curve * direction} ${endY}, ${endX} ${endY}`;

    const path = document.createElementNS(edges.namespaceURI, "path");
    path.setAttribute("d", pathData);
    path.setAttribute("class", "edge");
    path.dataset.constraint = relation.constraint;
    path.dataset.from = relation.fromTable;
    path.dataset.to = relation.toTable;
    path.setAttribute("marker-end", "url(#edge-arrow)");
    path.addEventListener("click", (event) => {
      event.stopPropagation();
      selectRelation(relation);
    });
    const title = document.createElementNS(edges.namespaceURI, "title");
    title.textContent =
      `${relation.fromTable}.${relation.fromColumns.join(", ")} → ` +
      `${relation.toTable}.${relation.toColumns.join(", ")}`;
    path.append(title);
    edges.append(path);

    if (!paused) {
      const particle = document.createElementNS(edges.namespaceURI, "circle");
      particle.setAttribute("r", "3.4");
      particle.setAttribute("class", "flow-particle");
      const motion = document.createElementNS(edges.namespaceURI, "animateMotion");
      motion.setAttribute("dur", `${3.8 / speed}s`);
      motion.setAttribute("repeatCount", "indefinite");
      motion.setAttribute("begin", `${(index % 8) * 0.14}s`);
      motion.setAttribute("path", pathData);
      particle.append(motion);
      edges.append(particle);
    }
  });

  updateHighlights();
}

function bindControls() {
  $("#search").addEventListener("input", applyFilters);
  $("#groups").addEventListener("change", applyFilters);
  $("#show").addEventListener("click", () => {
    $("#search").value = "";
    $("#groups").value = "";
    applyFilters();
  });
  $("#zoom-in").addEventListener("click", () => zoomAt(scale * 1.18));
  $("#zoom-out").addEventListener("click", () => zoomAt(scale / 1.18));
  $("#fit").addEventListener("click", fitToView);
  $("#reset").addEventListener("click", resetView);
  $("#pause").addEventListener("click", () => {
    paused = !paused;
    $("#pause").textContent = paused ? "Reanudar animación" : "Pausar animación";
    $("#pause").setAttribute("aria-pressed", String(paused));
    renderEdges();
  });
  $("#speed").addEventListener("input", (event) => {
    speed = Number(event.target.value);
    document.documentElement.style.setProperty("--speed", speed);
    renderEdges();
  });
}

function bindPanAndZoom() {
  let panStart = null;
  canvas.addEventListener("pointerdown", (event) => {
    if (event.target.closest(".node") || event.target.closest("button")) return;
    panStart = { x: event.clientX, y: event.clientY, tx, ty };
    canvas.setPointerCapture(event.pointerId);
    canvas.classList.add("dragging");
  });
  canvas.addEventListener("pointermove", (event) => {
    if (!panStart) return;
    tx = panStart.tx + event.clientX - panStart.x;
    ty = panStart.ty + event.clientY - panStart.y;
    applyTransform();
  });
  const stopPan = () => {
    panStart = null;
    canvas.classList.remove("dragging");
  };
  canvas.addEventListener("pointerup", stopPan);
  canvas.addEventListener("pointercancel", stopPan);
  canvas.addEventListener(
    "wheel",
    (event) => {
      event.preventDefault();
      const bounds = canvas.getBoundingClientRect();
      const factor = event.deltaY < 0 ? 1.1 : 1 / 1.1;
      zoomAt(scale * factor, event.clientX - bounds.left, event.clientY - bounds.top);
    },
    { passive: false },
  );
}

function beginNodeDrag(event, card, name) {
  if (event.button !== 0) return;
  event.stopPropagation();
  const origin = {
    x: event.clientX,
    y: event.clientY,
    left: positions[name].x,
    top: positions[name].y,
  };
  card.setPointerCapture(event.pointerId);
  const move = (pointerEvent) => {
    const dx = (pointerEvent.clientX - origin.x) / scale;
    const dy = (pointerEvent.clientY - origin.y) / scale;
    if (Math.abs(dx) + Math.abs(dy) > 4) {
      dragged = true;
      positions[name] = { x: origin.left + dx, y: origin.top + dy };
      card.style.left = `${positions[name].x}px`;
      card.style.top = `${positions[name].y}px`;
      renderEdges();
    }
  };
  const end = () => {
    card.removeEventListener("pointermove", move);
    card.removeEventListener("pointerup", end);
    card.removeEventListener("pointercancel", end);
    setTimeout(() => {
      dragged = false;
    }, 0);
  };
  card.addEventListener("pointermove", move);
  card.addEventListener("pointerup", end);
  card.addEventListener("pointercancel", end);
}

function applyFilters() {
  const query = $("#search").value.trim().toLocaleLowerCase();
  const group = $("#groups").value;
  data.tables.forEach((table) => {
    const card = nodeElements.get(table.name);
    const matchingColumns = new Set(
      table.columns
        .filter((column) => column.name.toLocaleLowerCase().includes(query))
        .map((column) => column.name.toLocaleLowerCase()),
    );
    const matches =
      !query ||
      table.name.toLocaleLowerCase().includes(query) ||
      matchingColumns.size > 0;
    const visible = (!group || table.group === group) && matches;
    card.classList.toggle("filtered-out", !visible);
    card.querySelectorAll(".column-row").forEach((row) => {
      row.classList.toggle(
        "match-column",
        Boolean(query) && matchingColumns.has(row.dataset.column),
      );
    });
  });
  renderEdges();
}

function selectTable(name) {
  selectedTable = name;
  selectedRelation = null;
  renderDetails(name);
  updateHighlights();
}

function selectRelation(relation) {
  selectedTable = relation.fromTable;
  selectedRelation = relation.constraint;
  renderDetails(relation.fromTable);
  updateHighlights();
}

function updateHighlights() {
  const activeRelations = selectedTable
    ? data.relations.filter(
        (relation) =>
          relation.fromTable === selectedTable ||
          relation.toTable === selectedTable,
      )
    : [];
  const relatedTables = new Set(
    activeRelations.flatMap((relation) => [
      relation.fromTable,
      relation.toTable,
    ]),
  );

  nodeElements.forEach((card, name) => {
    card.classList.toggle("selected", name === selectedTable);
    card.classList.toggle(
      "related",
      name !== selectedTable && relatedTables.has(name),
    );
    card.classList.toggle(
      "dim",
      Boolean(selectedTable) && name !== selectedTable && !relatedTables.has(name),
    );
  });
  edges.querySelectorAll(".edge").forEach((path) => {
    const relation = data.relations.find(
      (item) => item.constraint === path.dataset.constraint,
    );
    const active =
      relation &&
      (relation.fromTable === selectedTable ||
        relation.toTable === selectedTable);
    path.classList.toggle("active", Boolean(active));
    path.classList.toggle(
      "selected-relation",
      Boolean(selectedRelation && path.dataset.constraint === selectedRelation),
    );
    path.classList.toggle(
      "muted",
      Boolean(selectedTable && active === false),
    );
    const fromHidden = nodeElements
      .get(path.dataset.from)
      ?.classList.contains("filtered-out");
    const toHidden = nodeElements
      .get(path.dataset.to)
      ?.classList.contains("filtered-out");
    path.classList.toggle("filtered-edge", Boolean(fromHidden || toHidden));
  });
}

function renderDetails(name) {
  const table = data.tables.find((item) => item.name === name);
  const panel = $("#details");
  panel.replaceChildren();

  const top = document.createElement("div");
  top.className = "details-top";
  const headingGroup = document.createElement("div");
  const eyebrow = document.createElement("p");
  eyebrow.className = "eyebrow";
  eyebrow.textContent = "TABLA";
  const heading = document.createElement("h2");
  heading.textContent = table.name;
  headingGroup.append(eyebrow, heading);
  const close = document.createElement("button");
  close.type = "button";
  close.className = "close-details";
  close.setAttribute("aria-label", "Cerrar inspección");
  close.textContent = "×";
  close.addEventListener("click", () => {
    selectedTable = null;
    selectedRelation = null;
    panel.innerHTML =
      '<div class="details-empty"><p class="eyebrow">INSPECCIÓN</p><h2>Explora una tabla</h2><p>Selecciona una tarjeta para consultar su descripción, cantidad de registros, columnas e interrelaciones.</p></div>';
    updateHighlights();
  });
  top.append(headingGroup, close);
  panel.append(top);

  const count = document.createElement("div");
  count.className = `details-count ${table.rowCountVerifiable ? "" : "unverified"}`;
  count.textContent = table.rowCountVerifiable
    ? `${formatCount(table.rowCount)} registros en el respaldo`
    : "Cantidad de registros no verificable con este respaldo";
  panel.append(count);

  const description = document.createElement("p");
  description.className = "details-description";
  description.textContent = table.description;
  panel.append(description);

  const metadata = document.createElement("dl");
  metadata.className = "table-meta";
  addDefinition(metadata, "Motor", table.engine);
  addDefinition(metadata, "PK", table.primaryKey.join(", ") || "No declarada");
  addDefinition(metadata, "Grupo", table.group);
  addDefinition(metadata, "Opciones", table.options || "—");
  panel.append(metadata);

  const columnsTitle = document.createElement("h3");
  columnsTitle.textContent = `Columnas · ${table.columns.length}`;
  panel.append(columnsTitle);
  const columnList = document.createElement("div");
  columnList.className = "detail-columns";
  table.columns.forEach((column) => {
    const item = document.createElement("section");
    item.className = "detail-column";
    const header = document.createElement("div");
    header.className = "detail-column-header";
    const fieldName = document.createElement("strong");
    fieldName.textContent = column.name;
    const keyFlags = document.createElement("span");
    keyFlags.className = "detail-key-flags";
    keyFlags.textContent = [
      column.primaryKey ? "PK" : "",
      column.foreignKeys.length ? "FK" : "",
    ]
      .filter(Boolean)
      .join(" · ");
    header.append(fieldName, keyFlags);
    item.append(header);
    addDetailLine(item, "Tipo", column.type);
    addDetailLine(item, "NULL", column.nullable ? "Sí" : "No");
    addDetailLine(
      item,
      "DEFAULT",
      column.defaultDeclared ? column.default : "No declarado",
    );
    if (column.onUpdate) addDetailLine(item, "ON UPDATE", column.onUpdate);
    if (column.autoIncrement) addDetailLine(item, "AUTO_INCREMENT", "Sí");
    if (column.foreignKeyTargets?.length) {
      addDetailLine(item, "Referencia", column.foreignKeyTargets.join(", "));
    }
    addDetailLine(item, "Descripción", column.description);
    columnList.append(item);
  });
  panel.append(columnList);

  const relations = data.relations.filter(
    (relation) => relation.fromTable === name || relation.toTable === name,
  );
  const relationsTitle = document.createElement("h3");
  relationsTitle.textContent = `Relaciones declaradas · ${relations.length}`;
  panel.append(relationsTitle);
  if (!relations.length) {
    const empty = document.createElement("p");
    empty.className = "muted-text";
    empty.textContent = "No hay claves foráneas declaradas para esta tabla.";
    panel.append(empty);
  } else {
    const list = document.createElement("ul");
    list.className = "relation-list";
    relations.forEach((relation) => {
      const item = document.createElement("li");
      const button = document.createElement("button");
      button.type = "button";
      button.className = "relation-button";
      button.textContent =
        `${relation.fromTable}.${relation.fromColumns.join(", ")} → ` +
        `${relation.toTable}.${relation.toColumns.join(", ")}`;
      button.addEventListener("click", () => selectRelation(relation));
      const meta = document.createElement("small");
      meta.textContent =
        `${relation.cardinality} · ${relation.constraint} · ` +
        `DELETE ${relation.onDelete || "no declarado"} · ` +
        `UPDATE ${relation.onUpdate || "no declarado"}`;
      item.append(button, meta);
      list.append(item);
    });
    panel.append(list);
  }
}

function addDefinition(list, term, value) {
  const dt = document.createElement("dt");
  dt.textContent = term;
  const dd = document.createElement("dd");
  dd.textContent = value;
  list.append(dt, dd);
}

function addDetailLine(container, label, value) {
  const row = document.createElement("p");
  row.className = "detail-line";
  const term = document.createElement("span");
  term.textContent = `${label}: `;
  const definition = document.createElement("span");
  definition.textContent = value || "—";
  row.append(term, definition);
  container.append(row);
}

function resetView() {
  positions = structuredClone(defaultPositions);
  $("#search").value = "";
  $("#groups").value = "";
  selectedTable = null;
  selectedRelation = null;
  renderTables();
  renderEdges();
  $("#details").innerHTML =
    '<div class="details-empty"><p class="eyebrow">INSPECCIÓN</p><h2>Explora una tabla</h2><p>Selecciona una tarjeta para consultar su descripción, cantidad de registros, columnas e interrelaciones.</p></div>';
  fitToView();
}

function fitToView() {
  const maxX = Math.max(
    ...data.tables.map((table) => positions[table.name].x + NODE_WIDTH),
  );
  const maxY = Math.max(
    ...data.tables.map(
      (table) => positions[table.name].y + estimatedHeight(table),
    ),
  );
  const padding = 32;
  scale = Math.max(
    MIN_SCALE,
    Math.min(
      1.15,
      (canvas.clientWidth - padding * 2) / maxX,
      (canvas.clientHeight - padding * 2) / maxY,
    ),
  );
  tx = Math.max(padding, (canvas.clientWidth - maxX * scale) / 2);
  ty = Math.max(padding, (canvas.clientHeight - maxY * scale) / 2);
  applyTransform();
}

function zoomAt(nextScale, anchorX = canvas.clientWidth / 2, anchorY = canvas.clientHeight / 2) {
  const bounded = Math.max(MIN_SCALE, Math.min(MAX_SCALE, nextScale));
  const worldX = (anchorX - tx) / scale;
  const worldY = (anchorY - ty) / scale;
  scale = bounded;
  tx = anchorX - worldX * scale;
  ty = anchorY - worldY * scale;
  applyTransform();
}

function applyTransform() {
  world.style.transform = `translate(${tx}px, ${ty}px) scale(${scale})`;
  $("#zoom-level").textContent = `${Math.round(scale * 100)}%`;
}

function formatCount(value) {
  return new Intl.NumberFormat("es-MX").format(value);
}

window.addEventListener("resize", () => {
  if (data) fitToView();
});
