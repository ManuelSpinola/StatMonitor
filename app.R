# ============================================================
# app.R — Punto de entrada de StatMonitor
#
# Este archivo SOLO:
#   1. Carga librerías y helpers compartidos
#   2. Carga los módulos
#   3. Define ui y server ensamblando los módulos
#
# La lógica de cada pestaña vive en modules/mod_*.R
# Las funciones compartidas viven en R/helpers.R
# ============================================================

# ── 1. Librerías y helpers ─────────────────────────────────
source("R/helpers.R")

# ── 2. Módulos ─────────────────────────────────────────────
source("modules/mod_conceptos.R")
source("modules/mod_datos.R")
source("modules/mod_tendencias.R")
source("modules/mod_tecnicas.R")
source("modules/mod_acerca_de.R")

# ── 3. UI ──────────────────────────────────────────────────
ui <- page_navbar(
  title = div(
    style = "display: flex; align-items: center; gap: 10px; margin-top: 4px;",
    img(src = "hexsticker_StatMonitor.png", height = "38px"),
    span("StatMonitor", style = "font-weight: 600;")
  ),
  theme  = tema_app,
  lang   = "es",
  footer = div(
    class = "text-center text-muted small py-2",
    style = paste0("border-top: 1px solid ", colores$borde, ";"),
    "Manuel Spínola · ICOMVIS · Universidad Nacional · Costa Rica"
  ),
  
  nav_panel(
    title = "Conceptos",
    icon  = bs_icon("book"),
    mod_conceptos_ui("conceptos")
  ),
  nav_panel(
    title = "Mis datos",
    icon  = bs_icon("folder2-open"),
    mod_datos_ui("datos")
  ),
  nav_panel(
    title = "Tendencias",
    icon  = bs_icon("graph-up-arrow"),
    mod_tendencias_ui("tendencias")
  ),
  nav_panel(
    title = "Técnicas de análisis",
    icon  = bs_icon("diagram-3"),
    mod_tecnicas_ui("tecnicas")
  ),
  mod_acerca_de_ui("acerca_de"),
  
  nav_spacer(),
  nav_item(tags$span(class = "text-muted small", "StatMonitor v1.0"))
)

# ── 4. Server ──────────────────────────────────────────────
server <- function(input, output, session) {
  
  # mod_datos devuelve reactive() con la lista de datasets activos
  datos_activos <- mod_datos_server("datos")
  
  mod_conceptos_server("conceptos")
  mod_tendencias_server("tendencias", datos = datos_activos)
  mod_tecnicas_server("tecnicas")
  mod_acerca_de_server("acerca_de")
}

# ── 5. Lanzar ──────────────────────────────────────────────
shinyApp(ui, server)