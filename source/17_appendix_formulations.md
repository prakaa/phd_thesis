# Mixed integer linear program formulations {#sec:appendix-milps}

## Assumed battery energy storage system operating characteristics {#sec:appendix-milps-assumptions}

We model a lithium-ion BESS and assume the following with respect to its operating characteristics:

  - The BESS is highly flexible; it has no minimum operating levels and can ramp between charging at its maximum power output in one dispatch interval to discharging at its maximum power output in the next (or vice versa).
  - The BESS is only cycled between lower and upper state-of-charge limits (fixed at 10% and 90%, respectively). Such limits are often imposed by storage operators to avoid the accelerated degradation that accompanies deep discharging (particularly for lithium-nickel-manganese-cobalt-oxide batteries) [@xuRoleModelingBattery2022], and to ensure that market participation obligations can be met by the storage device. Given these state-of-charge constraints and assuming that the BESS is operated at its nominal temperature, current and voltage, we assume that its charging and discharging efficiencies remain constant and fix both at 91% (including inverter losses) [@yangModellingOptimalEnergy2022; @daviesCombinedEconomicTechnological2019]. Combined, these efficiencies yield an ESR round-trip efficiency of ~83%, which is consistent with values used in similar studies [@mcphersonImpactsStorageDispatch2020; @xuRoleModelingBattery2022; @yurdakulRiskAverseSelfSchedulingStorage2023].
  - Self-discharge losses are negligible for a lithium-ion BESS [@bradburyEconomicViabilityEnergy2014].
  - Given that we only model one year of operation, we ignore BESS capacity fade due to cycle and calendar degradation. The latter constitutes an additional opportunity-cost that may modify the attractiveness of certain arbitrage opportunities, particularly if operation over the entire lifetime of the BESS is modelled [@xuRoleModelingBattery2022; @wattsEffectsBatteryDegradation2022].

## Nomenclature

### Indices and sets

\begin{description}[leftmargin=8em,style=nextline]
  \item[$\mathcal{T}$] Ordered set of time periods within the lookahead horizon, i.e. $\mathcal{T} = \{1, 2, 3, ..., T\}$
  \item[$t \in \mathcal{T}$] Time period $t$ in the lookahead horizon. In this study, each $t$ corresponds to the end of a 5-minute dispatch interval
\end{description}

### Parameters

\begin{description}[leftmargin=8em,style=nextline]
  \item[$\tau$] Time duration of a dispatch interval (5 minutes or $\frac{1}{12}$ hours)
  \item[$\lambda_t$] Energy price (forecast or actual) at time $t$ (AUD/MW/hr)
  \item[$\bar{p}$] Maximum power capacity of BESS (MW)
  \item[$\underline{e}$] Minimum level of energy storage (MWh). Fixed at 10\% of energy capacity for all models
  \item[$\bar{e}$] Maximum level of energy storage (MWh). Fixed at 90\% of energy capacity for all models
  \item[$\eta_{\textrm{charge}}$] Charging efficiency (unitless). Fixed at 91\% for all models
  \item[$\eta_{\textrm{discharge}}$] Discharging efficiency (unitless). Fixed at 91\% for all models
  \item[$e_0$] Initial level of energy storage. Fixed at 50\% of energy capacity for the first scheduling step and, for successive steps, is calculated using the binding decision of the last step
  \item[$d_0$] Initial energy storage throughput (MWh). Fixed at 0 MWh for the first scheduling step and, for successive steps, is calculated using the binding decision of the last step
  \item[$d_{\textrm{lifetime}}$] Cumulative energy throughput lifetime of the BESS (MWh). See Table 1 for the values assumed in calculating this parameter.
  \item[$e_{\textrm{rated}}$] Rated (i.e. initial) energy storage capacity of the BESS (MWh). Fixed at 100 MWh for all BESS in this study.
  \item[$c_{\textrm{capital}}$] BESS capital cost per unit of energy storage (AUD/MWh). See Table 1 for the range of capital costs tested in this study.
\end{description}

### Variables

\begin{description}[leftmargin=8em,style=nextline]
  \item[$u_t$] Charge state binary variable, i.e. value of 1 if BESS is charging at time $t$ (unitless)
  \item[$e_t$] Level of energy storage at time $t$ (MWh)
  \item[$p_t$] Discharging power of BESS at time $t$ (MW)
  \item[$q_t$] Charging power of BESS at time $t$ (MW)
  \item[$d_t$] Cumulative BESS energy throughput at time $t$ (MWh)
\end{description}

## Arbitrage {#sec:appendix-milps-arb}

\begin{maxi!}[2]
    {p_t,q_t}{\sum_{t \in \mathcal{T}}{\tau\lambda_t(p_t-q_t)} \label{eq:arb-1a}}
    {}{}
    \addConstraint{u_t}{\in \{0,1\} \label{eq:arb-1b}}  
    \addConstraint{p_t}{\geq 0 \label{eq:arb-1c}}
    \addConstraint{q_t}{\geq 0 \label{eq:arb-1d}}
    \addConstraint{p_t - \bar{p}\left(1-u_t\right)}{\leq 0 \label{eq:arb-1e}}
    \addConstraint{q_t - \bar{p}u_t}{\leq 0 \label{eq:arb-1f}}
    \addConstraint{\underline{e} \leq e_t \leq \bar{e}}{\label{eq:arb-1g}}
    \addConstraint{e_t-e_{t-1}- \left( q_t\eta_{\textrm{charge}}\tau\right)+\frac{p_t\tau}{\eta_{\textrm{discharge}}}}{= 0 \label{eq:arb-1h}}
    \addConstraint{e_1 - e_0 - \left( q_1\eta_{\textrm{charge}}\tau\right)+\frac{p_1\tau}{\eta_{\textrm{discharge}}}}{= 0 \label{eq:arb-1i}}
