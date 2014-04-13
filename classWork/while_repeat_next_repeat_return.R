## while loop, takes logical expression and execute based on value of that expression

 
count <- 3

while(count<300) {
  print(count)
  count <-count +1
}

## be careful of infinite loop

## you can test multiple conditions using logical operatos
## conditions are always evaluated from left to right

z <- 5

while(z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1,1,0.5)
  
  if(coin == 1) { ##random walk
    z <- z + 1
  } else {
    z <- z - 1
  }
}


##repeat initiates an infinite loop, not common 
## must use break, only way to exit the loop checking
## usedin optimization, etc. 

x0 <- 1
tolerance <- 1e-8

repeat {
  x1 <- someRandomizer()
  
  if(abs(x1-x0) < tolerance) {
    break
  } else {
    x0 <- x1
  }
}

## algo must converge, could run forever 
## better to use for loop with limit of iterations it can run

##next 

## next is used to skip  an iteration of a loop

for (i in 1:100) {
  if(i <=10) { 
  ##skip the fisrt 10 iterations
  next
  }
  ##do something here
  print("hello")
}
summary()


##return can be used, more of a function thing


