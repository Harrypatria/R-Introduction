######## Welcome to RStudio ##############
# This area is the text editor
# Typing code here won't do anything until we send it to the console below
# It is strongly recommended to type out all code here first before you send it to the console
# This will allow you to edit your code easily, and save it as a .R file either using Ctrl+S or clicking "File -> Save As"
# We can send code to the console either by using Ctrl+Enter or by clicking the "Run" button in the top right corner

2 + 6

# We can send large chunks of code at once by highlighting all the code we wish to send before hitting Ctrl+Enter or clicking Run

1 + 3
2 + 7
3 - 5

# As we can see if we want we can just use R as a big calculator

2 + 4 # Addition
5 - 1 # Subtraction
2 * 6 # Multiplication
10 / 2 # Division
3 ^ 2 # Raising to a power (alternatively 3 ** 2 gives the same)
16 %% 3 # Modular arithmetic (remainder after division)
sqrt(25) # You can probably guess this one...
log(100, base = 10) # Taking logs (defaults to base e)
exp(10) # Calculating e^x

# As in standard maths, brackets help specify the order of operations

(3 + 2) / 5
3 + 2 / 5

# We can define objects using either '=' or '<-'

x = 5
y <- 10
z = x + y
z

# If we want R to assign a value to a variable, and display the value at the same time, 
# we put brackets around the assignment

(z = x * y)
z

# Objects within R aren't reactive, their values won't change until we redefine them

x = 7
y = x + 10
x = 1
y

y = x + 10
y

# We can make R forget variables using the rm() command

y
rm(y)
y

# We can see all the objects currently stored in R either in the top right window of RStudio 
# or using the ls() command

ls()

# R is also case sensitive

Y = 10
y

# Commonly we will need to combine multiple objects together into a vector
# This can be done using the concatenate function c() which combines objects into a single vector

x = c(5, 7, 11, -3)

# We identify elements of a vector using []

x = c(1, 7, 4, 5, 3, 2)
x[2]

# And we can change these in the same way

x
x[4] = 11
x

# We can access multiple elements of a vector by putting a vector inside the square brackets

x[c(2, 5)]

# We can find out how many elements are in a vector using the length() command

x = c(2, -1, 6, 0, 3.2)
length(x)

# If we're not sure what a function does we can access help by typing a ? before the function name

?length

# Discover how these functions work using the help window

?sample
?choose
?diff
?sort

# We can define an empty vector which we will later fill with values

x = vector()

# This gives the most generic vector which we can add as many different objects as we like
# If we know beforehand the type and number of objects that should go into our vector we can prespecify it
# This is useful both for avoiding bugs in code and for making code more efficient

x = numeric(length = 50)

# We can calculate numerical summaries of vectors easily

x = c(4, 7, 5, 11, 2, 0, 5)

sum(x) # Adds the elements of x
mean(x) # Calculates the mean of x
median(x) # Median of x
sd(x) # Calculates the sample standard deviation
var(x) # Caculates the sample variance
min(x) # Minimum of x
max(x) # Maximum of x
range(x) # Largest and smallest values
summary(x, type = 7, digits = 2) # Produces a range of summaries

# We can generate sequences of numbers stored in a vector using the seq() command

x = seq(3, 17, 2)
x
y = seq(-1, -16, -3)
y

# The : symbol gives a shortcut for sequences that go up in 1s

4 : 12

# We can form repeating sequences using the rep() command

rep(2, 10) # Generates a vector 10 2s
rep(1 : 3, 5) # Repeats the sequence 1,2,3 5 times
rep(5 : 8, each = 4) # Generates the sequence 5-8 where each element is repeated 4 times

# Vectors can be combined to form matrices (2-dimensional arrays) using the matrix() command

m = matrix(1 : 9, nrow = 3, ncol = 3) # nrow and ncol specify the dimensions of the matrices
m

# By default R fills matrices by column
# We can change this using the byrow argument

n = matrix(1 : 9, nrow = 3, ncol = 3, byrow = FALSE)
n

# We can access elements of a matrix using [] as with vectors

n[1, 2] # Extracts the element in row 1 column 2
n[3, ] # Extracts all of row 3
n[ , 1] # Extracts all of column 1

# If we only wish to see the first few elements of a vector/matrix we can use the head() command
# Especially useful when looking at a large dataset to see a sample without loading the full thing

data("airquality")
head(airquality) # shows the first 6 elements by default. Can change this using the n argument
head(airquality, n = 3)
tail(airquality, n=5) # Shows the last few elements/rows
summary(airquality)

x = 1 : 10000
head(x) # Shows the first

# There are several different data types in R, the most common being: numeric, character and logical

x = 10 # Numeric
x = "Fries" # Character
x = FALSE # Logical

# The type of an object determines what we can do with it

x = 5
x + 7