\end{maxi!}

[@eq:arb-1a] maximises arbitrage revenue over the scheduling lookahead horizon. [@eq:arb-1c] and [@eq:arb-1d] ensure that discharging and charging, respectively, are greater than or equal to 0 MW, and [@eq:arb-1b] introduces binary charge state variables that are used in [@eq:arb-1e] and [@eq:arb-1f] to enforce the BESS maximum power capacity limit and prevent the BESS from simultaneously discharging and charging in the same dispatch interval. [@eq:arb-1g] enforces BESS energy storage limits (the rationale for which we previously discussed in @sec:appendix-milps-assumptions), and [@eq:arb-1h] and [@eq:arb-1i] are intertemporal constraints that model BESS state-of-charge evolution.

## Arbitrage with throughput penalty {#sec:appendix-milps-arbpen}

\begin{maxi!}[2]
    {p_t,q_t}{\sum_{t \in \mathcal{T}}{\tau\lambda_t(p_t-q_t)}  - \frac{d_T - d_0}{d_{\textrm{lifetime}}} e_{\textrm{rated}} c_{\textrm{capital}} \label{eq:arb-2a}}
    {}{}
    \addConstraint{u_t}{\in \{0,1\}} 
    \addConstraint{p_t}{\geq 0}
    \addConstraint{q_t}{\geq 0}
    \addConstraint{p_t - \bar{p}\left(1-u_t\right)}{\leq 0}
    \addConstraint{q_t - \bar{p}u_t}{\leq 0}
    \addConstraint{\underline{e} \leq e_t \leq \bar{e}}{}
    \addConstraint{e_t-e_{t-1}- \left( q_t\eta_{\textrm{charge}}\tau\right)+\frac{p_t\tau}{\eta_{\textrm{discharge}}}}{= 0}
    \addConstraint{e_1 - e_0 - \left( q_1\eta_{\textrm{charge}}\tau\right)+\frac{p_1\tau}{\eta_{\textrm{discharge}}}}{= 0}
    \addConstraint{e_t-e_{t-1}- \left( q_t\eta_{\textrm{charge}}\tau\right)+\frac{p_t\tau}{\eta_{\textrm{discharge}}}}{= 0}
    \addConstraint{d_t-d_{t-1} - p_t\tau}{= 0 \label{eq:arb-2j}}
    \addConstraint{d_1-d_0 - p_1\tau}{= 0 \label{eq:arb-2k}}
\end{maxi!}

[@eq:arb-2a] maximises arbitrage revenue over the scheduling lookahead horizon given a penalty on the throughput accrued by the BESS over the optimisation window. The penalty corresponds to the additional BESS throughput accrued over the scheduling lookahead horizon (i.e. $d_T - d_0$) divided by the assumed BESS warrantied throughput lifetime ($d_{\textrm{lifetime}}$) and multiplied by the assumed BESS capital cost (the product of $e_{\textrm{rated}}$ and $c_{\textrm{capital}}$) (see [@tbl:formulations] for assumed values). Constraints [@eq:arb-2j] and [@eq:arb-2k] are intertemporal constraints that model BESS cumulative throughput evolution. All other constraints are described in @sec:appendix-milps-arb.

## Arbitrage with discounting {#sec:appendix-milps-arbdisc}

\begin{maxi!}[2]
    {p_t,q_t}{\sum_{t \in \mathcal{T}}\left(\tau(p_t - q_t) \times \lambda_t DF(r, t-t_0) \right)  - \frac{d_T - d_0}{d_{\textrm{lifetime}}} e_{\textrm{rated}} c_{\textrm{capital}} \label{eq:arb-3a}}
    {}{}
    \addConstraint{u_t}{\in \{0,1\}}
    \addConstraint{p_t}{\geq 0}
    \addConstraint{q_t}{\geq 0}
    \addConstraint{p_t - \bar{p}\left(1-u_t\right)}{\leq 0}
    \addConstraint{q_t - \bar{p}u_t}{\leq 0}
    \addConstraint{\underline{e} \leq e_t \leq \bar{e}}{}
    \addConstraint{e_t-e_{t-1}- \left( q_t\eta_{\textrm{charge}}\tau\right)+\frac{p_t\tau}{\eta_{\textrm{discharge}}}}{= 0}
    \addConstraint{e_1 - e_0 - \left( q_1\eta_{\textrm{charge}}\tau\right)+\frac{p_1\tau}{\eta_{\textrm{discharge}}}}{= 0}
    \addConstraint{e_t-e_{t-1}- \left( q_t\eta_{\textrm{charge}}\tau\right)+\frac{p_t\tau}{\eta_{\textrm{discharge}}}}{= 0}
    \addConstraint{d_t-d_{t-1} - p_t\tau}{= 0}
    \addConstraint{d_1-d_0 - p_1\tau}{= 0}
\end{maxi!}

[@eq:arb-3a] maximises arbitrage revenue over the scheduling lookahead horizon given discounted future prices (i.e. $\lambda_t DF(r,t-t_0)$) and a penalty on the throughput accrued by the BESS over the optimisation window. The discount function $DF$ is either exponential or hyperbolic, and takes a discount rate $r$ and forecast ahead time $t-t_0$ as arguments. Refer to the next appendix (@sec:appendix-discounting) for the discount function formulae, the methodology for determining discount rates and the discount rate values used in this study's storage modelling. All other constraints are described in @sec:appendix-milps-arb and @sec:appendix-milps-arbpen.
