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

Given the welfare and economic benefits associated with electricity access, many 20^th^ century states constructed bulk *power systems* to leverage investment & operational economies of scale. These systems sought to efficiently deliver *active power* (i.e. power that does work) to numerous electricity end-users (*demand* or *loads*) from electricity suppliers (*generators*) across vast distances. A typical power system configuration is presented in [@fig:elec_supply_chain]. Generators supply the system with alternating current (AC) power either through a direct electromagnetic connection or, if they are *inverter-based resources* (IBRs), through a power electronic *inverter* interface that converts the direct current (DC) power produced by the generator to AC power. AC power is then efficiently transmitted over long distances through a high voltage *transmission* system. As transmission lines approach load centres, voltages are stepped down to make power delivery to the houses and businesses connected to the lower voltage *distribution system* safer [@mastersRenewableEfficientElectric2004].

![Conventional bulk power system, including generation, transmission, distribution and industrial, commercial and residential end-users (loads). Source: @australianenergymarketoperatorIndustryOverview2023.](source/figures/electricity_supply_chain.pdf){#fig:elec_supply_chain short-caption="The bulk power system as an electricity supply chain"}

### Synchronous and control areas

A network area that is operated at a (constant) nominal AC frequency is known as a *synchronous area*. During normal operation, AC frequency should be close to the system's nominal value and more-or-less uniform across the synchronous area (see @sec:lit_review-balancing_need). A *control area*, on the other hand, is a network area in which a particular *system operator* (SO) is responsible for operating the power system. In this thesis, I use the term *jurisdiction* interchangeably with *control area*, with a preference for the former when referring to a control area with an associated wholesale electricity market (see [@sec:lit_review-operational_paradigms]).

Whether the term "power system" refers to a synchronous area or a control area is often dependent on context and the relationship between the two in the jurisdiction in question. In eastern and southern Australia, the National Electricity Market's (NEM) single control area consists of two synchronous areas (see [@sec:fcs-nem] for further detail). In contrast, other jurisdictions have a single synchronous area composed of several electrically-connected control areas demarcated by political rather than physical boundaries. For example, continental Europe is a single synchronous area consisting of many national or trans-national control areas, and the continental United States has three synchronous areas (two of which extend into Canada) with over 60 control areas [@schittekatteDistributedEnergyResources2022; @northamericanelectricreliabilitycorporationNERCInterconnections2023].

## Power system operations {#sec:lit_review-operations}

In broad terms, *operating* a power system involves the direction or control of *power system resources* — generators, loads, network elements and energy storage resources (which can act as both a generator and a load). In practice, however, power system operation is inseparable from the economic objective imposed upon SOs: minimise system costs (or under some market paradigms described in [@sec:lit_review-operational_paradigms], maximise the value of trade) whilst 1) continuously maintaining a balance between active power supply & demand and 2) ensuring that system resources & the system itself are operated within their respective technical envelopes [@woodPowerGenerationOperation2014]. The latter constraint implies *secure* operation (which include *stability*) and is a prerequisite for the former constraint, which more-or-less corresponds to *reliable* operation[^1] [@anderssonPowerSystemSecurity2021]. Maintaining a secure and reliable power system is vital; restarting the system after failure (*system restoration*) is a long & complex procedure, and power outages (*blackouts*), whether they be localised or across a wider area, can have devastating social & economic consequences [@kirschenFundamentalsPowerSystem2004].

[^1]: Strictly speaking, reliability is typically defined as the ability of generation to supply load requirements to an administratively-set standard, which varies across jurisdictions.

Noting that planning & investment have a large bearing on the manner in which a power system is operated (and vice versa), [@fig:power_system_timeframes] presents a high-level overview of power system phenomena and processes, services & markets that are most pertinent to active power balancing in operational timeframes, with those discussed in detail within this thesis highlighted in bold red text.

