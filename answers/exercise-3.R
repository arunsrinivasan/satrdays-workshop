require(data.table) # v1.9.6+
flights = fread("flights_2014.csv")

# 1. Find all flights From JFK to MIA
flights[origin == "JFK" & dest == "MIA"] # we'll use this from here on
# or
flights[origin == "JFK" & dest == "MIA", ]

# 2. Find all flights from any origin airport except JFK
flights[origin != "JFK"]

# 3. Order by origin airport and then in descending order by dest airport.
flights[order(origin, -dest)] # "-" works on character types in data.table's 
                              # i-argument

# 4. Get all rows where dest airport begins with I or J.
flights[dest %like% "^[IJ]"]

# 5. Get the last row.
flights[.N] # inbuilt symbol, holds number of rows
