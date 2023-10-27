# Literature review {#sec:lit_review}

## Introduction

<!--
Due to falling capital costs and growing concern around carbon-intensive electricity production and global warming, power systems around the world are undergoing an energy transition in which synchronous generators fuelled by fossil fuels are being displaced by variable renewable energy resources, such as solar photovoltaic systems and wind turbines [@DeConinck2018]. The inherent characteristics and control systems of variable renewable energy and other inverter-based resources differ from those of conventional synchronous generators. This poses both opportunities and challenges to the control of alternating current (AC) frequency in the power system. Failure to ensure that frequency is controlled within power system limits may result in equipment damage, load shedding and cascading failures that lead to blackouts.
-->

## Outline of literature review

<!--
In this literature review, we lay a theoretical foundation for designing efficient and effective frequency control arrangements in electricity markets with growing levels of inverter-based resources. Frequency control arrangements include the specification, procurement and provision of frequency control services and products from power system resources. In [2](#sec:elec_markets){reference-type="ref" reference="sec:elec_markets"}, we review current electricity market structures and practices, with a focus on how mandatory pool markets attempt to balance supply and demand for electricity. In [3](#sec:fundamentals){reference-type="ref" reference="sec:fundamentals"}, we explore how the supply-demand balance is linked to AC frequency and how synchronous machines behave in response to frequency deviations. Then, in [4](#sec:freq_dev_control){reference-type="ref" reference="sec:freq_dev_control"}, we explore the need for frequency control and outline a typical power system frequency control scheme. In [5](#sec:ibr_freq){reference-type="ref" reference="sec:ibr_freq"} and [6](#sec:procurement){reference-type="ref" reference="sec:procurement"}, we explore the existing and emerging challenges and opportunities that are faced by control mechanisms and schemes, and frequency control services procurement mechanisms, respectively. Finally, in [7](#sec:designing_arrangements){reference-type="ref" reference="sec:designing_arrangements"}, we frame the frequency control arrangement design problem in mandatory pool markets and outline the outcomes we expect from good design.
-->


## Power systems {#sec:lit_review-power_systems}

Given the welfare and economic benefits associated with electricity access, many 20^th^ century states constructed large bulk *power systems* to leverage investment & operational economies of scale. These systems sought to efficiently deliver active power (i.e. power that does work) to numerous electricity end-users (*demand* or *loads*) from electricity suppliers ( *generators*) across vast distances. A typical power system configuration is presented in [@fig:elec_supply_chain]. Generators supply the system with alternating current (AC) power either through a direct electromagnetic connection or through a power inverter interface (which converts the direct current, or DC, produced by the generator to AC). AC power is then efficiently transmitted over long distances through a high voltage *transmission* system. As transmission lines approach load centres, voltages are stepped down to make power delivery to the houses and businesses connected to the lower voltage *distribution system* safer [@mastersRenewableEfficientElectric2004].

![Conventional bulk power system, including generation, transmission,
distribution and industrial, commercial and residential end-users (loads). Source: @australianenergymarketoperatorIndustryOverview2023.](source/figures/electricity_supply_chain.pdf){#fig:elec_supply_chain width=100% short-caption="The bulk power system as an electricity supply chain"}

### Synchronous and control areas

A network area that is operated at a (constant) nominal AC frequency is known as a *synchronous area*. During stable operation, AC frequency should be close to the system's nominal value and more-or-less uniform across the synchronous area. A *control area*, on the other hand, is a network area in which a *system operator* (SO) is responsible for maintaining a balance between supply and demand for electrical power. Whether the term "power system" refers to a synchronous area or a control area is often dependent on context — in particular, the relationship between the two in the jurisdiction in question. In eastern and southern Australia, the National Electricity Market's (NEM) single control area consists of two synchronous areas (see [@sec:fcs-nem] for further detail). In contrast, other jurisdictions have a single synchronous area composed of several electrically-connected control areas demarcated by political rather than physical  boundaries. For example, continental Europe is a single synchronous area consisting of many national or trans-national control areas, and the continental United States has three synchronous areas (two of which extend into Canada) with over 60 control areas [@schittekatteDistributedEnergyResources2022; @northamericanelectricreliabilitycorporationNERCInterconnections2023]
    
## Power system operations

In broad terms, *operating* a power system involves the direction or control of *power system resources* — generators, loads, network elements and energy storage resources (which can act as both a generator and a load). In practice, however, power system operation is inseparable from the economic objective imposed upon SOs: minimise system costs (or under some market paradigms described in [@sec:lit_review-operational_paradigms], maximise the value of trade) whilst 1) continuously maintaining a balance between active power supply & demand and 2) ensuring that system resources & the system itself are operated within their respective technical envelopes [@woodPowerGenerationOperation2014]. The latter constraint implies *stable* & *secure* operation and is a prerequisite for the former constraint, which more-or-less corresponds to *reliable* operation[^1].

[^1]: Strictly speaking, reliability is typically defined as the ability of generation to supply load requirements to an administratively-set standard.

Noting that planning & investment have a large bearing on the manner in which a power system is operated (and vice versa), [@fig:power_system_timeframes] presents a high-level overview of power system phenomena and processes, services & markets that are most pertinent to active power balancing in operational timeframes, with those discussed in detail within this thesis highlighted in bold red text.

