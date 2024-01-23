# Methodology for discounting future price forecasts {#sec:appendix-discounting}

Delay discounting was used to model a scheduler's belief that price forecasts will improve as the forecast run time approaches the forecasted delivery time. In other words, discounting price forecasts further into the future represents a time preference for *information*. The rationale for discounting price forecasts is that it can provide robustness to ESR operation by reducing the attractiveness of uncertain opportunities. However it is also problematic as "devaluing" revenues and costs in the near future (i.e. up to a day-ahead) is not reflective of the time periods over which a storage operator's time preferences are stronger (i.e. over multiple months and years). Devaluing future revenues and costs could also lead to missed opportunities (e.g. due to discounted price spikes) and poor decisions (e.g. discounted lower prices that make charging more attractive than it otherwise would be).

Two discounting functions were tested: an exponential discounting function ([@eq:exponential-discounting]), which is commonly used in finance and neoclassical economics, and a hyperbolic discounting function ([@eq:hyperbolic-discounting]), which has been used to model empirical evidence of intertemporal inconsistency in decision-making [@ainslieSpeciousRewardBehavioral1975; @grune-yanoffModelsTemporalDiscounting2015]. Instead of using the hyperbolic discount function to model the *choice* of a decision-maker, we use it to model a potential *belief* about information they might hold: that price forecasts further into the future are likely to be more-or-less equally "untrustworthy" (e.g. a forecast made 8 hours ahead might be as "inaccurate" as a forecast made 12 hours ahead).

$$DF(r, t-t_0) = e^{-r(t-t_0)}$$ {#eq:exponential-discounting}

$$DF(r, t-t_0) = \frac{1}{1+r(t-t_0)}$$ {#eq:hyperbolic-discounting}

Given their importance to market participants, counts of significant pre-dispatch price forecast errors ([@fig:nsw_significant_price_error_counts]) were used to calculate a discount rate for each function (i.e. $r$, in units $hr^{-1}$). Significant price forecast error price counts were max-scaled (i.e. counts at each ahead time were divided by the counts at 24 hours ahead) and then subtracted from one to produce the red curve in @fig:discount_function_fitting. The exponential and hyperbolic discount functions were then fitted to this curve using curve fitting tools in the `scipy` package [@mckinney-proc-scipy-2010]. The values of $r$ obtained from this process (outlined in @tbl:discount-rates) were then used alongside their corresponding discount functions in the arbitrage with discounting MILP formulation ([@sec:appendix-milps-arbdisc]).

+-------------------------+-------------------------+-------------------------+
|                         | Exponential             |Hyperbolic               |
|                         |                         |                         |
|                         |                         |                         |
|                         |                         |                         |
|                         |                         |                         |
+-------------------------+-------------------------+-------------------------+
|Discount rate ($hr^{-1}$)| 0.1994                  |0.4203                   |
|                         |                         |                         |
|                         |                         |                         |
|                         |                         |                         |
|                         |                         |                         |
+-------------------------+-------------------------+-------------------------+
|RMSD                     |0.088                    |0.049                    |
|                         |                         |                         |
|                         |                         |                         |
|                         |                         |                         |
|                         |                         |                         |
+-------------------------+-------------------------+-------------------------+
: Discount rates obtained from fitting discount functions to max-scaled significant price forecast error counts over time, and the root-mean-square deviation (RMSD) of each fit. {#tbl:discount-rates}

![Significant price forecast errors (i.e. > 300 AUD/MW/hr, see @sec:info-case_study-price_forecast_errors for a definition of "significant") as a proportion of all price forecast errors for a given forecast ahead time in NSW in 2021. The horizontal axis labels show both the forecast ahead time in hours and the number of price forecast error samples for that ahead time in square brackets. The number of samples decreases beyond 16 hours (the reason for which is outlined in @sec:info-case_study-bess_simulations-method-price_data) and increases within an hour of delivery as forecasts within this horizon are published more frequently (i.e. 5MPD is published every 5 minutes). The decrease in the proportion of significant price forecast errors from forecasts 24 hours out to forecasts 32 hours out could be explained by the latter forecasting periods late at night or early in the morning – periods when supply and demand conditions are typically more stable and thus predictable [@prakashLookingPredispatchDemand2023]. Pre-dispatch price forecast data were obtained using `NEMSEER` [@prakashNEMSEERPythonPackage2023], and actual market price data were obtained using `NEMOSIS` [@gormanNEMOSISNEMOpen2018]. Errors within an hour of delivery were calculated using 5MPD forecasts. Refer the research data for this article for further details and source code. This plot was generated using `matplotlib` [@hunterMatplotlib2DGraphics2007].](source/figures/NSW1_percent_above_300.0_2021.png){#fig:nsw_significant_price_error_counts}

Though the hyperbolic discount function obtains a better fit and reflects the intuition that forecasts say 15 hours out and 20 hours out are equally questionable, it discounts price forecasts closer to real-time ($\lessapprox$ 6 hours) to a greater degree than the exponential discount function ([@fig:discount_function_fitting]). As we outline in @sec:info-case_study-bess_simulations-method-results, this may, in some cases, lead to poorer arbitrage performance than if an exponential discount function were used.

![Discount function fits to the price forecast error counts for NSW in 2021. To ensure that forecasts further out from delivery were discounted to a greater degree, significant price forecast errors counts were max-scaled and then subtracted from one (i.e. $1-\frac{\textrm{counts}_{\textrm{ahead time}}}{\textrm{counts}_{\textrm{24 hours ahead}}}$)](source/figures/curve_fits_300.0.png){#fig:discount_function_fitting}
