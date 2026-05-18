#' Application Server
#'
#' @param input,output,session Internal parameters for Shiny.
#' @noRd
app_server <- function(input, output, session) {

  # mod_datos devuelve reactive() con la lista de datasets activos
  datos_activos <- mod_datos_server("datos")

  mod_conceptos_server("conceptos")
  mod_tendencias_server("tendencias", datos = datos_activos)
  mod_tecnicas_server("tecnicas")
  mod_acerca_de_server("acerca_de")
}
