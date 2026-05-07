# ============================================================
# mod_conceptos.R — Fundamentos del monitoreo biológico
# StatMonitor · StatSuite · Manuel Spínola · ICOMVIS · UNA
#
# Filosofía B: retorna tagList, nav_panel se define en app.R
# ============================================================

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
    
    navset_card_tab(
      
      # ── Pestaña 1: ¿Qué es monitoreo? ─────────────────
      nav_panel(
        title = tagList(bs_icon("info-circle", class = "me-1"), "¿Qué es monitoreo?"),
        card_body(
          layout_columns(
            col_widths = c(5, 7),
            
            div(
              h5(style = paste0("color:", colores$primario, "; font-weight:700;"),
                 "Definición"),
              p(class = "small",
                "El ", strong("monitoreo biológico"), " es la colecta y análisis ",
                "sistemático y repetido de observaciones o mediciones para evaluar ",
                "los ", strong("cambios en el tiempo"), " de una condición biológica ",
                "y el progreso hacia un objetivo de manejo."
              ),
              div(
                class = "alert alert-warning small py-2 px-3",
                bs_icon("exclamation-triangle-fill", class = "me-1"),
                strong("No confundir con inventario:"), " un inventario mide en ",
                "un punto en el tiempo; el monitoreo repite las mediciones para ",
                "detectar cambios."
              ),
              h6(style = paste0("color:", colores$primario, ";"),
                 "Características del monitoreo:"),
              tags$ul(
                class = "small",
                tags$li(strong("Sistemático"), " — sigue un diseño y protocolo definido"),
                tags$li(strong("Continuo o periódico"), " — se realiza en intervalos regulares"),
                tags$li(strong("Multiescala"), " — local, regional o global"),
                tags$li(strong("Informativo"), " — provee evidencia para decisiones"),
                tags$li(strong("Adaptativo"), " — permite ajustar estrategias")
              )
            ),
            
            div(
              h5(style = paste0("color:", colores$primario, "; font-weight:700;"),
                 "Las tres preguntas clave"),
              p(class = "small text-muted", "Todo programa de monitoreo debe responder:"),
              tags$svg(
                xmlns = "http://www.w3.org/2000/svg",
                viewBox = "0 0 440 160",
                width = "100%",
                
                # ¿Por qué?
                tags$rect(x="5", y="20", width="130", height="118",
                          rx="8", fill="#EEF3FA",
                          stroke=colores$primario, `stroke-width`="1.8"),
                tags$rect(x="5", y="20", width="130", height="28",
                          rx="8", fill=colores$primario),
                tags$rect(x="5", y="38", width="130", height="10",
                          fill=colores$primario),
                tags$text(x="70", y="39", `text-anchor`="middle",
                          `font-size`="12", `font-weight`="700",
                          fill="white", "¿Por qué?"),
                tags$text(x="70", y="68", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "Objetivos del"),
                tags$text(x="70", y="82", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "monitoreo"),
                tags$text(x="70", y="100", `text-anchor`="middle",
                          `font-size`="9.5", fill=colores$secundario,
                          "· Tendencia poblacional"),
                tags$text(x="70", y="114", `text-anchor`="middle",
                          `font-size`="9.5", fill=colores$secundario,
                          "· Manejo adaptativo"),
                tags$text(x="70", y="128", `text-anchor`="middle",
                          `font-size`="9.5", fill=colores$secundario,
                          "· Estado de conservación"),
                
                # Flecha 1
                tags$polygon(points="140,79 158,70 158,88", fill=colores$acento),
                
                # ¿Qué?
                tags$rect(x="160", y="20", width="130", height="118",
                          rx="8", fill="#EEF3FA",
                          stroke=colores$primario, `stroke-width`="1.8"),
                tags$rect(x="160", y="20", width="130", height="28",
                          rx="8", fill=colores$primario),
                tags$rect(x="160", y="38", width="130", height="10",
                          fill=colores$primario),
                tags$text(x="225", y="39", `text-anchor`="middle",
                          `font-size`="12", `font-weight`="700",
                          fill="white", "¿Qué?"),
                tags$text(x="225", y="68", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto,
                          "Especies e indicadores"),
                tags$text(x="225", y="100", `text-anchor`="middle",
                          `font-size`="9.5", fill=colores$secundario,
                          "· Abundancia / densidad"),
                tags$text(x="225", y="114", `text-anchor`="middle",
                          `font-size`="9.5", fill=colores$secundario,
                          "· Distribución geográfica"),
                tags$text(x="225", y="128", `text-anchor`="middle",
                          `font-size`="9.5", fill=colores$secundario,
                          "· Tasas vitales"),
                
                # Flecha 2
                tags$polygon(points="295,79 313,70 313,88", fill=colores$acento),
                
                # ¿Cómo?
                tags$rect(x="315", y="20", width="120", height="118",
                          rx="8", fill="#EEF3FA",
                          stroke=colores$primario, `stroke-width`="1.8"),
                tags$rect(x="315", y="20", width="120", height="28",
                          rx="8", fill=colores$primario),
                tags$rect(x="315", y="38", width="120", height="10",
                          fill=colores$primario),
                tags$text(x="375", y="39", `text-anchor`="middle",
                          `font-size`="12", `font-weight`="700",
                          fill="white", "¿Cómo?"),
                tags$text(x="375", y="68", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "Diseño y método"),
                tags$text(x="375", y="100", `text-anchor`="middle",
                          `font-size`="9.5", fill=colores$secundario,
                          "· Diseño de muestreo"),
                tags$text(x="375", y="114", `text-anchor`="middle",
                          `font-size`="9.5", fill=colores$secundario,
                          "· Protocolo de campo"),
                tags$text(x="375", y="128", `text-anchor`="middle",
                          `font-size`="9.5", fill=colores$secundario,
                          "· Análisis estadístico")
              )
            )
          )
        )
      ),
      
      # ── Pestaña 2: Ciclo de monitoreo ─────────────────
      nav_panel(
        title = tagList(bs_icon("arrow-repeat", class = "me-1"), "Ciclo de monitoreo"),
        card_body(
          layout_columns(
            col_widths = c(7, 5),
            
            tags$svg(
              xmlns = "http://www.w3.org/2000/svg",
              viewBox = "0 0 500 370",
              width = "100%",
              
              # Centro
              tags$circle(cx="250", cy="185", r="52", fill=colores$primario),
              tags$text(x="250", y="178", `text-anchor`="middle",
                        `font-size`="12", `font-weight`="700",
                        fill="white", "CICLO DE"),
              tags$text(x="250", y="195", `text-anchor`="middle",
                        `font-size`="12", `font-weight`="700",
                        fill="white", "MONITOREO"),
              
              # 1. Planificación — arriba
              tags$rect(x="185", y="8", width="130", height="62",
                        rx="8", fill=colores$acento),
              tags$text(x="250", y="26", `text-anchor`="middle",
                        `font-size`="11", `font-weight`="700",
                        fill="white", "1. Planificación"),
              tags$text(x="250", y="41", `text-anchor`="middle",
                        `font-size`="9.5", fill="white",
                        "Objetivos · Especies focales"),
              tags$text(x="250", y="54", `text-anchor`="middle",
                        `font-size`="9.5", fill="white",
                        "Escala · Preguntas clave"),
              
              # 2. Diseño — derecha arriba
              tags$rect(x="352", y="68", width="140", height="62",
                        rx="8", fill=colores$primario),
              tags$text(x="422", y="86", `text-anchor`="middle",
                        `font-size`="11", `font-weight`="700",
                        fill="white", "2. Diseño del"),
              tags$text(x="422", y="99", `text-anchor`="middle",
                        `font-size`="11", `font-weight`="700",
                        fill="white", "muestreo"),
              tags$text(x="422", y="114", `text-anchor`="middle",
                        `font-size`="9.5", fill="#C8D9EC",
                        "Sitios · Frecuencia · N"),
              
              # 3. Recolección — derecha abajo
              tags$rect(x="352", y="240", width="140", height="62",
                        rx="8", fill=colores$secundario),
              tags$text(x="422", y="258", `text-anchor`="middle",
                        `font-size`="11", `font-weight`="700",
                        fill="white", "3. Recolección"),
              tags$text(x="422", y="271", `text-anchor`="middle",
                        `font-size`="11", `font-weight`="700",
                        fill="white", "de datos"),
              tags$text(x="422", y="286", `text-anchor`="middle",
                        `font-size`="9.5", fill="#EEF3FA",
                        "Campo · Apps · Control"),
              
              # 4. Análisis — abajo
              tags$rect(x="185", y="300", width="130", height="62",
                        rx="8", fill=colores$peligro),
              tags$text(x="250", y="318", `text-anchor`="middle",
                        `font-size`="11", `font-weight`="700",
                        fill="white", "4. Análisis"),
              tags$text(x="250", y="333", `text-anchor`="middle",
                        `font-size`="9.5", fill="white",
                        "Tendencias · Modelos"),
              tags$text(x="250", y="346", `text-anchor`="middle",
                        `font-size`="9.5", fill="white",
                        "Índices · Visualización"),
              
              # 5. Comunicación — izquierda abajo
              tags$rect(x="8", y="240", width="140", height="62",
                        rx="8", fill="#9F8B75"),
              tags$text(x="78", y="258", `text-anchor`="middle",
                        `font-size`="11", `font-weight`="700",
                        fill="white", "5. Comunicación"),
              tags$text(x="78", y="273", `text-anchor`="middle",
                        `font-size`="9.5", fill="#EEF3FA",
                        "Informes · Tomadores"),
              tags$text(x="78", y="286", `text-anchor`="middle",
                        `font-size`="9.5", fill="#EEF3FA",
                        "de decisión · Comunidades"),
              
              # 6. Retroalimentación — izquierda arriba
              tags$rect(x="8", y="68", width="140", height="62",
                        rx="8", fill="#B85A0D"),
              tags$text(x="78", y="86", `text-anchor`="middle",
                        `font-size`="11", `font-weight`="700",
                        fill="white", "6. Retroalim."),
              tags$text(x="78", y="99", `text-anchor`="middle",
                        `font-size`="11", `font-weight`="700",
                        fill="white", "y ajuste"),
              tags$text(x="78", y="114", `text-anchor`="middle",
                        `font-size`="9.5", fill="#EEF3FA",
                        "Evaluar · Ajustar · Mejorar"),
              
              # Flechas
              tags$defs(
                tags$marker(id="arr", markerWidth="7", markerHeight="7",
                            refX="5", refY="3", orient="auto",
                            tags$path(d="M0,0 L0,6 L7,3 z", fill=colores$acento))
              ),
              tags$path(d="M 250 70 A 115 115 0 0 1 362 122",
                        fill="none", stroke=colores$acento,
                        `stroke-width`="2.2", `stroke-dasharray`="5,3",
                        `marker-end`="url(#arr)"),
              tags$path(d="M 362 248 A 115 115 0 0 1 250 300",
                        fill="none", stroke=colores$acento,
                        `stroke-width`="2.2", `stroke-dasharray`="5,3",
                        `marker-end`="url(#arr)"),
              tags$path(d="M 148 248 A 115 115 0 0 1 148 122",
                        fill="none", stroke=colores$acento,
                        `stroke-width`="2.2", `stroke-dasharray`="5,3",
                        `marker-end`="url(#arr)")
            ),
            
            div(
              h5(style = paste0("color:", colores$primario, "; font-weight:700;"),
                 "Las 6 etapas"),
              tags$ol(
                class = "small", style = "padding-left: 1.2rem;",
                tags$li(class = "mb-2",
                        strong(style = paste0("color:", colores$acento),
                               "Planificación — "),
                        "Definir objetivos, seleccionar especies focales y escala."),
                tags$li(class = "mb-2",
                        strong(style = paste0("color:", colores$primario),
                               "Diseño del muestreo — "),
                        "Sitios, frecuencia y protocolos estandarizados."),
                tags$li(class = "mb-2",
                        strong(style = paste0("color:", colores$secundario),
                               "Recolección de datos — "),
                        "Métodos de campo y control de calidad."),
                tags$li(class = "mb-2",
                        strong(style = paste0("color:", colores$peligro),
                               "Análisis e interpretación — "),
                        "Tendencias, índices y visualización."),
                tags$li(class = "mb-2",
                        strong(style = "color:#9F8B75", "Comunicación — "),
                        "Hallazgos para tomadores de decisión y comunidades."),
                tags$li(class = "mb-2",
                        strong(style = "color:#B85A0D", "Retroalimentación — "),
                        "Evaluar y ajustar el programa para mejorar.")
              )
            )
          )
        )
      ),
      
      # ── Pestaña 3: Tipos de monitoreo ─────────────────
      nav_panel(
        title = tagList(bs_icon("binoculars", class = "me-1"), "Tipos de monitoreo"),
        card_body(
          layout_columns(
            col_widths = c(6, 6),
            
            card(
              card_header(bs_icon("binoculars-fill", class = "me-1"),
                          "Tipo 1: Vigilancia o estado"),
              card_body(
                tags$svg(
                  xmlns = "http://www.w3.org/2000/svg",
                  viewBox = "0 0 380 90", width = "100%",
                  tags$line(x1="20", y1="45", x2="360", y2="45",
                            stroke=colores$primario, `stroke-width`="2.5"),
                  tags$circle(cx="60",  cy="45", r="7", fill=colores$secundario),
                  tags$circle(cx="120", cy="45", r="7", fill=colores$secundario),
                  tags$circle(cx="180", cy="45", r="7", fill=colores$secundario),
                  tags$circle(cx="240", cy="45", r="7", fill=colores$secundario),
                  tags$circle(cx="300", cy="45", r="7", fill=colores$secundario),
                  tags$circle(cx="360", cy="45", r="7", fill=colores$acento),
                  tags$text(x="60",  y="26", `text-anchor`="middle",
                            `font-size`="9", fill=colores$texto, "T1"),
                  tags$text(x="120", y="26", `text-anchor`="middle",
                            `font-size`="9", fill=colores$texto, "T2"),
                  tags$text(x="180", y="26", `text-anchor`="middle",
                            `font-size`="9", fill=colores$texto, "T3"),
                  tags$text(x="240", y="26", `text-anchor`="middle",
                            `font-size`="9", fill=colores$texto, "T4"),
                  tags$text(x="300", y="26", `text-anchor`="middle",
                            `font-size`="9", fill=colores$texto, "T5"),
                  tags$text(x="360", y="26", `text-anchor`="middle",
                            `font-size`="9", fill=colores$acento, "T6"),
                  tags$path(d="M 60 62 Q 200 78 360 56",
                            fill="none", stroke=colores$peligro,
                            `stroke-width`="2", `stroke-dasharray`="4,2"),
                  tags$text(x="190", y="85", `text-anchor`="middle",
                            `font-size`="9.5", fill=colores$peligro,
                            "Detectar tendencia a largo plazo")
                ),
                p(class = "small mt-2 mb-1",
                  "Evalúa los ", strong("cambios a largo plazo"), " en poblaciones o ",
                  "comunidades para determinar tendencias de calidad biológica."),
                div(class = "small text-muted",
                    bs_icon("check-circle-fill",
                            style = paste0("color:", colores$exito), class = "me-1"),
                    "Ejemplo: índice de abundancia anual de aves por puntos de conteo.")
              )
            ),
            
            card(
              card_header(bs_icon("gear-fill", class = "me-1"),
                          "Tipo 2: Manejo adaptativo"),
              card_body(
                tags$svg(
                  xmlns = "http://www.w3.org/2000/svg",
                  viewBox = "0 0 380 90", width = "100%",
                  tags$rect(x="10",  y="20", width="90", height="44",
                            rx="6", fill=colores$primario),
                  tags$text(x="55", y="40", `text-anchor`="middle",
                            `font-size`="9.5", `font-weight`="700",
                            fill="white", "Acción de"),
                  tags$text(x="55", y="54", `text-anchor`="middle",
                            `font-size`="9.5", `font-weight`="700",
                            fill="white", "manejo"),
                  tags$rect(x="145", y="20", width="90", height="44",
                            rx="6", fill=colores$secundario),
                  tags$text(x="190", y="40", `text-anchor`="middle",
                            `font-size`="9.5", `font-weight`="700",
                            fill="white", "Monitoreo"),
                  tags$text(x="190", y="54", `text-anchor`="middle",
                            `font-size`="9.5", `font-weight`="700",
                            fill="white", "de respuesta"),
                  tags$rect(x="280", y="20", width="90", height="44",
                            rx="6", fill=colores$acento),
                  tags$text(x="325", y="40", `text-anchor`="middle",
                            `font-size`="9.5", `font-weight`="700",
                            fill="white", "Evaluar"),
                  tags$text(x="325", y="54", `text-anchor`="middle",
                            `font-size`="9.5", `font-weight`="700",
                            fill="white", "y ajustar"),
                  tags$defs(
                    tags$marker(id="arr3", markerWidth="7", markerHeight="7",
                                refX="5", refY="3", orient="auto",
                                tags$path(d="M0,0 L0,6 L7,3 z",
                                          fill=colores$texto))
                  ),
                  tags$path(d="M 102 42 L 143 42", fill="none",
                            stroke=colores$texto, `stroke-width`="2",
                            `marker-end`="url(#arr3)"),
                  tags$path(d="M 237 42 L 278 42", fill="none",
                            stroke=colores$texto, `stroke-width`="2",
                            `marker-end`="url(#arr3)"),
                  tags$path(d="M 325 64 Q 190 88 55 64", fill="none",
                            stroke=colores$peligro, `stroke-width`="1.8",
                            `stroke-dasharray`="4,2",
                            `marker-end`="url(#arr3)")
                ),
                p(class = "small mt-2 mb-1",
                  "Mide el ", strong("progreso hacia un objetivo de manejo"), ". ",
                  "Provee evidencia para continuar, modificar o suspender una acción."),
                div(class = "small text-muted",
                    bs_icon("check-circle-fill",
                            style = paste0("color:", colores$exito), class = "me-1"),
                    "Ejemplo: efecto de corredores sobre ocupación de pumas.")
              )
            )
          ),
          div(
            class = "alert alert-warning small py-2 px-3 mt-3 mb-0",
            bs_icon("info-circle-fill", class = "me-1"),
            strong("Nota:"), " en muchos casos los dos tipos se complementan — ",
            "el monitoreo de vigilancia puede ser el paso previo necesario para ",
            "diseñar un programa de manejo adaptativo."
          )
        )
      ),
      
      # ── Pestaña 4: ¿Qué se mide? ──────────────────────
      nav_panel(
        title = tagList(bs_icon("rulers", class = "me-1"), "¿Qué se mide?"),
        card_body(
          layout_columns(
            col_widths = c(4, 4, 4),
            
            card(
              card_header(
                bs_icon("people-fill", class = "me-1",
                        style = paste0("color:", colores$primario)),
                "Parámetros poblacionales"
              ),
              card_body(
                tags$ul(
                  class = "small ps-3",
                  tags$li(class = "mb-1", strong("Abundancia / tamaño"),
                          " — cuántos individuos hay"),
                  tags$li(class = "mb-1", strong("Densidad"),
                          " — individuos por unidad de área"),
                  tags$li(class = "mb-1", strong("Distribución"),
                          " — rango geográfico y cambios"),
                  tags$li(class = "mb-1", strong("Estructura poblacional"),
                          " — edad, sexo, clases"),
                  tags$li(class = "mb-1", strong("Tasas vitales"),
                          " — supervivencia, reproducción, reclutamiento")
                )
              )
            ),
            
            card(
              card_header(
                bs_icon("tree-fill", class = "me-1",
                        style = paste0("color:", colores$exito)),
                "Parámetros del hábitat"
              ),
              card_body(
                tags$ul(
                  class = "small ps-3",
                  tags$li(class = "mb-1", strong("Uso del hábitat"),
                          " — tipos utilizados por la especie"),
                  tags$li(class = "mb-1", strong("Calidad del hábitat"),
                          " — cobertura, refugios, agua"),
                  tags$li(class = "mb-1", strong("Disponibilidad"),
                          " — área total y fragmentación"),
                  tags$li(class = "mb-1", strong("Conectividad"),
                          " — corredores biológicos")
                )
              )
            ),
            
            card(
              card_header(
                bs_icon("exclamation-diamond-fill", class = "me-1",
                        style = paste0("color:", colores$peligro)),
                "Factores de presión"
              ),
              card_body(
                tags$ul(
                  class = "small ps-3",
                  tags$li(class = "mb-1", "Pérdida o degradación del hábitat"),
                  tags$li(class = "mb-1", "Caza o extracción ilegal"),
                  tags$li(class = "mb-1", "Contaminación"),
                  tags$li(class = "mb-1", "Especies invasoras"),
                  tags$li(class = "mb-1", "Cambio climático"),
                  tags$li(class = "mb-1", "Enfermedades y parásitos")
                ),
                div(
                  class = "alert alert-warning py-1 px-2 small mt-2 mb-0",
                  bs_icon("lightbulb-fill", class = "me-1"),
                  "Variables: relevantes, medibles, sensibles y viables."
                )
              )
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