y = "Prepare For Trouble"
y * 2

# The mode() function tells us the type of an object

x = "Who Let The Dogs Out?"
mode(x)

# Logical objects, also known as booleans, can arise as the result of statements
x <- 5
x = 10
x > 3 # Is x greater than 3?
x <= 14 # Is x less than or equal to 14?
x == 9 # Note the double equals sign. "x = 9" says "x equals 9", "x == 9" says "Does x equal 9?"
x != 7 # Is x not equal to 7?

# We can connect logical statements using AND (&) and OR (|) connectors

x = c(4, 7, 11, -2, 6.4, -9)
x > 0 # Which elements of x are greater than 0?
x < 8 # Which elements of x are less than 8?
x > 0 & x < 8 # Which elements of x are greater than 0 and less than 8?
x > 0 | x < 8 # Which elements of x are greater than 0 or less than 8?

# Applying statements to vectors returns a vector of booleans

x = c(5, 1, 9, 4, 7)
x > 4

# This can be extremely useful for extracting elements of a vector (or matrix) which meet specific criteria
# When we subset (using []) using a vector of booleans, R only returns the vector elements corresponding to TRUE

x = c(11, 8, 4, 12, 3)
x > 10
x[x > 10]

# We can identify which elements of a vector satisfy a given condition using the which() command

x = c(4, 12, 11, 8, 4)
which(x < 5)

# Commonly we might wish to know the largest or smallest element of a vector
# This can be done elegantly using the which.max() and which.min() commands

x = c(4, 7, 11, 2, 8, 6)
which.max(x)
which.min(x)

# One of the most important uses of booleans is in if statements
# In the expression if(expression){stuff}, R will only do "stuff" if the expression evaluates to TRUE

x = 5
if(x > 2){print("Hello!")}

x = 1
if(x > 2){print("Hello!")}

# We can chain together lots of condition statements using else expressions

x = 6
if(x > 3){print("x is big!")} else{print("x is small!")}

# We can account for multiple outcomes using else if() statements

x = 10
if(x < 3){print("x is REALLY small")} else if(x < 8){print("x is quite small")} else if(x < 12){print("I guess we can't tell if x is small or not until we know what it is")}

x = 7
if(x < 3){print("x is REALLY small")} else if(x < 8){print("x is quite small")} else if(x < 12){print("I guess we can't tell if x is small or not until we know what it is")}

# Note how for this last example, even though x was less than 8 and less than 12, only the stuff from the x < 8 statement was executed
# As soon as R hits an if statement that is TRUE, it stops reading the rest of the elses
# If we wanted all the if statements to be checked we would simply write them as seperate if statements and not include the else

# With long commands like the if else chain above, it is often a lot tidier and easier to follow if we split the command over several lines
# This is easy to do as long as long as we leave commands on all lines apart from the last one unfinished
# If R is expecting there to be more stuff (e.g. a closing bracket) it will search on the next line to see if it's there

4 +
  7

x = c("This",
      "Is",
      "A",
      "Really",
      "Stupid",
      "Way",
      "To",
      "Write",
      "A",
      "Vector")

# Note in the console at the beginning of each line the "+" symbol where there is normally a ">"
# This means R is expecting more than what it has received so far
# This issue happens a lot so if your code isn't running and you're not sure why, check to see if there is a "+" symbol
# Most of the time this will be due to unmatched brackets

# So we can make the if else statements from before look a lot nicer

x = 7
if(x < 3){
  print("x is REALLY small")
} else if(x < 8){
    print("x is quite small")
} else if(x < 12){
    print("I guess we can't tell if x is small or not until we know what it is")
}


x <- 5
if (x < 0) {
  print("x is negative")
} else if (x == 0) {
  print("x is zero")
} else if (x < 10) {
  print("x is a single-digit positive number")
} else {
  print("x is a two-digit or larger positive number")
}

# Oftentimes in R we will want to repeat an operation lots of times, potentially over different numbers
# In order to do this we can make use of loops. There are two main types of loops we'll look at: for loops and while loops
# For loops have an inidcator which takes the value of each of the elements of a given vector, and performs the same operation each time

for(i in 1 : 5){ # Remember the : shortcut for generating sequences going up in 1s
  print(i)
}

# The indicator name can be anything, as can the vector of values it takes

for(squiggle in c(4, 7, 2, 9)){
  x = squiggle^2
  print(x)
}

# We can use for loops for many different things, e.g. keeping running totals

total = 0
for(i in 1 : 50){
  total = total + i
}
total

# The code within the for loop doesn't need to involve the indicator at all, it will just mean the code will be executed n times where n is the length of the vector of inputs

total = 0
for(i in 1 : 100){
  total = total + 1
}
total

# Another common use of for loops is to populate vectors

