for(i in 1:10) {
  print(i)
}

## 3 ways to for loop

## create simple vector
x<- c("a", "b", "c", "d")

## example  1, C like
for(i in 1:4) {
  print(x[i])
}

## example 2 uses sequence length to match unkown lengths

for (i in seq_along(x)) {
  print(x[i])
}

## example 3 useing index variable which happens to be equal to the letter
for(letter in x) {
  print(letter)
}

## example 4
for(i in 1:4) print(x[i])  for single expression, you can omit curly brackets

## NEsted for loops

## create a test matrix
x <- matrix(1:6,2,3)


##loop through by creating an intiger sequence seq_len for i(1:2)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) { ## for j 1:3 seq_len for i(1:2)
    print(x[i,j])
  }
}

##avoid nesting beyond 2, maybe 3 levels.  Use functions instead
