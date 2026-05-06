# ============================================================
# mod_conceptos.R — Fundamentos del monitoreo biológico
# StatMonitor · StatSuite · Manuel Spínola · ICOMVIS · UNA
#
# Filosofía B: retorna tagList, nav_panel se define en app.R
# ============================================================

# ── UI ────────────────────────────────────────────────────
mod_conceptos_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    # ── Encabezado ──────────────────────────────────────
    div(
      class = "py-3 px-2",
      h4(
        bs_icon("book-half", class = "me-2"),
        "Fundamentos del Monitoreo Biológico",
        style = paste0("color:", colores$primario, "; font-weight:700;")
      ),
      p(
        class = "text-muted mb-0",
        "Conceptos esenciales para diseñar, implementar y evaluar ",
        "un programa de monitoreo de fauna y flora silvestre."
      )
    ),
    
    # ── Fila 1: Definición + SVG ciclo ──────────────────
    layout_columns(
      col_widths = c(5, 7),
      
      # Card definición
      card(
        card_header(
          bs_icon("info-circle-fill", class = "me-2"),
          "¿Qué es el monitoreo biológico?"
        ),
        card_body(
          p(
            "El ", strong("monitoreo biológico"), " es la colecta y análisis ",
            "sistemático y repetido de observaciones o mediciones para evaluar ",
            "los ", strong("cambios en el tiempo"), " de una condición biológica ",
            "y el progreso hacia un objetivo de manejo."
          ),
          hr(),
          p(
            class = "small text-muted mb-1",
            strong("El monitoreo responde a tres preguntas clave:")
          ),
          # SVG — 3 preguntas
          tags$svg(
            xmlns = "http://www.w3.org/2000/svg",
            viewBox = "0 0 420 110",
            width = "100%",
            
            # ¿Por qué?
            tags$rect(x="5",   y="10", width="120", height="88", rx="8",
                      fill="#EEF3FA", stroke=colores$primario, `stroke-width`="1.5"),
            tags$text(x="65",  y="32", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700",
                      fill=colores$primario, "¿Por qué?"),
            tags$text(x="65",  y="50", `text-anchor`="middle",
                      `font-size`="9.5", fill=colores$texto, "Objetivos del"),
            tags$text(x="65",  y="63", `text-anchor`="middle",
                      `font-size`="9.5", fill=colores$texto, "monitoreo:"),
            tags$text(x="65",  y="76", `text-anchor`="middle",
                      `font-size`="9", fill=colores$secundario, "tendencia"),
            tags$text(x="65",  y="89", `text-anchor`="middle",
                      `font-size`="9", fill=colores$secundario, "o manejo adapt."),
            
            # Flecha 1→2
            tags$polygon(
              points = "132,54 148,47 148,61",
              fill = colores$acento
            ),
            
            # ¿Qué?
            tags$rect(x="150", y="10", width="120", height="88", rx="8",
                      fill="#EEF3FA", stroke=colores$primario, `stroke-width`="1.5"),
            tags$text(x="210", y="32", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700",
                      fill=colores$primario, "¿Qué?"),
            tags$text(x="210", y="50", `text-anchor`="middle",
                      `font-size`="9.5", fill=colores$texto, "Especies, parámetros"),
            tags$text(x="210", y="63", `text-anchor`="middle",
                      `font-size`="9.5", fill=colores$texto, "e indicadores:"),
            tags$text(x="210", y="76", `text-anchor`="middle",
                      `font-size`="9", fill=colores$secundario, "abundancia, densidad,"),
            tags$text(x="210", y="89", `text-anchor`="middle",
                      `font-size`="9", fill=colores$secundario, "distribución, tasas vitales"),
            
            # Flecha 2→3
            tags$polygon(
              points = "277,54 293,47 293,61",
              fill = colores$acento
            ),
            
            # ¿Cómo?
            tags$rect(x="295", y="10", width="120", height="88", rx="8",
                      fill="#EEF3FA", stroke=colores$primario, `stroke-width`="1.5"),
            tags$text(x="355", y="32", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700",
                      fill=colores$primario, "¿Cómo?"),
            tags$text(x="355", y="50", `text-anchor`="middle",
                      `font-size`="9.5", fill=colores$texto, "Diseño y método:"),
            tags$text(x="355", y="63", `text-anchor`="middle",
                      `font-size`="9.5", fill=colores$texto, "muestreo, protocolo,"),
            tags$text(x="355", y="76", `text-anchor`="middle",
                      `font-size`="9", fill=colores$secundario, "tamaño de muestra,"),
            tags$text(x="355", y="89", `text-anchor`="middle",
                      `font-size`="9", fill=colores$secundario, "análisis estadístico")
          ),
          hr(),
          div(
            class = "alert alert-warning py-2 px-3 mb-0 small",
            bs_icon("exclamation-triangle-fill", class = "me-1"),
            strong("No confundir con inventario:"), " un inventario mide en ",
            "un punto en el tiempo; el monitoreo repite las mediciones para ",
            "detectar cambios."
          )
        )
      ),
      
      # Card con SVG del ciclo de monitoreo
      card(
        card_header(
          bs_icon("arrow-repeat", class = "me-2"),
          "El ciclo del monitoreo biológico"
        ),
        card_body(
          # SVG — Rueda de 6 etapas
          tags$svg(
            xmlns = "http://www.w3.org/2000/svg",
            viewBox = "0 0 500 380",
            width = "100%",
            
            # ── Centro
            tags$circle(cx="250", cy="190", r="52",
                        fill=colores$primario),
            tags$text(x="250", y="183", `text-anchor`="middle",
                      `dominant-baseline`="middle",
                      `font-size`="12", `font-weight`="700",
                      fill="white", "CICLO DE"),
            tags$text(x="250", y="200", `text-anchor`="middle",
                      `dominant-baseline`="middle",
                      `font-size`="12", `font-weight`="700",
                      fill="white", "MONITOREO"),
            
            # ── Etapa 1 — Planificación (arriba)
            tags$polygon(
              points="250,130 212,80 288,80",
              fill=colores$acento, opacity="0.15"
            ),
            tags$rect(x="185", y="10", width="130", height="68", rx="8",
                      fill=colores$acento),
            tags$text(x="250", y="28", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700", fill="white",
                      "1. Planificación"),
            tags$text(x="250", y="44", `text-anchor`="middle",
                      `font-size`="9.5", fill="white",
                      "Objetivos · Especies focales"),
            tags$text(x="250", y="57", `text-anchor`="middle",
                      `font-size`="9.5", fill="white",
                      "Escala espacial y temporal"),
            tags$text(x="250", y="70", `text-anchor`="middle",
                      `font-size`="9.5", fill="white",
                      "Preguntas de monitoreo"),
            
            # ── Etapa 2 — Diseño del muestreo (derecha arriba)
            tags$polygon(
              points="250,190 310,130 370,155",
              fill=colores$primario, opacity="0.12"
            ),
            tags$rect(x="350", y="70", width="142", height="68", rx="8",
                      fill=colores$primario),
            tags$text(x="421", y="88", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700", fill="white",
                      "2. Diseño del"),
            tags$text(x="421", y="101", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700", fill="white",
                      "muestreo"),
            tags$text(x="421", y="117", `text-anchor`="middle",
                      `font-size`="9.5", fill="#C8D9EC",
                      "Sitios · Frecuencia"),
            tags$text(x="421", y="130", `text-anchor`="middle",
                      `font-size`="9.5", fill="#C8D9EC",
                      "Protocolos · N muestral"),
            
            # ── Etapa 3 — Recolección (derecha abajo)
            tags$polygon(
              points="250,190 310,250 370,225",
              fill=colores$secundario, opacity="0.15"
            ),
            tags$rect(x="350", y="240", width="142", height="68", rx="8",
                      fill=colores$secundario),
            tags$text(x="421", y="258", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700", fill="white",
                      "3. Recolección"),
            tags$text(x="421", y="271", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700", fill="white",
                      "de datos"),
            tags$text(x="421", y="287", `text-anchor`="middle",
                      `font-size`="9.5", fill="#EEF3FA",
                      "Métodos de campo"),
            tags$text(x="421", y="300", `text-anchor`="middle",
                      `font-size`="9.5", fill="#EEF3FA",
                      "Apps · Sensores · Control"),
            
            # ── Etapa 4 — Análisis (abajo)
            tags$polygon(
              points="250,250 212,300 288,300",
              fill=colores$peligro, opacity="0.12"
            ),
            tags$rect(x="185", y="302", width="130", height="68", rx="8",
                      fill=colores$peligro),
            tags$text(x="250", y="320", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700", fill="white",
                      "4. Análisis"),
            tags$text(x="250", y="336", `text-anchor`="middle",
                      `font-size`="9.5", fill="white",
                      "Tendencias · Índices"),
            tags$text(x="250", y="349", `text-anchor`="middle",
                      `font-size`="9.5", fill="white",
                      "Modelos · Indicadores"),
            tags$text(x="250", y="362", `text-anchor`="middle",
                      `font-size`="9.5", fill="white",
                      "Visualización"),
            
            # ── Etapa 5 — Comunicación (izquierda abajo)
            tags$polygon(
              points="250,190 190,250 130,225",
              fill="#9F8B75", opacity="0.15"
            ),
            tags$rect(x="8", y="240", width="130", height="68", rx="8",
                      fill="#9F8B75"),
            tags$text(x="73", y="258", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700", fill="white",
                      "5. Comunicación"),
            tags$text(x="73", y="271", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700", fill="white",
                      "de resultados"),
            tags$text(x="73", y="287", `text-anchor`="middle",
                      `font-size`="9.5", fill="#EEF3FA",
                      "Informes · Tomadores"),
            tags$text(x="73", y="300", `text-anchor`="middle",
                      `font-size`="9.5", fill="#EEF3FA",
                      "de decisión · Comunidades"),
            
            # ── Etapa 6 — Retroalimentación (izquierda arriba)
            tags$polygon(
              points="250,190 190,130 130,155",
              fill="#F1CE63", opacity="0.20"
            ),
            tags$rect(x="8", y="70", width="130", height="68", rx="8",
                      fill="#B85A0D"),
            tags$text(x="73", y="88", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700", fill="white",
                      "6. Retroalim."),
            tags$text(x="73", y="101", `text-anchor`="middle",
                      `font-size`="11", `font-weight`="700", fill="white",
                      "y ajuste"),
            tags$text(x="73", y="117", `text-anchor`="middle",
                      `font-size`="9.5", fill="#EEF3FA",
                      "Evaluar el programa"),
            tags$text(x="73", y="130", `text-anchor`="middle",
                      `font-size`="9.5", fill="#EEF3FA",
                      "Ajustar metodología"),
            
            # ── Flechas circulares (arcos simplificados con líneas curvas)
            tags$path(d="M 250 78 A 112 112 0 0 1 362 130",
                      fill="none", stroke=colores$acento,
                      `stroke-width`="2.5", `stroke-dasharray`="5,3",
                      `marker-end`="url(#arrow)"),
            tags$path(d="M 362 250 A 112 112 0 0 1 250 302",
                      fill="none", stroke=colores$acento,
                      `stroke-width`="2.5", `stroke-dasharray`="5,3",
                      `marker-end`="url(#arrow)"),
            tags$path(d="M 138 250 A 112 112 0 0 1 138 130",
                      fill="none", stroke=colores$acento,
                      `stroke-width`="2.5", `stroke-dasharray`="5,3",
                      `marker-end`="url(#arrow)"),
            
            # Definición marcador flecha
            tags$defs(
              tags$marker(
                id="arrow", markerWidth="8", markerHeight="8",
                refX="6", refY="3", orient="auto",
                tags$path(d="M0,0 L0,6 L8,3 z", fill=colores$acento)
              )
            )
          )
        )
      )
    ),
    
    # ── Fila 2: Tipos de monitoreo ───────────────────────
    layout_columns(
      col_widths = c(6, 6),
      
      card(
        card_header(
          bs_icon("binoculars-fill", class = "me-2"),
          "Tipo 1: Monitoreo de vigilancia (estado)"
        ),
        card_body(
          # SVG — línea de tiempo
          tags$svg(
            xmlns = "http://www.w3.org/2000/svg",
            viewBox = "0 0 380 80",
            width = "100%",
            # Línea de tiempo
            tags$line(x1="20", y1="40", x2="360", y2="40",
                      stroke=colores$primario, `stroke-width`="2.5"),
            # Puntos de muestreo
            tags$circle(cx="60",  cy="40", r="7", fill=colores$secundario),
            tags$circle(cx="120", cy="40", r="7", fill=colores$secundario),
            tags$circle(cx="180", cy="40", r="7", fill=colores$secundario),
            tags$circle(cx="240", cy="40", r="7", fill=colores$secundario),
            tags$circle(cx="300", cy="40", r="7", fill=colores$secundario),
            tags$circle(cx="360", cy="40", r="7", fill=colores$acento),
            # Etiquetas
            tags$text(x="60",  y="22", `text-anchor`="middle",
                      `font-size`="9", fill=colores$texto, "T1"),
            tags$text(x="120", y="22", `text-anchor`="middle",
                      `font-size`="9", fill=colores$texto, "T2"),
            tags$text(x="180", y="22", `text-anchor`="middle",
                      `font-size`="9", fill=colores$texto, "T3"),
            tags$text(x="240", y="22", `text-anchor`="middle",
                      `font-size`="9", fill=colores$texto, "T4"),
            tags$text(x="300", y="22", `text-anchor`="middle",
                      `font-size`="9", fill=colores$texto, "T5"),
            tags$text(x="360", y="22", `text-anchor`="middle",
                      `font-size`="9", fill=colores$acento, "T6"),
            # Flecha tendencia
            tags$path(d="M 60 58 Q 200 72 360 52",
                      fill="none", stroke=colores$peligro,
                      `stroke-width`="2", `stroke-dasharray`="4,2"),
            tags$text(x="190", y="77", `text-anchor`="middle",
                      `font-size`="9.5", fill=colores$peligro,
                      "Detectar tendencia a largo plazo")
          ),
          p(
            class = "small mt-2 mb-1",
            "Evalúa los ", strong("cambios a largo plazo"), " en poblaciones o ",
            "comunidades. Su objetivo es determinar el estado o tendencia de ",
            "algún aspecto de la calidad ambiental o biológica."
          ),
          div(
            class = "small text-muted",
            bs_icon("check-circle-fill", style="color:#5FA2CE", class="me-1"),
            "Ejemplo: índice de abundancia anual de aves por puntos de conteo."
          )
        )
      ),
      
      card(
        card_header(
          bs_icon("gear-fill", class = "me-2"),
          "Tipo 2: Monitoreo enmarcado en manejo adaptativo"
        ),
        card_body(
          # SVG — ciclo acción-monitoreo
          tags$svg(
            xmlns = "http://www.w3.org/2000/svg",
            viewBox = "0 0 380 80",
            width = "100%",
            # Cajas
            tags$rect(x="10",  y="15", width="90", height="48", rx="6",
                      fill=colores$primario),
            tags$text(x="55",  y="36", `text-anchor`="middle",
                      `font-size`="9.5", `font-weight`="700", fill="white", "Acción de"),
            tags$text(x="55",  y="50", `text-anchor`="middle",
                      `font-size`="9.5", `font-weight`="700", fill="white", "manejo"),
            
            tags$rect(x="145", y="15", width="90", height="48", rx="6",
                      fill=colores$secundario),
            tags$text(x="190", y="36", `text-anchor`="middle",
                      `font-size`="9.5", `font-weight`="700", fill="white", "Monitoreo"),
            tags$text(x="190", y="50", `text-anchor`="middle",
                      `font-size`="9.5", `font-weight`="700", fill="white", "de respuesta"),
            
            tags$rect(x="280", y="15", width="90", height="48", rx="6",
                      fill=colores$acento),
            tags$text(x="325", y="36", `text-anchor`="middle",
                      `font-size`="9.5", `font-weight`="700", fill="white", "Evaluar"),
            tags$text(x="325", y="50", `text-anchor`="middle",
                      `font-size`="9.5", `font-weight`="700", fill="white", "y ajustar"),
            
            # Flechas
            tags$path(d="M 102 39 L 143 39",
                      fill="none", stroke=colores$texto, `stroke-width`="2",
                      `marker-end`="url(#arr2)"),
            tags$path(d="M 237 39 L 278 39",
                      fill="none", stroke=colores$texto, `stroke-width`="2",
                      `marker-end`="url(#arr2)"),
            tags$path(d="M 325 63 Q 190 90 55 63",
                      fill="none", stroke=colores$peligro,
                      `stroke-width`="1.8", `stroke-dasharray`="4,2",
                      `marker-end`="url(#arr2)"),
            tags$defs(
              tags$marker(
                id="arr2", markerWidth="7", markerHeight="7",
                refX="5", refY="3", orient="auto",
                tags$path(d="M0,0 L0,6 L7,3 z", fill=colores$texto)
              )
            )
          ),
          p(
            class = "small mt-2 mb-1",
            "Mide el ", strong("éxito o progreso hacia un objetivo de manejo"), ". ",
            "Provee evidencia para continuar, modificar o suspender una acción. ",
            "Requiere diseño experimental más riguroso."
          ),
          div(
            class = "small text-muted",
            bs_icon("check-circle-fill", style="color:#5FA2CE", class="me-1"),
            "Ejemplo: efecto de corredores biológicos sobre ocupación de pumas."
          )
        )
      )
    ),
    
    # ── Fila 3: Parámetros clave ─────────────────────────
    card(
      card_header(
        bs_icon("rulers", class = "me-2"),
        "¿Qué se mide en el monitoreo?"
      ),
      card_body(
        layout_columns(
          col_widths = c(4, 4, 4),
          
          # Parámetros poblacionales
          div(
            h6(
              bs_icon("people-fill", class = "me-1",
                      style = paste0("color:", colores$primario)),
              "Parámetros poblacionales",
              style = paste0("color:", colores$primario, "; font-weight:700;")
            ),
            tags$ul(
              class = "small ps-3",
              tags$li(strong("Abundancia / tamaño"), " — cuántos individuos"),
              tags$li(strong("Densidad"), " — individuos / unidad de área"),
              tags$li(strong("Distribución"), " — rango geográfico"),
              tags$li(strong("Estructura poblacional"), " — edad, sexo, clase"),
              tags$li(strong("Tasas vitales"), " — supervivencia, reproducción, reclutamiento")
            )
          ),
          
          # Parámetros ecológicos
          div(
            h6(
              bs_icon("tree-fill", class = "me-1",
                      style = paste0("color:", colores$exito)),
              "Parámetros del hábitat",
              style = paste0("color:", colores$exito, "; font-weight:700;")
            ),
            tags$ul(
              class = "small ps-3",
              tags$li(strong("Uso del hábitat"), " — tipos utilizados"),
              tags$li(strong("Calidad del hábitat"), " — cobertura, refugios, agua"),
              tags$li(strong("Disponibilidad"), " — área, fragmentación"),
              tags$li(strong("Conectividad"), " — corredores biológicos")
            )
          ),
          
          # Factores de presión
          div(
            h6(
              bs_icon("exclamation-diamond-fill", class = "me-1",
                      style = paste0("color:", colores$peligro)),
              "Factores de presión",
              style = paste0("color:", colores$peligro, "; font-weight:700;")
            ),
            tags$ul(
              class = "small ps-3",
              tags$li("Pérdida o degradación del hábitat"),
              tags$li("Caza o extracción ilegal"),
              tags$li("Contaminación"),
              tags$li("Especies invasoras"),
              tags$li("Cambio climático"),
              tags$li("Enfermedades")
            ),
            div(
              class = "alert alert-warning py-1 px-2 small mt-2 mb-0",
              bs_icon("lightbulb-fill", class = "me-1"),
              "Las variables deben ser relevantes, medibles, sensibles y viables."
            )
          )
        )
      )
    )
  )
}

# ── Server ────────────────────────────────────────────────
mod_conceptos_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Módulo estático — sin lógica reactiva
  })
}