x = vector() # The generic empty vector, it is better to be prescriptive so in this example x = numeric(10)
for(i in 1 : 10){
  x[i] = i^2 # Remember x[i] just means the object in the ith position of x
}

# The second type of loop is a while loop
# While loops execute their code as long as the expression used to define them remains true

x = 0
y = 0
while(x <= 50){
  y = y + x
  x = x + 1
}

# For loops and while loops can often be used interchangeably
# The example above is entirely equivalent to the 1 to 50 total for loop we just looked at

# Often in R we find ourselves repeatedly executing the same or similar code over and over
# It is much nicer to just have to write the code once and then tell R to just do that with the new inputs we give it
# Thankfully in R we are completely free to define our own functions and call them in our code

babys.first.function = function(x){ # Here we specify x to be the input for my function
  y = x ^ 3 + 3 * x ^ 2 + 6 # We do something to the input
  return(y) # And specify the output
}

babys.first.function(4)
babys.first.function(-3)

# As soon as a function hits a "return" statement it returns the output and stops

babys.second.function = function(x){
  y = x + 3
  return(y) # The function will return y and ignore the rest of the function
  z = x / 2
  return(z)
}

babys.second.function(6)

# Functions don't need to have a return statement at all
# If the last line in the function calls a single object, R will return that
# It is still recommended to use return statements to avoid confusion

f = function(x){
  x ^ 3
}

f(4)

# Functions can have as many arguments as we want

big.expression = function(x, y, z, a){
  return(x ^ y + (x - z) - (x * a))
}

big.expression(2, 4, 6, 1)

# If we don't give R enough inputs for our function R gets mad

big.expression(2, 4, 6)

# Also if we give too many inputs

big.expression(2, 4, 6, 1, 5)

# If we have lots of inputs, it can help avoid confusion (and debugging) by naming the inputs we want

big.expression(x = 2, y = 4, z = 6, a = 1)

# If we name our inputs, we can have them in any order and still get the same result

big.expression(z = 6, x = 2, a = 1, y = 4)

# We one input is likely to take the same value lots of times, we can save time typing it out by setting a default input

small.expression = function(x, y = 5){
  return((x ^ 2) - (y ^ 2))
}

# If an input has a default, R will assume we want the input to take that value unless we tell it otherwise

small.expression(3)
small.expression(3, 5)
small.expression(7)
small.expression(2, 6)

# One important thing to note is that variables defined within functions are not defined outside of them
# This is because these definitions only exist in a local environment rather than the global environment we normall work in
# We'll go into the mechanics of this in CSC8631

r = 10

last.function = function(x, y){
  r = 2 * x
  s = x + y
  return(s + r)
}

last.function(9, 8)
r

# Another very common thing to do in R is to plot things
# The base plot function in R has MANY possible arguments
# We'll look at the most common here, you're more than welcome to go and experiment with the different inputs and arguments
# We'll look at a nicer package for producing plots (ggplot2) in CSC8631

first = c(4, 7, 9, 3, 5)
second = c(7, 7, 4, 9, 2)

# If we give plot() 2 inputs, it plots the first on the x-axis, against the second on the y-axis

plot(first, second)

# If we only give it a single input, it plots the elements of that input against their position in the vector

plot(second)

# We can add a title to our plots using the "main" argument

plot(first, second, main = "Example Heading")

# We adjust the x-axis limits of our plot using the xlim and ylim commands
# R will naturally scale the initial plot to fit all points plotted
# However it won't rescale if we add lines or points later

plot(first, second, xlim = c(0, 10), ylim = c(-5, 15))

# We add labels to the axis using the "xlab" and "ylab" arguments

plot(first, second, main = "Heading", xlab = "x-axis label", ylab = "y-axis label")

# We can insert symbols into our axis labels using the expression() command

plot(first, second, main = expression(omega), xlab = expression(alpha), ylab = expression(beta))

# We can add a straight line to a plot using abline()
# The first argument is the y-intercept and the second is the gradient

abline(-3, 2) # Adds the lines y = 2x - 3

# We can adjust the colour using the "col" argument and the line type using "lty"

abline(1, 0.5, col = "red", lty = 2)

# Horizontal and vertical lines can be added using the 'h' or 'v' arguments

abline(h = 5, col = "blue", lty = 5)
abline(v = 7, col = "black", lty = 3)

# We can be more precise with adding lines using the lines() command
# The first argument is a vector of x-co-ordinates of the points to be joined by the line and the second is the y co-ordinates

lines(x = first[c(2, 3, 4)], y = second[c(2, 3, 4)])

# We can adjust the line type and colour in the same way as for abline

lines(x = c(6, 8), y = c(3, 3), col = "blue", lty = 3)

# We can add points to a plot using the points command
# The first input is the x-coordinate(s) of the points, and the second is the y co-ordinate(s)
# We can change the colour using "col" as before and the shape of the point using "pch"

