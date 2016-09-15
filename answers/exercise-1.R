# Using base R

DF1 = data.frame(id = c(1,1,1,2,2),
               code = c("abc", "abc", "abd", "apq", "apq"),
               valA = c(0.1, 0.6, 1.5, 0.9, 0.3),
               valB = c(11, 7, 5, 10, 13),
   stringsAsFactors = FALSE)

# 1. Get sum(valA) for code != "abd"
sum(DF1[DF1$code != "abd", "valA"])
# or
sum(DF1$valA[DF1$code != "abd"])

# 2. Get sum(valA) and sum(valB) grouped by id
aggregate(cbind(valA, valB) ~ id, DF1, FUN = sum)

# 3. Get sum(valA) and mean(valB) grouped by id for code != "abd"
ans1 = aggregate(cbind(valA) ~ id, DF1[DF1$code != "abd", ], FUN = sum)
ans2 = aggregate(cbind(valB) ~ id, DF1[DF1$code != "abd", ], FUN = mean)
ans = merge(ans1, ans2, by = "id")
ans

# 4. Replace valB with NA where code == "abd"
DF1[DF1$code == "abd", "valB"] = NA
#or
DF1$valB[DF1$code == "abd"] = NA

# 5. Get max(valA)-min(valA) grouped by code
aggregate(valA ~ code, DF1, FUN = function(x) max(x) - min(x))

# 6. Get sum(valA) and sum(valB) grouped by id and code
aggregate(cbind(valA, valB) ~ id + code, DF1, FUN = sum, na.action = function(x) x)
# compare this to
aggregate(cbind(valA, valB) ~ id + code, DF1, FUN = sum)