\blandscape
![A high-level overview of power system concepts, phenomena and processes, services & markets relevant within operational timeframes (bounded by the red dashed box). All non-faded text in the bottom section indicates a process, service and/or market related to active power balancing. All bold red text in the bottom section indicates a process, service and/or market related to active power balancing that is discussed in detail in this thesis. Processes, services & markets bounded by the blue dashed box occur within scheduling timeframes. Phenomena & stability categories, and their timeframes of relevance, are based on those discussed in @machowskiPowerSystemDynamics2020, @hatziargyriouDefinitionClassificationPower2021 and @matevosyanFutureInverterBasedResources2021. The figure concept and layout was inspired by a similar figure presented in @wilsonIntroductoryPresentation20202020.](source/figures/power_system_timeframes.pdf){#fig:power_system_timeframes short-caption="High-level overview of power system concepts, phenomena and processes, services & markets relevant within operational timeframes" width="135%"}

\elandscape
    
### Phenomena in operational timeframes

As shown in @fig:power_system_timeframes, power system operations is concerned with phenomena that dominate on timescales ranging from a few milliseconds to several months [@hatziargyriouDefinitionClassificationPower2021; @machowskiPowerSystemDynamics2020]:

1.  *Electromagnetic* phenomena arise from the coupling of electrical and magnetic fields within *synchronous machines* (generators and motors that rotate at a speed proportional to AC frequency) and between power system resources. They occur on the timescale of milliseconds to seconds. IBR controls also operate in this timeframe.

2.  *Electromechanical* phenomena are slower (seconds to minutes timescale) and arise as a result of electromagnetic fields interacting with rotating masses and mechanical forces. These typically occur in motors and generators.

3.  *Thermodynamic* phenomena are slower still. They encompass chemical fuel conversion & heat transfer processes in boilers. These phenomena occur over multiple timeframes, from seconds to minutes to hours. The dynamics of the primary energy sources for hydroelectricity and *variable renewable energy* (VRE), which primarily refers to wind and solar *photovoltaic* (PV) generation, are also relevant in these timeframes [@keeratimahatAnalysisShorttermOperational2021].

### Active power balancing {#sec:lit_review-balancing}

In theory, *active power balancing* is simply a consequence of the law of conservation of energy: the energy supplied through primary energy conversion or by energy storage into a network node is equal to the sum of the energy dissipated, stored and consumed at the same network node at each and every moment. In practice, however, it involves the **_moment-to-moment control_ of generation and loads to balance active power supply and demand _across the power system_**. *Moment-to-moment* (i.e. real-time) control of supply & demand is required because it is still uneconomical in many jurisdictions to store electricity at scale (i.e. in the same order of magnitude as generation and demand) despite grid-scale storage cost reductions [@internationalenergyagencyGridScaleStorage2022]. Furthermore, though electricity can be transported close to the speed of light across the network, balancing requires at least a degree of coordination *across the power system* because of transmission losses and various network constraints imposed by line thermal limits, stability requirements & Kirchoff's circuit laws [@kirschenFundamentalsPowerSystem2004; @hirthWhyWindNot2016a].

#### Why is balancing required? {#sec:lit_review-balancing_need}

Unlike the transportation networks of many other commodities, an imbalance between active power supply & demand can lead to deviations in technical parameters — voltage and AC frequency — that not only have the potential to damage equipment connected to the power system, but also to trigger a system collapse [@borensteinEconomicsElectricityReliability2023]. As such, maintaining active power balance is essential to proper resource and system functioning.

##### The relationship between active power balance & AC frequency {#sec:lit_review-balancing_need-frequency}

The presence of synchronous machines in most power systems means that system active power balance is closely tied to the system's AC frequency. During steady state operation, synchronous machines rotate at a *synchronous speed* ($N_s$) that is proportional to the nominal system frequency ($f$) ([@eq:synch_speed]) [@chapmanElectricMachineryFundamentals2011]:

$$N_s = \frac{120f}{P}$$ {#eq:synch_speed}

where $N_s$ is the synchronous speed in revolutions per minute, $P$ is the number of (rotor) magnetic poles and $f$ is the electrical frequency in hertz.

The link between active power balance and synchronous speed/system frequency can be elucidated by examining synchronous machine dynamics. In a synchronous generator (coal-fired, gas-fired and hydro generators), the interaction between the interacting magnetic fields of the rotor and stator produces an electromagnetic torque ($T_e$) on the rotor that opposes the mechanical torque ($T_m$) supplied by a prime mover (e.g. steam turbine) ([@fig:synch_torques]). [@eq:swing], which is an energy balance variation of what is known as the *swing equation*, shows that if there is a transient increase in the electrical load of the power system (equivalent to an increase in $P_e$ and thus $T_e$), the rotor of a synchronous generator will begin to decelerate as its stored kinetic energy is converted to electrical energy [@graingerPowerSystemAnalysis1994; @elgerdElectricEnergySystems1971].

$$J\omega_{sm}\frac{d\omega_{sm}}{dt} = P_m - P_e$$ {#eq:swing}

where $\omega_{sm}$ is the synchronous machine rotor shaft velocity, $J$ is moment of inertia of the rotor, $P_m$ is mechanical power, $T_m$ is mechanical torque, $P_e$ is electrical power and $T_e$ is electromagnetic torque.

![Mechanical power applied to the prime mover results in a mechanical torque $T_m$ on the rotor of a synchronous generator. This is opposed by an electromagnetic torque $T_e$ that is produced from the interaction of the rotor and stator magnetic fields. Source: @reboursComprehensiveAssessmentMarkets2009](source/figures/swing.png){#fig:synch_torques short-caption="Mechanical and electromagnetic torques on a synchronous generator" width="60%"}

The relationship between the active power imbalance in a power system ($P_{gen}-P_{load}$) and AC frequency is obtained by extending the dynamics of the swing equation from a single synchronous generator to all synchronous generators in a synchronous area ([@eq:swing_area]). [@eq:swing_area] shows that the rate of change of frequency (*RoCoF*) is proportional to the active power imbalance and inversely proportional to the system's inertia constant, $H$. This form of the swing equation only models the *inertial response* of synchronous generators, and not the *load damping* response offered by (frequency-dependent) induction motor loads. Generation inertial response typically plays a large role in electromechanical system dynamics as the high speed and mass of generator rotors mean that they store significant quantities of kinetic energy [@ulbigImpactLowRotational2014; @denholmInertiaPowerGrid2020].

$$\frac{2H}{f}\frac{df}{dt} = \frac{P_{gen}-P_{load}}{S_{g, total}}$$ {#eq:swing_area}

where $H$ is the inertia constant of the synchronous area ($H=\sum_{g} H_g$, where $H_g = \frac{J_g(2\pi f)^2}{2S_g}$), $f$ is the AC frequency, $\frac{df}{dt}$ is the rate of change of frequency or RoCoF, $S_{g,total}$ is the total apparent power of synchronous generators, and $P_{gen}$ and $P_{load}$ are the system's total power supply and total power demand (including losses), respectively.

[@eq:swing_area] shows that a power system's AC frequency is an indicator of active power balance [@bagginiHandbookPowerQuality2008]. Insufficient generation will lead to a *decrease* in system frequency (i.e. negative RoCoF) and oversupply will lead to an *increase* in system frequency (i.e. positive RoCoF).

##### The consequences of frequency deviations {#sec:lit_review-balancing_need-consequences}

Serious power system frequency deviations away from the nominal value can have harmful effects. Synchronous machines may experience equipment-damaging vibrations [@ulbigImpactLowRotational2014], and both synchronous machines and transformers can overheat and fail if they operate outside their rated voltage-frequency limits [@kirbyFrequencyControlConcerns2002]. Synchronous machines are also vulnerable to damage from high RoCoFs due to pole slipping [@dgaconsultingInternationalReviewFrequency2016]. For these reasons, frequency-sensitive relays are often used to protect power system resources from frequency excursions.

However, these same protection measures can also trigger the complete collapse of the power system. Should the disconnection of a resource following a relay trip exacerbate an existing active power imbalance, the system frequency may deviate further and result in further disconnections. Situations such as these are known as *cascading failures* and can lead to the collapse of the entire power system. As such, SOs often employ emergency frequency control schemes to arrest imbalances by tripping loads in the event of under-frequency (*under-frequency load shedding* or *UFLS*) or generation in the event of over-frequency (*over-frequency generation shedding* or *OFGS*) [@australianenergymarketoperatorEnduringPrimaryFrequency2021; @hartmannEffectsDecreasingSynchronous2019]. The activation of these schemes is undesirable; UFLS adversely affects power system reliability and both are intended to be a last line of defence against frequency-driven system collapse.

#### Threats to active power balance {#sec:lit_review-balancing_threats}

Threats to active power balance can be broadly categorised as either power system *variability* or power system *uncertainty*.

##### Power system variability

Power system variability refers to **expected** or forecasted changes to active power supply and/or demand. Sources of variability include fluctuations in load, oscillatory active power output from synchronous generators and VRE generation *ramping* (i.e. a sustained increase or decrease in active power output), which includes changes in solar PV generation during sunrise & sunset and in wind generation with wind speed variations [@elaOperatingReservesVariable2011; @australianenergymarketoperatorRenewableIntegrationStudy2020; @bloomItIndisputableFive2017].

##### Power system uncertainty

Power system uncertainty refers to **unexpected** changes to active power supply and/or demand. These include demand and VRE generation forecast errors (so-called "known unknowns"), and singular or widespread outage events ("unknown unknowns") triggered by the weather or unexpected system responses & interactions [@australianenergymarketoperatorRenewableIntegrationStudy2020; @elaOperatingReservesVariable2011; @egglestonSecurityResilienceTechnical2021].

### Operational paradigms {#sec:lit_review-operational_paradigms}

Given the need for at least some degree of balancing coordination in a power system (@sec:lit_review-balancing), SOs, which are a feature of all control area jurisdictions, have ultimate responsibility in ensuring that the area is operated in a secure and reliable manner [@roquesMarketDesignGeneration2008]. However, though the powers, responsibilities and degree of ring-fencing imposed upon the SO vary from jurisdiction to jurisdiction, these characteristics are first & foremost governed by the control area's *operational paradigm* [@chawlaGlobalTrendsElectricity2013]. Below, I discuss the two types of operational paradigms: where the SO is a *vertically-integrated utility*, and where the SO is, at the very least, responsible for operating a transmission system that forms the physical basis of a *wholesale electricity market*.

#### Vertically-integrated utility

Under this paradigm, a single company (either state-owned or privately-owned but regulated) owns, operates & invests in generation, transmission & distribution infrastructure, as well as being responsible for the retail of electricity to the end-user. This was the sole operational paradigm prior to the 1980s. Having a single owner and operator of power system resources reduces complexity, eliminates transaction costs and enables economies of scale in both asset investment (particularly generation infrastructure) and operation  [@sioshansiElectricityMarketReform2006]. These benefits are accentuated by industrialisation and electrification driving sustained load growth, which occurred in advanced economies in the 20^th^ century and which many emerging economies continue to experience [@roquesAdaptingElectricityMarkets2017; @hoganElectricityMarketStructure2008].

#### Wholesale electricity markets

Beginning in the late 1980s, some jurisdictions opted to *restructure* their electricity sector. To varying degrees across different jurisdictions, the impetus for restructuring was the result of advancements in small low-upfront cost gas turbine technologies, the promise of consumer choice, perceptions that vertically-integrated utilities were inefficient & politicised, and a political zeitgeist prevalent at the time that pursued economic efficiency through privatisation & competition [@sioshansiElectricityMarketReform2006; @macgillElectricityIndustryReform2013; @simshauserLessonsAustraliaNational2019; @chesterEnergyProblemRepresentation2019]. Two features common to electricity industry restructuring processes were the *unbundling* of vertically-integrated utilities and the introduction of competition for wholesale supply (and in some cases, demand) via an *electricity market*.

##### Unbundling

At the very least, the unbundling of a vertically-integrated utility divided generation ownership and created the SO, which was made responsible for the secure & reliable operation of the transmission network and often barred from owning generation assets. In some jurisdictions, SOs were given ownership of the transmission network (e.g. Transmission System Operators, or *TSOs*, in many European control areas) whereas others made their SOs "independent" of any asset ownership (e.g. Independent System Operators in North American control areas). Some SOs, such as those in North America and the Australian NEM, were also given market operation responsibilities [@chawlaGlobalTrendsElectricity2013].

##### Market models

Much like unbundling, the design and implementation of wholesale electricity markets (an auction-based mechanism for the sale and/or purchase of electricity) differed across jurisdictions engaged in restructuring. Despite these differences, electricity markets worldwide can broadly be categorised into two markets models[^2] that are distinguished by the degree of centralisation of system & market operations [@barrosoClassificationElectricityMarket2005; @cramtonElectricityMarketDesign2017; @ahlqvistSurveyComparingCentralized2022]:

[^2]: I note that my descriptions of central and self-dispatch electricity markets differ slightly to those of @ahlqvistSurveyComparingCentralized2022, who focus on the level of centralisation in day-ahead timeframes. They categorise the Australian NEM as a decentralised market as participants manage self-commitment; however, the SO still produces resource-specific production & consumption targets through a central dispatch process that constitutes the real-time market. Refer to TODO: (Ref to information context) for more detail.

1.  *Central dispatch* markets, where decisions regarding *dispatch* and, in some cases, *unit commitment* (see [@sec:lit_review-balancing_practices-scheduling]) are made by the SO. System & market operations are often *integrated* (i.e. the SO is also the market operator) in central dispatch markets through the creation of a *mandatory power pool*, in which supply offers are aggregated and cleared against a demand forecast (one-sided pool) or against an aggregated demand curve constructed from potential buyers (two-sided pool) [@barrosoClassificationElectricityMarket2005]. In these markets, locational marginal prices for energy and *ancillary services* (services procured for to maintain security and reliability) are produced by centralised optimisation processes run by the SO that consider the physical constraints of the transmission system. As outlined in @sec:fcs-NA, this market model has been adopted in Independent System Operator/Regional Transmission Operator (ISO/RTO) markets in North America and, as I discuss in TODO: (Ref to information context), the Australian NEM has many features of a central dispatch market.

2.  Decentralised or *self-dispatch* markets, where decisions regarding dispatch and unit commitment are made by market participants and in which system & market operations are more decoupled. These types of markets facilitate trade through *bilateral contracts* that enable suppliers to enter into contracts with buyers either directly or through intermediaries. Whilst scheduling and dispatch is managed by market participants, intended energy schedules (i.e. net contract positions) are submitted by market participants ahead of time to the SO. The SO is responsible for taking *redispatch* actions to ensure that transmission constraints are not violated, and for determining the requirement for and procuring *balancing services* (another name for frequency control services, which I discuss in greater detail in TODO:ref) that maintain system balance following market gate closure. As outlined in @sec:fcs-EU, this is the dominant market model in Europe.

@fig:market_models shows the primary and secondary commercial arrangements in each of these market models. Bilateral contracts (in the form of derivatives) are often used as hedging instruments in mandatory pool markets, and several bilateral markets, such as those in Europe, have associated voluntary power exchanges that are essentially power pools [@barrosoClassificationElectricityMarket2005].

![Commercial arrangements in central and self-dispatch electricity markets. Reproduced from @barrosoClassificationElectricityMarket2005. TODO: Fix up figure.](source/figures/market_models.png){#fig:market_models}

##### Market platforms {#sec:lit_review-operational_paradigms-markets-platforms}

Power system resource inflexibilities and the desire for physical & financial risk management mechanisms in operational timeframes have led market designers in many jurisdictions to implement electricity markets with multiple market *platforms* [@energysecurityboardSystemServicesAhead2020; @isemongerBenefitsRisksVirtual2006]. Platforms are formal sub-markets for energy (and sometimes ancillary services) that are settled at different times (mostly *ahead* of the delivery of electricity and/or ancillary services). The number of platforms implemented in a particular market is often related to its market model. Self-dispatch markets can maximise trade and better enable market participants to balance their positions by implementing multiple market platforms (typically *day-ahead* and several *intra-day*), whereas the number of platforms in central dispatch markets (typically *real-time* and in most cases, *day-ahead*) is limited by the computational complexity of the optimisation algorithm(s) used by the SO to clear the market [@ahlqvistCentralSelfDispatchElectricity2018]. I discuss the market platforms implemented in European markets in TODO:ref, North American ISO/RTO markets in TODO:ref and in the Australian NEM in TODO:ref-reserves.

## Balancing practices in operational timeframes {#sec:lit_review-balancing_practices}

SOs employ *balancing practices* in operational timeframes (which include the processes, services & markets shown in @fig:power_system_timeframes) for the purpose of obtaining *balancing flexibility* to address variability & uncertainty [@heggartyQuantifyingPowerSystem2020]. Though the particularities of these practices vary between jurisdictions, they are almost always organised in a hierarchical and sequential fashion to ensure that active power supply & demand are continuously balanced across different timeframes (see @sec:lit_review-balancing). Furthermore, in jurisdictions that have restructured their electricity industries, balancing practices that were previously administered by a vertically-integrated utility have been adapted into or integrated with market-based mechanisms.

### Conventional balancing practices
    
In the subsections that follow, I describe conventional balancing practices in the order of their timeframe of relevance (i.e. from milliseconds to years, as shown in @fig:power_system_timeframes).

#### Frequency control services

*Frequency control services* (leftmost section of the processes, services & markets shown in @fig:power_system_timeframes) are used by the SO to contain AC frequency within as narrow a band as possible during normal operation and following *contingency events* (sudden disturbances) [@etoFrequencyControlRequirements2018]. With the exception of inertial response from synchronous machines ([@sec:lit_review-balancing_practices-inertial_response]), these services are provided by power system resources with 1) the appropriate control system configurations and 2) capacity flexibility in the form of *headroom* (the ability to increase active power output) to respond to an under-frequency event and/or *footroom* (the ability to decrease active power output) to respond to an over-frequency event [@etoUseFrequencyResponse2010]. Whereas vertically-integrated utilities must schedule resources to provide frequency control services, SOs in restructured electricity industries through regulatory and market-based mechanisms (see @sec:fcs-context-procurement).

As shown in @fig:freq_control and discussed further in @sec:fcs, the conventional frequency control services described below differ based on their purpose, response time and activation & control methods.

![(a) A trace of power system frequency with corresponding frequency control services following a loss-of-generation contingency event. (b) The timeframes over which the various frequency control services are provided. Source: @australianenergymarketoperatorPowerSystemRequirements2020](source/figures/freq_control_timeframes.png){#fig:freq_control}

##### Inertial response {#sec:lit_review-balancing_practices-inertial_response}

As discussed in @sec:lit_review-balancing_need-frequency, synchronous machines have an *inherent* inertial response to AC frequency deviations that must be considered in the frequency control strategy of a power system. For a given active power imbalance, the inertia constant of the synchronous area, $H$, determines the magnitude of the initial RoCoF following an imbalance event (see @eq:swing_area) and the speed at which the power system can be returned to the nominal frequency [@ulbigImpactLowRotational2014; @tielensRelevanceInertiaPower2016].

###### Fast frequency response

IBRs and loads on frequency-responsive relays can provide what is typically known as *fast frequency response* (FFR). The most widely discussed use-case for FFR is the mitigation of high RoCoFs (i.e. response delivery within a matter of milliseconds to a few seconds) following contingency events [@millerTechnologyCapabilitiesFast2017; @australianenergymarketoperatorFastFrequencyResponse2017]. In the electricity industry to date, the term FFR has been used rather loosely to refer to three distinct control configurations (I discuss this further in @sec-ibr-challenges):

1. An **inherent** response delivered by IBRs that, though they lack a spinning mass, resembles the inertial response of synchronous machines (sometimes referred to as *virtual inertia*) [@linResearchRoadmapGridForming2020];
2. A **controlled** response delivered by wind generation in which kinetic energy is extracted from a wind turbine rotor to rapidly inject active power (sometimes referred to as *synthetic inertia* or *inertia-based FFR*) [@erikssonSyntheticInertiaFast2018; @nercinverter-basedresourceperformancetaskforceFastFrequencyResponse2020];
3. A **controlled and sustained** response delivered by IBRs & frequency-responsive loads that is more-or-less a faster version of primary frequency response ([@sec:lit_review-balancing_practices-pfr]) [@dreidyInertiaResponseFrequency2017; @fernandez-guillamonPowerSystemsHigh2019; @nercinverter-basedresourceperformancetaskforceFastFrequencyResponse2020].

##### Primary frequency response {#sec:lit_review-balancing_practices-pfr}

The aim of primary frequency response (PFR) is to arrest a frequency deviation. PFR is implemented in  resource-level control systems such that each enabled resource provides a response to locally-measured frequency deviations that exceed a certain control dead-band [@wangReviewAGCImplementation2003; @elaAlternativeApproachesIncentivizing2012]. For generators, this is achieved through *droop control*, in which a deviation from synchronous speed corresponds to a change in the active power output of a generator according to its droop characteristic ([@fig:droop], from A to B along $L_0$) . Droop control is implemented in the turbine governors of synchronous generators and the inverter control systems of IBRs [@fernandez-guillamonPowerSystemsHigh2019; @linResearchRoadmapGridForming2020]. Provided there is a sufficient amount of PFR reserve to arrest the system frequency, the frequency *zenith*/*nadir* (maximum/minimum system frequency following an active power imbalance event) is determined by the size of the imbalance event, the inertia constant of the synchronous area, the droop characteristics of power system resources and the speed of PFR [@nercinverter-basedresourceperformancetaskforceFastFrequencyResponse2020]. PFR should ideally be sustained until secondary frequency control can take over (i.e. several to tens of seconds) [@etoUseFrequencyResponse2010; @etoFrequencyControlRequirements2018; @undrillPrimaryFrequencyResponse2018; @undrillNotesFrequencyControl2019].

#### Secondary frequency control

Secondary frequency response (SFR) is designed to take over from and "relieve" fast-acting PFR. SFR is implemented in resource-level load controllers, which can [@undrillNotesFrequencyControl2019; @etoFrequencyControlRequirements2018].:

1. Be pre-configured to respond (including sustaining already-delivered PFR) following a frequency deviation through a *frequency bias* setting (as shown in @fig:droop); or
2. Receive control signals from *Automatic Generation Control* (AGC), a control system used by the SO to coordinate SFR across the control area. The AGC aims to minimise Area Control Error (ACE) subject to a tie-line bias, and thus return the power system to its nominal frequency, by communicating with enabled resources to make them adjust their active power output [@machowskiPowerSystemDynamics2020]. The service provided by these enabled resources is referred to as *regulation* in many jurisdictions [@elaOperatingReservesVariable2011; @hewickerDimensioningControlReserves2020].  

![Behaviour of a synchronous generator providing PFR and SFR in an isolated system. $L_0$ is the initial droop characteristic of the turbine governor. The generator is initially operating at point A with an active power output of $P_{M0}$. Following an imbalance event, system frequency (and hence the synchronous speed of the turbine) decreases from $\omega_0$ to $\omega_1$. The turbine governor then responds by moving the turbine along the droop characteristic to point B, thus increasing the generator's active power output to $P_{M1}$. This constitutes the provision of PFR. Following this, the generator load controller changes the reference speed setpoint of the governor and thus shifts the droop characteristic to $L_1$. This subsequent control action sustains PFR and returns the system to frequency $\omega_0$. This constitutes the provision of SFR. Source: @wangReviewAGCImplementation2003.](source/figures/droop.png){#fig:droop width="75%"}

#### Tertiary frequency control

In power systems where scheduling processes are infrequently run (e.g. vertically-integrated utilities that historically produced hourly schedules) or in which a "safety margin" is desired to address active power imbalances that endure over multiple scheduling intervals, tertiary frequency response (TFR) is deployed to relieve PFR & SFR [@hewickerDimensioningControlReserves2020]. Some jurisdictions, such as those operated by the California and Midcontinent ISOs, have introduced *ramping reserves*, which are essentially a form of TFR intended to address increased variability and uncertainty across dispatch intervals (i.e. several minutes to an hour) due to growing penetrations of VRE [@elaWholesaleElectricityMarket2016; @elaElectricityMarketsRenewables2017]. Others, such as the Australian NEM, rely on flexibility obtained through frequent scheduling processes (though the implementation of an *operating reserve* service — a form of ramping TFR —  had been proposed; see @sec:reserves-orcontext) [@australianenergymarketoperatorPowerSystemRequirements2020; @rieszFrequencyControlAncillary2015].

#### Scheduling {#sec:lit_review-balancing_practices-scheduling}

The purpose of *scheduling* is to produce efficient (or *economic*) generation and consumption schedules ahead of delivery based on expected power system conditions (typically non-scheduled demand and VRE generation forecasts). I divide the scheduling problem into three phases: *dispatch*, *unit commitment* and *longer-term scheduling*.

##### Dispatch

Dispatch involves the assignment of real-time generation or consumption targets to already-committed (see @sec:lit_review-balancing_practices-scheduling-uc) power system resources. Dispatch is carried out by vertically-integrated utilities, the SO in central dispatch markets and self-managed by market participants in self-dispatch markets (see [@sec:lit_review-operational_paradigms]). In the first two cases,  the power system is dispatched by a central operator which runs a process known as *security-constrained economic dispatch*. Security-constrained economic dispatch typically seeks to find a minimum cost operating configuration for committed generation and loads such that a short-term forecast of non-scheduled demand can be met subject to network constraints and stability & reliability requirements[^3] [@graingerPowerSystemAnalysis1994]. Some SOs solve this problem for a single interval (e.g. as in the Australian NEM), whereas others, including the California and Midcontinent ISOs, solve a multi-period dispatch to procure and, to some extent, price capabilities to address expected non-scheduled demand ramps [@schiroProcurementPricingRamping2017; @elaSchedulingPricingExpected2016]. The dispatch solution for each dispatch interval (5-15 minutes long in many central dispatch markets [@irenaIncreasingTimeGranularity2019]) consists of generation & consumption setpoints, enablement quantities for resources providing frequency control services and, in central dispatch markets that integrate power system operation & markets, real-time market locational marginal prices for energy & ancillary services [@cramtonElectricityMarketDesign2017]. If piecewise linear functions are used by vertically-integrated utilities to model resource cost curves or are required by the real-time market bid format for a market participant's energy offer curve[^4], the security-constrained economic dispatch problem can be efficiently solved using linear programming techniques [@woodPowerGenerationOperation2014].

[^3]: This is a common variant of the generic problem description discussed in [@sec:lit_review-operations].

[^4]: Bid formats may actually require monotonically increasing price-quantity pairs, but these can be used to construct piecewise linear increasing offer curves.

##### Unit commitment {#sec:lit_review-balancing_practices-scheduling-uc}

Thermal & hydroelectric generation, which historically dominated supply in many power systems, have inflexibility constraints (minimum load, start-up time, ramping limits and minimum up & down times) & costs (those attached to resource start-up, shut-down and operation at minimum load) that require SOs and market participants to make non-trivial *unit commitment* decisions (i.e. whether a resource should be online or offline). Depending on the resource, these decisions are made anywhere from 5 minutes to several hours ahead of power delivery [@denholmHowLowCan2018; @agoraenergiewendeFlexibilityThermalPower2017]. Unit commitment is:

- Self-managed by market participants in self-dispatch markets & in single-platform semi-centralised markets such as the Australian NEM;
- Built into the day-ahead market & intra-day reliability processes in central dispatch markets; and 
- Managed by vertically-integrated utilities for all resources in jurisdictions that have not undergone restructuring. 

In the latter two cases, the SO runs a process known as *security-constrained unit commitment*, which typically seeks to determine the minimum cost subset of power system resources that should be committed to meet a non-scheduled demand forecast for a future horizon (usually 36-48 hours ahead) subject to network constraints and stability & reliability requirements. Security-constrained unit commitment is typically formulated as a mixed-integer linear program, which are computationally complex to solve due to the non-convexity of the integral solution space [@woodPowerGenerationOperation2014; @knuevenMixedintegerProgrammingFormulations2020].

In the day-ahead platforms of central dispatch markets, market participants submit start-up and no-load (minimum load) costs in addition to a piecewise linear offer for energy [@herreroEvolvingBiddingFormats2020]. The SO solves a security-constrained unit commitment problem to clear the day-ahead market and produce an ahead schedule, which is only financially binding (i.e. deviations from this schedule are settled using real-time prices), in addition to locational prices for energy and ancillary services for each market interval (usually each hour) in the day-ahead horizon [@isemongerEvolvingDesignRTO2009; @cramtonElectricityMarketDesign2017]. As discussed in [@sec:lit_review-operational_paradigms-markets-platforms], the day-ahead market platform provides market participants with an opportunity to hedge their real-time market position, and gives both market participants & the SO a degree of certainty in schedules well before power delivery.

##### Longer-term scheduling

Operational planning actions taken in longer-term scheduling timeframes (a day ahead to a few years ahead) include resource maintenance scheduling, the management of *energy/fuel reserves* and ensuring that social & environmental obligations on resources are met (e.g. regulated discharges from hydroelectric scheme dams) [@helistoIncludingOperationalAspects2019; @sucklingSeasonaltoDecadalClimateForecasting2018; @denholmHowLowCan2018]. Many of these activities are conducted on the basis of information supplied by longer-term weather/climate, power system & market forecasts. Energy reserve management is a particularly important aspect of longer-term scheduling for power system resources that face material opportunity-costs due to limited energy/fuel storage capacity, seasonally-variable primary energy source availability and/or degradation from operation [@xuRoleModelingBattery2022; @mcphersonImpactsStorageDispatch2020]. In restructured electricity industries, longer-term scheduling requires market participants to also consider, and potentially change, their forward market position, which is defined by the *electricity derivatives & contracts* they hold [@macgillEndtoendElectricityMarket2020].

## Designing balancing practices in operational timeframes
#### Procurement of frequency control services {#sec:procurement}

As highlighted by @Ela2012b and @Billimoria2020, frequency control
services are typically procured through a combination of market-based
mechanisms, such as remunerative schemes or contract or spot markets,
and regulatory mechanisms, such as connection requirements or system
operator intervention.

##### Market-based mechanisms {#sec:market_mech}

###### Suitability of markets

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

###### Opportunity costs and co-optimisation

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

###### Potential benefits of market-based mechanisms

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

##### Challenges in frequency control services markets {#sec:challgnes_fcas_markets}

Frequency control services markets face both existing and emerging
challenges to achieving productive and dynamically efficient outcomes.
The main challenges being faced in these markets are outlined below:

###### Product design and fungibility.

Products in existing frequency control services markets generally
reflect the capabilities and requirements of conventional frequency
control provided by synchronous generators [@EU-SysFlex2019]. As
frequency control abilities and needs have changed over time, various
jurisdictions have considered or created additional frequency control
services. These include ramping products, which have been implemented in
some ISO/RTO markets in response to increasing variability and
uncertainty [@Ela2019; @Ela2017], FFR products to mitigate RoCoF
[@Ela2019; @Fernandez-Munoz2020] and TFR or operating reserves where
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

###### Price formation.

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

###### Cost allocation.

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

###### IBR participation.

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

##### Regulatory mechanisms {#sec:regulatory_mech}

Regulatory mechanisms, such as equipment technical standards, grid codes
and system operator intervention, were used by monopoly electric
utilities and system operators to procure sufficient frequency control
response prior to implementation of frequency control services markets.
Even now, regulatory mechanisms are used in conjunction with
market-based mechanisms to procure frequency control services. In fact,
the processes of designing and regulating market rules are in and of
themselves regulatory mechanisms [@Sioshansi2006].

###### Potential benefits of regulatory mechanisms

Regulatory mechanisms are ideal for mandating basic frequency control
capabilities as a condition for access or where markets may be difficult
to design or suffer from major flaws such as a concentration of market
power, oversupply of a product or the issues discussed in
[6.1.4](#sec:challgnes_fcas_markets){reference-type="ref"
reference="sec:challgnes_fcas_markets"} [@Ela2012b].

###### Shortfalls of regulatory mechanisms

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

###### Regulatory requirements as a solution to market failures

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


Designing frequency control arrangements is a control, regulatory and
market design problem which has become more complex in recent years due
to electricity industry restructuring and growing penetrations of IBR
[@VanderVeen2016].

### Outcomes of good design

t is important to define desired outcomes of the design process. Below,
e present three outcomes that have previously been proposed for
esigning ancillary/system services arrangements (including frequency
ontrol arrangements) by @Rebours2007b and the
AustralianEnergyMarketCommission2020a.

.  **Effectiveness**. This entails both sufficient quantity and
   performance of procured frequency control services to ensure that
   power system security requirements are met.

.  **Efficiency**. Efficient frequency control arrangements will
   procure services at the lowest cost to the system, both now
   (productive efficiency) and into the future (dynamic efficiency).
   Furthermore, efficient arrangements should also procure the right
   mix of services according to user and/or system needs (*allocative
   efficiency*).

.  **Minimising procurement costs and complexity**. Procurement and
   verification of delivery of frequency control services may involve
   significant costs associated with facilitation and monitoring. This
   could include metering equipment, IT systems and additional staffing
   costs. Complex procurement arrangements may also have unintended and
   unforeseen consequences on processes and markets that interface with
   these arrangements, such as the energy market and other ancillary
   services markets.

### Complexity of the design process

esigning frequency control arrangements is a complex exercise in
anaging interrelated and interacting capabilities, mechanisms and
bjectives ([7](#fig:design_complexity){reference-type="ref"
eference="fig:design_complexity"}). The frequency control *capability*
f a power system is distinct from its *performance*, with a *control
trategy* defining how the former translates to the latter. The
requency control capability of a power system is determined by the
hysical characteristics and configuration of generators, loads and
etwork elements within a synchronous area.

[A diagrammatic depiction of the complexity involved in designing power
ystem frequency control
rrangements.](source/figures/capability_performance-04.png){#fig:design_complexity
idth="\\textwidth"}

requency control services from capable resources are often mandated
hrough connection requirements or power system operator intervention
see [6.2](#sec:regulatory_mech){reference-type="ref"
eference="sec:regulatory_mech"}), incentivised through remunerative
chemes, or procured through a contract or spot market (see
6.1](#sec:market_mech){reference-type="ref"
eference="sec:market_mech"}) [@Billimoria2020]. Together with the
ontrol specification of frequency control products, these mechanisms
efine a power system *control strategy* that dictates how capable
ystem resources respond to deviations, and therefore determine the
requency control *performance* of a power system. The outcomes that
efine frequency control performance can be divided into physical
erformance criteria, which describe the effectiveness of frequency
ontrol services provided, and economic objectives, which relate to the
roductive, dynamic and price and cost-allocation efficiency of the
rrangements.

#### Interactions between capability, strategy and performance

hese three design layers often interact. Technical capabilities may
uide the design of the control strategy, and therefore the mechanisms
hat define frequency control performance. An example of such a process
s the PJM Interconnection (an RTO) implementing a high frequency AGC
ignal designed for BESS providing fast regulation frequency control
ervices [@Benner2015; @Brooks2019]. Similarly, deficiencies in
erformance can be addressed through modifying the control strategy to
rocure additional or more suitable frequency control capability. The
alifornia and Midcontinent ISOs have introduced ramping products to
ddress increasing variability and uncertainty in their power systems
@Ela2016; @Ela2017].

### Diversity of design outcomes

he design process has and will most likely continue to proceed
ifferently across jurisdictions due to the diversity of both the
echnical capabilities of resources within power systems (see
4](#sec:freq_dev_control){reference-type="ref"
eference="sec:freq_dev_control"} and
5](#sec:ibr_freq){reference-type="ref" reference="sec:ibr_freq"}) and
he different structures and features of various electricity markets
see [2](#sec:elec_markets){reference-type="ref"
eference="sec:elec_markets"}) [@Rebours2007b]. Existing frequency
ontrol arrangements across the world have been reviewed and compared
xtensively in the literature
@Rebours2009; @Ela2011; @DGAConsulting2016; @Hewicker2020; @Rebours2007a; @Rebours2007; @Zhou2016; @ReishusConsultingLLC2017; @Banshwar2018].

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

##### Holistic design

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

##### Interfaces

The concept of interfaces in electricity industry decision-making is
distinct but coupled to the frequency control arrangement design layers
discussed above. Interfaces were first formalised by @Thorncraft2007,
specifically with relation to the security decision-making interface
between commercial decision-making processes (i.e. processes within
market-based mechanisms) and the technical and physical processes and
the requirements of the power system (i.e. frequency control capability
and physical performance) [@Thorncraft2009].

###### Security decision-making interface.

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

###### Interfaces between mechanisms in the frequency control strategy

Interfaces change over time and with technological innovation
[@Thorncraft2009]. The arrival of highly-controllable loads and IBR in
the power system warrants the consideration of a *control system*
process that is separate from physical characteristics and processes
([8](#fig:interfaces){reference-type="ref" reference="fig:interfaces"}).

![Interfaces between the frequency control capability and the mechanisms
within the frequency control strategy of a power
system.](source/figures/interfaces_03.png){#fig:interfaces}

###### Interface between control and procurement mechanisms.

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

###### Interface between procurement mechanisms.

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


## Emerging challenges to balancing
### Inverter-based variable renewable energy resources

Inverter-based resources (IBR) include variable IBR (solar PV and Type
III and Type IV wind turbines [@Wu2018]), BESS and high voltage direct
current (HVDC) links that connect to a power system through power
electronic devices. The impacts of variable IBR on frequency control are
of particular interest to system operators and market designers as many
power systems are currently experiencing high instantaneous penetrations
of variable IBR (in excess of 50%) and because many more are expected to
do so in the future [@AustralianEnergyMarketOperator2019; @IRENA2020].
    
#### Challenges posed by inverter-based resources

High penetrations of IBR in power systems pose challenges to frequency
control due to their characteristics, particularly in islanded power
systems or weakly-interconnected control areas that cannot rely on a
wider synchronous area for frequency control services [@Hodge2020].
These include [@Kroposki2019]:

##### Interface to power system

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

##### Variability and uncertainty

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

##### Provision of frequency control services

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

### Designing balancing practices
#### The benefits and limits of markets
#### The role of the SO
#### Design in a world of "second-best"
Tradeoffs/overlap
##### Grid architectures
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
