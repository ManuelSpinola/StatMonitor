# ============================================================
# mod_acerca_de.R — Información, paquetes y citas
# ============================================================
mod_acerca_de_ui <- function(id) {
  ns <- NS(id)
  nav_panel(
    title = "Acerca de",
    icon  = bs_icon("info-circle"),
    tagList(
      div(class = "py-3 px-2",
          h4(bs_icon("info-circle-fill", class = "me-2"),
             "Acerca de StatMonitor",
             style = paste0("color:", colores$primario, "; font-weight:700;")),
          p(class = "text-muted",
            strong("StatMonitor"), " es parte de ", strong("StatSuite"),
            ", una suite de aplicaciones estadísticas para biólogos y estudiantes ",
            "de recursos naturales desarrollada por ",
            strong("Manuel Spínola"),
            " (ICOMVIS, Universidad Nacional, Costa Rica)."
          )
      ),
      layout_columns(
        col_widths = c(6, 6),
        card(
          card_header(bs_icon("collection", class = "me-2"), "StatSuite — apps disponibles"),
          card_body(
            tags$ul(
              class = "small",
              tags$li(strong("StatDesign"),  " — Diseño de estudios y muestreo"),
              tags$li(strong("StatFlow"),    " — Primeros análisis y visualización"),
              tags$li(strong("StatGeo"),     " — Análisis y visualización espacial (SIG)"),
              tags$li(strong("StatMonitor"), " — Monitoreo biológico ← esta app"),
              tags$li(em("StatOcu"),         " — Modelos de ocupación (próximamente)")
            )
          )
        ),
        card(
          card_header(bs_icon("box-seam", class = "me-2"), "Paquetes de R utilizados"),
          card_body(uiOutput(ns("tabla_paquetes")))
        )
      ),
      card(
        card_header(bs_icon("book", class = "me-2"), "Citas y reconocimientos"),
        card_body(
          p(class = "small",
            strong("Asistencia en desarrollo:"), " Claude (Anthropic, 2026). ",
            "Asistencia de inteligencia artificial en el desarrollo de StatMonitor."
          ),
          p(class = "small",
            strong("R Core Team"), " (", R.version$year, "). R: A language and environment ",
            "for statistical computing. R Foundation for Statistical Computing, Vienna, Austria."
          ),
          p(class = "small",
            strong("Bogaart P, van der Loo M, Pannekoek J"), " (2023). rtrim: Trends and Indices ",
            "for Monitoring Data. R package. https://CRAN.R-project.org/package=rtrim"
          )
        )
      )
    )
  )
}

mod_acerca_de_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$tabla_paquetes <- renderUI({
      paquetes  <- c("shiny", "bslib", "bsicons", "tidyverse", "DT",
                     "rtrim", "vegan", "scales", "readxl")
      versiones <- sapply(paquetes, function(p) {
        tryCatch(as.character(packageVersion(p)), error = function(e) "—")
      })
      tags$table(
        class = "table table-sm table-striped small",
        tags$thead(tags$tr(tags$th("Paquete"), tags$th("Versión"))),
        tags$tbody(
          mapply(function(p, v) tags$tr(tags$td(strong(p)), tags$td(v)),
                 paquetes, versiones, SIMPLIFY = FALSE)
        )
      )
    })
  })
}