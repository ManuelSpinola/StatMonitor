# ============================================================
# mod_tendencias.R — Análisis de tendencias poblacionales
# StatMonitor · StatSuite · Manuel Spínola · ICOMVIS · UNA
#
# Método: TRIM (Trends and Indices for Monitoring data)
# Paquete: rtrim (Bogaart, van der Loo, Pannekoek)
#
# Filosofía B: retorna tagList, nav_panel se define en app.R
# ============================================================

# ── UI ────────────────────────────────────────────────────
mod_tendencias_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    # ── Encabezado ────────────────────────────────────────
    div(
      class = "py-3 px-2",
      h4(
        bs_icon("graph-up-arrow", class = "me-2"),
        "Tendencias poblacionales — Modelo TRIM",
        style = paste0("color:", colores$primario, "; font-weight:700;")
      ),
      p(
        class = "text-muted mb-0",
        "TRIM (Trends and Indices for Monitoring data) estima índices de abundancia ",
        "y tasas de cambio poblacional a partir de conteos repetidos en sitios fijos, ",
        "manejando adecuadamente los datos faltantes."
      )
    ),
    
    navset_card_tab(
      
      # ── Pestaña 1: ¿Qué es TRIM? ──────────────────────
      nav_panel(
        title = tagList(bs_icon("book", class = "me-1"), "¿Qué es TRIM?"),
        card_body(
          layout_columns(
            col_widths = c(6, 6),
            
            div(
              h5(style = paste0("color:", colores$primario, "; font-weight:700;"),
                 "El modelo TRIM"),
              p(class = "small",
                "TRIM fue desarrollado por Statistics Netherlands para analizar datos de ",
                "monitoreo de aves, pero se aplica a cualquier grupo de organismos. ",
                "Usa un ", strong("modelo log-lineal"), " que descompone los conteos en:"
              ),
              tags$ul(
                class = "small",
                tags$li(strong("Efecto de sitio"),
                        " — diferencias de abundancia entre sitios"),
                tags$li(strong("Efecto de tiempo"),
                        " — cambio de abundancia entre años"),
                tags$li(strong("Sobredispersión"),
                        " — variabilidad extra en los conteos"),
                tags$li(strong("Autocorrelación serial"),
                        " — dependencia entre años consecutivos")
              ),
              p(class = "small",
                "Una ventaja clave: maneja ", strong("datos faltantes"),
                " (sitios no visitados en algún año) sin descartar el sitio completo."
              ),
              div(
                class = "alert alert-warning small py-2 px-3 mb-2",
                bs_icon("info-circle-fill", class = "me-1"),
                strong("Modelos disponibles:"), br(),
                "• Modelo 2 — impone una ", em("pendiente lineal"), " en el tiempo. ",
                "El error estándar es más pequeño porque comparte información entre años.", br(),
                "• Modelo 3 — estima un ", em("efecto independiente por año"),
                " (más flexible). Más honesto sobre la incertidumbre cuando ",
                "la tendencia no es estrictamente lineal."
              ),
              div(
                class = "alert alert-info small py-2 px-3 mb-0",
                bs_icon("lightbulb-fill", class = "me-1"),
                strong("Formato requerido:"), " los datos deben tener una columna de ",
                strong("sitio"), ", una de ", strong("año"), " y una de ",
                strong("conteo"), ". Los datos de cámaras trampa ",
                "(presencia/ausencia) no son compatibles con TRIM — ",
                "esos van en ", em("StatOcu"), " para modelos de ocupación."
              )
            ),
            
            div(
              h5(style = paste0("color:", colores$primario, "; font-weight:700;"),
                 "Estructura de los datos para TRIM"),
              # SVG — matriz sitios × años
              # viewBox ampliado, etiqueta Sitios debajo de la matriz
              tags$svg(
                xmlns = "http://www.w3.org/2000/svg",
                viewBox = "0 0 430 240",
                width = "100%",
                
                # Título eje X (arriba)
                tags$text(x="260", y="14", `text-anchor`="middle",
                          `font-size`="11", `font-weight`="700",
                          fill=colores$primario, "Años de muestreo"),
                
                # Cabecera años — fila y=30
                tags$text(x="80",  y="30", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "2018"),
                tags$text(x="138", y="30", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "2019"),
                tags$text(x="196", y="30", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "2020"),
                tags$text(x="254", y="30", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "2021"),
                tags$text(x="312", y="30", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "2022"),
                tags$text(x="370", y="30", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "2023"),
                
                # Sitio 1 — y base = 40
                tags$text(x="42", y="58", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "Sitio 1"),
                tags$rect(x="57",  y="44", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="80",  y="61", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "12"),
                tags$rect(x="115", y="44", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="138", y="61", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "9"),
                tags$rect(x="173", y="44", width="46", height="26", rx="4",
                          fill="#FFE8D6", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="196", y="61", `text-anchor`="middle",
                          `font-size`="10", fill=colores$peligro, "NA"),
                tags$rect(x="231", y="44", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="254", y="61", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "7"),
                tags$rect(x="289", y="44", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="312", y="61", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "6"),
                tags$rect(x="347", y="44", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="370", y="61", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "4"),
                
                # Sitio 2 — y base = 76
                tags$text(x="42", y="94", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "Sitio 2"),
                tags$rect(x="57",  y="80", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="80",  y="97", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "8"),
                tags$rect(x="115", y="80", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="138", y="97", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "11"),
                tags$rect(x="173", y="80", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="196", y="97", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "7"),
                tags$rect(x="231", y="80", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="254", y="97", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "9"),
                tags$rect(x="289", y="80", width="46", height="26", rx="4",
                          fill="#FFE8D6", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="312", y="97", `text-anchor`="middle",
                          `font-size`="10", fill=colores$peligro, "NA"),
                tags$rect(x="347", y="80", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="370", y="97", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "5"),
                
                # Sitio 3 — y base = 112
                tags$text(x="42", y="130", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "Sitio 3"),
                tags$rect(x="57",  y="116", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="80",  y="133", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "15"),
                tags$rect(x="115", y="116", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="138", y="133", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "13"),
                tags$rect(x="173", y="116", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="196", y="133", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "10"),
                tags$rect(x="231", y="116", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="254", y="133", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "8"),
                tags$rect(x="289", y="116", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="312", y="133", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "6"),
                tags$rect(x="347", y="116", width="46", height="26", rx="4",
                          fill="#EEF3FA", stroke=colores$borde, `stroke-width`="1"),
                tags$text(x="370", y="133", `text-anchor`="middle",
                          `font-size`="10", fill=colores$texto, "5"),
                
                # Puntos suspensivos
                tags$text(x="215", y="162", `text-anchor`="middle",
                          `font-size`="14", fill=colores$texto, "· · · · · ·"),
                tags$text(x="42",  y="162", `text-anchor`="middle",
                          `font-size`="11", fill=colores$texto, "..."),
                
                # Etiqueta eje Y — debajo de la matriz, sin rotar
                tags$text(x="42", y="180", `text-anchor`="middle",
                          `font-size`="11", `font-weight`="700",
                          fill=colores$primario, "↑ Sitios"),
                
                # Leyenda
                tags$rect(x="57",  y="193", width="14", height="10",
                          rx="2", fill="#EEF3FA", stroke=colores$borde,
                          `stroke-width`="1"),
                tags$text(x="77", y="202", `font-size`="9",
                          fill=colores$texto, "Conteo observado"),
                tags$rect(x="210", y="193", width="14", height="10",
                          rx="2", fill="#FFE8D6", stroke=colores$borde,
                          `stroke-width`="1"),
                tags$text(x="230", y="202", `font-size`="9",
                          fill=colores$peligro, "Dato faltante (TRIM lo imputa)")
              ),
              p(class = "small text-muted mt-2 mb-0",
                "Cada celda es el conteo en un sitio y año. ",
                "TRIM estima los valores faltantes a partir de la tendencia general."
              )
            )
          )
        )
      ),
      
      # ── Pestaña 2: Configurar análisis ────────────────
      nav_panel(
        title = tagList(bs_icon("sliders", class = "me-1"), "Configurar análisis"),
        card_body(
          layout_columns(
            col_widths = c(4, 8),
            
            card(
              card_header(bs_icon("gear-fill", class = "me-1"),
                          "Parámetros del modelo"),
              card_body(
                uiOutput(ns("sel_cols_ui")),
                hr(),
                selectInput(
                  ns("modelo"),
                  label   = "Modelo TRIM:",
                  choices = c("Modelo 2 — tendencia lineal" = "2",
                              "Modelo 3 — efectos por año"  = "3"),
                  selected = "3"
                ),
                checkboxInput(ns("serialcor"),
                              "Autocorrelación serial", value = TRUE),
                checkboxInput(ns("overdisp"),
                              "Sobredispersión", value = TRUE),
                hr(),
                actionButton(ns("correr"), "Correr TRIM",
                             class = "btn-primary w-100",
                             icon  = icon("play")),
                uiOutput(ns("msg_datos"))
              )
            ),
            
            div(
              uiOutput(ns("cards_resultado")),
              uiOutput(ns("tabla_slope_ui"))
            )
          )
        )
      ),
      
      # ── Pestaña 3: Gráfico de tendencia ───────────────
      nav_panel(
        title = tagList(bs_icon("graph-up", class = "me-1"), "Gráfico de tendencia"),
        card_body(uiOutput(ns("grafico_ui")))
      ),
      
      # ── Pestaña 4: Índices por año ────────────────────
      nav_panel(
        title = tagList(bs_icon("table", class = "me-1"), "Índices por año"),
        card_body(uiOutput(ns("tabla_indices_ui")))
      )
    )
  )
}

