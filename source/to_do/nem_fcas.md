# Frequency control arrangements in the Australian National Electricity Market {#sec:nem_frequency_control}

## Overview of the NEM

The NEM consists of five regions corresponding to the eastern and
southern Australian states of New South Wales (NSW), Queensland (QLD),
Victoria (VIC), South Australia (SA) and Tasmania (TAS) (Figure
[\[fig:nem\]](#fig:nem){reference-type="ref" reference="fig:nem"}). In
2020, the NEM serviced a total electricity consumption of approximately
190 TWh/year and a peak demand of approximately 35 GW across a 'stringy'
network over 5000 kilometres long with relatively weak interconnection
between regions through interconnectors
[@AustralianEnergyRegulator2021a; @MacGill2020]. As high voltage DC
transmission connects the island of Tasmania to the mainland state of
Victoria, the NEM consists of two synchronous areas operated at a
nominal frequency of 50 Hz: the mainland states and Tasmania. Due to the
large distances involved, the NEM is not electrically connected to other
markets.

::: figure*
![image](figures/NEM.png){width="80%"}
:::

The NEM is a single platform (real-time) energy-only market with no
explicit capacity mechanisms. Unit commitment is managed by market
participants, who must submit resource-specific offers for energy and
Frequency Control Ancillary Services (FCAS) capacity in price-quantity
pairs the day before delivery. These offers are subsequently used in a
pre-dispatch process, which provides forecasted market information (e.g.
generation and demand, interconnector flows, prices, etc.) to market
participants. While prices in submitted offers are fixed, participants
may change the energy volumes in their offer up to a few minutes before
the delivery dispatch interval commences. As the NEM is single-sided,
security-constrained economic dispatch is run every five minute to meet
forecast demand at least cost, subject to network and security
constraints. Much like ISO/RTO markets, energy and FCAS markets are
co-optimised with respect to technical feasibility and cost
[@AustralianEnergyMarketOperator2017; @AustralianEnergyMarketOperator2019i].
Real-time dispatch produces zonal marginal prices for energy and FCAS,
which form the basis for market settlement in each of the NEM's regions.

## FCAS markets

The NEM's competitive FCAS markets consist of eight separate raise and
lower FCAS products that can be classed as regulation FCAS or
contingency FCAS, with the former responsible for control when frequency
is within the normal operating frequency band (NOFB) and the latter for
when frequency deviates outside the NOFB after an event (see Table
[\[tab:nem_fcas\]](#tab:nem_fcas){reference-type="ref"
reference="tab:nem_fcas"}). This is similar to arrangements in many
ISO/RTO markets, where FCS are divided into event and non-event reserves
[@Ela2011].

Security-constrained economic dispatch includes system-wide and regional
FCAS requirement constraints. Regulation and contingency FCAS are
typically procured for and from all regions of the NEM in the absence of
binding local constraints. Local requirements for FCAS procurement apply
to Tasmania and to the other regions of the NEM if they experience
network constraints, are at risk of separation or when islanded[^4]
[@AustralianEnergyMarketOperator2010; @AustralianEnergyMarketOperator2015].
Prices are calculated for each region of the NEM based on the sum of the
shadow prices of local and system-wide constraints and FCAS costs are
allocated to market participants based on a \"Causer Pays\" principle,
which bears similarities to imbalance penalties in European markets
[@AustralianEnergyMarketOperator2015a]. FCAS providers are paid for
enablement (capacity provision) regardless of whether their capacity is
activated
[@Thorncraft2007; @Riesz2015b; @AustralianEnergyMarketOperator2015a].

For a resource to provide FCAS, it must meet pre-qualification criteria
and undergo a registration process. Historically, FCAS was provided by
thermal generation (predominantly coal and some gas), hydropower
generation and some large loads, such as hydropower pumps and an
aluminium smelter, as only resources associated with wholesale energy
market participants were permitted to offer FCAS. In 2017, the first
battery energy storage system (BESS) in the NEM began to offer FCAS and
market reform enabled demand response (DR) aggregators to offer
contingency FCAS without participating in the energy market
[@AustralianEnergyMarketCommission2016; @Aurecon2019a]. In recent years,
new FCAS market entrants have included several DR aggregators, new BESS,
distributed PV-battery virtual power plants and wind farms (the latter
two through trials)
[@Aurecon2019a; @AustralianEnergyMarketOperator2021b; @AustralianEnergyRegulator2021a].
However, these new entrants tend to offer smaller volumes and there are
still relatively few FCAS providers in the NEM, with no single FCAS
product having more than 30 providers across the system or 8 providers
in any one region [@AustralianEnergyRegulator2021a].

::: table*
  =**Product**                                   = **Control Action**                                                                                                                                                                                           = **Procurement**                                                                                                                                                                             = **Timeframes**
  ---------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------
  =Regulation (raise & lower)                    = Centralised control through AEMO Automatic Generation Control (AGC), which adjusts unit set points                                                                                                           = Minimum capacity enablement with dynamic additional reserve setting based on time error for every dispatch interval                                                                         = Unit set points adjusted by AGC every 4 seconds over dispatch interval
  =-second Contingency (fast raise & lower)      =                                                                                                                                                                                                              =                                                                                                                                                                                             = Full response delivered by 6 seconds after frequency has left NOFB and orderly transition to 60-second service
  =-second Contingency (slow raise & lower)      =                                                                                                                                                                                                              =                                                                                                                                                                                             = Full response delivered by 60 seconds after frequency has left NOFB and orderly transition to 5-minute service
  =-minute Contingency (delayed raise & lower)   = Response pre-configured by AEMO but triggered in response to locally-measured frequency. Typically consists of unit control systems increasing or decreasing set points with sustained frequency deviation   = Capacity enablement based on size of largest generator (raise) or load block (lower), minus assumed load relief and corresponding Regulation FCAS procurement for every dispatch interval   = Full response delivered by 5 minutes after frequency has left NOFB and sustained until frequency returns to NOFB or 10 minutes has elapsed

[]{#tab:nem_fcas label="tab:nem_fcas"}
:::

## NEM operation and governance

The Australian Energy Market Operator (AEMO) is responsible for the
operation of the market and power system in the NEM in accordance with
the National Electricity Rules (NER). They act as a single buyer of
dynamically-determined volumes of FCS. The Australian Energy Market
Commission (AEMC) is responsible for making or amending rules for the
NEM. Both AEMO and the AEMC provide operational and strategic advice to
the Energy Security Board (ESB), which is responsible for coordinating
market oversight and longer-term reform such as the ongoing post-2025
NEM market design framework. As the market regulator, the Australian
Energy Regulator (AER) monitors compliance with and enforces the NER.

## Challenges to frequency control posed by VRE and IBR

The rapid pace at which IBR have entered the NEM was preceded by the
exit of FCAS-capable synchronous generation (Figure
[1](#fig:entry_exit){reference-type="ref" reference="fig:entry_exit"}).
Many of these IBR do not currently offer FCAS or any meaningful
frequency response to deviations other than the most extreme.
Furthermore, though updated equipment standards require distributed IBR
to ride-through and/or respond to certain frequency deviations, some
inverter models have been found to be non-compliant and there is still a
significant number of legacy systems in the NEM
[@Stringer2020; @AustralianEnergyMarketOperator2021k].

![Entry (of IBR) and exit (of synchronous generation) capacity in the
NEM between Australian financial years 2013/14 and 2019/20. Data source:
@AustralianEnergyMarketCommission2020d.](./figures/synchronous_ibr_entry_exit.eps){#fig:entry_exit}

The challenges that VRE and other IBR pose to frequency control have
been exacerbated by the NEM's network topology. Limited interconnection
between regions reduces the NEM's cross-regional balancing capabilities
and increases the likelihood of synchronous area separation following
power system events, a consequence of which is that local requirements
for FCAS may apply [@AustralianEnergyMarketOperator2019]. Furthermore,
correlated variability and uncertainty can arise from intensive
development of similar utility-scale VRE in areas with good wind or
solar resources (as might occur in the Renewable Energy Zones identified
by AEMO's least-regrets transmission planning study
[@AustralianEnergyMarketOperator2020h]). This is also an issue at the
distribution level given the significant installed capacities of rooftop
solar PV located within proximity of one another in suburban areas
[@AustralianEnergyMarketOperator2021g].

## Features of NEM frequency control arrangements

Below, we highlight some noteworthy features of the NEM's frequency
control arrangements that complement or contrast previous analyses in
[@Thorncraft2007], [@Riesz2015b] and [@Thorncraft2008].

### Control mechanisms:

-   There is no explicit TFR FCS in the NEM. Security-constrained
    economic dispatch is run every five minutes and is expected to
    relieve PFR and SFR and address supply-demand imbalances
    [@AustralianEnergyMarketOperator2020l].

-   PFR from contingency FCAS is only required to respond to frequency
    deviations outside the NOFB (50 $\pm$ 0.15 Hz). When FCAS markets
    were implemented in the NEM in 2001, mandatory PFR around a tight
    deadband of $\pm$`<!-- -->`{=html}50 mHz was removed from the NER
    [@AustralianEnergyMarketOperator2019e]. Since then and prior to
    2020, there was no explicit procurement or requirement for
    tight-deadband PFR provision within the NOFB. The decline in the
    provision of tight-deadband PFR in the NEM is discussed further in
    Section [4.1](#sec:pfr){reference-type="ref" reference="sec:pfr"}.

-   The mainland synchronous area is controlled as one balancing area by
    AEMO's AGC (i.e. no tie-line biased SFR) despite limited
    interconnection between adjacent regions
    [@AustralianEnergyMarketOperator2018c]. AGC control performance is
    discussed further in Section
    [4.2](#sec:regulation){reference-type="ref"
    reference="sec:regulation"}.

### Market-based mechanisms:

-   There are relatively few limits imposed on FCAS participation. FCAS
    can be provided by any technology through variable, switched or
    hybrid controllers [@AustralianEnergyMarketOperator2020g].
    Furthermore, regulation and contingency FCAS products are unbundled
    into raise and lower services, and contingency FCAS products are
    unbundled based on response time. All of these features improve the
    potential for participation and competition in FCAS markets, though
    market participants can and often are enabled to provide multiple
    FCAS.

-   FCAS unbundling has enabled a 'Causer Pays' cost allocation
    framework. Raise contingency FCAS costs, which are incurred as
    insurance for the failure of a generator, are distributed amongst
    generators in proportion to their generation in the trading
    interval. Similarly, lower contingency FCAS costs are distributed
    amongst loads based on their consumption in a trading interval. A
    complex methodology is used to calculate monthly, portfolio-wide
    Causer Pays contribution factors (outlined in
    [@AustralianEnergyMarketOperator2018b] and summarised in
    [@Riesz2015b]) that determine how regulation FCAS costs are
    allocated to market participants. We discuss the issues associated
    with this methodology in Section
    [4.2](#sec:regulation){reference-type="ref"
    reference="sec:regulation"}.

-   The NEM co-optimises FCAS that respond within similar timeframes. In
    the absence of constraints, the volume of 5-minute delayed
    contingency FCAS procured is reduced by the volume of regulation
    FCAS enabled [@AustralianEnergyMarketOperator2010].

### Regulatory mechanisms:

-   Connecting utility-scale generators negotiate the frequency response
    capability of their plant between a minimum access standard and an
    automatic access standard, the latter guaranteeing network access to
    the applicant. A suite of generator standards for frequency response
    were added to the NER in October 2018 and apply to any
    newly-connecting generation. These standards include minimum
    frequency disturbance ride-through times, automatic generation
    output reduction following extreme over-frequency events and the
    capability to operate in a frequency response mode with a
    proportional response[^5] [@AustralianEnergyMarketCommission2018].

-   Transmission Network Service Providers (TNSPs) are required to
    address any inertia shortfalls identified by AEMO within the NEM
    region in which they build, maintain, plan and operate the
    transmission network. AEMO's assessment considers whether an
    islanded region can be securely operated following a contingency
    event. Shortfalls can be reduced by special protection schemes (e.g.
    disconnection of load following interconnector trip) and the
    provision of FFR, but they must ultimately be met by providers of
    inertial response
    [@AustralianEnergyMarketOperator2018; @AustralianEnergyMarketOperator2020o].

# Insights from the National Electricity Market

In light of existing challenges and those posed by energy transition,
effective and efficient frequency control arrangements should enable
sufficient FCS to be procured across timeframes and strike the
appropriate balance between efficiency and robustness. In the following
sections, we review issues associated with two core elements of the
NEM's frequency control hierarchy (i.e. PFR and SFR), assess their
physical and economic performance and outline reform underway. Drawing
on developments in the NEM and our review of arrangements in North
America and Europe, we then discuss the merits and flaws of regulatory
and market-based mechanisms with respect to sufficiency and efficiency.
We conclude by offering insights that could serve as design principles
for jurisdictions revisiting their frequency control arrangements during
energy transition. []{#sec:insights label="sec:insights"}

## Declining tight-deadband primary frequency response {#sec:pfr}

When FCAS markets were implemented in 2001, mandatory tight-deadband PFR
was superseded by two types of PFR: voluntary PFR within the NOFB and
competitive procurement for PFR outside the NOFB in the form of
contingency FCAS [@AustralianEnergyMarketOperator2019e].

As such, the NEM's frequency control scheme deviated from what has been
argued to be international best practice as it only explicitly specified
and procured wide-deadband PFR (i.e. deadband of
$\pm$`<!-- -->`{=html}150 mHz) [@AustralianEnergyMarketOperator2019e].
In contrast, ENTSO-E specifies that PFR providers have a deadband no
greater than $\pm$`<!-- -->`{=html}10-15 mHz depending on the control
area
[@EuropeanNetworkofTransmissionSystemOperatorsforElectricityENTSO-E2013]
and FERC Order 842 mandates all newly-connecting generation in US
interconnections to operate frequency-responsive control equipment with
maximum deadbands of $\pm$`<!-- -->`{=html}36 mHz
[@FederalEnergyRegulatoryCommissionFERC2018].

In recent years in the NEM, the lack of an incentive or requirement for
tight-deadband PFR and perceived disincentives to its provision (through
Causer Pays contribution factors discussed further in Section
[4.2](#sec:regulation){reference-type="ref" reference="sec:regulation"})
has led to many synchronous generators that once provided tight-deadband
PFR to widen deadbands or install control systems that block or dampen
PFR from the speed governor within the NOFB
[@AustralianEnergyMarketCommission2020]. Furthermore, many VRE
generators were deployed in the NEM and connected with inverter control
systems that were unresponsive to any frequency deviations other than
the most serious.

The extent to which tight-deadband PFR provision had declined in the NEM
and the consequences of this became clear to AEMO following a major
power system incident on the 25^th^ of August 2018
[@AustralianEnergyMarketOperator2019n]. Prior to the event, the QLD
region was exporting $\sim$`<!-- -->`{=html}900 MW to the rest of the
NEM. Around 13:11:41, lightning strikes at the QLD-NSW interconnector
resulted in the QLD region being separated from the rest of the NEM with
excess supply. The SA region was exporting $\sim$`<!-- -->`{=html}200 MW
prior to the event and following QLD's separation, this increased by
more than 200 MW in response to under-frequency. The sudden increase in
active power flow triggered an emergency scheme that disconnected SA
from the NSW-VIC synchronous area, resulting in local over-frequency.

There were diverse responses from various generators following the
double separation event. While many synchronous generators provided some
form of PFR though not enabled for FCAS, their response was withdrawn by
their load controllers in several cases so that the unit could return to
its dispatch target (e.g. green and pink lines in top frame of Figure
[2](#fig:plant_responses){reference-type="ref"
reference="fig:plant_responses"}). Wind and solar farms were either
unresponsive, tripped due to protection settings in their inverters, or
reduced their active power output in line with performance standards
negotiated in their connection agreements (middle and bottom frames in
Figure [2](#fig:plant_responses){reference-type="ref"
reference="fig:plant_responses"}). AEMO attributed slow frequency
recovery and under-frequency load shedding in NSW and VIC to
insufficient PFR from generators and a lack of appropriate contingency
FCAS within the islanded regions. Over 50% of fast and slow raise
contingency FCAS needed in NSW-VIC was enabled in SA and QLD, whilst QLD
had no lower FCAS enabled to respond to over-frequency[^6]
[@AustralianEnergyMarketOperator2019n].

![Active power output of QLD super-critical coal generators (top), SA
solar PV farms (middle) and SA wind farms (bottom). The response of an
individual generator is denoted by solid lines (obtained from 4-second
AEMO SCADA data using NEMOSIS [@Gorman2018]). None of these generators
are enabled for FCAS. The red dashed line in each frame is the regional
frequency as measured by high-speed (1-second) phasor measurement
units.](./figures/all_responses_25082018.eps){#fig:plant_responses}

Prior to this incident, deteriorating control of frequency within the
NOFB was of concern to AEMO and the AEMC, and trials and investigations
were recommended to inform the design of an incentive for tight-deadband
PFR provision [@AustralianEnergyMarketCommission2018a]. However, this
separation event demonstrated the \"urgent need for regulatory changes
to arrest the ongoing decline in frequency performance in the NEM\" and
to enhance \"the resilience of the NEM to similar major disturbances\",
with AEMO submitting a rule change proposal for all capable generators
in the NEM to provide mandatory PFR with a maximum deadband of
$\pm$`<!-- -->`{=html}0.015 Hz (i.e. 10% of the NOFB)
[@AustralianEnergyMarketOperator2019e].

This rule was initially incorporated into the NER in 2020 as a temporary
arrangement through the addition of a \"sunset\" after three years to
demonstrate the AEMC's commitment to investigating incentives or
market-based mechanisms for tight-deadband PFR
[@AustralianEnergyMarketCommission2020; @AustralianEnergyMarketCommission2020b].
AEMO has specified PFR settings, including maximum droop and response
time, but is unable to require generation to reserve headroom for PFR
[@AEMO2020a].

## Performance and efficiency issues of regulation services {#sec:regulation}

For SFR provided by regulation FCAS within the NOFB to be effective, the
dynamics of the system need to accommodate slower SFR control action and
the centralised secondary controller (in the NEM, AEMO's AGC) needs to
be properly configured. Prior to the introduction of mandatory PFR in
the NEM, AEMO observed no significant improvement in NOFB frequency
stability despite several increases in the minimum volumes procured for
regulation FCAS in 2019 [@AustralianEnergyMarketOperator2019e]. This is
likely due to:

-   A lack of fast and decentralised tight-deadband PFR supporting
    slower SFR;

-   Inappropriate control signals being calculated within the AGC due to
    the use of rate limiters to account for ramping constraints, signal
    filtering and generator controller models that do not accurately
    reflect a unit's frequency response [@DIgSILENT2017]. The latter is
    the consequence of an absence of control coordination between market
    participants and AEMO; and

-   Variable communication delays between individual unit controllers
    and AEMO's AGC system, and disparate response times from generators.

Furthermore, the control of all mainland regions as one balancing area
can be problematic in the event of separation. AGC control of regulation
FCAS enabled in islanded regions may exacerbate local frequency
deviations when responding to the AGC frequency reference. This was the
case during the double separation event on the 25^th^ of August 2018, in
which the AGC instructed raise regulation FCAS generators in QLD and SA
to respond to under-frequency in the AGC frequency reference despite
local over-frequency (Figure
[3](#fig:regional_freq){reference-type="ref"
reference="fig:regional_freq"}). Such incorrect control action can occur
until AEMO is able to manually reconfigure the AGC to treat each island
as a control area - a process which can take up to 15 minutes
[@AustralianEnergyMarketOperator2019n].

![Regional phasor measurement unit frequency data and AGC reference
frequency data from AEMO's NSW control centre (obtained using NEMOSIS
[@Gorman2018]) during the power system event on the 25^th^ of August,
2018. Note that the AGC reference frequency deviates in the opposite
direction to local frequency in QLD and
SA.](figures/regional_SCADA_frequencies.eps){#fig:regional_freq
width="0.8\\linewidth"}

Over time, inefficiencies in regulation FCAS procurement and
cost-allocation have also become apparent. Regulation FCAS procurement
in the NEM is dynamic beyond a minimum volume, but the dynamic component
is based on the system time error [@AustralianEnergyMarketOperator2015].
Time error control is largely unnecessary as modern clocks no longer
rely on power system frequency to keep the time [@Rebours2007b].
Furthermore, whilst AEMO is required to control the NEM within certain
time error limits, these have been relaxed in recent years
[@AEMCReliabilityPanel2017]. Given that time error is no longer
prioritised as a control objective, dynamic regulation FCAS procurement
based on better measures of sustained frequency deviation (e.g. mean
absolute error as suggested by @Riesz2015b) and/or a modelled
distribution of potential intra-dispatch ramp uncertainty may be more
suitable.

Regulation FCAS costs are allocated to market participants based on
their contribution factor, a calculation which represents the extent to
which the participant has contributed to the need for regulation FCAS
through a deviation from a dispatch trajectory. Though the calculation
methodology assigns weights to a generator or load's dispatch trajectory
deviation based on the AGC regulation direction and mileage requirement
every 4 seconds, the disincentive for dispatch deviation suffers from a
disconnect to causation. This is because the contribution factors of a
generator or load are averaged over a 5-minute dispatch interval, summed
over a 28-day period and then within a market participant's portfolio
[@AustralianEnergyMarketOperator2018b; @AustralianEnergyMarketCommission2018a; @AustralianEnergyRegulator2020].

Much like portfolio-based balancing in Europe, the aggregation of
contribution factors enables a market participant to offset antagonistic
deviations with assisting deviations (from the provision of
tight-deadband PFR) across its resources and time. However, the
complexity and opacity of the methodology and cost-allocation process
has contributed to the withdrawal of tight-deadband PFR in the NEM.
Several generators disabled governor response in the NOFB in the belief
that dispatch adherence alone will minimise Causer Pays liabilities
[@DIgSILENT2017].

## NEM assessment and outlook

Though the introduction of competitive FCAS markets in 2001 initially
resulted in significantly lower FCAS prices in the NEM
[@Thorncraft2007; @Riesz2015b], volume-weighted average FCAS prices,
particularly those for raise regulation and contingency services, have
increased relative to the volume-weighted average energy price since
2016 (Figure [4](#fig:raise_fcas_vwap){reference-type="ref"
reference="fig:raise_fcas_vwap"}). Furthermore, the increases in minimum
regulation FCAS volumes and reductions in assumed load relief in 2019
have raised the procured volumes of regulation and contingency FCAS,
respectively. Together, these factors have contributed to higher
NEM-wide FCAS costs [@AustralianEnergyMarketOperator2019l]. While
quarterly FCAS costs were less than 1% of quarterly total NEM costs in
2015, 50% of all quarters from 2017 to 2020 had FCAS costs that were
between 1-2% of total NEM costs [@AustralianEnergyRegulator2021a].

![Events and volume-weighted NEM-wide average quarterly prices for
energy, raise regulation FCAS and raise contingency FCAS in the NEM. The
entry of new albeit smaller FCAS providers in 2017 was preceded by the
retirement of several large thermal generation. Q1 2020 FCAS prices were
high due to local procurement in the SA region, which was islanded for
approximately two weeks. Note that while average energy prices fell in
Q2-Q4 in 2020 to levels previously seen in 2014-2015 (due to lower
demand during COVID-19 lockdowns), FCAS prices remained relatively high.
Five-minute price and volume data obtained using NEMOSIS
[@Gorman2018].](figures/energy_raise_fcas_vwap_quarterly_2014_2020_v2.png){#fig:raise_fcas_vwap
width="\\linewidth"}

Prior to the implementation of mandatory PFR, higher NEM FCAS costs were
arguably not accompanied by an improvement in frequency control
performance. Alongside deteriorating frequency control performance
within the NOFB (Figure
[5](#fig:nofb_freq_2005_2018){reference-type="ref"
reference="fig:nofb_freq_2005_2018"}), AEMO has expressed a loss of
confidence in the NEM's resilience to complex power system events, such
as the double separation incident on the 25^th^ of August 2018
[@AustralianEnergyMarketOperator2019e]. These events are typically more
severe than the 'credible' contingency events (i.e. N-1 contingency)
that dictate the volume of contingency FCAS procured.

![Normalised distribution of mainland frequency within the NOFB in 2005
and 2018. Reproduced from
[@AustralianEnergyMarketOperator2019m]](figures/nem_nofb_frequency_2005_2018_digitised.eps){#fig:nofb_freq_2005_2018
width="0.65\\linewidth"}

Since the implementation of the mandatory PFR, settings specified by
AEMO have been applied to a majority of large synchronous generators
($>$`<!-- -->`{=html}200MW) and some smaller synchronous generators.
Despite the absence of requirements for maintaining headroom and/or
footroom, preliminary analysis by AEMO[^7] suggests that mandatory PFR
has delivered better control of frequency within the NOFB (see Figure
[6](#fig:mpfr_dist){reference-type="ref" reference="fig:mpfr_dist"}) and
reduced excursions beyond the NOFB
[@AustralianEnergyMarketOperator2021g]. As a result of this initial
success and further technical advice provided by AEMO, the AEMC has
indicated that it intends to retain mandatory PFR at a tight-deadband
following the \"sunset\" of the initial rule
[@AustralianEnergyMarketCommission2020e].

![Standard deviation of mainland frequency grouped by each day, week,
month or quarter from 2009 to 2021. Some initial PFR setting changes
were made in late September 2020 and many generators moved to final
settings in late October 2020. Source:
@AustralianEnergyMarketOperator2021g.](figures/f_stddev_2009_2021.png){#fig:mpfr_dist
width="0.7\\linewidth"}

However, this initial success may be a result of the headroom maintained
by these generators for risk management purposes (e.g. defending
contract positions) and any headroom made available to the system
through the displacement of more expensive synchronous capacity by VRE.
Given that several large synchronous generators are expected to retire
in the coming decades [@AustralianEnergyMarketOperator2020h], continuing
to rely on this \"free\" headroom (and any available footroom) into the
future may reduce the potential resilience benefits of widespread,
tight-deadband PFR and place a greater burden on generators that do
reserve headroom and hence respond. The AEMC is proposing to address
this issue by paying resources that provide assisting tight-deadband PFR
(\"double-siding\") [@AustralianEnergyMarketCommission2020e].

Presently, several other operational and market changes are being
considered or implemented with the goal of improving the effectiveness
of arrangements in the NEM. AEMO is investigating the use of dispatch
constraints to [@AustralianEnergyMarketOperator2021e]:

-   Procure contingency FCAS volumes based on system inertia;

-   Apply regional contingency and regulation FCAS requirements; and

-   To limit the amount of switched contingency FCAS procured. Switched
    FCAS has a number of limitations compared to governor-like control
    [@AustralianEnergyMarketOperator2020c].

These additional constraints will likely improve the effectiveness of
frequency control arrangements but may lead to higher FCAS costs. In
addition to these procurement changes, the AEMC has made a rule to
introduce raise and lower contingency markets for FFR by October 2023,
each with a likely response time of 1 second
[@AustralianEnergyMarketCommission2021d; @AustralianEnergyMarketOperator2021c].
Whilst AEMO has highlighted that potential stability issues and
interconnector maloperation will need to be managed (e.g. through
delivery caps or provision constraints)
[@AustralianEnergyMarketOperator2021], these FFR markets, along with the
ESB's proposals for short-term scheduling and/or procurement of inertial
response [@EnergySecurityBoard2021a], will likely improve AEMO's
operational toolbox for managing a low-inertia NEM.

## Reactive regulatory requirements

Despite a broad set of FCS markets, there is a high degree of reliance
on regulatory mechanisms in the NEM. Performance standards and mandatory
PFR enforced by connection requirements in the NEM have recently been
aligned with international grid-codes [@Roberts2018]. As argued by TNSPs
and AEMO during the mandatory PFR rule change process, near-universal
widespread provision of frequency control should lead to relatively low
costs for individual participants and be outweighed by greater
visibility and certainty for AEMO alongside the system-wide benefits of
improved physical frequency control performance
[@ChantalHopw2019; @Dillon2019; @AustralianEnergyMarketOperator2019e].

Regulatory mechanisms are ideal for mandating basic FCS capabilities as
a condition for access, which may reduce the need to procure more
specialised FCS, or where FCS faces significant barriers to efficient
price formation or unbundled procurement. The latter reasons are
particularly pertinent in the NEM. Current FCAS prices do not appear to
be incentivising FCS provision from the vast majority of VRE generators,
which have business models centred around energy provision
[@AustralianEnergyMarketCommission2021; @Meegahapola2021]. Furthermore,
procuring inertial response is challenging due to its inseparability
from system strength provision and unit commitment costs
[@Billimoria2020]. With respect to these challenges, regulatory
mechanisms in the NEM have assisted in ensuring some level of frequency
response from most power system resources (e.g. mandatory PFR) and
improving the ability of AEMO and TNSPs to coordinate the procurement of
essential but \"lumpy\" FCS (e.g. inertia shortfall mechanism).

While mechanisms such as mandatory PFR are likely to improve the
robustness of frequency control arrangements, it may be difficult for
other regulatory mechanisms to keep in step with changing physical
performance requirements in systems rapidly facing higher penetrations
of VRE and IBR. Regulatory mechanisms are often only updated after a
number of years to reduce the burden placed on connecting resources. As
such, they are slow to respond to changing capabilities and
requirements. This delay often makes new standards and requirements
reactive rather than proactive. For example, AEMO can only review
utility-scale generator technical performance standards every 5 years
[@AustralianEnergyMarketCommission2018], a timeframe in which the solar
PV capacity installed in the NEM has more than quadrupled (2015-2020)
[@AustralianPVInstitute].

Additional concerns with regulatory mechanisms include poor dynamic
efficiency and opaque costs [@Riesz2015a]. In the absence of
remuneration or incentives, particularly those that are linked to the
quality of frequency response, there is no incentive to innovate or
invest in higher-quality frequency control capabilities
[@Meegahapola2021]. Furthermore, cost opacity may lead to FCS provision
costs being internalised within other prices (e.g. energy) by
participants and prevent the implementation of imbalance or dispatch
non-conformance disincentives through cost-allocation mechanisms.

## Preference for market-based arrangements

Since the establishment of the NEM, a competition norm has been
established, with markets being viewed as a key driver for delivering
the National Electricity Objective of \"efficient investment in, and
efficient operation and use of electricity services\"
[@Haines2016; @MacGill2020a]. This norm has pervaded all levels of
participation and governance in the NEM. Generator owners opposed the
mandatory nature of the mandatory PFR rule change on the basis that a
lack of remuneration was against market principles and that it would
lead to economically inefficient outcomes
[@Skinner2019; @Rolfe2019; @Scott2019]. AEMO did not include a headroom
requirement in its proposal, making the mandatory PFR rule change more
palatable to market bodies and participants. The AEMC, who have
expressed a clear preference for market-based approaches
[@AustralianEnergyMarketCommission2018a], included a \"sunset\" clause
in their initial decision to implement mandatory PFR. Furthermore, and
the scope of the ESB's post-2025 market design process
[@EnergySecurityBoard2020c; @EnergySecurityBoard2021a], a market for FFR
will be implemented in 2023 and the ESB's post-2025 market design
process is considering new system services markets for inertial response
and TFR [@EnergySecurityBoard2021a].

If incentives or remuneration are designed correctly, markets can drive
short-run efficiency. Where required, they can also support investment
in FCS capability and assist a power system in achieving dynamically
efficient frequency control arrangements. However, in some cases, simply
introducing new FCS markets may serve as 'patchwork' solutions to
existing control deficiencies and market failures. These deficiencies
and failures could be partially addressed by improving FCS cost
allocation processes, verifying FCS performance and linking incentives
to higher quality provision.

As discussed in Section [2](#sec:context){reference-type="ref"
reference="sec:context"}, efficient Causer Pays cost-allocation
mechanisms in FCS markets could provide suitable disincentives for
dispatch non-conformance or imbalances. In the NEM, the aggregation of
regulation FCAS Causer Pays contribution factors over time and a
portfolio has resulted in a blunt frequency performance market signal.
The solution to this problem may not be as simple as strengthening
disincentives (e.g. as proposed by @Hirth2015 and @Papavasiliou2020) for
resource-based cost-allocation processes as potential exposure to high
instantaneous FCS costs may lead to participants curtailing or
decommitting flexible resources rather than providing an assisting
frequency response. This has been observed in the NEM when local
constraints have resulted in regulation FCAS
[@AustralianEnergyMarketCommission2018a] and contingency FCAS
[@AustralianEnergyMarketOperator2020] price spikes. The AEMC has
proposed a compromise to this problem by shortening the settlement
period for regulation FCAS Causer Pays to 5 minutes but only allocating
the costs of regulation FCAS capacity that is activated by AEMO (i.e.
the cost of any unactivated capacity is socialised across power system
users) [@AustralianEnergyMarketCommission2020e].

An alternative to Causer Pays is to allocate costs based on needs ('User
Pays'), such that connected equipment imposing RoCoF or frequency
constraints pay for FCS. 'Users' of frequency control currently include
synchronous machines and IBR that have not been configured to
ride-through higher RoCoFs and greater frequency deviations. Following
more extreme frequency deviations, the former may suffer equipment
damage whereas both have the potential to trip
[@DGAConsulting2016; @Miller2017c]. A User Pays approach to
cost-allocation could encourage resources to be more resilient to
frequency deviations and thereby reduce system FCS costs [@Lal2021a],
particularly if a significant proportion of connected equipment are IBR
that can be configured to ride-through such disturbances.

Beyond choosing who costs should be allocated to and what an appropriate
granularity for cost-allocation might be, market designers should ensure
that the chosen methodology is transparent, can be understood by
participants and that any calculations can be replicated using
accessible data. If appropriate design choices are made, efficient
cost-allocation could create counter-parties for financial instruments
that hedge price risk [@Thorncraft2007; @Skinner2020]. FCS derivatives
may drive investment in FCS capabilities by supporting business models
in which FCS is a major revenue stream (this is currently the case for
utility-scale BESS, DR aggregators and virtual power plants in the NEM)
and assist in FCS price formation [@Pollitt2019a; @Billimoria2020].

As in ISO/RTO Regulation markets, aligning FCS procurement and/or
remuneration with performance essentially recognises that there is a
spectrum of FCS capabilities. This recognition is lacking in the NEM,
where battery energy storage systems are responding precisely and
rapidly to AGC regulation signals but are being paid the same as thermal
plant that provide lower quality regulation FCAS
[@AustralianEnergyMarketOperator2018i]. However, implementing
performance-based design is contingent on the SO verifying FCS
provision. While AEMO has outlined FCAS delivery measurement standards
and verification principles [@AustralianEnergyMarketOperator2020g],
delivery verification appears to be restricted to confirming contingency
FCAS delivery following a power system event (to the authors' best
knowledge). While a regular verification process does not appear to be
in place for regulation FCAS, AEMO is proposing to specify minimum
control requirements (e.g. response delay and ramp rate) and implement a
regular testing cycle for resources registered for regulation FCAS
[@AustralianEnergyMarketOperator2021l].

Market designers may also need to consider price formation in FCS
markets to ensure that arrangements are at least capable of supporting
investment during energy transition. As discussed by @Hirth2015, VRE
have low to no short-term energy market opportunity-costs when providing
lower/negative FCS but can incur significant short-term energy market
opportunity-costs when providing raise/positive FCS. The raise/positive
opportunity-cost may be even higher if the SO requires additional
curtailment to better ensure that FCS capacity is firm, which AEMO has
required, or if the resource has entered into an energy off-take
agreement, which is common in the NEM [@AEMO2018d]. While co-optimised
FCS markets mean that such opportunity-costs can be accounted for, FCS
prices can be suppressed if large conventional generators with low to no
opportunity-costs offer large volumes of FCS. Low prices can limit the
incentive for high capital, low operating cost IBR to provide and invest
in FCS capabilities. This may lead to a dynamically inefficient outcome
as additional conventional generators are retired and limited FCS
capabilities are offered by VRE and other IBR
[@Ela2019; @Meegahapola2021]. As discussed in Section
[2.3.2](#subsubsec:efficiencychallenges){reference-type="ref"
reference="subsubsec:efficiencychallenges"}, one potential solution to
this issue is to strengthen scarcity pricing in FCS markets. The AEMC
and ESB have discussed implementing system demand curves with scarcity
pricing for all existing and proposed FCAS
[@EnergySecurityBoard2020c; @AustralianEnergyMarketCommission2020b].
However, the shape of these system demand curves and how they account
for interdependent or interchangeable FCAS will ultimately dictate their
success.

# Conclusion

Whilst recent years have seen increasing participation from demand
response and IBR, energy transition and a pervasive competition norm
have exposed design issues in the NEM's frequency control arrangements.
As such, considerable attention and effort have been devoted to
reforming the NEM's arrangements in the past two years.

From our review of North American and European frequency control
arrangements and our analysis of the NEM's, we share four key insights
below that could serve as design principles for operators, regulators
and market-bodies attempting to design effective and efficient frequency
control arrangements in restructured electricity industries during
energy transition:

1.  Control deficiencies may not be addressable through introducing new
    FCS. While this solution may address emerging needs (e.g.
    low-inertia operation), SOs and market bodies need to better
    understand the interdependency, interoperability and
    interchangeability between FCS and the interactions with other
    technical attributes of the power system (e.g. system strength) to
    ensure that frequency control is first and foremost effective. Once
    this has been achieved, the short-run efficiency of arrangements can
    be improved through mechanisms such as dynamic and probabilistic
    dimensioning and co-optimising the procurement of interchangeable
    FCS.

2.  Given the pace and scale of energy transition, a dynamically
    efficient outcome in some power systems may require additional
    investments in FCS capability. FCS prices can be strengthened
    through scarcity pricing, which may better reflect the system's
    preference for security and reliability. Such pricing mechanisms are
    complementary to appropriate and efficient cost-allocation based on
    causation or needs. Both efficient price formation and
    cost-allocation will improve the potential for FCS derivatives,
    which may assist in providing price signals for investment.

3.  SOs should systematically and frequently verify FCS delivery, where
    relevant, and withhold or penalise remuneration when delivery is
    deemed to be insufficient. If such monitoring is in place, FCS
    remuneration can be performance-based to drive the provision of high
    quality FCS. Performance monitoring would also enable the SO to
    assess FCS arrangements and identify any deficiencies in control
    action or procurement.

4.  During energy transition, a suitable set of frequency control
    arrangements will most likely involve a combination of market-based
    and regulatory mechanisms. Frequency control is a power system
    public good and achieving frequency stability requires a degree of
    coordination and cooperation between resources. These
    characteristics make it difficult to establish complete markets for
    FCS, and an emphasis on market solutions may obscure these
    characteristics to market participants and undermine effective
    control. In contrast, regulatory mechanisms may prove to be more
    robust and resilient in the face of uncertainties, particularly
    those that are exogenous to the power system (e.g. climate risk).
    Regardless of whether arrangements are skewed towards market-based
    mechanisms or regulatory mechanisms, designers should be more
    forward-looking and avoid assumptions regarding the provision of FCS
    capability over time, particularly when there is a pervasive
    competition norm and effective frequency control relies on
    sequential and hierarchical control actions.

# Acknowledgements {#acknowledgements .unnumbered}

The authors would like to thank Andrew Corrigan and Max Zekulich for
sharing their data and analysis on frequency response and FCAS markets.
We greatly appreciate the thoughtful comments provided by the reviewers
in response to our original submission. This research was supported by
an Australian Government Research Training Program Scholarship and by
the UNSW Digital Grid Futures Institute.




[^4]: From 2015-2019, the Tasmanian and mainland contingency FCAS
    markets were separated on average for 40% of the time due to the
    technical limitations of the high voltage DC interconnector
    [@GHDAdvisory2019]. However, if the interconnector flow is within
    the appropriate operating envelope, NEM-wide FCAS procurement is
    possible as the interconnector's frequency controller enables FCAS
    transfer between the mainland and Tasmania [@AEMO2017e].

[^5]: In addition to these standards, newly-connected generation may
    install a synchronous condenser under the 'do no harm' requirements
    outlined in the NER if they are determined to have an adverse impact
    on system strength. Particularly when fitted with a rotating mass or
    flywheel, these synchronous condensers can also provide inertial
    response [@AustralianEnergyMarketOperator2020e].

[^6]: AEMO is currently investigating appropriate regional requirements
    for FCAS, particularly for contingency FCAS in the terminal regions
    of QLD and SA
    [@AustralianEnergyMarketOperator2019m; @AustralianEnergyMarketOperator2020b]

[^7]: We note that AEMO has yet to complete mandatory PFR
    implementation. In particular, settings have yet to be changed for
    many VRE plant as inverter control system software changes are being
    trialled.