![A high-level overview of power system concepts, phenomena and processes, services & markets relevant within operational timeframes (bounded by the red dashed box). All non-faded text in the bottom section indicates a process, service and/or market related to active power balancing. All bold red text in the bottom section indicates a process, service and/or market related to active power balancing that is discussed in detail in this thesis. Timeframes, phenomena and stability categories were adapted from @machowskiPowerSystemDynamics2020 and @hatziargyriouDefinitionClassificationPower2021. The figure concept and layout was inspired by a similar figure presented in @wilsonIntroductoryPresentation20202020.](source/figures/power_system_timeframes.pdf){#fig:power_system_timeframes width=100% short-caption="High-level overview of power system concepts, phenomena and processes, services & markets relevant within operational timeframes"}
    
### Phenomena in operational timeframes

As shown in @fig:power_system_timeframes, power system operations is concerned with phenomena that dominate on timescales ranging from a few milliseconds to several months [@hatziargyriouDefinitionClassificationPower2021; @machowskiPowerSystemDynamics2020]:

1.  *Electromagnetic* phenomena arise from the coupling of electrical and magnetic fields within *synchronous machines* (generators and motors that rotate at a speed proportional to AC frequency) and between power system resources. They occur on the timescale of milliseconds to seconds. Controls for *inverter-based resources*, which have a power electronic inverter interface to the wider power system, also operate in this timeframe.

2.  *Electromechanical* phenomena are slower (seconds to minutes timescale) and arise as a result of electromagnetic fields interacting with rotating masses and mechanical forces. These typically occur in motors and generators.

3.  *Thermodynamic* phenomena are slower still. They encompass chemical fuel conversion & heat transfer processes in boilers. These phenomena occur over multiple timeframes, from seconds to minutes to hours. I will also extend this category to include the dynamic behaviour of the primary energy sources for hydroelectricity and *variable renewable energy* (VRE), which primarily refers to wind and solar photovoltaic (PV) generation.

### The need for system balance

#### Synchronism

Following synchronisation, generators (e.g. turbines) and loads (e.g.
motors) that rotate at a speed proportional to the power system
frequency are known as *synchronous machines*. As shown in
[\[eq:synch_speed\]](#eq:synch_speed){reference-type="ref"
reference="eq:synch_speed"}, the *synchronous speed* is dependent on the
number of poles of the machine and the power system frequency
[@Grainger1994].

$$N_s = \frac{120f}{P}
        \label{eq:synch_speed}$$

where $N_s$ is the synchronous speed in revolutions per minute, $P$ is
the number of magnetic poles and $f$ is the electrical frequency in Hz.

Power system frequency control is required for the stable operation of a
synchronous area. Should synchronous machines be exposed to high RoCoFs
and sufficiently serious frequency deviations, they may experience
equipment-damaging vibrations [@Ulbig2014] or suffer from pole slipping
due to a loss of synchronism [@DGAConsulting2016]. As such, if frequency
control services are insufficient in their response, *under-frequency
load shedding* (UFLS) relays or *over-frequency generation shedding*
(OFGS) relays, and frequency-sensitive equipment protection relays are
used as emergency frequency control schemes and equipment protection
measures, respectively
[@Eto2018; @AustralianEnergyMarketCommission2019].

The activation of these schemes is undesirable, particularly as UFLS is
reflected in power system reliability metrics. Moreover, the presence
and configuration of these schemes in the power system means that if
frequency deviations are sufficiently large, a cascading series of trips
and faults may aggravate the active power imbalance and lead to power
system black-out and collapse [@Ulbig2014; @Hartmann2019].

### Threats to system balance

As highlighted in
[\[eq:swing_area\]](#eq:swing_area){reference-type="ref"
reference="eq:swing_area"}, the AC frequency of a power system can
deviate from its nominal value when there is an imbalance between power
supply and demand in the synchronous area. Active power imbalances are
the result of power system *variability* and *uncertainty*.

#### Variability

Variability refers to expected or forecast fluctuations in the balance
of active power supply and demand [@Ela2011]. Sources of variability
include fluctuations in load, oscillatory active power output from
synchronous generators and changing weather conditions (e.g. cloud
cover, wind speed) that may affect the active power output of VRE
[@Ela2011; @Bloom2017; @Riesz2015a].

#### Uncertainty

Uncertainty refers to unexpected fluctuations in the balance of active
power supply and demand [@Ela2011]. Power system uncertainty encompasses
the unanticipated behaviour of generators, loads and network elements.
This includes unexpected outages (known as *contingency events*) and
weather forecast errors that lead to VRE generation forecast error
[@Ela2011; @Riesz2015a] 

## Operational paradigms{#sec:lit_review-operational_paradigms}

Synchronous areas can be subdivided into *control areas*, which are typically demarcated by the network boundaries of separate electric utilities or electricity markets [@Grainger1994; @Elgerd1971]. Within a control area, the control of AC frequency is the responsibility of a system operator.

### Vertically-integrated

Historically, this configuration enabled economies of scale in both
asset investment and operation to be achieved by electric utilities,
particularly regulated monopolies that owned and operated most, if not
all, of the generation, transmission and distribution infrastructure
within a power system and were responsible for the retail of electricity
to the end-user (these regulated monopolies are known as
vertically-integrated utilities) [@Masters2004].

### Restructuring and the emergence of wholesale electricity markets

In mandatory pool markets, the system operator commits and dispatches
individual generators (and, in some cases, loads) in the day-ahead and
real-time markets, respectively, based on economic optimisation
processes that incorporate transmission constraints and stability and
reliability requirements. These processes are *security-constrained unit
commitment* (SCUC), which is executed in the day-ahead market, and
*security-constrained economic dispatch* (SCED), which is executed just
prior to the relevant real-time market interval. In many mandatory pool
markets, SCED and SCUC co-optimise the provision of energy and frequency
control services

It should be noted that these processes are not exclusive to mandatory
pool markets and could be used by vertically-integrated utilities to
efficiently schedule resources in the power system [@Grainger1994].

#### Electricity industry restructuring

Beginning in the early 1990s, perceived inefficiencies and overspend by
monopoly electric utilities, advancements in small low-upfront cost gas
turbine technologies and the successful liberalisation of other
industries such as airlines and telecommunications prompted many
countries to restructure their electricity industries
[@Weigt2009; @Miller2017]. A common feature of this process across power
systems was the implementation of a wholesale market for electricity,
where generators compete for the opportunity to supply electricity and
earn revenue through an auction-based mechanism [@Milligan2017].

#### Electricity market structures and features

##### System operator

In restructured electricity industries, the implementation of wholesale
markets was accompanied by the creation of an independent power system
operator to operate the transmission network, manage and administer the
electricity market, maintain short-term power system *reliability* (the
ability to meet demand with supply) and *security* (the ability to
operate the power system within a defined operating envelope), and carry
out longer term planning functions [@Sioshansi2006; @Hogan2008]. These
entities may own transmission infrastructure as a regulated monopoly, as
is the case with the various Transmission System Operators (TSOs) in
Europe, or be independent of any infrastructure ownership, such as the
Independent System Operators (ISOs) and Regional Transmission Operators
(RTOs) in North America and the Australian Energy Market Operator
(AEMO).

##### Market models

The restructuring process proceeded differently across jurisdictions,
resulting in the implementation of different wholesale market
mechanisms. However, at a higher level, electricity markets worldwide
have generally converged towards two main market models which are
distinguished by the degree of centralisation of market operations and
the role of the system operator
([2](#fig:market_models){reference-type="ref"
reference="fig:market_models"}):

1.  Decentralised *bilateral markets*, in which suppliers enter into
    contracts with buyers either directly or through intermediaries
    [@Barroso2005]. Whilst scheduling and dispatch is managed by market
    participants, intended energy schedules (i.e. net contract
    positions) are submitted by market participants ahead of time to the
    system operator, who is responsible for determining the requirement
    for and procuring frequency control services (known as balancing
    services in bilateral markets) [@Hirth2015]. This model is the
    dominant market model in Europe.

2.  Centralised *mandatory power pool markets*, in which offers to
    generate are aggregated into a single supply curve and are cleared
    against a demand forecast (one-sided pool) or against an aggregated
    demand curve constructed from potential buyers (two-sided pool) by
    the system operator [@Barroso2005]. In these markets, locational
    marginal prices for energy and frequency control services are
    produced by centralised optimisation processes run by the system
    operator that consider the physical constraints of the transmission
    system [@Cramton2017]. The Australian National Electricity Market
    (NEM) and the ISO/RTO markets in North America have adopted this
    type of market model.

The difference between these mechanisms is whether real-time generation
instructions (*dispatch*) or scheduling decisions (an outcome of *unit
commitment* processes) are determined centrally by the system operator
or are decentralised, with decisions made by market participants. It is
important to note, however, that the adoption of one model does not
preclude the integration of aspects of the other. Bilateral contracts
(in the form of derivatives) are often used as hedging instruments in
mandatory pool markets and several bilateral markets, such as those in
Europe, have associated voluntary power exchanges that are essentially
power pools [@Barroso2005].

<figure id="fig:market_models">
<img src="source/figures/market_models-01.png" />
<p>. <span id="fig:market_models" label="fig:market_models"></span></p>
<figcaption>Mandatory power pool and physical bilateral market models.
Reproduced from <span class="citation"
data-cites="Barroso2005"></span></figcaption>
</figure>

##### Market platforms

Whilst other commodity markets are settled continuously or sequentially,
reliability and security considerations and concerns have led to
electricity markets being divided into discrete *platforms*
[@Isemonger2006]. Platforms are formal sub-markets for energy that are
settled at different times. A platform implemented by all electricity
markets is a real-time, or spot, market. Where implemented, additional
platforms involve trade for one or more real-time market intervals but
are each settled at different times ahead of the spot market. These
additional platforms can reduce uncertainty for the system operator and
provide market participants with a formal market mechanism for managing
risk [@Isemonger2006; @EnergySecurityBoard2020c].

The number and type of platforms a particular market implements is often
related to its market model. European bilateral markets often have a
real-time market, a day-ahead market and intra-day markets, where
day-ahead commitments may be traded continuously between market
participants [@Ahlqvist2018Central-Markets]. In contrast, however, it is
practical to limit the number of platforms in a mandatory pool market
due to the inflexibility of commitment 'contracts' determined by
computationally complex optimisation processes
[@Isemonger2006; @Ahlqvist2018Central-Markets]. North American ISO/RTO
markets have two platforms - a financially binding day-ahead market and
a physically and financially binding real-time spot market
[@Cramton2017]. The Australian NEM is rather unique amongst mandatory
pool markets as it only has a single platform - the real-time spot
market. This arrangement means that while dispatch is centralised,
participants manage the commitment of their generation portfolio with
the assistance of pre-dispatch forecasts provided by AEMO [@Riesz2016a].

## Balancing processes and mechanisms

### Inherent inertial response {#sec:electromech}

Synchronous machines convert electrical energy to mechanical energy, or
vice versa, through the interacting magnetic fields of the rotor and the
stator [@Chapman2011ElectricFundamentals]. In a synchronous generator,
this interaction produces an electromagnetic torque ($T_e$) on the rotor
that opposes the mechanical torque ($T_m$) supplied by a prime mover
([4](#fig:synch_torques){reference-type="ref"
reference="fig:synch_torques"}). From
[\[eq:swing\]](#eq:swing){reference-type="ref" reference="eq:swing"},
which is known as the *swing equation*, we can see that if a generator
is at synchronous speed (i.e. steady state) and there is a transient
increase in the electrical load of the power system (equivalent to an
increase in $P_e$), the rotor of a synchronous generator will begin to
decelerate as its stored kinetic energy is converted to electrical
energy [@Grainger1994; @Elgerd1971]. When this electromechanical
response is observed across synchronous machines, the decrease in rotor
speed will result in a decrease in the synchronous area's AC frequency
as per [\[eq:synch_speed\]](#eq:synch_speed){reference-type="ref"
reference="eq:synch_speed"}. The inverse is true for a decrease in
electrical load - the synchronous area's AC frequency will increase.
These inherent responses describe a synchronous machine's *inertial
response*. $$J\omega_{sm}\frac{d\omega_{sm}}{dt} = P_m - P_e
        \label{eq:swing}$$

where $\omega_{sm}$ is the rotor shaft velocity, $J$ is moment of
inertia of the rotor, $P_m$ is mechanical power due to $T_m$ and $P_e$
is electrical power due to $T_e$.

![Mechanical power applied to the prime mover results in a mechanical
torque $T_m$ on the rotor of a synchronous generator. This is opposed by
an electromagnetic torque $T_e$ that is produced from the interaction of
the rotor and stator magnetic fields. Source:
@Rebours2009.](source/figures/swing.png){#fig:synch_torques width="60%"}

#### Active power imbalance and RoCoF

We arrive at the relationship between the active power imbalance
($P_{gen}-P_{load}$) in a power system and AC frequency in
[\[eq:swing_area\]](#eq:swing_area){reference-type="ref"
reference="eq:swing_area"} by extending the dynamics of the swing
equation from a single synchronous generator to all synchronous
generators in the synchronous area [@Tamrakar2017].
[\[eq:swing_area\]](#eq:swing_area){reference-type="ref"
reference="eq:swing_area"} demonstrates that the rate of change of
frequency (*RoCoF*) is proportional to the active power imbalance and
inversely proportional to the system's inertia constant, $H$.
[\[eq:swing_area\]](#eq:swing_area){reference-type="ref"
reference="eq:swing_area"} is primarily concerned with synchronous
generators, not loads, as the rotors of the former store more kinetic
energy due to a larger physical mass and higher rotational speeds
[@Ulbig2014; @Denholm2020].
$$\frac{2H}{f}\frac{df}{dt} = \frac{P_{gen}-P_{load}}{S_{g, total}}
        \label{eq:swing_area}$$ where $H$ is the inertia constant of the
synchronous area ($H=\sum_{g} H_g$, where
$H_g = \frac{J_g \omega^2}{2S_g}$), $f$ is the AC frequency,
$\frac{df}{dt}$ is the rate of change of frequency or RoCoF,
$S_{g,total}$ is the total apparent power of synchronous generators, and
$P_{gen}$ and $P_{load}$ are the system's total power supply and total
power demand (including losses), respectively.

### Load damping response {#sec:load_damp}

Another inherent electromechanical response is that of
frequency-dependent loads, which include machinery driven by induction
motors [@AustralianEnergyMarketOperator2019l]. The power consumption of
frequency-dependent loads decreases with lower frequencies and increases
with higher frequencies. This is known as *load damping*, as the
response reduces the imbalance in active power supply and demand and
hence dampens the change in AC frequency as described in
[\[eq:swing_area\]](#eq:swing_area){reference-type="ref"
reference="eq:swing_area"} [@Denholm2020]. However, load damping is
diminishing in power systems around the world as a growing share of load
is coupled to the power system through power electronic controllers,
which enable loads to operate independently of the power system
frequency [@Undrill2018].

## The role of frequency control services

As discussed in [2.4](#sec:scuc_sced){reference-type="ref"
reference="sec:scuc_sced"}, SCED is executed by vertically-integrated
utilities and in mandatory pool electricity markets to ensure that
active power supply and demand is efficiently balanced subject to
network constraints and system security and reliability requirements.
Between, and potentially across consecutive SCED processes (dispatch
intervals) and unit commitment schedules, *frequency control services*
are used by the system operator to manage both small and large
instantaneous active power imbalances that may arise due to variability
and uncertainty.

## Conventional frequency control scheme and services {#sec:conventional_freq_control}

Power system operators typically employ a hierarchical and sequential
control scheme to contain AC frequency within as narrow a band as
possible, particularly during contingency events
[@Undrill2018; @Ela2011]. This control scheme involves the use of
generation or load units with reserve capacity that provide frequency
control services [@Ela2011]. For these units to mitigate power system
frequency deviations, they must have reserve capacity in the form of
*headroom* (the ability to increase active power output) to respond to
an under-frequency event, *footroom* (the ability to decrease active
power output) to respond to an over-frequency event, or both
[@Eto2010a]. Under-frequency events are generally of greater concern to
the system operator (e.g. loss of large generator). The various
frequency control services differ based on their purpose, activation
method, response time and control method
([5](#fig:freq_control){reference-type="ref"
reference="fig:freq_control"}). In the following subsections, we outline
frequency control services that are common in many power systems.

![(a) A trace of power system frequency with corresponding frequency
control services following a loss-of-generation contingency event. (b)
The timeframes over which the various frequency control services are
provided. Source:
@AustralianEnergyMarketOperator2020l.](source/figures/freq_control-03.png){#fig:freq_control
width="\\textwidth"}

### Inertial response

As discussed in [3.3.1](#sec:electromech){reference-type="ref"
reference="sec:electromech"}, synchronous machines have an inherent
inertial response to AC frequency deviations that must be considered in
the frequency control strategy of a power system. For a a given active
power imbalance, the inertia constant of the synchronous area, $H$,
determines the magnitude of the initial RoCoF following a contingency
event (see [\[eq:swing_area\]](#eq:swing_area){reference-type="ref"
reference="eq:swing_area"}) and the speed at which the power system can
be returned to the nominal frequency [@Ulbig2014; @Hartmann2019].

### Primary frequency control

The aim of primary frequency control (PFC) is to arrest the frequency
deviation through the autonomous response of generators and
frequency-responsive demand-response to locally-measured frequency
deviations that exceed a certain control dead-band
[@Ela2012b; @Wang2003; @AustralianEnergyMarketOperator2019e]. For
generators, this is achieved through *droop control*, in which a
deviation from synchronous speed corresponds to a change in the active
power output of a generator according to its droop characteristic
([6](#fig:droop){reference-type="ref" reference="fig:droop"}, from A to
B along $L_0$) [@Eto2018; @Ela2012b]. Droop control is implemented
through the turbine governors of synchronous generators or the inverter
control system for IBR [@Undrill2018]. Provided there is a sufficient
amount of PFC reserve to arrest the system frequency, the speed of PFC
determines the *frequency zenith* or *frequency nadir*, which are the
maximum or minimum system frequency, respectively, following an active
power imbalance event [@Eto2010a]. PFC can be activated in response to
small (tight dead-band) or contingency (wide dead-band) imbalance events
and should ideally be sustained until secondary frequency control can
take over [@Eto2018].

### Secondary frequency control

Secondary frequency control (SFC) replaces PFC and can consist of either
or both of a synchronous area secondary control system known as an
*Automatic Generation Control* (AGC) or unit-level load controllers (the
latter is illustrated in [6](#fig:droop){reference-type="ref"
reference="fig:droop"}) [@Undrill2018; @Eto2018; @Undrill2019]. The most
common strategy is for a synchronous area AGC to implement
proportional-integral control on the Area Control Error (ACE) with a
tie-line bias [@Machowski2020; @Ela2011]. To minimise ACE and return the
power system to its nominal frequency, the AGC sends signals to SFC
units every 4 to 10 seconds to adjust their active power output in
response to a frequency deviation [@Eto2018]. When used to respond to
smaller imbalance events, SFC is typically known as *regulation*
[@Ela2011; @Hewicker2020].

![Behaviour of a synchronous generator with a turbine governor providing
PFC and responding to SFC. $L_0$ is the initial droop characteristic.
The generator is initially operating at point A with an active power
output of $P_{M0}$. System frequency (and hence the synchronous sped of
the turbine) decreases from $\omega_0$ to $\omega_1$ and the turbine
governor responds by moving the turbine along the droop characteristic
to point B, thus increasing its active power output to $P_{M1}$.
Following this, SFC changes the reference speed setpoint of the
governor, moving the droop characteristic to $L_1$ and returning the
system to frequency $\omega_0$. Source:
@Wang2003.](source/figures/droop.png){#fig:droop width="75%"}

### Tertiary frequency control

Tertiary frequency control (TFC) is intended to replace PFC and SFC. TFC
is typically used as a margin of safety in systems where relatively
infrequent unit commitment or rescheduling processes may be required to
correct an active power imbalance [@Hewicker2020]. Some systems, such as
the NEM, do not procure TFR and instead rely solely upon a SCED that is
frequently executed [@Billimoria2020].

### Dispatch and unit commitment

#### Security-constrained economic dispatch

SCED aims to determine the minimum cost operating configuration for
committed generation such that a short-term forecast or actual demand
can be met subject to subject to network constraints and stability and
reliability requirements [@Grainger1994; @Wood2014]. As generators
typically submit offers for generation (and in some cases, frequency
control) as piecewise linear cost functions, the SCED problem is less
computationally complex than SCUC and can be solved using linear
programming techniques [@Wood2014]. For a given real-time market
interval, SCED produces a set of physically and financially binding
dispatch instructions, which include generation setpoints and enablement
for frequency control services, and locational marginal prices for
energy and frequency control services [@Cramton2017]. In multi-platform
markets such as the ISO/RTO markets, SCED is considered a sub-problem of
unit commitment and is run for every real-time market interval ( 5-15
minutes) [@Wood2014; @InternationalRenewableEnergyAgency2019]. In
single-platform markets, such as the NEM, market participants manage
their own unit commitment and SCED is the only market process that
produces a binding schedule [@AustralianEnergyRegulator2016].

#### Security-constrained unit commitment

The aim of SCUC is to determine the minimum cost subset of generation
that should be committed (i.e. synchronised and ready to deliver power
to the power system) to meet a demand forecast for a set of future
market intervals subject to network constraints and stability and
reliability requirements [@Wood2014]. SCUC is a computationally complex
non-linear problem in many electricity markets because it considers
non-convexities such as start-up costs and minimum operating costs in
addition to an offer for energy [@Cramton2017; @Isemonger2009]. The
outcomes of solving this problem are an ahead schedule, which is often
only financially binding, and locational marginal prices for energy and
frequency control services for a future set of market intervals, such as
the next day when SCUC is executed in day-ahead markets. SCUC can be
beneficial for market participants that wish to hedge their production
or consumption [@Isemonger2006]. Furthermore, it offers certainty around
power system outcomes to the system operator, and around market outcomes
to generators that have long lead times and significant costs associated
with commitment (e.g. baseload coal power plant) or generators that
primarily consider opportunity costs, rather than marginal costs, when
determining whether it is profitable to provide energy (e.g.
hydroelectric power plants, battery energy storage systems)
[@Wood2014; @Cadwalader1998ReliabilityPricing].

### Longer-term scheduling

## Emerging challenges in power system operations

### Inverter-based resources and frequency control {#sec:ibr_freq}

Inverter-based resources (IBR) include variable IBR (solar PV and Type
III and Type IV wind turbines [@Wu2018]), BESS and high voltage direct
current (HVDC) links that connect to a power system through power
electronic devices. The impacts of variable IBR on frequency control are
of particular interest to system operators and market designers as many
power systems are currently experiencing high instantaneous penetrations
of variable IBR (in excess of 50%) and because many more are expected to
do so in the future [@AustralianEnergyMarketOperator2019; @IRENA2020].

### Challenges posed by inverter-based resources

High penetrations of IBR in power systems pose challenges to frequency
control due to their characteristics, particularly in islanded power
systems or weakly-interconnected control areas that cannot rely on a
wider synchronous area for frequency control services [@Hodge2020].
These include [@Kroposki2019]:

#### Interface to power system

As IBR interface to a synchronous area through inverters, they are not
electromagnetically coupled to the power system and therefore do not
exhibit the inherent inertial response of synchronous generators. This
has two main implications. The first is that reduced inertial response
may affect power system stability during transients (e.g. rotor angle
stability) [@Tielens2016], and the second is that a lack of inertia in
the power system can lead to higher RoCoF and therefore more severe
frequency nadirs or zeniths and the tripping of emergency protection
schemes that would otherwise not occur in high inertia systems
[@Machowski2020; @Ulbig2014; @Hartmann2019; @Dreidy2017].

#### Variability and uncertainty

The aggregate degree of power system variability and uncertainty is
likely to increase with higher penetrations of variable IBR
[@Riesz2015a; @AustralianEnergyMarketOperator2020b]. Variability not
only encompasses active power output variability during a dispatch
interval, which depends on the primary energy source and plant location
and configuration, but also includes large ramps due to the correlated
active power output of variable IBR over longer timeframes
[@Keeratimahat2019a; @AustralianEnergyMarketOperator2020d]. Power system
uncertainty will depend on the accuracy of weather and generation
forecasting, generator reliability and may also be a function of the
degree of visibility and control a system operator has over IBR,
particularly distributed energy resources such as rooftop solar PV and
electric vehicles
[@AustralianEnergyMarketOperator2020d; @Wurth2019; @AustralianEnergyMarketOperator2020m].

### Provision of frequency control services

The presence of synchronous machines and grid-following inverters makes
inertial response and frequency control necessary for secure and stable
operation of a power system. At high instantaneous penetrations, low
short-run marginal cost IBR may displace synchronous generators that
have traditionally provided inertial response and frequency control
services, and the load damping response may be minimal
[@Riesz2015a; @Tielens2012]. In these cases, the instantaneous inertia
constant of the system may be low and IBR may be needed to assist in
frequency control [@Hartmann2019; @Tielens2012]. Through their inverter
control system, IBR are able exercise rapid and precise control of their
active power, within the constraints of primary or stored energy, to
provide what is known as *fast frequency response* (FFR)
[@Machowski2020; @Hodge2020].

#### Fast frequency response

FFR can generally be provided within a matter of milliseconds to provide
a sustained active power response similar to PFC or to mitigate high
RoCoF events [@AEMO2017a; @Miller2017]. In response to an
under-frequency event, a sustained active power raise response, similar
to PFC, can be achieved by implementing frequency droop control in the
inverter of a BESS, or that of a variable IBR that has been *deloaded*
to provide headroom. Wind turbines can be deloaded through pitch angle
or over speed control, whereas solar PV is typically deloaded through
over-voltage control
[@Dreidy2017; @Tielens2012; @Fernandez-Guillamon2019a]. A sustained
lower response can be delivered by operating an inverter control system
at an off-maximum power point to reduce the IBR's active power output.

High RoCoF can be mitigated by FFR that is delivered through processes
and controls that mimic the inertial response of a synchronous generator
[@Eriksson2018]. Inertia-based FFR (otherwise known as *synthetic
inertia* in the literature) is provided by extracting the kinetic energy
from a wind turbine rotor to rapidly inject active power [@Miller2017]
into the power system. FFR from *virtual inertia*, on the other hand, is
provided as the result of implementing the dynamic model of a
synchronous machine to some degree within an inverter control system
[@Tamrakar2017; @Anderson-Cook2013]. As FFR requires some form of
measurement and is not inherent, it cannot be considered to be a direct
substitute for inertial response [@Miller2017; @AEMO2017a].

## Procurement of frequency control services {#sec:procurement}

As highlighted by @Ela2012b and @Billimoria2020, frequency control
services are typically procured through a combination of market-based
mechanisms, such as remunerative schemes or contract or spot markets,
and regulatory mechanisms, such as connection requirements or system
operator intervention.

### Market-based mechanisms {#sec:market_mech}

#### Suitability of markets

Many restructured electricity industries have developed competitive
*ancillary services* markets that enable frequency control services to
be procured alongside *primary* markets for energy and/or capacity
provision. Competitive markets are a suitable mechanism for procuring
frequency control services as AC frequency is a global parameter and, as
such, frequency control services can be provided by any capable resource
within a synchronous area [@Billimoria2020; @Hirst1998]. This supports
greater participation and competition in frequency control markets.
Furthermore, frequency control services and energy are essentially the
same commodity (active power) but differentiated by their delivery
methods, with the former providing reserve capacity that responds in the
event of a frequency deviation and the latter providing sustained
delivery of active power during a market interval. Given that these
products are related, there are benefits related to reducing overall
system costs, incentivising frequency control provision and improving
trade outcomes for market participants by *co-optimising* markets for
energy and frequency control services [@Ela2016].

#### Opportunity costs and co-optimisation

To provide raise frequency control services, generation must allocate
reserve capacity, which may be at the expense of profitable energy
provision [@Raineri2006]. As such, participation in ancillary services
markets often entails an *opportunity cost* to market participants.
While frequency control services markets are often co-optimised with
energy markets to ensure that power system energy supply and security
requirements are met at the lowest cost to the system, participant
opportunity costs can be accounted for in two ways in mandatory pool
electricity markets:

1.  In *partially co-optimised* frequency control services markets,
    perceived opportunity costs are incorporated into bids by market
    participant. The procurement of frequency control services and
    energy is co-optimised by the system operator in SCUC and/or SCED,
    thereby minimising overall costs to the system [@Isemonger2009].

2.  In *fully co-optimised* frequency control services markets, market
    participants submit bids for energy and frequency control services
    provision. The system operator then determines a price for frequency
    control services that is the sum of the bid offer and the
    opportunity cost of that resource foregoing provision of energy or
    other services. The system operator can then co-optimise all bids
    and costs in SCUC and/or SCED so as to simultaneously maximise
    profit for market participants whilst minimising overall costs to
    the system [@Ela2012a; @IntelligentEnergySystems2010a].

#### Potential benefits of market-based mechanisms

Compensation for frequency control services addresses the externality of
providing ancillary services, particularly if the compensation is
aligned with a market participant's opportunity costs [@Rebours2007b].
Furthermore, if compensation is delivered through market-based
mechanisms and if these mechanisms are designed well, frequency control
services can be procured at least cost to the system from resources that
are best placed to provide them within an operational timeframe
(*productive* efficiency) and spur efficient investment in frequency
control capabilities by market participants into the future (*dynamic*
efficiency)
[@Thorncraft2007; @Riesz2015b; @Biggar2014TheMarkets; @AustralianEnergyMarketCommission2020a].

#### Challenges in frequency control services markets {#sec:challgnes_fcas_markets}

Frequency control services markets face both existing and emerging
challenges to achieving productive and dynamically efficient outcomes.
The main challenges being faced in these markets are outlined below:

##### Product design and fungibility.

Products in existing frequency control services markets generally
reflect the capabilities and requirements of conventional frequency
control provided by synchronous generators [@EU-SysFlex2019]. As
frequency control abilities and needs have changed over time, various
jurisdictions have considered or created additional frequency control
services. These include ramping products, which have been implemented in
some ISO/RTO markets in response to increasing variability and
uncertainty [@Ela2019; @Ela2017], FFR products to mitigate RoCoF
[@Ela2019; @Fernandez-Munoz2020] and TFC or operating reserves where
operating reserve margins are a concern to the system operator
[@EnergySecurityBoard2020].

Furthermore, there are trade-offs associated with the separation and
*fungibility* of both existing and new frequency control products.
Market-based mechanisms will work best when a particular frequency
control product is a fungible and well defined, or "discrete", commodity
supplied by various providers [@Gimon2020]. With a sufficiently large
market, prices should reflect the costs incurred by various providers to
provide such a service [@Ela2012b]. This, however, ignores the wide
"spectrum" of technical capabilities of power system resources with
respect to frequency control.

Understanding the trade-offs in creating fungible new products is
important to frequency control service market design. For example, while
a new product may value and incentivise the provision of a particular
frequency response [@Ela2012b], a market may not deliver a net benefit
if there is limited competition or the costs and complexity of
administering a market are significant [@Rebours2007b; @Ela2019].

##### Price formation.

Price formation is an unresolved issue within frequency control services
market design. Ideally, the price of provision should be explicit,
transparent and recognise the true value of the service alongside any
opportunity-costs incurred by the supplying participant. There are three
main issues that hamper efficient price formation and hence productive
and dynamically efficient market outcomes:

1.  Frequency control products are arbitrarily defined by a system
    operator and often procured in a single-sided market due to the
    *public good* nature of frequency control
    [@Billimoria2020; @Pollitt2019a]. As such, the true value of these
    services to power system users is not recognised [@Rebours2007b].

2.  Furthermore, in co-optimised markets, there is a tension between the
    relatively low opportunity costs of existing synchronous generation
    providing frequency control services and the strong price signals
    needed to incentivise new capabilities, particularly from high
    capital, low operating cost inverter-based resources [@Ela2019].

3.  Some products, such as inertia, may be 'lumpy' in their provision
    and inseparable from other system security products
    [@Billimoria2020; @EnergySecurityBoard2020].

##### Cost allocation.

In many mandatory pool markets, the cost of frequency control services
procured by the system operator is allocated to loads, even though the
deviation of generation may cause the need for procurement in the first
place [@Milligan2011a]. Australia's NEM has a 'Causer Pays' cost
allocation framework in place for frequency control services procured
for contingency response and regulation, though the mechanism for the
latter suffers from a lack of transparency, complexity and fundamental
design flaws
[@Riesz2015b; @AustralianEnergyMarketCommission2020; @AustralianEnergyRegulator2020].
Cost allocation could provide disincentives for undesirable behaviour,
such as deviation from SCED dispatch instruction, and create
counter-parties for hedging frequency control services price risk and
therefore assist in price formation [@Thorncraft2007]. As the power
system continues to transition, it may be possible to allocated costs
based on a 'User Pays' framework, whereby power system resources that
impose frequency zenith, nadir or RoCoF limits pay for frequency control
services [@AustralianEnergyMarketCommission2020a].

##### IBR participation.

IBR cannot or do not participate in many frequency control services
markets. Historically, literature has focused on the impact of variable
IBR on frequency control-related integration costs and how these costs
can be minimised [@Ela2011; @Riesz2015b]. However, for reasons discussed
in [5](#sec:ibr_freq){reference-type="ref" reference="sec:ibr_freq"} and
as demonstrated by variable IBR frequency control trials
[@AEMO2018d; @Loutan2017] and the provision of frequency control
services by BESS [@AustralianEnergyMarketOperator2018i], there is both a
growing need for and benefit to IBR providing frequency control
services. In markets such as Australia's NEM, many IBR can participate
in frequency control services markets but choose not to as their
business models rely on revenue from energy provision and the
opportunity-cost of participation is too high [@AEMO2018d]. An active
area of interest is designing frequency control services markets and the
revenue earned within them to incentivise IBR participation and
investment in frequency control capabilities, particularly as system
security requirements change over time and as high instantaneous IBR
penetrations are often associated with low energy prices
[@Ela2019; @EnergySecurityBoard2020].

### Regulatory mechanisms {#sec:regulatory_mech}

Regulatory mechanisms, such as equipment technical standards, grid codes
and system operator intervention, were used by monopoly electric
utilities and system operators to procure sufficient frequency control
response prior to implementation of frequency control services markets.
Even now, regulatory mechanisms are used in conjunction with
market-based mechanisms to procure frequency control services. In fact,
the processes of designing and regulating market rules are in and of
themselves regulatory mechanisms [@Sioshansi2006].

#### Potential benefits of regulatory mechanisms

Regulatory mechanisms are ideal for mandating basic frequency control
capabilities as a condition for access or where markets may be difficult
to design or suffer from major flaws such as a concentration of market
power, oversupply of a product or the issues discussed in
[6.1.4](#sec:challgnes_fcas_markets){reference-type="ref"
reference="sec:challgnes_fcas_markets"} [@Ela2012b].

#### Shortfalls of regulatory mechanisms

It may be difficult for regulatory mechanisms to ensure that sufficient
frequency control services can be procured in power systems and
electricity markets that are rapidly facing more power electronic-based
control systems, lower levels of operational inertial response and
higher variability and uncertainty of different scales and nature.
Prescriptive regulatory mechanisms, such as grid codes, are often only
updated after a number of years to reduce the compliance burden placed
on connecting generators and loads. As such, they are slow to respond to
changing frequency control capabilities and requirements. This delay can
make new standards and requirements reactive rather than proactive. For
example, AEMO can only review generator technical performance standards
every 5 years [@AustralianEnergyMarketCommission2018], a timeframe in
which the solar PV capacity installed in the NEM has more than tripled
(2014-2019) [@AustralianPVInstitute].

#### Regulatory requirements as a solution to market failures

Regulatory mechanisms are being increasingly used in power system
jurisdictions where frequency control services markets have failed to
incentivise or procure or appropriate capabilities and services, or
where there is significant uncertainty around frequency response from
generation. For example, several power systems, including the Australian
NEM, have mandated some degree of PFC provision from connected
generators in their grid codes or market rules
[@AustralianEnergyMarketCommission2020; @Roberts2018]. Similarly,
frequency response has also been specified as a requirement for new
generation (primarily IBR) to access and connect to the NEM and ISO/RTO
markets in the U.S.
[@AustralianEnergyMarketCommission2018; @FederalEnergyRegulatoryCommissionFERC2018].

#### Role of regulatory mechanisms

Though processes across several jurisdictions are underway to address
frequency control services market deficiencies (e.g. the Australian
NEM's post-2025 market design project [@EnergySecurityBoard2020], the
Electric Reliability Council of Texas' (ERCOT) Nodal Protocol Revision
Request [@Ela2019] and the EU-SysFlex project [@EU-SysFlex2019]), there
has been relatively little work around what role regulatory mechanisms
may play, how they interact with market-based mechanisms and the
relative benefits and costs of further frequency control services
marketisation, both now and into the future.

## Designing frequency control arrangements {#sec:designing_arrangements}

Designing frequency control arrangements is a control, regulatory and
market design problem which has become more complex in recent years due
to electricity industry restructuring and growing penetrations of IBR
[@VanderVeen2016].

### Outcomes of good design

It is important to define desired outcomes of the design process. Below,
we present three outcomes that have previously been proposed for
designing ancillary/system services arrangements (including frequency
control arrangements) by @Rebours2007b and the
@AustralianEnergyMarketCommission2020a.

1.  **Effectiveness**. This entails both sufficient quantity and
    performance of procured frequency control services to ensure that
    power system security requirements are met.

2.  **Efficiency**. Efficient frequency control arrangements will
    procure services at the lowest cost to the system, both now
    (productive efficiency) and into the future (dynamic efficiency).
    Furthermore, efficient arrangements should also procure the right
    mix of services according to user and/or system needs (*allocative
    efficiency*).

3.  **Minimising procurement costs and complexity**. Procurement and
    verification of delivery of frequency control services may involve
    significant costs associated with facilitation and monitoring. This
    could include metering equipment, IT systems and additional staffing
    costs. Complex procurement arrangements may also have unintended and
    unforeseen consequences on processes and markets that interface with
    these arrangements, such as the energy market and other ancillary
    services markets.

### Complexity of the design process

Designing frequency control arrangements is a complex exercise in
managing interrelated and interacting capabilities, mechanisms and
objectives ([7](#fig:design_complexity){reference-type="ref"
reference="fig:design_complexity"}). The frequency control *capability*
of a power system is distinct from its *performance*, with a *control
strategy* defining how the former translates to the latter. The
frequency control capability of a power system is determined by the
physical characteristics and configuration of generators, loads and
network elements within a synchronous area.

![A diagrammatic depiction of the complexity involved in designing power
system frequency control
arrangements.](source/figures/capability_performance-04.png){#fig:design_complexity
width="\\textwidth"}

Frequency control services from capable resources are often mandated
through connection requirements or power system operator intervention
(see [6.2](#sec:regulatory_mech){reference-type="ref"
reference="sec:regulatory_mech"}), incentivised through remunerative
schemes, or procured through a contract or spot market (see
[6.1](#sec:market_mech){reference-type="ref"
reference="sec:market_mech"}) [@Billimoria2020]. Together with the
control specification of frequency control products, these mechanisms
define a power system *control strategy* that dictates how capable
system resources respond to deviations, and therefore determine the
frequency control *performance* of a power system. The outcomes that
define frequency control performance can be divided into physical
performance criteria, which describe the effectiveness of frequency
control services provided, and economic objectives, which relate to the
productive, dynamic and price and cost-allocation efficiency of the
arrangements.

#### Interactions between capability, strategy and performance

These three design layers often interact. Technical capabilities may
guide the design of the control strategy, and therefore the mechanisms
that define frequency control performance. An example of such a process
is the PJM Interconnection (an RTO) implementing a high frequency AGC
signal designed for BESS providing fast regulation frequency control
services [@Benner2015; @Brooks2019]. Similarly, deficiencies in
performance can be addressed through modifying the control strategy to
procure additional or more suitable frequency control capability. The
California and Midcontinent ISOs have introduced ramping products to
address increasing variability and uncertainty in their power systems
[@Ela2016; @Ela2017].

### Diversity of design outcomes

The design process has and will most likely continue to proceed
differently across jurisdictions due to the diversity of both the
technical capabilities of resources within power systems (see
[4](#sec:freq_dev_control){reference-type="ref"
reference="sec:freq_dev_control"} and
[5](#sec:ibr_freq){reference-type="ref" reference="sec:ibr_freq"}) and
the different structures and features of various electricity markets
(see [2](#sec:elec_markets){reference-type="ref"
reference="sec:elec_markets"}) [@Rebours2007b]. Existing frequency
control arrangements across the world have been reviewed and compared
extensively in the literature
[@Rebours2009; @Ela2011; @DGAConsulting2016; @Hewicker2020; @Rebours2007a; @Rebours2007; @Zhou2016; @ReishusConsultingLLC2017; @Banshwar2018].

### Design principles and considerations

Previous literature has explored the key design considerations for
frequency control arrangements. @Rebours2007b outline design principles
for power pool markets related to the frequency control services
procurement, price formation, cost-allocation and market structure,
which includes how frequency control services are offered, remunerated
and cleared in markets, in addition to market operation and regulation.
@VanderVeen2016 build upon the work of @Rebours2007b to provides a more
comprehensive treatment of frequency control arrangement design
variables and performance criteria. The key contribution of
@VanderVeen2016 is that they explore some of the trade-offs between
performance criteria when designing frequency control services markets.
However, as they focus on the design challenge in European bilateral
markets, some of these trade-offs are not relevant to or present in
mandatory pool markets.

Both @Rebours2007b and @VanderVeen2016 emphasise that good design will
lead to efficient and effective frequency control arrangements. However,
@VanderVeen2016 focuses solely on market design whilst @Rebours2007b
assesses various competitive procurement options but only briefly
discusses the relative merits of compulsory provision of frequency
control services through regulatory mechanisms. The work from these
authors concentrates on achieving economic efficiency but pays
relatively little attention to the technical capabilities of power
system resources and the design of and interactions between frequency
control products.

#### Holistic design

@Ela2012b, @Billimoria2020 and @MacGill2020a recognise that power system
frequency control arrangements are typically composed of a mixture of
market-based mechanisms and regulatory mechanisms that are compatible
with the physics and control needs of the power system. The challenge
here is determining the appropriate combination of these options for
procurement, and the most suitable control mechanisms that account for
both frequency control capabilities and the physical performance
required by a power system. This can only be achieved by considering the
interactions, or *interfaces*, between mechanisms within a power
system's frequency control strategy.

#### Interfaces

The concept of interfaces in electricity industry decision-making is
distinct but coupled to the frequency control arrangement design layers
discussed above. Interfaces were first formalised by @Thorncraft2007,
specifically with relation to the security decision-making interface
between commercial decision-making processes (i.e. processes within
market-based mechanisms) and the technical and physical processes and
the requirements of the power system (i.e. frequency control capability
and physical performance) [@Thorncraft2009].

##### Security decision-making interface.

The security decision-making interface includes system operator
processes in integrated markets (e.g. SCUC and SCED) which co-optimise
the provision of energy and frequency control services [@Chow2005].
Literature has explored enhancing unit commitment and economic dispatch
processes for frequency control through frequency response constraints
[@Ela2014; @Doherty2005; @Teng2015; @Mancarella2017a] and, more
recently, inertia constraints [@Gu2020; @Johnson2020]. However, these
studies implicitly assume that existing security decision-making
processes and frequency control products are adequate and efficient, and
will therefore perform well.

#### Interfaces between mechanisms in the frequency control strategy

Interfaces change over time and with technological innovation
[@Thorncraft2009]. The arrival of highly-controllable loads and IBR in
the power system warrants the consideration of a *control system*
process that is separate from physical characteristics and processes
([8](#fig:interfaces){reference-type="ref" reference="fig:interfaces"}).

![Interfaces between the frequency control capability and the mechanisms
within the frequency control strategy of a power
system.](source/figures/interfaces_03.png){#fig:interfaces}

##### Interface between control and procurement mechanisms.

Some literature has begun to explore the interface between control
mechanisms and market-based mechanisms. @Garcia2019a explore the impact
of interchangeability between FFR and PFC on total system frequency
control services costs. @Badesa2020 outlined an optimisation framework
that enables inertia, a reduction in contingency size and multi-speed
PFC to be procured based on RoCoF and frequency nadir constraints and,
more significantly, priced with a view of incentivising faster PFC and
synthetic/virtual inertia provision from IBR. However, these studies do
not consider how control mechanisms might interface with other
regulatory mechanisms, such as equipment performance standards.

##### Interface between procurement mechanisms.

In framing the design challenge for power system security services in
the NEM, @MacGill2020, @Billimoria2020 and @Skinner2020 acknowledge that
there is a choice between, or potential combination of regulatory
mechanisms and market-based mechanisms for procurement, with the latter
two exploring the various advantages and disadvantages of each option.
In particular, @Billimoria2020 explores various procurement models and
how regulatory and market-based mechanisms may interact within them.
However, these procurement models are highly generic and further work is
required to determine how existing and emerging control mechanisms might
be structured in each of the models. Furthermore, there is a need to
understand how these procurement models might interface with and
integrate into existing and emerging market processes if an optimum for
the entire system is to be achieved [@MacGill2020].

## Conclusion

Frequency control is vital to the secure operation of a power system.
The inherent characteristics and control systems of IBR differ from
those of synchronous machines and this poses both opportunities and
challenges to frequency control arrangements in mandatory pool markets
with growing instantaneous penetrations of IBR. The frequency control
performance of a power system is highly influenced by the frequency
control strategy, which consists of the control mechanisms, electricity
market design and the regulatory mechanisms that are in place, and the
frequency control capability of its resources. Determining the
appropriate combination of these mechanisms will require examining the
interfaces between market-based, regulatory and control mechanisms and
identifying the benefits, costs and trade-offs associated with
particular design choices. This will enable electricity market designers
to make an informed choice in implementing effective and efficient
frequency control arrangements in low-carbon electricity markets.
