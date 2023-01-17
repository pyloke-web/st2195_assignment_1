# Radius
r <- 2


# Function to compute the volume of a sphere with radius r
volume <- function(r) {
  return(3/4*pi*r^3)
}
volume(r)

# Function to compute the volumes of the spheres with radius r, r^2 and r^3
volume_vector <- function(r) {
    for (i in c(1:3)){
    print(paste("Sphere with radius ",r^i, " has volume: ", volume(r^i)))
  }
}

# Run volume_vector(r) and print the volumes of the spheres with radius r, r^2 and r^3
volume_vector(r)


