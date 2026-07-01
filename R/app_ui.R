#' Application UI
#'
#' @return A Shiny UI object.
#' @noRd
app_ui <- function() {

  golem::add_resource_path(
    "www",
    system.file("app/www", package = "StatMonitor")
  )

  page_navbar(
    title = div(
      style = "display: flex; align-items: center; gap: 10px; margin-top: 4px;",
      img(src = "www/hexsticker_StatMonitor.png", height = "38px"),
      span("StatMonitor", style = "font-weight: 600;")
    ),
    theme  = tema_app,
    lang   = "es",
    footer = div(
      class = "text-center small py-2",
      style = paste0("background:", colores$primario, "; color: white;"),
      "Manuel Sp\u00ednola \u00b7 ICOMVIS \u00b7 Universidad Nacional \u00b7 Costa Rica"
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
      title = "T\u00e9cnicas de an\u00e1lisis",
      icon  = bs_icon("diagram-3"),
      mod_tecnicas_ui("tecnicas")
    ),
    mod_acerca_de_ui("acerca_de"),

    nav_spacer(),
    nav_item(tags$span(class = "text-muted small", "StatMonitor v1.0"))
  )
}
