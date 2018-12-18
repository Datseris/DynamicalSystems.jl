# Recurrence Plots
## Recurrence Matrices

A [Recurrence plot](https://en.wikipedia.org/wiki/Recurrence_plot) (which refers to the plot of a matrix) is a way to quantify *recurrences* that occur in a trajectory. A recurrence happens when a trajectory visits the same neighborhood on the phase space that it was at some previous time.

The central structure used in these recurrences is the (cross-) recurrence matrix:
```math
R(i, j) = \begin{cases}
1 \quad \text{if}\quad d(x[i], y[j]) \le \varepsilon\\
0 \quad \text{else}
\end{cases}
```
where $d(x[i], y[j])$ stands for the _distance_ between trajectory $x$ at point $i$ and trajectory $y$ at point $j$. If $x\equiv y$ then $R$ is called recurrence matrix, otherwise it is called cross-recurrence matrix. There is also the joint-recurrence variant, see below.

With `RecurrenceAnalysis` you can use the following functions to access these matrices
```@docs
recurrencematrix
crossrecurrencematrix
jointrecurrencematrix
```

## Plottable Format
As you can tell from the above documentation strings, the recurrence matrices are stored as sparse matrices with boolean values. To create the recurrence plots, one needs to obtain a full form out of them.

This functionality is supported by the following function:
```@docs
recurrenceplot
```
## Example
Here is a recurrence plot of a full trajectory of the Roessler system:
```@example recurrence
using DynamicalSystems
ro = Systems.roessler(a=0.15, b=0.20, c=10.0)
N = 2000; dt = 0.05
tr = trajectory(ro, N*dt; dt = dt, Ttr = 10.0)
R = recurrencematrix(tr, 5.0; metric = "euclidean")
Rp = recurrenceplot(R)
```

```@example recurrence
using PyPlot; figure(figsize = (6, 8))
ax1 = subplot2grid((3,1), (0,0))
plot(0:dt:N*dt, tr[:, 2], "k"); xlim(0, N*dt); ylabel("\$y(t)\$")
ax2 = subplot2grid((3,1), (1, 0), rowspan = 2)
imshow(Rp, cmap = "Greys_r", extent = (0, N*dt, 0, N*dt))
xlabel("\$t\$"); ylabel("\$t\$"); tight_layout()
subplots_adjust(hspace = 0.2)
savefig("rmatrix.png"); nothing # hide
```
![](rmatrix.png)

## Distances
The distance function used in [`recurrencematrix`](@ref) and co. can be specified either as a string or as a `Metric` instance from [`Distances`](https://github.com/JuliaStats/Distances.jl). In addition, the following function returns a matrix with the cross-distances across all points in one or two trajectories:
```@docs
distancematrix
```
