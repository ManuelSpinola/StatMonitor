# ============================================================
# mod_tendencias.R — Análisis de tendencias con rtrim
# (esqueleto v1 — se desarrolla en siguiente iteración)
# ============================================================
mod_tendencias_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(class = "py-3 px-2",
        h4(bs_icon("graph-up-arrow", class = "me-2"),
           "Tendencias poblacionales",
           style = paste0("color:", colores$primario, "; font-weight:700;")),
        p(class = "text-muted",
          "Análisis de tendencias en índices de abundancia mediante el modelo TRIM ",
          "(Trends and Indices for Monitoring data). Detecta si una población está ",
          "aumentando, disminuyendo o estable a lo largo del tiempo.")
    ),
    div(class = "alert alert-info mx-2",
        bs_icon("hourglass-split", class = "me-2"),
        strong("Módulo en desarrollo."),
        " Cargá primero los datos de conteos anuales en la pestaña 'Mis datos'.")
  )
}
mod_tendencias_server <- function(id, datos) {
  moduleServer(id, function(input, output, session) { })
}