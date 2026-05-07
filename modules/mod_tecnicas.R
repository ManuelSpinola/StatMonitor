# ============================================================
# mod_tecnicas.R — Panorama de técnicas de análisis
# StatMonitor · StatSuite · Manuel Spínola · ICOMVIS · UNA
#
# Filosofía B: retorna tagList, nav_panel se define en app.R
# ============================================================

mod_tecnicas_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    # ── Encabezado ──────────────────────────────────────
    div(
      class = "py-3 px-2",
      h4(
        bs_icon("diagram-3", class = "me-2"),
        "Técnicas de análisis para monitoreo biológico",
        style = paste0("color:", colores$primario, "; font-weight:700;")
      ),
      p(
        class = "text-muted mb-0",
        "Panorama de los principales métodos estadísticos usados en programas ",
        "de monitoreo. Los métodos se organizan según el tipo de parámetro ",
        "que se quiere monitorear: ", strong("poblacional"), " o ",
        strong("comunitario"), "."
      )
    ),
    
    navset_card_tab(
      
      # ── Pestaña 1: ¿Qué método usar? ──────────────────
      nav_panel(
        title = tagList(bs_icon("map", class = "me-1"), "¿Qué método usar?"),
        card_body(
          layout_columns(
            col_widths = c(5, 7),
            
            div(
              h5(style = paste0("color:", colores$primario, "; font-weight:700;"),
                 "Parámetros poblacionales"),
              p(class = "small text-muted",
                "Se enfocan en una sola especie o grupo:"),
              tags$ul(class = "small",
                      tags$li(class = "mb-2",
                              strong(style = paste0("color:", colores$acento),
                                     "TRIM"), br(),
                              "Conteos repetidos en sitios fijos. Estima índices de ",
                              "abundancia y tasa de cambio anual. Maneja datos faltantes."),
                      tags$li(class = "mb-2",
                              strong(style = paste0("color:", colores$secundario),
                                     "Modelos de ocupación"), br(),
                              "Datos de presencia/ausencia con visitas repetidas. ",
                              "Estima la probabilidad de que un sitio esté ocupado, ",
                              "corrigiendo por detección imperfecta."),
                      tags$li(class = "mb-2",
                              strong(style = paste0("color:", colores$peligro),
                                     "CMR — Captura-Marcaje-Recaptura"), br(),
                              "Individuos marcados y recapturados. Estima abundancia ",
                              "absoluta, supervivencia y reclutamiento.")
              ),
              hr(),
              h5(style = paste0("color:#9F8B75; font-weight:700;"),
                 "Parámetros comunitarios"),
              p(class = "small text-muted",
                "Se enfocan en la comunidad completa de especies:"),
              tags$ul(class = "small",
                      tags$li(class = "mb-2",
                              strong(style = "color:#9F8B75",
                                     "Índices de diversidad en el tiempo"), br(),
                              "Riqueza, Shannon, Simpson monitoreados por sitio y año. ",
                              "Detectan cambios en la diversidad de la comunidad."),
                      tags$li(class = "mb-2",
                              strong(style = "color:#B85A0D",
                                     "Diversidad beta y composición"), br(),
                              "Similitud entre sitios y entre períodos. Detecta ",
                              "reemplazos de especies y cambios en la composición.")
              )
            ),
            
            # SVG árbol de decisión
            div(
              h6(style = paste0("color:", colores$primario, ";"),
                 "Árbol de decisión — ¿qué quieres monitorear?"),
              tags$svg(
                xmlns = "http://www.w3.org/2000/svg",
                viewBox = "0 0 440 480",
                width = "100%",
                
                # Raíz
                tags$rect(x="120", y="8", width="200", height="36",
                          rx="8", fill=colores$primario),
                tags$text(x="220", y="22", `text-anchor`="middle",
                          `font-size`="10.5", `font-weight`="700",
                          fill="white", "¿Qué quieres"),
                tags$text(x="220", y="36", `text-anchor`="middle",
                          `font-size`="10.5", `font-weight`="700",
                          fill="white", "monitorear?"),
                
                # Líneas raíz → nivel 1
                tags$line(x1="220", y1="44", x2="110", y2="78",
                          stroke=colores$borde, `stroke-width`="1.8"),
                tags$line(x1="220", y1="44", x2="330", y2="78",
                          stroke=colores$borde, `stroke-width`="1.8"),
                
                # Nodo izq — Una especie
                tags$rect(x="20", y="78", width="180", height="34",
                          rx="7", fill=colores$primario),
                tags$text(x="110", y="92", `text-anchor`="middle",
                          `font-size`="10", `font-weight`="700",
                          fill="white", "Una especie"),
                tags$text(x="110", y="105", `text-anchor`="middle",
                          `font-size`="8.5", fill="#C8D9EC",
                          "parámetros poblacionales"),
                
                # Nodo der — Una comunidad
                tags$rect(x="240", y="78", width="180", height="34",
                          rx="7", fill="#9F8B75"),
                tags$text(x="330", y="92", `text-anchor`="middle",
                          `font-size`="10", `font-weight`="700",
                          fill="white", "Una comunidad"),
                tags$text(x="330", y="105", `text-anchor`="middle",
                          `font-size`="8.5", fill="#EEF3FA",
                          "parámetros comunitarios"),
                
                # Pregunta dato — rama poblacional
                tags$text(x="110", y="128", `text-anchor`="middle",
                          `font-size`="8.5", fill=colores$texto,
                          "¿Qué dato puedes colectar?"),
                tags$line(x1="110", y1="112", x2="42",  y2="138",
                          stroke=colores$borde, `stroke-width`="1.3",
                          `stroke-dasharray`="3,2"),
                tags$line(x1="110", y1="112", x2="110", y2="138",
                          stroke=colores$borde, `stroke-width`="1.3",
                          `stroke-dasharray`="3,2"),
                tags$line(x1="110", y1="112", x2="178", y2="138",
                          stroke=colores$borde, `stroke-width`="1.3",
                          `stroke-dasharray`="3,2"),
                
                # TRIM
                tags$rect(x="5", y="138", width="74", height="62",
                          rx="6", fill=colores$acento),
                tags$text(x="42", y="154", `text-anchor`="middle",
                          `font-size`="10", `font-weight`="700",
                          fill="white", "TRIM"),
                tags$text(x="42", y="167", `text-anchor`="middle",
                          `font-size`="8", fill="white", "Conteos por"),
                tags$text(x="42", y="178", `text-anchor`="middle",
                          `font-size`="8", fill="white", "sitio y año"),
                
                # Ocupación
                tags$rect(x="73", y="138", width="74", height="62",
                          rx="6", fill=colores$secundario),
                tags$text(x="110", y="154", `text-anchor`="middle",
                          `font-size`="9.5", `font-weight`="700",
                          fill="white", "Ocupación"),
                tags$text(x="110", y="167", `text-anchor`="middle",
                          `font-size`="8", fill="white", "Presencia/"),
                tags$text(x="110", y="178", `text-anchor`="middle",
                          `font-size`="8", fill="white", "ausencia (0/1)"),
                
                # CMR
                tags$rect(x="141", y="138", width="74", height="62",
                          rx="6", fill=colores$peligro),
                tags$text(x="178", y="154", `text-anchor`="middle",
                          `font-size`="10", `font-weight`="700",
                          fill="white", "CMR"),
                tags$text(x="178", y="167", `text-anchor`="middle",
                          `font-size`="8", fill="white", "Individuos"),
                tags$text(x="178", y="178", `text-anchor`="middle",
                          `font-size`="8", fill="white", "marcados"),
                
                # Pregunta dentro/entre — rama comunitaria
                tags$text(x="330", y="128", `text-anchor`="middle",
                          `font-size`="8.5", fill=colores$texto,
                          "¿Dentro o entre sitios?"),
                tags$line(x1="330", y1="112", x2="278", y2="138",
                          stroke=colores$borde, `stroke-width`="1.3",
                          `stroke-dasharray`="3,2"),
                tags$line(x1="330", y1="112", x2="382", y2="138",
                          stroke=colores$borde, `stroke-width`="1.3",
                          `stroke-dasharray`="3,2"),
                
                # Diversidad alfa
                tags$rect(x="228", y="138", width="100", height="62",
                          rx="6", fill="#9F8B75"),
                tags$text(x="278", y="154", `text-anchor`="middle",
                          `font-size`="9.5", `font-weight`="700",
                          fill="white", "Diversidad α"),
                tags$text(x="278", y="167", `text-anchor`="middle",
                          `font-size`="8", fill="white", "Riqueza, Shannon,"),
                tags$text(x="278", y="178", `text-anchor`="middle",
                          `font-size`="8", fill="white", "Simpson por"),
                tags$text(x="278", y="189", `text-anchor`="middle",
                          `font-size`="8", fill="white", "sitio y año"),
                tags$text(x="278", y="191", `text-anchor`="middle",
                          `font-size`="8", fill="#EEF3FA", ""),
                
                # Diversidad beta
                tags$rect(x="332", y="138", width="100", height="62",
                          rx="6", fill="#B85A0D"),
                tags$text(x="382", y="154", `text-anchor`="middle",
                          `font-size`="9.5", `font-weight`="700",
                          fill="white", "Diversidad β"),
                tags$text(x="382", y="167", `text-anchor`="middle",
                          `font-size`="8", fill="white", "Recambio entre"),
                tags$text(x="382", y="178", `text-anchor`="middle",
                          `font-size`="8", fill="white", "sitios o entre"),
                tags$text(x="382", y="189", `text-anchor`="middle",
                          `font-size`="8", fill="white", "períodos"),
                
                # Separador
                tags$line(x1="10", y1="218", x2="430", y2="218",
                          stroke=colores$borde, `stroke-width`="1",
                          `stroke-dasharray`="4,3"),
                tags$text(x="220", y="234", `text-anchor`="middle",
                          `font-size`="10", `font-weight`="700",
                          fill=colores$primario,
                          "¿Cuál es la diferencia entre diversidad α y β?"),
                
                # Caja alfa
                tags$rect(x="10", y="244", width="200", height="108",
                          rx="8", fill="#EEF3FA",
                          stroke="#9F8B75", `stroke-width`="2"),
                tags$text(x="110", y="262", `text-anchor`="middle",
                          `font-size`="10", `font-weight`="700",
                          fill="#9F8B75", "Diversidad alfa (α)"),
                tags$text(x="110", y="278", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "Diversidad DENTRO de un sitio"),
                tags$text(x="110", y="292", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "¿Cuántas especies hay aquí?"),
                tags$text(x="110", y="306", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "¿Cambia con el tiempo?"),
                tags$rect(x="25", y="332", width="170", height="16",
                          rx="4", fill="#9F8B75"),
                tags$text(x="110", y="344", `text-anchor`="middle",
                          `font-size`="8.5", fill="white",
                          "¿Qué hay en este restaurante?"),
                
                # Caja beta
                tags$rect(x="230", y="244", width="200", height="108",
                          rx="8", fill="#FFF3EC",
                          stroke="#B85A0D", `stroke-width`="2"),
                tags$text(x="330", y="262", `text-anchor`="middle",
                          `font-size`="10", `font-weight`="700",
                          fill="#B85A0D", "Diversidad beta (β)"),
                tags$text(x="330", y="278", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "Recambio ENTRE sitios o períodos"),
                tags$text(x="330", y="292", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "¿Cambia la composición de"),
                tags$text(x="330", y="306", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "especies entre sitios o años?"),
                tags$rect(x="245", y="332", width="170", height="16",
                          rx="4", fill="#B85A0D"),
                tags$text(x="330", y="344", `text-anchor`="middle",
                          `font-size`="8.5", fill="white",
                          "¿Difiere el menú entre restaurantes?"),
                
                # Nota final
                tags$rect(x="10", y="364", width="420", height="106",
                          rx="6", fill="#FFF8EC",
                          stroke=colores$advertencia, `stroke-width`="1.5"),
                tags$text(x="220", y="380", `text-anchor`="middle",
                          `font-size`="9.5", `font-weight`="700",
                          fill="#B85A0D", "Principio fundamental:"),
                tags$text(x="220", y="395", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "El tipo de dato que puedes colectar define el método,"),
                tags$text(x="220", y="409", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "no al revés. La pregunta biológica guía el diseño"),
                tags$text(x="220", y="423", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "del muestreo, y el diseño determina qué análisis"),
                tags$text(x="220", y="437", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "es posible aplicar.")
              )
            )
          )
        )
      ),
      
      # ── Pestaña 2: TRIM ───────────────────────────────
      nav_panel(
        title = tagList(bs_icon("graph-up-arrow", class = "me-1"), "TRIM"),
        card_body(
          layout_columns(
            col_widths = c(6, 6),
            div(
              h5(style = paste0("color:", colores$acento, "; font-weight:700;"),
                 "TRIM — Trends and Indices for Monitoring data"),
              p(class = "small",
                "Método desarrollado por Statistics Netherlands para estimar ",
                strong("índices de abundancia"), " y ", strong("tasas de cambio"),
                " a partir de conteos repetidos en sitios fijos a lo largo del tiempo."
              ),
              h6(style = paste0("color:", colores$primario, ";"),
                 "¿Cuándo usarlo?"),
              tags$ul(class = "small",
                      tags$li("Tenés conteos de individuos por sitio y año"),
                      tags$li("Algunos sitios pueden tener datos faltantes"),
                      tags$li("Querés una tasa de cambio anual con intervalo de confianza"),
                      tags$li("Necesitás comparar tendencias entre regiones o períodos")
              ),
              h6(style = paste0("color:", colores$primario, ";"),
                 "Tipo de dato requerido"),
              div(class = "alert alert-info small py-2 px-3 mb-2",
                  bs_icon("table", class = "me-1"),
                  strong("Formato:"), " sitio | año | conteo (entero ≥ 0)"),
              h6(style = paste0("color:", colores$primario, ";"),
                 "Paquete en R"),
              div(class = "alert alert-light small py-2 px-3 mb-0",
                  bs_icon("code-slash", class = "me-1"),
                  tags$code("rtrim"),
                  " — Bogaart, van der Loo & Pannekoek (Statistics Netherlands)")
            ),
            div(
              h6(style = paste0("color:", colores$primario, ";"),
                 "Interpretación de resultados"),
              tags$table(
                class = "table table-sm table-striped small",
                tags$thead(
                  tags$tr(tags$th("Resultado"), tags$th("Qué significa"))
                ),
                tags$tbody(
                  tags$tr(tags$td(strong("Tasa de cambio")),
                          tags$td("% de cambio anual en abundancia relativa")),
                  tags$tr(tags$td(strong("p < 0.05")),
                          tags$td("La tendencia es estadísticamente significativa")),
                  tags$tr(tags$td(strong("Índice = 1.0")),
                          tags$td("Abundancia igual al año base")),
                  tags$tr(tags$td(strong("IC 95%")),
                          tags$td("Rango de incertidumbre del índice")),
                  tags$tr(tags$td(strong("Modelo 2")),
                          tags$td("Tendencia lineal — menor incertidumbre, más restrictivo")),
                  tags$tr(tags$td(strong("Modelo 3")),
                          tags$td("Efectos por año — más flexible, IC más amplios"))
                )
              ),
              div(
                class = "alert alert-warning small py-2 px-3 mb-0",
                bs_icon("lightbulb-fill", class = "me-1"),
                strong("Tip:"), " usá el Modelo 3 cuando no sabés si la tendencia ",
                "es lineal. Si los IC son muy amplios, considerá aumentar el ",
                "número de sitios o años de muestreo."
              )
            )
          )
        )
      ),
      
      # ── Pestaña 3: Modelos de ocupación ───────────────
      nav_panel(
        title = tagList(bs_icon("grid-3x3", class = "me-1"), "Ocupación"),
        card_body(
          layout_columns(
            col_widths = c(6, 6),
            div(
              h5(style = paste0("color:", colores$secundario, "; font-weight:700;"),
                 "Modelos de ocupación"),
              p(class = "small",
                "Estiman la ", strong("probabilidad de que una especie ocupe un sitio"),
                " tomando en cuenta que no siempre la detectamos aunque esté presente. ",
                "Separan dos procesos: ", em("ocupación (ψ)"), " y ",
                em("detección (p)"), "."
              ),
              h6(style = paste0("color:", colores$primario, ";"),
                 "¿Cuándo usarlos?"),
              tags$ul(class = "small",
                      tags$li("Tenés datos de presencia/ausencia por sitio y visita"),
                      tags$li("La detección de la especie no es perfecta"),
                      tags$li("Querés estimar qué fracción del paisaje está ocupado"),
                      tags$li("Querés relacionar la ocupación con covariables del hábitat")
              ),
              h6(style = paste0("color:", colores$primario, ";"),
                 "Tipo de dato requerido"),
              div(class = "alert alert-info small py-2 px-3 mb-2",
                  bs_icon("table", class = "me-1"),
                  strong("Formato:"), " sitio | visita_1 | visita_2 | ... (0/1)"),
              h6(style = paste0("color:", colores$primario, ";"),
                 "Paquetes en R"),
              div(class = "alert alert-light small py-2 px-3 mb-0",
                  bs_icon("code-slash", class = "me-1"),
                  tags$code("unmarked"), ", ", tags$code("ubms"),
                  " — modelos de ocupación, N-mixture y CMR")
            ),
            div(
              h6(style = paste0("color:", colores$primario, ";"),
                 "Concepto clave: detección imperfecta"),
              tags$svg(
                xmlns = "http://www.w3.org/2000/svg",
                viewBox = "0 0 320 200",
                width = "100%",
                
                # Realidad
                tags$rect(x="10", y="20", width="140", height="155",
                          rx="8", fill="#EEF3FA",
                          stroke=colores$primario, `stroke-width`="1.5"),
                tags$text(x="80", y="38", `text-anchor`="middle",
                          `font-size`="10", `font-weight`="700",
                          fill=colores$primario, "REALIDAD"),
                tags$text(x="80", y="52", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "Sitios ocupados: 8"),
                lapply(list(c(30,75), c(60,70), c(90,80), c(120,72),
                            c(40,110), c(70,105), c(100,115), c(50,140)),
                       function(p) tags$circle(cx=p[[1]], cy=p[[2]], r="7",
                                               fill=colores$primario, opacity="0.8")),
                
                # Flecha
                tags$path(d="M 155 97 L 173 97",
                          fill="none", stroke=colores$texto, `stroke-width`="2",
                          `marker-end`="url(#arrT2)"),
                tags$text(x="164", y="89", `text-anchor`="middle",
                          `font-size`="8", fill=colores$peligro, "p < 1"),
                
                # Lo observado
                tags$rect(x="176", y="20", width="134", height="155",
                          rx="8", fill="#FFF0E8",
                          stroke=colores$peligro, `stroke-width`="1.5"),
                tags$text(x="243", y="38", `text-anchor`="middle",
                          `font-size`="10", `font-weight`="700",
                          fill=colores$peligro, "LO OBSERVADO"),
                tags$text(x="243", y="52", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "Detecciones: 5"),
                lapply(list(c(196,75), c(226,70), c(256,80),
                            c(206,110), c(266,115)),
                       function(p) tags$circle(cx=p[[1]], cy=p[[2]], r="7",
                                               fill=colores$peligro, opacity="0.8")),
                lapply(list(c(236,72), c(216,105)),
                       function(p) tags$circle(cx=p[[1]], cy=p[[2]], r="7",
                                               fill="#A3ACB9", opacity="0.5")),
                tags$text(x="243", y="148", `text-anchor`="middle",
                          `font-size`="8", fill="#A3ACB9",
                          "● presente,"),
                tags$text(x="243", y="160", `text-anchor`="middle",
                          `font-size`="8", fill="#A3ACB9",
                          "no detectada"),
                
                tags$defs(
                  tags$marker(id="arrT2", markerWidth="7", markerHeight="7",
                              refX="5", refY="3", orient="auto",
                              tags$path(d="M0,0 L0,6 L7,3 z", fill=colores$texto))
                ),
                tags$text(x="160", y="192", `text-anchor`="middle",
                          `font-size`="9", fill=colores$texto,
                          "El modelo estima la ocupación real, no la observada")
              )
            )
          )
        )
      ),
      
      # ── Pestaña 4: CMR ────────────────────────────────
      nav_panel(
        title = tagList(bs_icon("person-badge", class = "me-1"), "CMR"),
        card_body(
          layout_columns(
            col_widths = c(6, 6),
            div(
              h5(style = paste0("color:", colores$peligro, "; font-weight:700;"),
                 "CMR — Captura-Marcaje-Recaptura"),
              p(class = "small",
                "Estima la ", strong("abundancia absoluta"), " de una población ",
                "a partir de individuos marcados y recapturados. A diferencia de ",
                "TRIM, da un número real de individuos, no un índice relativo."
              ),
              h6(style = paste0("color:", colores$primario, ";"),
                 "¿Cuándo usarlo?"),
              tags$ul(class = "small",
                      tags$li("Podés capturar y marcar individuos de forma única"),
                      tags$li("Necesitás abundancia absoluta, no solo tendencia"),
                      tags$li("Querés estimar supervivencia y tasas de reclutamiento"),
                      tags$li("Tenés múltiples ocasiones de muestreo")
              ),
              h6(style = paste0("color:", colores$primario, ";"),
                 "Modelos principales"),
              tags$ul(class = "small",
                      tags$li(strong("Lincoln-Petersen"),
                              " — dos ocasiones, población cerrada"),
                      tags$li(strong("Cormack-Jolly-Seber"),
                              " — múltiples ocasiones, población abierta"),
                      tags$li(strong("Huggins"),
                              " — covariables en capturabilidad"),
                      tags$li(strong("Pradel"),
                              " — tasas de crecimiento poblacional")
              ),
              h6(style = paste0("color:", colores$primario, ";"),
                 "Paquetes en R"),
              div(class = "alert alert-light small py-2 px-3 mb-0",
                  bs_icon("code-slash", class = "me-1"),
                  tags$code("RMark"), ", ", tags$code("marked"), ", ",
                  tags$code("FSA"))
            ),
            div(
              h6(style = paste0("color:", colores$primario, ";"),
                 "Historia de captura — formato básico"),
              p(class = "small text-muted",
                "Cada individuo tiene un registro de 0s y 1s por ocasión:"),
              tags$table(
                class = "table table-sm table-bordered small",
                tags$thead(
                  tags$tr(
                    tags$th("Individuo"),
                    tags$th("Oc. 1"), tags$th("Oc. 2"),
                    tags$th("Oc. 3"), tags$th("Oc. 4")
                  )
                ),
                tags$tbody(
                  tags$tr(tags$td("Ind. A"), tags$td("1"),
                          tags$td("0"), tags$td("1"), tags$td("1")),
                  tags$tr(tags$td("Ind. B"), tags$td("0"),
                          tags$td("1"), tags$td("1"), tags$td("0")),
                  tags$tr(tags$td("Ind. C"), tags$td("1"),
                          tags$td("1"), tags$td("0"), tags$td("0")),
                  tags$tr(tags$td("Ind. D"), tags$td("0"),
                          tags$td("0"), tags$td("1"), tags$td("1")),
                  tags$tr(tags$td(em("...")), tags$td("..."),
                          tags$td("..."), tags$td("..."), tags$td("..."))
                )
              ),
              div(
                class = "alert alert-warning small py-2 px-3 mb-0",
                bs_icon("lightbulb-fill", class = "me-1"),
                strong("Supuesto clave:"), " la marca no afecta la probabilidad ",
                "de recaptura ni la supervivencia del individuo. Verificar ",
                "siempre este supuesto antes de interpretar los resultados."
              )
            )
          )
        )
      ),
      
      # ── Pestaña 5: Parámetros comunitarios ────────────
      nav_panel(
        title = tagList(bs_icon("tree", class = "me-1"), "Parámetros comunitarios"),
        card_body(
          layout_columns(
            col_widths = c(6, 6),
            
            div(
              h5(style = "color:#9F8B75; font-weight:700;",
                 "Diversidad y composición en el tiempo"),
              p(class = "small",
                "En monitoreo comunitario no solo interesa saber qué tan diverso ",
                "es un sitio en un momento dado, sino ", strong("cómo cambia la diversidad"),
                " y la composición de especies a lo largo del tiempo."
              ),
              h6(style = paste0("color:", colores$primario, ";"),
                 "Diversidad alfa (α) — dentro de un sitio, en el tiempo"),
              tags$ul(class = "small",
                      tags$li(class = "mb-1",
                              strong("Riqueza de especies (S)"),
                              " — número de especies por sitio y año"),
                      tags$li(class = "mb-1",
                              strong("Shannon-Wiener (H')"),
                              " — riqueza + equitatividad; sensible a especies raras"),
                      tags$li(class = "mb-1",
                              strong("Simpson (D)"),
                              " — dominancia; más robusto a especies raras"),
                      tags$li(class = "mb-1",
                              strong("Rarefacción"),
                              " — estandariza por esfuerzo de muestreo antes de comparar")
              ),
              div(
                class = "alert alert-warning small py-2 px-3 mt-2",
                bs_icon("info-circle-fill", class = "me-1"),
                strong("Tendencia en el tiempo:"), " los índices α calculados por ",
                "sitio y año pueden analizarse con modelos mixtos (", tags$code("lme4"),
                ") o regresión para detectar si la diversidad está cambiando."
              ),
              h6(style = paste0("color:", colores$primario, ";"),
                 "Paquetes en R"),
              div(class = "alert alert-light small py-2 px-3 mb-0",
                  bs_icon("code-slash", class = "me-1"),
                  tags$code("vegan"), ", ", tags$code("iNEXT"), ", ",
                  tags$code("hillR"))
            ),
            
            div(
              h6(style = paste0("color:", colores$primario, ";"),
                 "Diversidad beta (β) — entre sitios y entre períodos"),
              p(class = "small",
                "Cuantifica el ", strong("recambio de especies"), " entre sitios o ",
                "entre períodos. Permite detectar si la composición de la comunidad ",
                "está cambiando aunque la riqueza total se mantenga estable."
              ),
              tags$ul(class = "small",
                      tags$li(class = "mb-1",
                              strong("Jaccard / Sørensen"),
                              " — similitud en presencia/ausencia entre sitios"),
                      tags$li(class = "mb-1",
                              strong("Bray-Curtis"),
                              " — similitud en abundancias relativas"),
                      tags$li(class = "mb-1",
                              strong("NMDS / PCoA"),
                              " — ordenación de comunidades en espacio multivariado"),
                      tags$li(class = "mb-1",
                              strong("PERMANOVA"),
                              " — prueba si la composición difiere entre grupos o períodos")
              ),
              div(
                class = "alert alert-info small py-2 px-3 mt-2",
                bs_icon("lightbulb-fill", class = "me-1"),
                strong("Ejemplo de pregunta:"), " ¿La composición de aves en los ",
                "bosques de Sarapiquí en 2023 es diferente a la de 2010? ",
                "La diversidad β entre períodos responde esa pregunta."
              ),
              div(
                class = "alert alert-warning small py-2 px-3 mb-0",
                bs_icon("exclamation-triangle-fill", class = "me-1"),
                strong("Esfuerzo de muestreo:"), " antes de comparar índices entre ",
                "sitios o períodos, verificá que el esfuerzo fue igual o usá ",
                "rarefacción para estandarizar."
              )
            )
          )
        )
      )
    )
  )
}

# ── Server ────────────────────────────────────────────────
mod_tecnicas_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Módulo estático — sin lógica reactiva
  })
}