points(x = c(4, 5, 8, 7), y = c(3, 6, 6, 5), col = "blue", pch = 19)

# There is only one sensible colour choice though...

plot(first, second)
points(first, second, pch = 19, col = rainbow(5))

# We can round values up and down in R using ceiling() and floor()

ceiling(2.6) # Rounds 2.6 up to 3
floor(7.2) # Rounds 7.2 down to 7
ceiling(5) # If we round a whole number to the nearest whole number it just stays the same

# Example function for counting proportion square numbers in a range

square.counter = function(lower.lim, upper.lim){ # lower.lim and upper.lim give the limits of my range
  count = 0 # Initialise counter to count how many square numbers there are
  n = (upper.lim - lower.lim) + 1 # The total number of values the function will test (remember that includes both lower.lim and upper.lim)
  for(number in lower.lim : upper.lim){ # Go through each value in turn
    root.number = sqrt(number) # Find the square root
    if(floor(root.number) == root.number){count = count + 1} # If the square root is a whole number increase the counter by one
  }
  return(count / n) # Return the proprtion of square numbers (i.e. the number of square numbers divided by the number of values we tested)
}

# We can generate probabilities associated with families of distributions

# For the Binomial distribution we have
# If X ~ Bin(10, 0.2)

dbinom(5, 10, 0.2) # Pr(X = 5) - the PMF
pbinom(5, 10, 0.2) # Pr(X <= 5) - the CDF
rbinom(3, 10, 0.2) # Generates 3 values of X

# We repeat the same for other distributions with the same first letters
# d- gives PMF, p- gives CDF, r- generates random values

dpois(7, 4) # Poisson distribution
dgeom(3, 0.1) # Geometric distribution
dunif(3, 2, 5) # Uniform distribution
dnorm(2, 1, 5) # Normal distribution
dexp(3, 2) # Exponential distribution

# We sometimes wish to numerically find the minimum or maximum of functions
# There are a variety of numerical optimisers in R, one of which is optimise()

trial.function = function(x){
  return(-(x - 1) ^ 2 + 5)
}

optimise(f = trial.function , interval = c(-10, 10), maximum = TRUE)

trial.second = function(m, y){
  return(sum((y - m) ^ 2) / length(y))
}

y = runif(20, 5, 15)
optimise(f = trial.second, interval = c(0, 20), maximum = FALSE, y = y)

head(airquality)
head(airquality$Wind)
head(airquality$Day)

plot(airquality$Day, airquality$Wind,
     main = "Daily Wind",
     xlab = "day", ylab = "wind")
# Drop NA 
airqual = na.omit(airquality)

# Correlation
cor(airqual)

summary(airquality)
var(airquality)
sd(airquality$Wind)

install.packages('ggpplot2')
library('ggplot2')

install.packages('GGally')

library(GGally)
ggpairs(airqual, title = "descriptive analysis of air quality data")

iris = data("iris")
ggpairs(iris, ggplot2::aes(colour=Species)) 

library(GGally)
library(ggplot2)

p <- ggpairs(iris, aes(color = Species))+ theme_bw()
# Change color manually.

# Loop through each plot changing relevant scales
for(i in 1:p$nrow) {
  for(j in 1:p$ncol){
    p[i,j] <- p[i,j] + 
      scale_fill_manual(values=c("#00AFBB", "#E7B800", "#FC4E07")) +
      scale_color_manual(values=c("#00AFBB", "#E7B800", "#FC4E07"))  
  }
}
p

g = ggplot(data=mpg, aes(x=displ, y=cty))
g + geom_point(aes(colour=factor(cyl)))
g + geom_line(aes(colour=factor(cyl), size = factor(cyl)))
p = g + geom_point(aes(colour=factor(cyl))) + stat_smooth(aes(colour=factor(cyl)))
p

g = ggplot(data=mpg, aes(x=displ, y=cty))
g
g2 = g + geom_boxplot(aes(group=size))
g2
g3 = g2 + geom_dotplot(aes(group=size),
                       binaxis="y", stackdir="center",
                       binwidth=0.05, stackratio=0.5)
g3

# Use single color
ggplot(mpg, aes(x=displ, y=cty)) +
  geom_boxplot(fill='#A4A4A4', color="black")+
  theme_classic()
# Change box plot colors by groups
p<-ggplot(mpg, aes(x=displ, y=cty, fill=class)) +
  geom_boxplot()
p


airqual.matrix = as.matrix(airqual)
heatmap(airqual.matrix, Rowv=NA, Colv=NA, labRow=NA)
mpg_matrix = as.matrix(mpg)
heatmap(mpg.matrix, Rowv=NA, Colv=NA, labRow=NA)

head(airqual)
Solar <- lm(Solar)
