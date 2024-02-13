\appendix
\renewcommand\thefigure{\thechapter.\arabic{figure}}
\renewcommand\thetable{\thechapter.\arabic{table}}
# Data and assumptions used in market simulation {#sec:appendix-reserves_assumptions}

## Resource ramp rates

Separate upwards and downwards ramp rates were modelled for most resource types. For hydro generation and reciprocating engines, maximum upwards and downwards ramp rates were sourced from @ghd2018AEMOCost2018. For other conventional resources (coal-fired generation, Gas-Steam, CCGT and OCGT), ramp rates in each direction were further separated into a *market* ramp rate, which was used in the PLEXOS market simulation, and an *upper* ramp rate, which was used to calculate available reserves/footroom. For these resources, the market ramp rate was calculated using the unit ramp rates used most frequently in NEM dispatch[^36] in 2020, and the upper ramp rate was calculated using resources' assumed maximum ramp rates in AEMO's 2020 Inputs and Assumptions workbook (for an example of a comparison, see @fig:ramp_rate_comparison) [@australianenergymarketoperator2020InputsAssumptions2020]. Additional resources in 2025 were assumed to have the same ramp rate characteristics as newer existing resources of the same technology type.

[^36]: The ramp rate used in dispatch by AEMO is the lesser of a telemetered rate or a ramp rate submitted in a resource's offer for energy, and was obtained using NEMOSIS [@gormanNEMOSISNEMOpen2018].

