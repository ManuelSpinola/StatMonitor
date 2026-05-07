# ============================================================
# helpers.R — Funciones y objetos compartidos entre módulos
# StatMonitor · StatSuite · Manuel Spínola · ICOMVIS · UNA
# Paleta: Tableau Color Blind (ggthemes)
# ============================================================

library(shiny)
library(bslib)
library(bsicons)
library(tidyverse)
library(DT)
library(scales)
library(readxl)

# rtrim no está en el repositorio estándar de Posit Cloud — instalar si falta
if (!requireNamespace("rtrim", quietly = TRUE)) {
  install.packages("rtrim")
}
library(rtrim)

# ── Paleta de colores StatMonitor ────────────────────────────
# Tableau Color Blind — accesible y profesional
colores <- list(
  fondo       = "#F4F7FB",  # azul muy pálido — fondo general
  primario    = "#1170AA",  # azul oscuro — navbar, encabezados
  acento      = "#FC7D0B",  # naranja — botones, íconos activos
  secundario  = "#5FA2CE",  # azul claro — elementos secundarios
  texto       = "#57606C",  # gris oscuro — texto principal
  exito       = "#5FA2CE",  # azul claro — valores positivos
  advertencia = "#F1CE63",  # amarillo
  peligro     = "#C85200",  # naranja oscuro — errores
  borde       = "#C8D9EC",  # azul muy pálido — bordes
  
  # Paleta completa Tableau Color Blind para gráficos
  tableau = c(
    "#1170AA", # azul oscuro
    "#FC7D0B", # naranja
    "#A3ACB9", # gris medio
    "#57606C", # gris oscuro
    "#C85200", # naranja oscuro
    "#7BC8ED", # azul cielo
    "#5FA2CE", # azul claro
    "#F1CE63", # amarillo
    "#9F8B75", # marrón
    "#B85A0D"  # marrón naranja
  )
)

# ── Tema visual ────────────────────────────────────────────
tema_app <- bs_theme(
  version      = 5,
  bg           = colores$fondo,
  fg           = colores$texto,
  primary      = colores$primario,
  secondary    = colores$secundario,
  success      = colores$exito,
  danger       = colores$peligro,
  warning      = colores$advertencia,
  base_font    = font_google("Nunito"),
  heading_font = font_google("Nunito", wght = 700),
  bootswatch   = NULL
) |>
  bs_add_rules("
  .navbar { background-color: #1170AA !important; }
  .navbar-brand { color: #ffffff !important; display: flex !important;
                  align-items: center !important;
                  padding-top: 0 !important; padding-bottom: 0 !important; }
  .navbar .nav-link { color: #ffffff !important; }
  .navbar .nav-link.active { border-bottom: 2px solid #FC7D0B; }
  .btn-primary { background-color: #FC7D0B; border-color: #FC7D0B; color: #ffffff; }
  .btn-primary:hover { background-color: #d4680a; border-color: #d4680a; }
  .card-header { background-color: #EEF3FA; font-weight: 700;
                 border-bottom: 2px solid #C8D9EC; }
  .badge-trim { background-color: #1170AA; color: white; border-radius: 4px;
                padding: 2px 8px; font-size: 0.78rem; }
")

# ── Escalas ggplot2 ───────────────────────────────────────
scale_fill_statmonitor <- function(...) {
  scale_fill_manual(values = colores$tableau, ...)
}
scale_color_statmonitor <- function(...) {
  scale_color_manual(values = colores$tableau, ...)
}

# ── Leer archivo CSV o Excel ─────────────────────────────
leer_archivo <- function(path, ext) {
  tryCatch({
    if (ext == "csv") {
      read_csv(path, show_col_types = FALSE)
    } else if (ext %in% c("xlsx", "xls")) {
      read_excel(path)
    }
  }, error = function(e) NULL)
}

# ── Datasets de ejemplo para monitoreo ──────────────────
set.seed(2024)

datos_ejemplo <- list(
  
  # ── 1. Conteos anuales de aves por punto (estilo TRIM)
  # Simula monitoreo de Trogon melanocephalus en Sarapiquí
  # Tendencia decreciente significativa (~8% por año) — fragmentación de bosque
  conteos_aves = {
    sitios <- paste0("Sitio_", 1:20)
    anios  <- 2008:2023
    expand_grid(site = sitios, year = anios) |>
      mutate(
        t     = year - 2008,
        # Lambda decreciente clara, sin ruido aditivo — solo variabilidad Poisson
        mu    = pmax(0.5, 12 * exp(-0.085 * t)),
        count = rpois(n(), lambda = mu)
      ) |>
      select(site, year, count)
  },
  
  # ── 2. Conteos anuales de mamíferos por punto de aguada (estilo TRIM)
  # Simula monitoreo de Tapirus bairdii (danta) en Tortuguero
  # Tendencia estable — sin cambio significativo, área protegida reciente
  conteos_mamiferos = {
    sitios <- paste0("Aguada_", 1:8)
    anios  <- 2014:2023
    expand_grid(site = sitios, year = anios) |>
      mutate(
        mu    = 4.0 + 0.05 * (year - 2014) + rnorm(n(), 0, 0.5),
        count = pmax(0L, rpois(n(), lambda = pmax(0.1, mu)))
      ) |>
      select(site, year, count)
  },
  
  # ── 3. Presencia/ausencia por cámara trampa
  # Danta, Puma y Tepezcuintle — 20 estaciones, 3 temporadas
  # NOTA: formato para modelos de ocupación (StatOcu), no para TRIM
  camaras = {
    estaciones <- paste0("CT_", sprintf("%02d", 1:20))
    temporadas <- c("Seca_2021", "Lluviosa_2021", "Seca_2022")
    expand_grid(estacion = estaciones, temporada = temporadas) |>
      mutate(
        danta        = rbinom(n(), 1, 0.45),
        puma         = rbinom(n(), 1, 0.30),
        tepezcuintle = rbinom(n(), 1, 0.65),
        ocelote      = rbinom(n(), 1, 0.20),
        cobertura_boscosa = round(runif(n(), 40, 95), 1),
        distancia_borde_m = round(runif(n(), 10, 800), 0)
      )
  }
  
)