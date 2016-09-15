require(data.table) # v1.9.6+
flights = fread("flights_2014.csv")

# From flights:
# 1. Select `arr_delay` column and return as a vector
flights[, arr_delay]

# 2. Same as (1) but return a data.table instead
flights[, .(arr_delay)]

# 3. Select both columns arr_delay and dep_delay
flights[, .(arr_delay, dep_delay)]

# 4. Get the total number of rows in ‘flights’ the data.table way.
flights[, .N]

# 5. Compute the median of both arr_delay and dep_delay columns
flights[, .(median(arr_delay, na.rm = TRUE), 
            median(dep_delay, na.rm = TRUE))]

# 6. Same as (5), but in addition name them `med_arr_delay` and `med_dep_delay` 
# Subset rows *and* select columns
flights[, .(med_arr_delay = median(arr_delay, na.rm = TRUE), 
            med_dep_delay = median(dep_delay, na.rm = TRUE))]

# 7. Select columns `origin`, `dest` and `carrier` for the `month` of June 
# both the data.table and the data.frame way.
flights[month == 6L, .(origin, dest, carrier)] # data.table-way
flights[month == 6L, c("origin", "dest", "carrier"), with = FALSE] # data.frame-way

# 8. For those flights with "JFK" as the `origin` airport, calculate the 
# total number of flights where the total delay is > 0.
flights[origin == "JFK", sum(arr_delay + dep_delay > 0L)]
# or
flights[origin == "JFK" & (arr_delay + dep_delay > 0L), .N]
