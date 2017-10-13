# Bayesian Adaptive Kernel Smoother (BAKS)
BAKS is a method for estimating firing rate from spike train data that uses kernel smoothing technique with adaptive bandwidth determined using a Bayesian approach.
Function input:
- SpikeTimes : spike event times [nSpikes x 1]
- Time : time at which the firing rate is estimated [nTime x 1]
- a : shape parameter (alpha) 
- b : scale paramter (beta)
Function output:
- h : adaptive bandwidth [nTime x 1]
- FiringRate : estimated firing rate [nTime x 1]

More information, please refer to "Estimation of neuronal firing rate using Bayesian adaptive kernel smoother (BAKS)"
