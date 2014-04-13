## Coding Standards
#* 1. Always use a text editor (ascii typically). LEast common demoniao
#* 2. Indent your code. (debated as to what is appropriate) spaced to the right 
#     blocks of code more than other to show control flow of program
#* 3. Limit the width of code (80 columns? standard)
#* 4. Limit the length of function (limit to one basic activity or objective and
#     and logical, do not try to lump things into a "monster" code the trys to
#     do more than one thing, always split into logical functions) When you have
#     a bug it simplifies the debugging


## Scoping Rules 
# HOw does R know which value to assign to which symbol? when I type
# there is already a built in function lm, so.

lm <- function(x) {x*x} ## squaring input
lm
lm(8)


#R need to bind the value to a symbol, wither a function of smoe sorts. either
# my lm or the stats package lm.  It searches through environments (objects and 
# values)
#* 1. Seraches the global environment for a object(symbol) name mathcing the one
# requested
# 2. If no match on global, then it will search all R pachages that are currently
# loaded in env.
# to see use
search()

## BInding values to symbols(objects)
#* the global env. or the users workspace is always the first element of the search list
# and the base package is always the last
#* so the order of theloaded  package on search () list matters
#* Users can config which pkgs get loaded on startup, so you can not assume that 
#  there wil be a set list of packages available.
#* When a user loads a pkg, with the library() the namespace of that package 
# gets put into position 2 of the serach list by default and everything is shifted down 
#* note that R has seperate namespaces for functions and non-finctions so it's
# possible to hav an object named xxx and a function named xxxnot best practice

## SCoping Rules
#* the scoping rules determine how a value is bound ot a free variable in a function
# R uses static scoping, or lexical scoping
# Related to the scoping rules is how R uses the search list to "bind" a valueto a symbol
# Lexical scopingturns out to be particularly useful for simplifying statistical 
# computations.

f <- function(x,y) { 
        x^2 + y /z
}

## the above has 3 formal agrs x and y. In the body, it has a free variable z.
# The scopin rules of a language determine how values are assigned to free variables
# free vars are nt formal args and are not local variables assigned iside the function


##OK, so lexical scoping in R means that:
# the values of free variables are searched for in the environment in which the function was defined

## So, What is an environment?
#* An environment is a collection of (symbol(object), value) pairs, ie. x is a symbol and 3.14 mught be the value
# y is a symbol, and a data.frame might be its value
# * every environment has a parent env; it is poss for an env. to hav multiple "children"
#* the only env. without a parent the the empty env.
#* A function + an environment = a "closure" or a "function closure" these are key to soke very intersting operations in R

# global env is a set of global symbols and pairs (data frame, vector of numerics, list, etc)

## searching for the value of a free variable
#8 if the value of a symbols is not found inthe env in which a function was defined, the it iwll search the parent environment
#* the search will continue down the sequence of the parent env's until we hit the top-level environment, thisi is usually the global envinroment
# workspce or the namespcae of the package
#* After the top level env, the search continues down the search list un we hit the empty env, if a value for a symbol cant be found, then an eror is thorwn


#### SO, Typically, a function is defined in the global environment, so that the values of the free variables are just found in the users workspace

# this behavior is logical for most people and us usually the right thing to do
# However, in R you can have functions defined inside other functions
# C does not allow you to do this
# Now things get interesting, in ths case the env in which a fucntion is defined is the body of another function

make.power <- function(n) {
        pow <- function(x) {
                x^n
        }
        pow
}

cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)

## exploring a functions environment  ls()

ls(environment(cube))
ls(environment(square))
get ("n", environment(square))

## lexical vs Dynamic SCoping
 y <- 10

f <- function(x) {
        y <- 2
        y^2 + g(x)
}

g <- function(x) {
     x*y   
}
f(3)
f(1)

##VEctorized operations easy without having to do looping
# Concept is that things can happen i parralel
x <-  1:4; y <- 6:9
x+y
x>=2
y ==8
x*y
x/y


## VEctorized Matix Operations
x<- matrix(1:4,2,2); y <- matrix(rep(10,4),2,2)
x*y ## element wise multiplication
x/y
x %*% y ## true matrix multiplication

##dates ad times values
#R has a special way to represent them as a specail class
#8 Dates "Date"
#* Times POSIXct or POSIXlt
# Dates are stored internally as the # of days since 1970-01-01
## Times are stored internally as the # of seconds since 1970-01-01
x <- as.Date("1970-01-01") ## converst string to date object
x
class(x)
unclass(x) # dates stored since 970-01-01
unclass(as.Date("1970-01-02"))


##Timesin r
# as a POSIXct is just a large ineger useful when you want to store times in a data frame
# POSIXlt is a list and stores a bunch of other usefu info like doay if week, fay f year, mot, day of onth,etc.

## generic functions that work on both 
# weekdays: day of week
# months : manth name
# quarters: quarter # , ie. ("Q1", "Q2", ...Q4)

x <- Sys.time()
x

p <- as.POSIXlt(x)
p
names(unclass(p))
p$sec

p$mday
p$wday
## so change from one to another using as.POSIXxx
x<- Sys.time()
x## alrady in the POSIXct format
unclass(x)

x$sec #errors because it is just a big integer

#so 

p <- as.POSIXlt(x) ##class(cast?) to POSIXlt
p$sec
## finally, there is strptime function in case dates are written id varied formats

datestring <-c("January 12, 2013 10:15")
x<- strptime(datestring, "%B %d, %Y %H:%M" )
x
class(x)
?strptime

#operation on the date data
x <- as.Date("2012-01-01")
y <- strptime("9 JAN 2011 11:26:33", "%d %b %Y %H:%M:%S")
x-y # errors, not like classes
class(x)
class(y)

## so to fix, cast x as a POSIXlt()
x <- as.POSIXlt(x)
x-y


## nice thing is they are really ood at trick y things LP YRS, DAYLIGHT SAVING,timexones
x <- as.Date("2012-03-01"); y<-as.Date("2012-02-28") ##leap yr
x-y

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 07:00:00", tz ="GMT")
y-x

# world clock
#x <- (Sys.time, tz = "GMT")
#x

> cube <- function(x, n) {
        +     x^3
        + }
> cube(3)
[1] 27
> f <- function(x) {
        +     g <- function(y) {
                +         y + z
                +     }
        +     z <- 4
        +     x + g(x)
        + }

z <- 10
f(3)
##
x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}
y

##

h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}

h
h(3)
