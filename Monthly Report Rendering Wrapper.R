#Create variable names and import files
beginning.date <- "2020-02-01"
ending.date <- "2020-02-29"
customers.file <- "customers.csv"
products.file <- "products.csv"
views.file <- "views -- February 2020.csv"
transactions.file <- "transactions -- February 2020.csv"
report.name <- "February 2020 Monthly Report"

#Create parameters to be read into report 
params <- list(beginning.date = beginning.date,
               ending.date = ending.date,
               customers.file = customers.file,
               products.file = products.file,
               views.file = views.file,
               transactions.file = transactions.file,
               report.name = report.name
)

#Create path in computer directory to save the output report
the.year <- lubridate::year(ending.date)
the.month <- lubridate::month(ending.date)
out.path <- sprintf("Monthly Reports/%s/%s", the.year, the.month)
print(out.path)
dir.create(path = out.path, showWarnings = F, recursive = T)

#Render to create report for the month
rmarkdown::render(input = "Monthly Reporting Script.Rmd", output_file = sprintf("%s/%s", 
out.path, report.name), params = params)