![Ramp rates observed (red) and used in dispatch by AEMO (blue) for a coal-fired unit in NSW in 2020. The green line denotes the ramp rate assumed by AEMO in its 2020 Inputs and Assumptions workbook and the 2020 ISP.](source/figures/coal_market_upper_ramps.png){#fig:ramp_rate_comparison short-caption="Observed, submitted and ISP ramp rates for a NSW coal-fired unit"}

## Unit commitment and cycling constraints

Many existing flexible conventional resources (OCGT, reciprocating engines and hydro generation) submit dispatch inflexibility profiles to AEMO that contain the resource's time to start up and reach MSL, the MSL itself, the time required at minimum loading and the time taken to shut down [@australianenergymarketoperatorFastStartInflexibilityProfile2021]. The most frequently offered fast start inflexibility profile of a resource in 2020 was obtained using NEMOSIS [@gormanNEMOSISNEMOpen2018] and used to calculate its start-up rate, minimum up-time, MSL and shutdown rate. The minimum down-time for these resources was chosen to be equal to the minimum up-time.

For the other conventional resources (CCGT, coal-fired generation and Gas-Steam), minimum up-times, minimum down-times and MSLs were obtained from AEMO's 2020 Inputs and Assumptions workbook [@australianenergymarketoperator2020InputsAssumptions2020] and start-up rates were calculated based on hot or warm start times (i.e. depending on the start state of the resource after being offline for its minimum down-time) obtained from @ghd2018AEMOCost2018 or @aureconaustralasiaGeneratorTechnicalCost2020. The shut-down rates for these resources were calculated based on actual shutdowns, or those of similar technology types, observed in AEMO dispatch data that was obtained using NEMOSIS [@gormanNEMOSISNEMOpen2018].

BESS were dispatched by PLEXOS's arbitrage algorithm subject to charging and discharging efficiencies and maximum and minimum state of charge constraints that corresponded to those assumed within AEMO's 2020 Inputs and Assumptions workbook [@australianenergymarketoperator2020InputsAssumptions2020]. Given an assumed economic lifetime of 10 years [@australianenergymarketoperator2020InputsAssumptions2020] and 3000 cycles [@dasilvalimaLifeCycleAssessment2021] for lithium-ion BESS, a constraint of 300 cycles per year was applied to BESS in each scenario.

## Partial and forced outages

Maintenance rates, forced outage rates (partial and full) and the corresponding mean time taken to repair were modelled for all conventional generation and were sourced from AEMO's 2020 Inputs and Assumptions workbook [@australianenergymarketoperator2020InputsAssumptions2020].

## SA synchronous generation requirement

At present, certain combinations of synchronous generators are required to remain online for power system security in SA. Should ahead processes indicate that the synchronous generation expected to be online and dispatched is inadequate to provide sufficient system strength in SA, AEMO will intervene in the market and direct additional synchronous generation online [@guReviewSystemStrength2019]. The various sufficient combinations of synchronous generation in SA are outlined in @australianenergymarketoperatorTransferLimitAdvice2022, with a decrease in requirements/increase in the allowable asynchronous generation level following the installation of 4 synchronous condensers (completed in 2021). To model these requirements, a must-run condition was imposed on 3 CCGT units and 1 Gas-Steam unit in 2020, and on 2 CCGT units and 1 Gas-Steam unit in the 2025 scenarios. These combinations reflect a subset of the sufficient combinations outlined in @australianenergymarketoperatorTransferLimitAdvice2022.

## Hydro generation monthly energy constraints

Run-of-river hydro generation and pumped hydro storage in NSW were aggregated and modelled as dispatchable generation with monthly energy constraints. These monthly energy constraints correspond to the average monthly inflows for the Snowy scheme (NSW and Australia's largest hydro scheme) across financial years 2011 to 2018 (obtained from @australianenergymarketoperator2020InputsAssumptions2020). Though this model for hydro does not account for the additional generation that could be extracted from pumped storage, the application of monthly energy constraints could be interpreted as modelling one pattern of run-of-river hydro operation and/or enforcing the same reservoir level at the start and end of each month (and thus at the start and end of each year). Explicitly modelling reservoir schemes, inflows for individual hydro generators and pumping opportunities for pumped hydro storage are likely to improve the accuracy of the methodology proposed in this work for systems with significant shares of hydropower capacity.

## Demand and VRE traces

Chronological demand traces at 5-minute resolution were used in the market simulation. For each region, historical operational demand for 2020 at 5-minute resolution was obtained using NEMOSIS [@gormanNEMOSISNEMOpen2018] and used as the demand trace for the 2020 scenario. AEMO ISP demand traces were available for each 2025 scenario at half-hourly resolution [@australianenergymarketoperator2020DraftISP2019a]; 5-minute resolution demand traces for each 2025 scenario were produced by scaling 5-minute historical operational demand by a corresponding half-hourly scaling factor, which was calculated as the ratio of the ISP scenario's 2025 demand trace to the ISP scenario's 2020 demand trace.

Half-hourly chronological solar PV and wind capacity factor traces were obtained from AEMO's ISP database for each 2020 scenario [@australianenergymarketoperator2020DraftISP2019] and for each 2025 scenario [@australianenergymarketoperator2020ISPSolar2020]. Generation traces were obtained by multiplying the capacity factor trace of a resource by its nameplate capacity. Capacities for existing and committed VRE plants were obtained from AEMO's 2020 Inputs and Assumptions workbook [@australianenergymarketoperator2020InputsAssumptions2020] and any additional VRE capacity that was built out in the 2025 scenarios was assigned to AEMO-designated Renewable Energy Zones (for which capacity factor traces are available) based on the ISP's generation capacity outlook. The half-hourly generation traces for each resource and Renewable Energy Zone in a region were than aggregated and linearly interpolated for use in the 5-minute resolution market simulation.

## Resource market offers

For all scenarios for a given region, one set of four static price-quantity pairs were used to represent each resource's offer in the market simulation. Except for hydro generation, offers were priced *a priori*. The type of the resource determined how each band was priced (price bands for each resource type are outlined in @tbl:resourceoffers) [^37]:

- For wind and solar PV generators, the entire available forecasted energy was offered at the market floor price to ensure preferential dispatch of VRE where possible.
- For baseload conventional resources (coal-fired generation and Gas-Steam), the first band was priced at or close to the market floor price to ensure the resource's MSL would clear the market. The second band was priced close to the short-run marginal cost (SRMC) of the resource. The SRMC was calculated using the average heat rate, fuel price and variable operating and maintenance cost of each resource type obtained from @australianenergymarketoperator2020InputsAssumptions2020. The third band was priced at a premium relative to the resource's SRMC and the fourth band was offered at the market cap price.
- For peaking generation (OCGT and reciprocating engines), the first band was priced close to the SRMC of each resource, which was calculated in the same manner as for baseload conventional resources. The second and third band were offered at a moderate and higher premium relative to the resource's SRMC, respectively. The fourth band was offered at the market cap price.
- Hydro generation offers were adjusted iteratively to align the proportions of annual generation and average market prices of the NSW 2020 scenario with those calculated from historical data.

|    Generator Type    | Price Band 1 (AUD/MWh) | Price Band 2 (AUD/MWh) | Price Band 3 (AUD/MWh) | Price Band 4 (AUD/MWh) |
|:--------------------:|:----------------------:|:----------------------:|:----------------------:|:----------------------:|
|         Coal         |         Floor          |           30           |           50           |          Cap           |
|         CCGT         |   40/Floor (NSW/SA)    |           70           |          170           |           -            |
|         OCGT         |    100/175 (NSW/SA)    |    200/300 (NSW/SA)    |          500           |          Cap           |
| Reciprocating Engine |          175           |          300           |          500           |          Cap           |
|      Gas-Steam       |         Floor          |           90           |          190           |          Cap           |
|         Wind         |         Floor          |           -            |           -            |           -            |
|       Solar PV       |         Floor          |           -            |           -            |           -            |
|        Hydro         |           35           |           60           |          300           |          Cap           |

: Offers by resources type for NSW and SA across all scenarios. The market floor and cap prices used were -1000 AUD/MW/hr and 15,000 AUD/MW/hr, respectively.  []{#tbl:resourceoffers short-caption="Offers by resource type for NSW and SA across all scenarios"}

[^37]: For all conventional resources, the distribution of offer prices resembles "hockey-stick" offer curves that are common in the NEM [@energysynapseDemandResponseNational2020] and in other electricity markets [@hurlbutProtectingMarketHockey2004]. Moreover, for most peaking conventional resources, energy is offered at or just above the strike price of cap options/futures (300 AUD/MWh).

### Calibration {#sec:calibration .unnumbered}

Resource offer quantities were used to calibrate the 2020 simulation with historical generation patterns in each state. The quantity of energy in each price band was adjusted in an iterative process of offer adjustment and market simulation to ensure that the proportion of annual generation of a particular resource type in the simulated 2020 scenario was similar to the actual proportion of annual generation for that resource type in 2020. The combination of offer quantities that produced the closest proportions were retained and used for each state's 2020 and 2025 scenarios. The results of the calibration for NSW and SA are outlined in @tbl:nswcalibration and @tbl:sacalibration, respectively.

|                 | Coal | Wind | Hydro | Solar PV | CCGT | OCGT |
|:----------------|:----:|:----:|:-----:|:--------:|:----:|:----:|
| NSW 2020        | 82.9%| 6.4% | 4.5%  |   3.2%   | 2.4% | 0.6% |
| Historical 2020 | 84.5%| 6.6% | 3.8%  |   3.3%   | 1.5% | 0.3% |

: Percentage of annual generation by resource type for the simulated NSW 2020 scenario and for NSW in 2020 (calculated based on historical data obtained using NEMOSIS [@gormanNEMOSISNEMOpen2018]).   []{#tbl:nswcalibration short-caption="NSW 2020 calibration results (by resource type)"}

|                 | Wind  | CCGT  | Gas-Steam | Solar PV | OCGT | Reciprocating Engine |
|:----------------|:-----:|:-----:|:---------:|:--------:|:----:|:--------------------:|
| Historical 2020 | 43.7% | 29.7% |   15.1%   |   5.1%   | 2.3% |         3.5%         |
| SA 2020         | 45.6% | 25.6% |   16.8%   |   8.0%   | 2.3% |         1.6%         |

: Percentage of annual generation by resource type for the simulated SA 2020 scenario and for SA in 2020 (calculated based on historical data obtained using NEMOSIS [@gormanNEMOSISNEMOpen2018]). Note that percentages may not sum to a total of 100% due to net storage in BESS.   []{#tbl:sacalibration short-caption="SA 2020 calibration results (by resource type)"}
