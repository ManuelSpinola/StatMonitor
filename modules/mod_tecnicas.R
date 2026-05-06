# ============================================================
# mod_tecnicas.R — Panorama de técnicas de análisis
# (esqueleto v1 — se desarrolla en siguiente iteración)
# ============================================================
mod_tecnicas_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(class = "py-3 px-2",
        h4(bs_icon("diagram-3", class = "me-2"),
           "Técnicas de análisis para monitoreo",
           style = paste0("color:", colores$primario, "; font-weight:700;")),
        p(class = "text-muted",
          "Panorama de los principales métodos estadísticos usados en monitoreo biológico: ",
          "TRIM, modelos de ocupación, CMR, diversidad y más.")
    ),
    div(class = "alert alert-info mx-2",
        bs_icon("hourglass-split", class = "me-2"),
        strong("Módulo en desarrollo."))
  )
}
mod_tecnicas_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}