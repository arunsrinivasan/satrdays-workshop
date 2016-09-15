# Revisiting exercise 1
# solviing using what we learned so far

require(data.table)
DT1 = as.data.table(DF1) # convert to data.table
# also look at ?setDT to convert to data.table more efficiently by reference

# 1. Get sum(valA) for code != "abd"
DT1[code != "abd", sum(valA)]

# 2. Get sum(valA) and sum(valB) grouped by id
DT1[, .(sum(ValA), sum(valB)), 
      by = id]

# 3. Get sum(valA) and mean(valB) grouped by id for code != "abd"

DT1[code != "abd", 
      .(sum(valA), mean(valB)), 
      by = id]

# 4. Replace valB with NA where code == "abd"
DT1[code == "abd", 
      valA := NA]

# 5. Get max(valA)-min(valA) grouped by code
DT1[, .(max(valA)-min(valA)), 
      by = code]

# 6. Get sum(valA) and sum(valB) grouped by id and code
DT1[, .(sum(valA), sum(valB)), 
      by = .(id, code)]
