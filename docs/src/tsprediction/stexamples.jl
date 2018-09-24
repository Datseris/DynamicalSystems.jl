# # Spatio-Temporal Prediction Examples
# In this page we are simply running files from the
# `examples` folder of the `TimeseriesPrediction` package.

# This is how you can (programmatically) find this folder:
using TimeseriesPrediction
exdir = dirname(dirname(pathof(TimeseriesPrediction)))*"/examples"

# ## Temporal Prediction: Kuramoto-Sivashinsky

include("1Dfield_temporalprediction.jl")

# ## Cross Prediction: Barkley Model

include("2Dfield_crossprediction.jl")

# ## Temporal Prediction: Periodic Nonlinear Barkley Model

include("2Dfield_temporalprediction.jl")
