# Adjusting for optimising dispatch decisions over rebids {#sec:appendix-losses}

Optimising the modelled BESS for dispatch decisions rather than forming bids and offers (as market participants would do for BESSs in the NEM) leads to lower annual arbitrage revenues because of opportunities missed or losses incurred in the three situations described below:

1. The BESS misses revenue opportunities presented by unanticipated price spikes that it would otherwise be dispatched to capture if its (discharge) capacity were offered into lower price bands. However, as we discuss in [@sec:info-case_study-bess_simulations-method-assumptions], BESSs in the NEM appear to be employing conservative bidding strategies to some extent. This means that they may still be missing opportunities to discharge during periods with moderate-to-high prices.

2. The BESS incurs losses from discharging during a negative price period where it would otherwise not. Though a market participant might choose to discharge the BESS into negative prices (e.g. to reduce its state-of-charge so that it might switch to charging at a later interval priced at the market floor), they could avoid such losses by offering (discharge) capacity into non-negative price bands. The magnitude of the losses incurred by a BESS in this situation is limited by the market price floor (-1000 AUD/MW/hr).

3. The BESS incurs losses from charging during high positive prices where it would otherwise not. Though a market participant might choose to charge the BESS during high positive prices (e.g. to increase the BESS's state-of-charge so that it can discharge in market intervals with even higher prices), they could avoid such losses by bidding (charge) capacity into negative price bands. The magnitude of the losses incurred by a BESS in this situation may be higher than those incurred from discharging during a negative price period as the modelled market price cap is 15,100 AUD/MW/hr.

## Magnitude of additional losses

Since BESSs participating in the NEM may still miss revenue opportunities because they are employing conservative bidding strategies, we focus on quantifying the impact of the additional losses described above in situations 2 and 3. To do so, we use the modelling methodology described in [@sec:info-case_study-bess_simulations-method] to run a RHOC simulation for each BESS configuration where the BESS is provided with actual price data for the binding period (i.e. next 5 minutes) and forecast price data for the remainder of its lookahead in each RHOC simulation step. We call this the "actual price in binding" (APB) variant, in which the BESS should avoid undesirable losses just as it would if its bids and offers were appropriately structured. By comparing the losses (i.e. under situations 2 and 3) for each BESS configuration in the "standard" simulation with forecast data (i.e. entire RHOC simulation step uses forecast price data, as described in [@sec:info-case_study-bess_simulations-method]) and the APB variant, we estimate the degree to which reductions in arbitrage revenue potential calculated from the results of the modelling in [@sec:info-case_study-bess_simulations] should be adjusted to better reflect those that BESSs participating in the NEM might actually experience.

[@tbl:max_losses] shows the maximum losses incurred from discharging (i.e. situation 2) and from charging at higher market prices (i.e. situation 3, with a threshold of 500 AUD/MW/hr chosen based on the "detrimental decisions" shown in [@fig:bess_price_revenue]) across all BESS configurations and lookaheads for the standard simulation and APB variant. The maximum losses from discharging into negative prices are small whilst the maximum losses from charging at higher market prices are significant in the standard simulations (21-36% of annual arbitrage revenue). As such, we hereon only consider avoidable losses from charging at higher market prices. [@tbl:max_losses] also shows that maximum charging losses are significantly reduced but not entirely eliminated by providing the BESS with actual price data for the binding period. Because it is still optimal for the BESS to occasionally charge at high prices to enable greater discharge at even higher prices, modelling simplifications that entirely eliminate charging at higher prices are inappropriate.

+----------------------------------------+-----------------------------------------+------------------------------------+
| Formulation                            | $\textrm{Max.                           | $\textrm{Max.                      | 
|                                        |loss}_{\textrm{discharge}}$              |loss}_{\textrm{charge,              |     
|                                        |                                         |500AUD/MW/hr}}$                     |
|                                        | (% of annual revenue)                   |                                    |
|                                        |                                         | (% of annual revenue)              |
|                                        +-----------+-----------------------------+-----------+------------------------+
|                                        | Standard  | APB                         | Standard  | APB                    |
+========================================+===========+=============================+===========+========================+
| Arbitrage                              |  4%       | 2%                          |  21%      | 4%                     |
+----------------------------------------+-----------+-----------------------------+-----------+------------------------+
| Arbitrage with throughput penalty      |           |                             |           |                        |
|                                        |  1%       | <1%                         |  27%      | 4%                     |
|(200,000 AUD/MWh)                       |           |                             |           |                        |
|                                        |           |                             |           |                        |
+----------------------------------------+-----------+-----------------------------+-----------+------------------------+
| Arbitrage with throughput penalty      |           |                             |           |                        |
|                                        |  1%       | <1%                         |  35%      | 5%                     |
|(400,000 AUD/MWh)                       |           |                             |           |                        |
|                                        |           |                             |           |                        |
+----------------------------------------+-----------+-----------------------------+-----------+------------------------+
| Arbitrage with throughput penalty      |           |                             |           |                        |
|                                        |  1%       | <1%                         |  36%      | 5%                     |
|(600,000 AUD/MWh)                       |           |                             |           |                        |
|                                        |           |                             |           |                        |
+----------------------------------------+-----------+-----------------------------+-----------+------------------------+
| Arbitrage with throughput penalty      |           |                             |           |                        |
|                                        |  <1%      | <1%                         |  36%      | 6%                     |
|(800,000 AUD/MWh)                       |           |                             |           |                        |
|                                        |           |                             |           |                        |
+----------------------------------------+-----------+-----------------------------+-----------+------------------------+
| Arbitrage with discounting             |           |                             |           |                        |
|                                        |  <1%      | <1%                         |  29%      | 5%                     |
|(exponential)                           |           |                             |           |                        |
|                                        |           |                             |           |                        |
|                                        |           |                             |           |                        |
+----------------------------------------+-----------+-----------------------------+-----------+------------------------+
| Arbitrage with discounting             |           |                             |           |                        |
|                                        |  <1%      | <1%                         |  29%      | 5%                     |
|(hyperbolic)                            |           |                             |           |                        |
|                                        |           |                             |           |                        | 
|                                        |           |                             |           |                        |
+----------------------------------------+-----------+-----------------------------+-----------+------------------------+
: The maximum annual losses of the standard simulation and APB variant from discharging and from charging during market intervals with prices greater than or equal to 500 AUD/MW/hr across all BESS configurations and lookaheads simulated for each formulation. Maximum annual losses are expressed as a percentage of the annual arbitrage revenue of the BESSs for that simulation variant (i.e. standard or APB). {#tbl:max_losses}

To derive adjustments, we calculate the mean and median reductions from the standard simulation to the APB variant in charging losses during intervals with market prices greater than or equal to 500 AUD/MW/hr and take the higher of the two for each storage duration. We calculate reductions by storage durations as shorter duration BESS will charge more frequently, choose the mean and median as aggregation functions so that the adjustments reflect a range of BESS operating practices, and ignore results from the 5 minute lookahead schedules since they are not the result of the intertemporal decision-making that would be common for BESS in the NEM. [@tbl:losses_reductions] shows the mean and median reductions across all formulation and lookaheads (excluding the 5 minute lookahead) simulated for each BESS storage duration. Based on these results, we choose to apply the following adjustments to the raw reductions in arbitrage revenue potential calculated in [@sec:info-case_study-bess_simulations] to better reflect those that would be seen by a BESS optimising its rebids in the NEM:

- -9% for a 4 hour BESS
- -10% for a 1 hour BESS
- -16% for a 15 minute BESS

It is important to note that the APB variant is inappropriate for modelling the impact of using pre-dispatch price forecasts on arbitrage revenue because it provides the BESS scheduler with perfect foresight for the next market interval. This can lead to annual arbitrage revenue improvements (see [@tbl:rev_improvement], which shows the improvements of the APB variant on the standard simulation) that exceed the maximum reduction in losses incurred from charging during market intervals with prices greater than or equal to 500 AUD/MW/hr ([@tbl:max_losses]).

+----------------------------------------+----------------------+
| Storage duration (power/energy)        | Charging loss        |
|                                        |reduction             |
|                                        |                      |
|                                        | (% of annual revenue)|
|                                        |                      |
|                                        |                      |
|                                        +-----------+----------+
|                                        |    mean   | median   |
+========================================+===========+==========+
| 4 hours (25 MW/ 100 MWh)               |    8%     |    9%    |
+----------------------------------------+-----------+----------+
| 1 hour (100 MW/ 100 MWh)               |    10%    |    6%    |
|                                        |           |          |
+----------------------------------------+-----------+----------+
| 15 minutes (400 MW/ 100 MWh)           |    16%    |   15%    |
|                                        |           |          |
+----------------------------------------+-----------+----------+

: Mean and median reduction in losses incurred by charging during intervals with market prices greater than or equal to 500 AUD/MW/hr across all formulations and lookaheads (excluding the 5 minute lookahead) simulated for each storage duration. The reduction is calculated by subtracting the annual charging losses under the APB variant from the annual charging losses under the standard simulation. {#tbl:losses_reductions}

+----------------------------------------+------------------------+
| Formulation                            |APB revenue improvement |
|                                        |                        |
|                                        |(% of standard revenue) |
|                                        |                        |
|                                        +-------+-------+--------+
|                                        | min   |median | max    |
+========================================+=======+=======+========+
| Arbitrage                              |  10%  | 27%   |  50%   |
+----------------------------------------+-------+-------+--------+
| Arbitrage with throughput penalty      |       |       |        |
|                                        |  11%  | 32%   | 68%    |
|(200,000 AUD/MWh)                       |       |       |        |
|                                        |       |       |        |
+----------------------------------------+-------+-------+--------+
| Arbitrage with throughput penalty      |       |       |        |
|                                        |  12%  | 37%   | 74%    |
|(400,000 AUD/MWh)                       |       |       |        |
|                                        |       |       |        |
+----------------------------------------+-------+-------+--------+
| Arbitrage with throughput penalty      |       |       |        |
|                                        |  13%  | 44%   | 78%    |
|(600,000 AUD/MWh)                       |       |       |        |
|                                        |       |       |        |
+----------------------------------------+-------+-------+--------+
| Arbitrage with throughput penalty      |       |       |        |
|                                        |  14%  | 45%   | 86%    |
|(800,000 AUD/MWh)                       |       |       |        |
|                                        |       |       |        |
+----------------------------------------+-------+-------+--------+
| Arbitrage with discounting             |       |       |        |
|                                        |  12%  | 37%   |  74%   |
|(exponential)                           |       |       |        |
|                                        |       |       |        |
|                                        |       |       |        |
+----------------------------------------+-------+-------+--------+
| Arbitrage with discounting             |       |       |        |
|                                        |  14%  | 29%   |  41%   |
|(hyperbolic)                            |       |       |        |
|                                        |       |       |        |
|                                        |       |       |        |
+----------------------------------------+-------+-------+--------+
: Minimum, median and maximum annual arbitrage revenue improvement between the APB variant and standard simulation across all BESS configurations and lookaheads (excluding the 5 minute lookahead) simulated for each formulation. Revenue improvement is calculated as the percentage improvement on the annual arbitrage revenue of the BESS in the standard simulation (i.e. $\textrm{improvement (\%)}=\frac{\textrm{Revenue}_{\textrm{APB}} - \textrm{Revenue}_{\textrm{standard}}}{\textrm{Revenue}_{\textrm{standard}}} \times 100$). {#tbl:rev_improvement}
