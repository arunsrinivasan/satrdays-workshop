require(data.table) # v1.9.6+
flights = fread("flights_2014.csv")

# 1. Write down two differences in the way data.table prints to screen in 
# comparison to data.frames - print(flights).
print(flights)

# differences
# 1. Row numbers are visually separated from the first column with a ":".
# 2. Only the first and last 5 rows are printed by default when the number of 
#    rows in the data.table is >100. To print all rows, do: 
#    print(flights, nrows=Inf) <~~~ but DON'T DO THIS as it will take A LOT 
#    OF TIME

