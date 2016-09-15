require(data.table) # v1.9.6+
flights = fread("flights_2014.csv")


# 1. Calculate average `dep_delay` for each `origin`
flights[, mean(dep_delay), by = origin]

# 2. Find the first three months with lowest average arr_delay?
flights[, .(mean_arr_delay = mean(arr_delay)), # get mean of arr_delay
           by = month                          # *for each* month
      ][order(mean_arr_delay)[1:3]]            # *and then* extract top 3 
                                               # rows with least avg. delay

# 3. Get the total number of trips for each origin,dest pair in a) ascending and b) descending order.
# ascending order
flights[, .N,                       # get total number of rows
          by = .(origin, dest)      # for each origin,dest
       ][order(N)]                  # *and then* order by `N` in incr. order

# b) descending order
flights[, .N,                       # get total number of rows
          by = .(origin, dest)      # for each origin,dest
       ][order(-N)]                 # *and then* order by `N` in decr. order

# 4. Get the number of trips for each `origin,dest` pair over each `month`
flights[, .N, 
         by = .(origin, dest, month)]

# 5. Get the mean of arrival and departure delays for `carrier == “AA”` for 
# every month for every `origin,dest` pair using `lapply`, `.SD` and `.SDcols`
flights[carrier == "AA", 
          lapply(.SD, mean, na.rm = TRUE), 
          by = .(month, origin, dest), # or c("month", "origin", "dest")
          .SDcols = c("arr_delay", "dep_delay")]
