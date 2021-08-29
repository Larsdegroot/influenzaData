#' COVID-19 data.
#'
#' Data describing new covid cases and hospital and ICU admissions across europe
#'
#' @format A data frame with 2720 rows and 10 variables:
#' \describe{
#'   \item{country}{name of country}
#'   \item{year_week}{date, in YYYY-Www format}
#'   \item{value}{Number of patients or new admissions per 100 000 population}
#'   \item{indicator}{if value is either about weekly new ICU patients or Hospital patients}
#'   \item{country_code}{abbriviation of country}
#'   \item{new_cases}{Number of new confirmed COVID-19 cases}
#'   \item{population}{population of country}
#'   \item{FirstDose}{Number of first dose vaccine administered to individuals during the reporting week}
#'   \item{SecondDose}{Number of second dose vaccine administered to individuals during the reporting week}
#'   ...
#' }
#' @source \url{https://www.ecdc.europa.eu/en/covid-19/data}
"data_covid"
