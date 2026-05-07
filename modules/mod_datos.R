# ============================================================
# mod_datos.R — Carga y selección de datos
# StatMonitor · StatSuite · Manuel Spínola · ICOMVIS · UNA
# ============================================================

mod_datos_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(class = "py-3 px-2",
        h4(bs_icon("folder2-open", class = "me-2"),
           "Mis datos",
           style = paste0("color:", colores$primario, "; font-weight:700;")),
        p(class = "text-muted mb-3",
          "Cargá tus propios datos o usá los conjuntos de ejemplo incluidos en StatMonitor.")
    ),
    layout_columns(
      col_widths = c(4, 8),
      card(
        card_header(bs_icon("upload", class = "me-2"), "Cargar datos"),
        card_body(
          radioButtons(ns("fuente"), "Fuente de datos:",
                       choices = c("Datos de ejemplo" = "ejemplo",
                                   "Cargar archivo"   = "archivo"),
                       selected = "ejemplo"),
          conditionalPanel(
            condition = paste0("input['", ns("fuente"), "'] == 'archivo'"),
            fileInput(ns("archivo"), "Seleccioná un archivo CSV o Excel:",
                      accept = c(".csv", ".xlsx", ".xls"))
          ),
          conditionalPanel(
            condition = paste0("input['", ns("fuente"), "'] == 'ejemplo'"),
            selectInput(ns("ejemplo_sel"), "Conjunto de ejemplo:",
                        choices = c(
                          "Conteos de aves — Trogon (Sarapiquí)"       = "conteos_aves",
                          "Conteos de mamíferos — Danta (Tortuguero)"  = "conteos_mamiferos"
                        )),
            uiOutput(ns("nota_camaras"))
          ),
          actionButton(ns("cargar"), "Cargar datos",
                       class = "btn-primary w-100 mt-2",
                       icon = icon("play"))
        )
      ),
      card(
        card_header(bs_icon("table", class = "me-2"), "Vista previa"),
        card_body(
          uiOutput(ns("resumen_ui")),
          DTOutput(ns("preview"))
        )
      )
    )
  )
}

mod_datos_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    datos_r <- reactiveVal(NULL)
    
    # ── Nota pedagógica para cámaras trampa ─────────────
    output$nota_camaras <- renderUI({
      req(input$ejemplo_sel == "camaras")
      div(
        class = "alert alert-warning small py-2 px-3 mt-2 mb-0",
        bs_icon("info-circle-fill", class = "me-1"),
        strong("Datos de presencia/ausencia:"), " este conjunto es para ",
        "modelos de ocupación (", em("StatOcu"), "). ",
        "Para el módulo de Tendencias usá los conjuntos de conteos anuales."
      )
    })
    
    observeEvent(input$cargar, {
      if (input$fuente == "ejemplo") {
        datos_r(datos_ejemplo[[input$ejemplo_sel]])
      } else {
        req(input$archivo)
        ext <- tools::file_ext(input$archivo$name)
        df  <- leer_archivo(input$archivo$datapath, ext)
        datos_r(df)
      }
    })
    
    output$resumen_ui <- renderUI({
      df <- datos_r()
      if (is.null(df)) return(
        div(class = "text-muted small",
            bs_icon("info-circle", class = "me-1"),
            "Hacé clic en 'Cargar datos' para comenzar.")
      )
      div(class = "mb-2 small",
          span(class = "badge me-1",
               style = "background:#1170AA;color:white;",
               paste(nrow(df), "filas")),
          span(class = "badge",
               style = "background:#FC7D0B;color:white;",
               paste(ncol(df), "columnas"))
      )
    })
    
    output$preview <- renderDT({
      req(datos_r())
      datatable(head(datos_r(), 50),
                options = list(scrollX = TRUE, pageLength = 8,
                               dom = "tip"),
                rownames = FALSE)
    })
    
    return(datos_r)
  })
}