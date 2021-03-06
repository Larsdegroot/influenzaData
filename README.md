
# RMDutil

## Installation

you can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Larsdegroot/influenzaData")
```

## Example

``` r
library(RMDutil) #0.0.0.9000
library(dslabs) #0.7.4
library(tidyverse) #1.3.1
#> -- Attaching packages --------------------------------------- tidyverse 1.3.1 --
#> v ggplot2 3.3.5     v purrr   0.3.4
#> v tibble  3.1.2     v dplyr   1.0.7
#> v tidyr   1.1.3     v stringr 1.4.0
#> v readr   2.0.1     v forcats 0.5.1
#> -- Conflicts ------------------------------------------ tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
```

``` r
data("data_covid")
```

The dataset `data_covid`contains data about COVID-19 cases, related
hospital and ICU admissions and vaccine’s given from Europe.

``` r
RMDutil::amount_factor(as.factor(data_covid$country))
#> [1] "as.factor(data_covid$country) has 24 levels:"
#>  [1] "Belgium"     "Croatia"     "Cyprus"      "Czechia"     "Denmark"    
#>  [6] "Estonia"     "France"      "Germany"     "Greece"      "Iceland"    
#> [11] "Ireland"     "Italy"       "Latvia"      "Lithuania"   "Luxembourg" 
#> [16] "Malta"       "Netherlands" "Norway"      "Portugal"    "Romania"    
#> [21] "Slovakia"    "Slovenia"    "Spain"       "Sweden"
```

Suppose you wanted to join the `data_covid` dataset with the `gapminder`
dataset. It is usefull to know what part of the data both datasets have
in common.

``` r
data("gapminder")
```

``` r
countries_gapminder <- as.vector(unique(gapminder$country))
countries_covid <- unique(data_covid$country)

#what countries do both datasets have in common
common_countries <- common(countries_gapminder, countries_covid)

#show the countries in the dataset covid that are not in the common countries
countries_covid[!(countries_covid  %in% common_countries)]
#> [1] "Czechia"  "Slovakia"
```

So i you joined that `data_covid` dataset to the `gapminder` dataset
you’d lose the COVID-19 data of Czechia and Slovakia.

------------------------------------------------------------------------

When making RMD documents there will usually be a code chunk at the top
loading in required packages. It is good practice to document the
package version. If the package ever updates and this influences the
results from the RMD document than you know which package you will need
to get the same results again.

An example of how version numbers are usually documented:

``` r
library(tidyverse) # 1.3.1
library(readxl) #1.3.1
library(here) #1.0.1
library(drc) #3.0-1
library(knitr) #1.33
library(ggpubr) # 0.4.0
library(captioner) #2.2.3.900
library(kableExtra) #1.3.4
```

I usually do this by searching the package version in the Rstudio GUI.
This is however very time consuming, certainly when package can update
so often because of their opensource nature. The functions
`capture_package_name()` and `format_version()`. try to streamline this.

`capture_package_name()` extracts package names and outputs it in a
vector. It recognizes that a package name is a string comes after
“library(”.

``` r
RMDutil::capture_package_name("library(tidyverse) # 1.3.1
library(readxl) #1.3.1
library(here) #1.0.1
library(dplyr) #1.0.6
library(knitr) #1.33
library(ggpubr) # 0.4.0
library(captioner) #2.2.3.900
library(kableExtra) #1.3.4")
#> [1] "tidyverse"  "readxl"     "here"       "dplyr"      "knitr"     
#> [6] "ggpubr"     "captioner"  "kableExtra"
```

This output is meant to feed into `format_version()`. `format_version()`
takes a vector of package names searches the version of the installed
package and formats a rmd code chunk with the version number.

``` r
RMDutil::format_version(RMDutil::capture_package_name("library(tidyverse) # 1.3.1
library(readxl) #1.3.1
library(here) #1.0.1
library(dplyr) #1.0.6
library(knitr) #1.33
library(ggpubr) # 0.4.0
library(captioner) #2.2.3.900
library(kableExtra) #1.3.4"))
#> library(tidyverse) #1.3.1
#> library(readxl) #1.3.1
#> library(here) #1.0.1
#> library(dplyr) #1.0.7
#> library(knitr) #1.33
#> library(ggpubr) #0.4.0
#> library(captioner) #2.2.3.9000
#> library(kableExtra) #1.3.4
```

You can see that the output is different for the package `{dplyr}`. It
has since been updated, now this output can simply be copy pasted into
the old code chunk to update the version numbers.

also if you wondered the input of `capture_package_name()` doesn’t need
to have version numbers already documented

``` r
RMDutil::format_version(RMDutil::capture_package_name("library(tidyverse)
library(readxl)
library(utils)
library(kableExtra)
library(captioner)
library(zoo)"))
#> library(tidyverse) #1.3.1
#> library(readxl) #1.3.1
#> library(utils) #4.0.5
#> library(kableExtra) #1.3.4
#> library(captioner) #2.2.3.9000
#> library(zoo) #1.8.9
```