# ── Server ───────────────────────────────────────────────
mod_tendencias_server <- function(id, datos) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    df_activo <- reactive({
      datos()
    })
    
    # ── UI dinámica: selección de columnas ──────────────
    output$sel_cols_ui <- renderUI({
      df <- df_activo()
      if (is.null(df)) {
        return(div(class = "alert alert-warning small py-2",
                   bs_icon("exclamation-triangle", class = "me-1"),
                   "Cargá datos en 'Mis datos' primero."))
      }
      cols <- names(df)
      tagList(
        selectInput(ns("col_sitio"), "Columna de sitio:",
                    choices  = cols,
                    selected = if ("site" %in% cols) "site" else cols[1]),
        selectInput(ns("col_anio"), "Columna de año:",
                    choices  = cols,
                    selected = if ("year" %in% cols) "year" else cols[2]),
        selectInput(ns("col_conteo"), "Columna de conteo:",
                    choices  = cols,
                    selected = if ("count" %in% cols) "count" else cols[3])
      )
    })
    
    output$msg_datos <- renderUI({
      if (is.null(df_activo())) return(NULL)
      div(class = "small text-muted mt-2",
          bs_icon("check-circle-fill",
                  style = paste0("color:", colores$exito),
                  class = "me-1"),
          paste(nrow(df_activo()), "registros listos para analizar."))
    })
    
    # ── Resultado TRIM ───────────────────────────────────
    trim_result <- eventReactive(input$correr, {
      df <- df_activo()
      req(df, input$col_sitio, input$col_anio, input$col_conteo)
      
      df_trim <- df |>
        rename(
          site  = !!sym(input$col_sitio),
          year  = !!sym(input$col_anio),
          count = !!sym(input$col_conteo)
        ) |>
        select(site, year, count) |>
        mutate(
          site  = as.factor(site),
          year  = as.integer(year),
          count = as.integer(count)
        )
      
      withProgress(message = "Ajustando modelo TRIM...", value = 0.5, {
        tryCatch({
          z <- trim(
            count ~ site + year,
            data      = df_trim,
            model     = as.integer(input$modelo),
            serialcor = input$serialcor,
            overdisp  = input$overdisp
          )
          incProgress(0.5)
          z
        }, error = function(e) {
          showNotification(
            paste("Error en TRIM:", conditionMessage(e)),
            type = "error", duration = 8
          )
          NULL
        })
      })
    })
    
    # ── Extrae slope de forma segura para modelo 2 y 3 ──
    # En rtrim, overall()$slope usa $p (no $p_add)
    extraer_slope <- function(z) {
      ov <- overall(z)
      sl <- ov$slope
      # El campo real es $p — crear $p_add como alias para compatibilidad
      if (is.null(sl$p_add) || length(sl$p_add) == 0) {
        sl$p_add <- if (!is.null(sl$p) && length(sl$p) > 0)
          sl$p else NA_real_
      }
      if (is.null(sl$add)    || length(sl$add)    == 0) sl$add    <- 0
      if (is.null(sl$se_add) || length(sl$se_add) == 0) sl$se_add <- NA_real_
      sl
    }
    
    # ── Cards resultado ──────────────────────────────────
    output$cards_resultado <- renderUI({
      z <- trim_result()
      if (is.null(z)) return(
        div(class = "text-muted small py-3",
            bs_icon("arrow-left-circle", class = "me-1"),
            "Configurá el modelo y hacé clic en 'Correr TRIM'.")
      )
      
      ov    <- overall(z)
      sl    <- extraer_slope(z)
      pct   <- round((exp(sl$add) - 1) * 100, 2)
      p_val <- if (is.na(sl$p_add)) 1 else sl$p_add
      
      icono <- if (p_val >= 0.05) "dash-circle-fill" else
        if (pct > 0) "arrow-up-circle-fill" else "arrow-down-circle-fill"
      color <- if (p_val >= 0.05) colores$acento else
        if (pct > 0) colores$exito else colores$peligro
      texto <- if (p_val >= 0.05) "Sin tendencia significativa" else
        if (pct > 0) "Incremento significativo" else "Decremento significativo"
      
      ci_lo <- if (is.na(sl$se_add)) "—" else
        round((exp(sl$add - 1.96 * sl$se_add) - 1) * 100, 1)
      ci_hi <- if (is.na(sl$se_add)) "—" else
        round((exp(sl$add + 1.96 * sl$se_add) - 1) * 100, 1)
      
      layout_columns(
        col_widths = c(4, 4, 4),
        card(
          class = "text-center",
          card_body(
            bs_icon(icono, size = "2em", style = paste0("color:", color)),
            h6(class = "mt-1 mb-0",
               style  = paste0("color:", color, "; font-weight:700;"),
               texto)
          )
        ),
        card(
          class = "text-center",
          card_body(
            h3(style = paste0("color:", colores$primario, "; font-weight:700;"),
               paste0(ifelse(pct > 0, "+", ""), pct, "%")),
            p(class = "small text-muted mb-0", "Tasa de cambio anual"),
            p(class = "small text-muted mb-0",
              paste0("IC 95%: [", ci_lo, "%, ", ci_hi, "%]"))
          )
        ),
        card(
          class = "text-center",
          card_body(
            h3(style = paste0("color:", colores$secundario, "; font-weight:700;"),
               ifelse(is.na(p_val), "p = n/d",
                      ifelse(p_val < 0.001, "p < 0.001",
                             paste0("p = ", round(p_val, 3))))),
            p(class = "small text-muted mb-0", "Valor p (pendiente)"),
            p(class = "small text-muted mb-0",
              paste0("Modelo ", input$modelo, " · ",
                     nlevels(as.factor(df_activo()[[input$col_sitio]])),
                     " sitios"))
          )
        )
      )
    })
    
    # ── Tabla slope ──────────────────────────────────────
    output$tabla_slope_ui <- renderUI({
      z <- trim_result()
      if (is.null(z)) return(NULL)
      sl    <- extraer_slope(z)
      ov    <- overall(z)
      p_val <- if (is.na(sl$p_add)) NA_real_ else sl$p_add
      card(
        class = "mt-3",
        card_header(bs_icon("calculator", class = "me-1"),
                    "Parámetros de la tendencia general"),
        card_body(
          tags$table(
            class = "table table-sm table-striped small mb-0",
            tags$thead(
              tags$tr(tags$th("Parámetro"), tags$th("Estimado"),
                      tags$th("EE"), tags$th("Valor p"))
            ),
            tags$tbody(
              tags$tr(
                tags$td("Pendiente aditiva (log)"),
                tags$td(round(sl$add,    4)),
                tags$td(round(sl$se_add, 4)),
                tags$td(ifelse(is.na(p_val), "—",
                               ifelse(p_val < 0.001, "< 0.001",
                                      round(p_val, 4))))
              ),
              tags$tr(
                tags$td("Pendiente multiplicativa"),
                tags$td(round(sl$mul,    4)),
                tags$td(round(sl$se_mul, 4)),
                tags$td("—")
              )
            )
          )
        )
      )
    })
    
    # ── Gráfico ──────────────────────────────────────────
    output$grafico_ui <- renderUI({
      z <- trim_result()
      if (is.null(z)) return(
        div(class = "text-muted small py-3 text-center",
            bs_icon("graph-up", size = "2em", class = "d-block mb-2"),
            "Corré el modelo TRIM primero.")
      )
      plotOutput(ns("plot_trim"), height = "420px")
    })
    
    output$plot_trim <- renderPlot({
      z  <- trim_result()
      req(z)
      sl    <- extraer_slope(z)
      ov    <- overall(z)
      p_val <- if (is.na(sl$p_add)) 1 else sl$p_add
      
      ov <- overall(z)
      
      df_plot <- data.frame(
        year  = ov$timept,
        index = ov$tt,
        se    = ov$err
      ) |>
        mutate(
          lower  = index - 1.96 * se,
          upper  = index + 1.96 * se,
          fit    = if (input$modelo == "2") {
            exp(log(index[1]) + sl$add * (year - min(year)))
          } else {
            index
          },
          fit_lo = if (!is.na(sl$se_add)) fit * exp(-1.96 * sl$se_add) else lower,
          fit_hi = if (!is.na(sl$se_add)) fit * exp( 1.96 * sl$se_add) else upper
        )
      
      pct     <- round((exp(sl$add) - 1) * 100, 2)
      p_txt   <- ifelse(is.na(sl$p_add), "p = n/d",
                        ifelse(sl$p_add < 0.001, "p < 0.001",
                               paste0("p = ", round(sl$p_add, 3))))
      col_lin <- if (p_val >= 0.05) colores$acento else
        if (pct > 0) colores$exito else colores$peligro
      
      ggplot(df_plot, aes(x = year)) +
        geom_ribbon(aes(ymin = fit_lo, ymax = fit_hi),
                    fill = col_lin, alpha = 0.15) +
        geom_ribbon(aes(ymin = lower, ymax = upper),
                    fill = colores$secundario, alpha = 0.20) +
        geom_line(aes(y = fit), color = col_lin, linewidth = 1.2) +
        geom_line(aes(y = index), color = colores$primario,
                  linewidth = 0.9, linetype = "dotted") +
        geom_pointrange(aes(y = index, ymin = lower, ymax = upper),
                        color = colores$primario, size = 0.5) +
        annotate(
          "label",
          x     = min(df_plot$year) + 0.3,
          y     = max(df_plot$upper) * 0.97,
          hjust = 0, size = 3.5,
          fill  = "#FAFCFF", color = col_lin, label.size = 0.5,
          label = paste0(
            "Tasa de cambio: ", ifelse(pct > 0, "+", ""), pct, "% / año\n",
            p_txt
          )
        ) +
        scale_x_continuous(breaks = df_plot$year) +
        labs(
          title    = "Tendencia poblacional — Modelo TRIM",
          subtitle = paste0(
            "Línea: tendencia ajustada (Modelo ", input$modelo, ")  ·  ",
            "Puntos: índice observado ± IC 95%"
          ),
          x = "Año",
          y = "Índice de abundancia"
        ) +
        theme_minimal(base_size = 13) +
        theme(
          plot.title       = element_text(color = colores$primario,
                                          face = "bold", size = 14),
          plot.subtitle    = element_text(color = colores$texto, size = 11),
          panel.grid.minor = element_blank(),
          axis.text.x      = element_text(angle = 45, hjust = 1)
        )
    }, res = 110)
    
    # ── Tabla índices por año ────────────────────────────
    output$tabla_indices_ui <- renderUI({
      z <- trim_result()
      if (is.null(z)) return(
        div(class = "text-muted small py-3 text-center",
            "Corré el modelo TRIM primero.")
      )
      DTOutput(ns("tabla_indices"))
    })
    
    output$tabla_indices <- renderDT({
      z  <- trim_result()
      req(z)
      
      ov <- overall(z)
      
      df_tbl <- data.frame(
        Año             = ov$timept,
        Índice          = round(ov$tt,  3),
        EE              = round(ov$err, 3),
        `IC inf. (95%)` = round(ov$tt - 1.96 * ov$err, 3),
        `IC sup. (95%)` = round(ov$tt + 1.96 * ov$err, 3),
        check.names = FALSE
      )
      
      # styleColorBar falla si el mínimo == 0; añadir pequeño offset
      rng_safe <- c(min(df_tbl$Índice) * 0.95, max(df_tbl$Índice) * 1.05)
      
      datatable(
        df_tbl,
        rownames = FALSE,
        options  = list(dom = "t", pageLength = 20, scrollX = TRUE),
        class    = "table-sm table-striped"
      ) |>
        formatStyle(
          "Índice",
          background         = styleColorBar(rng_safe, colores$secundario),
          backgroundSize     = "100% 80%",
          backgroundRepeat   = "no-repeat",
          backgroundPosition = "center"
        )
    })
  })
}