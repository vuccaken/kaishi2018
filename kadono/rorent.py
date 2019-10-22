import numpy as np
from matplotlib import pyplot
import matplotlib.ticker as ptick
import scipy.optimize
import glob, re
from functools import cmp_to_key
N = 10000

def func(x ,intensity ,X0,HWHM):
    return intensity * HWHM**2 /((x-X0)**2 + HWHM**2)
x = np.linspace(0,10,N)


fitline = func(x,1.0, 5, 0.5)
# pyplot.hlines(y = 0.5, xmin=4.5, xmax=5.5, color='r',linestyle="dotted")
pyplot.quiver(4.5,0.5,1.0,0.0,angles='xy',scale_units='xy',scale=1)
pyplot.quiver(5.5,0.5,-1.0,0.0,angles='xy',scale_units='xy',scale=1)
pyplot.text(4.8,0.4,'$\Gamma$',fontsize=20)
pyplot.plot(x, fitline)
pyplot.yticks([0,1.0],[0,'$I_0$'])
pyplot.xticks([0,5],[0,'$x_0$'])
pyplot.tick_params(labelsize = 20)
pyplot.show()