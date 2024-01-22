# Quantifying reserve capabilities: an Australian case study with increasing penetrations of renewables {#sec:reserves}

## Link to thesis

In wholesale electricity markets, market participation decisions determine the type and quantity of balancing flexibility available within scheduling timeframes. There is a role for empirical studies examining whether decentralised operational balancing practices, such as markets, are purpose-fit to deliver the balancing flexibility requirements of electricity markets in transition – particularly given that new markets for flexibility (e.g. reserve product markets) can introduce additional costs, constraints and complexity and even encroach upon the functions of existing operational practices. This focuses on understanding the balancing flexibility **capabilities** available in scheduling timeframes both now and into the near future, and using this knowledge to inform market design. The purpose of this chapter is to address the "capabilities" component of the second research objective of this thesis (see @sec:research_framework).

The content of this chapter is from the following peer-reviewed journal article published in *Energy Policy*:

**Prakash, A.**, Ashby, R., Bruce, A. & MacGill, I. Quantifying reserve capabilities for designing flexible electricity markets: An Australian case study with increasing penetrations of renewables. Energy Policy 177, 113551 (2023).

## Abstract

Across several power systems with market frameworks, policy-makers are proposing that balancing flexibility requirements emerging during energy transition be addressed through new reserve product markets. However, these may introduce additional costs, constraints and complexity and even encroach upon the functions of existing operational practices. Thus, policy-makers need to assess and compare flexibility design options, and quantifying system flexibility capabilities based on current and expected resource mixes can assist in achieving this. In this article, we offer a practical method to quantify the time-varying spectrum of upwards and downwards flexibility capabilities in systems, and subsequently apply it to historical and projected resource mixes in two regions of the Australian National Electricity Market. Our results suggest that with higher penetrations of renewable energy: 1) downwards flexibility margins can be exhausted around noon if wind and solar are unable or unwilling to provide it, 2) upwards flexibility becomes more scarce during morning and evening peak demand events and 3) a greater portion of upwards flexibility is provided by energy-limited resources. Given these trends, we recommend that policy-makers examine how existing operational practices can be augmented to elicit upwards flexibility provision, and that duration specifications and sustained footroom procurement be considered for reserve products.

## Introduction {#sec:reserves-intro}

The reliable and secure operation of power systems is contingent upon locational and temporal balancing of active power supply and demand. As jurisdictions progressively decarbonise electricity supply through considerable capacity additions of variable renewable energy (VRE) and the retirement of carbon-intensive conventional generation, the nature of short-term risks to system balancing (i.e. those of concern over the range of seconds to days) is changing. The most notable of these short-term risks are [@elaOperatingReservesVariable2011]:

- Power system *variability*, which includes expected changes in the supply-demand balance. Traditionally, variability has been associated with system load movements and fluctuations around pre-determined generator schedules. As energy transition proceeds, system operators (SOs) are becoming increasingly focused on managing variability that arises due to the presence of VRE. This includes the correlated ramping of neighbouring solar PV generation during sunrise and sunset, and that of wind generation following the arrival of a cold front [@lewWesternWindSolar2013;@australianenergymarketoperatorRenewableIntegrationStudy2020].
- Power system *uncertainty*, which encompasses unexpected changes in the supply-demand balance. Beyond demand and VRE generation forecast errors, uncertainty also includes singular or widespread outage events that could be the result of a sudden loss of primary energy availability, equipment malfunctions, or common mode failures either triggered by insecure system operation (e.g. significant frequency and/or voltage deviations) or exogenous events (e.g. extreme weather events) [@redefiningresourceadequacytaskforceRedefiningResourceAdequacy2021;@matevosyanFutureInverterBasedResources2021;@electricitysectorclimateinformationprojectESCIProjectFinal2021].

Provided that it is sufficient, leveraging the active power balancing flexibility of a power system (defined by @heggartyQuantifyingPowerSystem2020 as a system's "ability to cope with variability and uncertainty") should enable these short-term risks to be managed. At a particular point in time, the total balancing flexibility *capability* of a power system is the sum of potential flexibility contributions from resources such as generators, flexible demand and energy storage. However, the flexibility that can actually be *deployed* at any given time and location is potentially limited by:

1. Physical, economic, social and environmental constraints on the operation of resources [@denholmHowLowCan2018;@gonzalez-salazarReviewOperationalFlexibility2018];
2. Network topology, particularly if deploying a flexibility solution results in the violation of network constraints [@lannoyeTransmissionVariableGeneration2015;@liuGridMarketServices2021]; and
3. Operational practices. These include protocols and tools used by the SO (which is ultimately responsible for maintaining supply-demand balance) and electricity market design in power systems with a market overlay [@elaWholesaleElectricityMarket2016].

Though it is well established that operational practices are crucial to "enabling" balancing flexibility provision [@hirthBalancingPowerVariable2015;@hsiehGridFlexibilityQuiet2017;@papaefthymiouPowerSystemFlexibility2018], limited attention has been given to assessing the trade-offs between practice changes [@maysMissingIncentivesFlexibility2021]. A typical design choice in power systems with electricity markets is determining whether a balancing function should be performed by the SO, or partially delegated to market participants via market-based mechanisms. Proponents of market-based mechanisms argue that if they are well-designed, their benefit is twofold: appropriate incentives can unlock the efficient utilisation of latent flexibility from existing resources whilst encouraging investment in additional flexibility as a market-signalled need emerges. However, to some extent, desires to maximise market benefits and minimise market distortions need to be weighed against providing the SO with sufficient lead-time and levers to maintain system balance during both normal and extraordinary circumstances [@roquesMarketDesignGeneration2008; @prakashInsightsDesigningEffective2022].

Establishing markets for balancing reserves offers a compromise between SO control and market efficiency [@ryanVariableGenerationReserves2014;@kristovTaleTwoVisions2016]. These enable the SO to set a requirement for, competitively procure and then schedule system *headroom* (spare generation capacity and potential load curtailment) or system *footroom* (potential generation curtailment and load increase) with particular power, energy, ramping and quality-of-response (e.g. response time) capabilities [@ulbigAnalyzingOperationalFlexibility2015;@degefaComprehensiveClassificationsCharacterizations2021]. Whilst tailored *reserve services* can be procured through tendering processes, zonal or system-wide markets for *reserve products* have become increasingly commonplace given that temporal balancing is of greater concern in meshed networks. Additionally, "commodification" of capabilities through products reduces complexity and enables the implementation of auctions, which can improve transparency and competition and be co-optimised with energy or other reserve product markets [@mancarellaFragileGridPhysics2021;@lalEssentialSystemServices2021].

The changing nature of short-term risks to system balancing and the accompanying need for greater system flexibility is leading policy-makers to reassess the suitability of the reserve products available to their SOs [@eu-sysflexProductDefinitionInnovative2019;@energysecurityboardPost2025Market2021; @federalenergyregulatorycommissionEnergyAncillaryServices2021]. Reform of reserve arrangements can simply modify procurement practices or lead to a more significant restructuring of available products, which includes introducing new markets [@ryanVariableGenerationReserves2014]. Particularly in their initial stages, reform processes tend to justify changes on the basis of how they might address potential threats to system balancing. This approach is appropriate and sufficient where reserve service provision entails specialised quality-of-response capabilities that cannot be provided effectively or efficiently through other means (e.g. high bandwidth control configurations required for fast frequency response provision). However, some reserve products may "compete" with other design options. For example, the purpose and timeframe of tertiary frequency control and ramping products overlap with those of dispatch processes. Where reserve arrangement reform encroaches on the functions of other processes and practices, quantifying system flexibility capabilities based on current and expected resources mixes can assist policy-makers in assessing flexibility design options.

Reserve products also impose tangible and intangible costs. Regardless of cost allocation mechanisms, procuring reserves typically raises system operation costs and thus prices paid by energy users [@hummonFundamentalDriversCost2013]. Furthermore, even if they offer a solution to a system sub-problem, reserve products do not guarantee reliable operation of the overall system and may even hinder the implementation of other measures that can realise system flexibility [@papaefthymiouPowerSystemFlexibility2018;@pollittCompetitionMarketsAncillary2019;@macgillEndtoendElectricityMarket2020]. For example, valuing balancing flexibility on the scale of minutes to hours through reserve products could mean sacrificing the benefits of better reflecting the value of flexibility in energy prices:

1. For participants, energy market risk management is more straightforward than managing risk in reserve product markets. Short-term energy markets typically have greater depth and a broader range of associated technical or financial forward markets [@pollittCompetitionMarketsAncillary2019].
2. Reserve product markets often have pre-qualification criteria and minimum offer quantities. As such, the participation of smaller demand-side and distributed energy resources (DER) in reserve product markets is often contingent on the involvement of an intermediary aggregator, which imposes additional transaction costs [@poplavskayaDistributedEnergyResources2019]. However, embedding the value of flexibility within the price for energy could simplify flexibility provision through market participation for these resources, particularly if policy-makers pursue dynamic retail pricing or nested distribution-level markets that interface with transmission-level markets [@kristovTaleTwoVisions2016;@hoganMarketDesignPractices2019;@maysMissingIncentivesFlexibility2021].
3. The flexibility that the SO is able to procure through reserve products is restricted by their product specifications. Solely relying on reserve products for flexibility may constrain operational outcomes. Such flexibility "discretisation" might also be reflected in the resources deployed in the system should reserve product markets influence investment decisions [@lalEssentialSystemServices2021]. Additionally, whilst reserve products can be tailored to a particular system's capabilities and needs, reserve sharing between SO jurisdictions is easier if technical specifications are standardised [@schererFrequencyControlEuropean2016].

Given these factors, quantification and comparison are therefore needed to assess the role of reserve products, particularly where [@reboursFundamentalDesignIssues2007;@elaElectricityMarketFuture2021]:

1. Other operational practice or policy changes have the potential to deliver greater and/or more robust flexibility benefits without the additional costs, uncertainty and complexity of new markets; or
2. Current market design or exogenous resource adequacy policies (e.g. firming revenue guarantees or capacity markets) are driving sufficient investment in flexible resources.

A plethora of metrics that quantify different aspects of system balancing flexibility capabilities have been proposed in the literature [@lannoyePowerSystemFlexibility2012; @mohandesReviewPowerSystem2019; @heggartyQuantifyingPowerSystem2020]. Rather than solely quantifying flexibility capabilities, operational metrics typically compare short-term flexibility capabilities against a flexibility requirement that is set by one of the following or a combination thereof: rules-of-thumb, net load variability, net load forecast uncertainty and/or probabilistic VRE forecasts. While an SO can use these metrics to identify potential flexibility shortages [@zhaoUnifiedFrameworkDefining2016], dimension reserve products [@dvorkinAssessingFlexibilityRequirements2014; @costilla-enriquezOperatingDynamicReserve2023] or schedule resources [@nosairFlexibilityEnvelopesPower2015], they may be less useful to system designers assessing changes to practices that leverage decentralised decision-making (e.g. energy and reserve product markets). Broader planning-oriented flexibility capability metrics may be more suitable for such purposes. These include traditional resource adequacy metrics [@stenclikQuantifyingRiskUncertain2021], "inflexibility costs" (e.g. additional system costs due to flexibility constraints as explored in @vithayasrichareonOperationalFlexibilityFuture2017) or "flexibility adequacy" metrics, such as the insufficient ramping resource expectation proposed in @lannoyeEvaluationPowerSystem2012. In particular, @lannoyeEvaluationPowerSystem2012 uses time-sequential power system operations data to explicitly calculate the balancing flexibility available after resources are dispatched, though valuable chronological information is lost when the time series generated in the study are converted into probability distributions to calculate the insufficient ramping resource expectation. By retaining a degree of this chronological information, our methodology aims to provide electricity industry stakeholders with a better understanding of the time-varying "spectrum" of system balancing flexibility capabilities, and thus assist them in assessing, comparing and designing potential operational practice changes to improve flexibility in power systems with a growing number of variable and energy-limited resources.

In this article, we offer a practical method for quantifying available reserves and footroom (the balancing flexibility that is available after resources are dispatched to meet system demand), and an example of how such quantification can inform flexible electricity market design. We provide simple extensions to the methodology developed by @lannoyeEvaluationPowerSystem2012 that account for flexibility contributions from VRE and battery energy storage systems (BESS), and market participants' aversions to incurring cycling costs. We then use this methodology in a case study in which we quantify time-varying available reserves and footroom in real-world systems: two regions of the Australian National Electricity Market (NEM). Through a 2020 baseline and two 2025 scenarios, we test four key sensitivities in these two regions: the acceleration of large conventional generation retirement, the rate of deployment of VRE and storage technologies, contrasting resource mixes and operational constraints, and greater variability in operational demand. While previous studies have tested the impact of some of these sensitivities on the availability of total system headroom or existing reserve products [@hummonFundamentalDriversCost2013; @tanotoImpactHighSolar2021; @frewCurtailmentParadoxTransition2021], our analysis offers a perspective that is focused on quantifying a time-varying spectrum of flexibility capabilities and thus concerned with the *design* of operational practices in low-carbon power systems. Our analysis results highlight the underappreciated need to consider mechanisms for procuring footroom, and we proceed to discuss the implications of implementing new balancing products on operational outcomes. Though the NEM is unique in aspects of its operational practices and the balancing risks it faces, the methodology and findings from this study will become increasingly relevant in other jurisdictions given the accelerating deployment of VRE and storage and the progressive retirement of carbon-intensive conventional generation [@internationalenergyagencyStatusPowerSystem2019;@internationalenergyagencyNetZero20502021].

[@sec:reserves-flexnem] provides an overview of how balancing flexibility is enabled and procured through the NEM's operational practices and market design. In [@sec:reserves-modeloverview], we describe a methodology to quantify available reserves and footroom across deployment horizons for various resource types. Then, in [@sec:reserves-casestudy], we quantify the available reserves and footroom in two regions of the NEM for existing resource mixes in 2020 and potential resources mixes in 2025, with two scenarios for the latter. We then use the findings from this case study to explore the role of reserve products in securing balancing flexibility. We conclude by highlighting pertinent findings and recommendations to policy-makers in [@sec:reserves-conclusion].

## Flexibility in the National Electricity Market {#sec:reserves-flexnem}

The Australian National Electricity Market (NEM) is a short-term wholesale electricity market overlaid on a ~5000 kilometre long "stringy" network that services the majority of eastern and southern Australia [@australianenergymarketcommissionElectricitySupplyChain]. In 2021, it saw a peak demand of \~32 GW and total electricity consumption of \~204 TWh [@australianenergyregulatorStateEnergyMarket2022]. With no explicit capacity mechanisms or compulsory forward markets, the NEM solely consists of a zonal real-time platform, with market regions corresponding to the states of Queensland, New South Wales (NSW), Victoria, Tasmania and South Australia (SA). Interconnection between market regions is relatively weak and, due to the large distances involved, the NEM is not connected to other bulk power systems [@australianenergymarketoperatorMaintainingPowerSystem2019].

In the subsections that follow, we describe the operation of the NEM with a focus on features and mechanisms that enable or explicitly procure balancing flexibility. In particular, we discuss current reserve arrangements in the NEM in @sec:reserves-nemreserves and the proposal to introduce an *operating reserve* product in @sec:reserves-orcontext. The policy debate surrounding the usefulness and design of this potential reserve product provides the primary motivation for our case study in @sec:reserves-casestudy.

### Market design

#### Real-time markets

The NEM is a central dispatch market that is operated by the Australian Energy Market Operator (AEMO). On the day ahead of delivery, market participants are required to submit non-binding offers for each resource consisting of price-quantity pairs for energy and, optionally, Frequency Control Ancillary Services (FCAS) (described in Section @sec:reserves-nemreserves) [@australianenergymarketoperatorPredispatchOperatingProcedure2021]. Energy offers can be priced as high as the market price cap (15,000 AUD/MW/hour during the Australian financial year of 2020-2021) or as low as the market floor (-1000 AUD/MW/hour). Negative pricing enables generators to express a preference to either remain online due to significant start-up/shut-down costs or to be dispatched as a price-taker when it is commercially favourable to do so (e.g. to receive remuneration from an offtake agreement). In theory, it also provides investment signals for flexible resources alongside a relatively high market price cap [@rieszAssessingViabilityEnergyonly2016;@orvisRefiningCompetitiveElectricity2018].

On the day of delivery, co-optimised markets for energy and FCAS are cleared every 5 minutes through a security-constrained economic dispatch process, which produces zonal marginal prices for energy and FCAS. There is no formal gate closure in the NEM; participants are able to alter volumes (but not prices) in their offer up to tens of seconds before the delivery interval [@australianenergymarketcommissionBiddingGoodFaith2015;@paulmcardleTwoRecentImprovements2021]. In 2021, the market settlement period was changed from 30 minutes (the average of prices of the preceding six 5-minute intervals) to 5 minutes to better align settlement with dispatch and pricing [@australianenergymarketoperator5MSCommencement2022]. Since resources are expected to linearly ramp between one dispatch target and the next, the dispatch process implicitly "procures" some flexibility to manage variability [@ryanVariableGenerationReserves2014;@australianenergymarketoperatorDispatchStandardOperating2019]. As such, the NEM's dispatch is relatively fast and granular when compared to short-term electricity markets worldwide [@katzOpeningMarketsDesigning2019; @silva-rodriguezShortTermWholesale2022].

The NEM's real-time market is also able to elicit balancing flexibility provision from a variety of resources:

- Unlike some North American markets that permit large proportions of the generation fleet to self-schedule [@elaWholesaleElectricityMarket2016; @orvisRefiningCompetitiveElectricity2018], generation with a capacity above 30 MW is required to participate in the real-time market and receive dispatch instructions [@australianenergymarketcommissionNonscheduledGenerationLoad2017]. This exposes larger utility-scale resources, which make up the bulk of the NEM's generation capacity, to price signals that somewhat reflect system balancing requirements.
- VRE forecasts used in dispatch can be generated by AEMO or provided by market participants; due to very late gate closure, both are able to incorporate telemetered operational data from the minutes preceding delivery [@australianenergymarketoperatorSchedulingErrorReport2016;@australianenergymarketoperatorSemiScheduledGenerationDispatch2018].
- In 2021, a wholesale demand response mechanism was implemented to enable larger loads (aggregated or otherwise) and virtual power plants (VPPs) to directly participate in the energy market[^16] [@australianenergymarketoperatorWholesaleDemandReponse2020].

#### Forward markets

In the NEM, forward energy markets are voluntary and primarily consist of the trading of electricity derivatives between market participants. Though market participants can contract over-the-counter, the majority of forward market activity occurs on two market exchanges for standard products for periods up to 3 years out [@asxenergyAustralianElectricityMarket2021;@australianenergyregulatorStateEnergyMarket2021]. These standard products include quarterly or annual futures, which fix a price for an agreed quantity of energy, and caps, which are essentially call options that enable contract purchasers (typically electricity retailers) to pay no more than the strike price of 300 AUD/MWh for energy at the cost of a premium paid to the seller. Contract markets in SA are considered to be relatively illiquid compared to those in NSW, Queensland and Victoria [@australianenergyregulatorStateEnergyMarket2022]. Beyond enabling market participants to hedge real-time market price risk, products traded on the forward markets may 'discipline' market participants into offering balancing flexibility to the system. For example, a generating market participant that sells futures and caps is likely to retain some reliable generation capacity in reserve to avoid large payouts in the event of high real-time prices or the failure of their other plants [@rieszAssessingViabilityEnergyonly2016].

#### Limitations

Despite the arguably world-leading flexible design of its real-time markets, there are some notable limitations in the NEM and its associated forward markets:

- To date, the balancing flexibility offered by DER has primarily been leveraged through unremunerated, last-resort curtailment of distributed solar PV in SA by AEMO [@australianenergymarketoperatorOperatingGridHigh2021] or through aggregated solar-battery VPPs. At the end of 2021, VPPs had a registered capacity of approximately 30 MW [@kuiperWhatStateVirtual2022], a small percentage of the \~15 GW of distributed solar PV capacity installed in the NEM as of June 2022 [@australianpvinstituteInstalledPVGeneration].
- Aside from the procurement of footroom that is only deployed following frequency excursions (@sec:reserves-nemreserves), there are currently no mechanisms in the NEM that remunerate resources for providing sustained downwards flexibility to the system.
- Standard derivative products have remained much the same for decades despite changes in the NEM's resource mix and market dynamics. In particular, the 300 AUD/MWh strike price of cap contracts does not necessarily reflect a resource's operating costs (e.g. the price of natural gas or the charging/pumping price for BESS/pumped hydro energy storage). While a demonstration project trialled a market platform for derivatives designed to be sold by flexible resources (e.g. a "Super Peak" contract that enables buyers to hedge morning and evening demand peaks), these are nascent products with small traded volumes to date [@renewableenergyhubRenewableEnergyHub2021].
- AEMO has little visibility and no direct oversight over the voluntary forward markets, which are currently operated by the financial services sector. Moreover, even if AEMO did, it would likely be difficult for them to determine how portfolio-based contracting might influence the operation of particular resources [@australianenergymarketcommissionShortTermForward2020].

[^16]: Many of these resources were previously restricted to FCAS provision.

### Ahead processes and operator intervention {#sec:reserves-ahead_soint}

Through several ahead processes, AEMO regularly publishes forecasted system and market information to assess power system reliability and assist market participant decision-making. The processes most relevant to operational decision-making include the near-term Projected Assessment of System Adequacy (PASA) and pre-dispatch simulations:

- Using forecasts for demand and VRE, a simplified set of forecasted network constraints and participant-submitted resource availabilities and energy constraints, the Pre-Dispatch PASA and Short Term PASA (run every half-hour and hour, respectively) both assess the maximum generation reserves available in each region for the next 7 trading days. PASA outputs include half-hourly available generation and system load forecasts [@australianenergymarketoperatorShortTermPASA2012; @australianenergymarketoperatorReliabilityStandardImplementation2020;@australianenergymarketcommissionUpdatingShortTerm2022].
- Once day-ahead offers have been submitted by market participants, AEMO uses these offers in pre-dispatch processes alongside forecasts for constraints, demand and VRE. Pre-dispatch simulations then produce forecasts for dispatch conditions and regional prices for energy and FCAS. These are run every half hour at half-hourly resolution until the end of the next trading day (pre-dispatch) and at 5 minute resolution for the next hour (5 minute pre-dispatch) [@australianenergymarketoperatorPreDispatch; @australianenergymarketoperatorPredispatchOperatingProcedure2021]. The potential impacts of demand forecast error on regional energy prices and interconnector flows are explored through a sensitivity analysis [@australianenergymarketoperatorPreDispatchSensitivities2021].

Regional balancing stress is indicated by the level of in-market reserves, which is the total offered generation capacity in excess of forecast regional demand[^17]. Should the Short Term PASA or pre-dispatch processes forecast in-market reserves below specific trigger levels, AEMO must issue market notices that declare forecast Lack of Reserve (LOR) conditions [@australianenergymarketoperatorShortTermReserve2021]. Trigger levels are set by the maximum of either deterministic generation contingencies (i.e. below N-2 for LOR1, below N-1 for LOR2 and no in-market reserves for LOR3), or a particular confidence level of a probability distribution of total forecasting errors generated by a Bayesian Belief Network, which is trained on historical forecast errors and power system conditions [@australianenergymarketoperatorReserveLevelDeclaration2018].

[^17]: This measure does not consider the horizon within which the capacity can be converted to generation (i.e. the reserve horizon).

The intention of these ahead process and LOR notices is to provide market participants with information that might elicit a response, such as shifting planned maintenance or rescheduling flexible resources in response to forecasted tight supply-demand balance conditions. However, if more severe LOR2 or LOR3 notices have been issued and AEMO deems that the market response is insufficient by a certain time, AEMO can intervene in the market by issuing directions (manual dispatch), activating emergency reserves procured through the Reliability and Emergency Reserve Trader (RERT) and/or instructing transmission network operators to shed load [@australianenergymarketoperatorShortTermReserve2021; @australianenergymarketoperatorReserveLevelDeclaration2018].

### Reserve products {#sec:reserves-nemreserves}

Formal reserves arrangements in the NEM consist of eight FCAS and the Reliability and Emergency Reserve Trader (RERT). In each dispatch interval, FCAS are procured by AEMO from markets for raise (headroom) and lower (footroom) regulation FCAS, which are used to provide frequency control during normal operation, and three raise and lower contingency FCAS, which deliver their full response within 6 seconds, 60 seconds or 5 minutes following a major imbalance event. The volumes of FCAS procured for each dispatch interval are dynamically determined, with regulation FCAS procurement volumes dictated by power system time error and contingency FCAS procurement volumes typically corresponding to an N-1 contingency. In the absence of regional constraints, FCAS are procured for and from all regions of the NEM. While FCAS provides balancing flexibility through frequency-responsive headroom and footroom, they predominantly respond to intra-dispatch variability and uncertainty with the expectation that deployed resources will be relieved by 5-minute dispatch [@rieszFrequencyControlAncillary2015; @prakashInsightsDesigningEffective2022]. 5 minute contingency FCAS is an exception, given that its response may be called upon for up to 10 minutes. 5 minute contingency FCAS is currently provided by a diverse range of resources (see [@fig:raise_delayed_supply]).

![Q4 2020 global supply curves by resource type for the raise 5 minute contingency FCAS market. Each of the supply curves are truncated to the volumes of 5 minute contingency FCAS procured by AEMO across the NEM in that dispatch interval (NEM-wide mean of \~420 MW for Q4 2020). Providers include conventional steam and hydropower generators, an aluminium smelter, demand response (DR) aggregators, VPPs and BESS. As each supply curve is constructed from the offers of resources across the NEM (i.e. global), they do not reflect dispatch outcomes in the presence of regional constraints. Offer and dispatch data were obtained using NEMOSIS (@gormanNEMOSISNEMOpen2018).](source/figures/raise5minq42020.png){#fig:raise_delayed_supply short-caption="Q4 2020 5-minute contingency FCAS global supply curve by resource type"}

Through the RERT, AEMO can obtain last-resort reserves given between 1 week to 1 year of notice of forecasted in-market reserves shortfalls. While procurement practices vary depending on the notice time, RERT procurement consists of AEMO contracting with out-of-market resources. Following forecast or actual LOR2 or LOR3 conditions and an insufficient market response, AEMO is able to activate RERT reserves [@australianenergymarketcommissionreliabilitypanelReliabilityEmergencyReserve2020;@australianenergymarketoperatorProcedureExerciseReliability2021]. The RERT provides AEMO with a last-resort mechanism to procure balancing flexibility prior to any potential load shedding. However, resources that provide reserves through the RERT are unable to participate in the real-time market for the duration of their contract. After RERT reserves are activated, market participants are remunerated based on counterfactual pricing (i.e. dispatch without RERT), thus maintaining scarcity pricing and potential signals for investment.

#### Operating reserves product {#sec:reserves-orcontext}

An inter-dispatch operating reserve product has been proposed in the NEM. It would enable AEMO to procure headroom, which would need to be available to the real-time market within the product horizon, in each dispatch interval. Horizons of 5 minutes and 30 minutes were proposed [@energysecurityboardPost2025Market2021; @australianenergymarketoperatorSubmissionAEMCDirections2021]. Market bodies and participants have raised several potential benefits of an operating reserve product:

1. It could address both inter-dispatch variability and uncertainty. Market bodies consider that the need to address the latter may be more material due to the growing impact of forecast uncertainty on system balancing and the potential for high impact, low probability power system events leading to extraordinary system imbalances [@egglestonSecurityResilienceTechnical2021; @australianenergymarketcommissionReserveServicesNational2021].
2. AEMO supports a 30+ minute horizon, as a longer timeframe product is likely to have a larger pool of providers and provide participants/AEMO with more lead time prior to any potential market intervention [@australianenergymarketoperatorSubmissionAEMCDirections2021].
3. Through reserve constraints and potential scarcity pricing through an operating reserve demand curve [@hoganElectricityScarcityPricing2013], the product could act as an energy 'price-adder'. This would enable real-time market prices for energy to better reflect consumers' preference for reliability [@cramtonElectricityMarketDesign2017]. Although the NEM's market price cap is high by international standards, it is generally well below the estimated value of short-term reliability for both residential and non-residential customers in the NEM [@australianenergyregulatorValuesCustomerReliability2019]. A 'price-adder' could also provide sharper investment signals for flexible resources.

The assessment of reserve capabilities to justify this new product has been limited. AEMO has previously analysed ramping capabilities over timeframes greater than 30 minutes [@australianenergymarketoperatorRenewableIntegrationStudy2020], the total reserve capacity available within various timeframes across NEM regions and years [@australianenergymarketoperatorSubmissionAEMCDirections2021] and regularly forecasts in-market reserves (@sec:reserves-ahead_soint). However, these studies do not consider flexibility capability available *after* resources are dispatched, or do not explore the time-varying spectrum of this capability. Using the methodology outlined in @sec:reserves-modeloverview, we incorporate these elements when quantifying balancing flexibility capabilities in NSW and SA to inform an assessment of the operational benefits of additional balancing products (@sec:reserves-casestudy).

## Modelling Available Reserves and Footroom {#sec:reserves-modeloverview}

To quantify balancing flexibility capabilities, we consider headroom and footroom that can be converted to stable active power output within a particular time *horizon*. We will refer to these as *available reserves* and *available footroom*[^18], respectively. Though these metrics do not explicitly consider whether resources are frequency-responsive, how long a potential response can be sustained for and whether network constraints restrain flexibility provision, calculating these quantities is broadly useful for understanding the balancing flexibility that could be deployed in a meshed system within operational timeframes (minutes to hours).

[^18]: We use terminology consistent with @lannoyeTransmissionVariableGeneration2015, which quantifies *available* flexibility considering resource operational constraints and *realisable* flexibility considering both network and resource operational constraints. These types of flexibility exclude transient power changes from phenomena such as inertial response.

### Quantifying available reserves and footroom

At a given point in time and for a particular horizon, the available reserves and footroom that a resource can offer are dependent on its operational constraints, its synchronisation status and its active power output. The latter two can be obtained from historical data, or as the outputs of production-cost or market modelling.

Below, we outline a methodology for calculating system-wide available reserves and footroom ([@sec:reserves-syscalc]). We adapt the methodology proposed by @lannoyeEvaluationPowerSystem2012 to calculate available reserves and footroom from conventional resources (coal-fired, hydro and gas-fired generation - @sec:reserves-conventionalcalc), and propose simple extensions for calculating available reserves and footroom provided by VRE (@sec:reserves-vrecalc) and BESS (@sec:reserves-besscalc). The nomenclature used in these sections is described in @sec:reserves-nomenclature.

#### Nomenclature {#sec:reserves-nomenclature}

##### Indices and sets

\begin{description}[leftmargin=8em,style=nextline]
  \item[$t \in \mathcal{T}$] Time periods, each corresponding to the the end of a 5-minute dispatch interval in the corresponding scenario year.
  \item[$h \in \mathcal{H}$] Set of (reserve) horizons (minutes).
  \item[$r_c \in \mathcal{R}_c$]  Set of conventional  resource units.
  \item[$r_v \in \mathcal{R}_v$]  Set of VRE  resource units.
  \item[$r_b \in \mathcal{R}_b$]  Set of BESS resource units.
\end{description}

##### Time-varying resource parameters

\begin{description}[leftmargin=8em,style=nextline]
  \item[$g_{r_c/r_v/r_b,t}$] Net generation (active power output) of unit at time $t$ (MW).
  \item[$g^f_{r_v,t}$] Maximum generation of VRE resource unit based on primary energy availability, i.e.  $0 \leq g^f_{r_v,t} \leq \overline{g}_{r_v,t}$ (MW).
  \item[$\overline{g}_{r_c/r_v/r_b,t}$] Maximum capacity of unit. Time-varying due to seasonal derating and partial/full outages (MW).
\end{description}

##### Static resource parameters

\begin{description}[leftmargin=8em,style=nextline]
  \item[$\mathrm{MSL}_{r_c}$] Minimum stable level of conventional resource unit $r_c$ (MW).
  \item[$\mathrm{StartUp}_{r_c}$] Start-up ramp up rate of conventional resource unit $r_c$. Start-up is assumed to progress in a linear fashion (MW/minutes).
  \item[$\mathrm{RampUp}_{r_c}$] \textit{Upper} ramp up rate of conventional resource  unit $r_c$. See Section \ref{sec:reserves-method} for an explanation of \textit{upper} ramp rates (MW/minutes).
  \item[$\mathrm{RampDown}_{r_c}$] \textit{Upper} ramp down rate of conventional resource  unit $r_c$. See Section \ref{sec:reserves-method} for an explanation of \textit{upper} ramp rates (MW/minutes).
\end{description}

##### Computed quantities

\begin{description}[leftmargin=8em,style=nextline]
  \item[$\mathrm{SUT}_{r_c,t}$] Start-up time for conventional resource unit , i.e. $ \mathrm{SUT}_{r_c,t}=\frac{\mathrm{MSL}_{r_c}-g_{r_c,t}}{\mathrm{StartUp}_{r_c}}$ where $0 \leq g_{r_c, t} < \mathrm{MSL}_{r_c}$ (minutes).
  \item[$AR_{r_v,h,t}$] Available reserves from VRE resource unit $r_v$ at time $t$ for horizon $h$ (MW).
  \item[$AR_{r_b,h,t}$] Available reserves from BESS resource unit $r_b$ at time $t$ for horizon $h$ (MW).
  \item[$AR^{OFF}_{r_c,h,t}$] Available reserves from offline conventional resource unit $r_c$ at time $t$ for horizon $h$ (MW).
  \item[$AR^{ON}_{r_c,h,t}$] Available reserves from online conventional resource unit $r_c$ at time $t$ for horizon $h$ (MW).
 \item[$AR_{h,t}$] Reserves available to the system within horizon $h$ at time $t$ (MW).
 \item[$AF_{r_v,h,t}$] Available footroom from VRE resource unit $r_v$ at time $t$ for horizon $h$ (MW).
 \item[$AF_{r_b,h,t}$] Available footroom from BESS resource unit $r_b$ at time $t$ for horizon $h$ (MW).
 \item[$AF^{ON}_{r_c,h,t}$] Available footroom from online conventional resource unit $r_c$ at time $t$ for horizon $h$ (MW).
 \item[$AF_{h,t}$] Footroom available to the system within horizon $h$ at time $t$
\end{description}

#### Conventional resources {#sec:reserves-conventionalcalc}

The quantities of reserves and footroom that can be made available by conventional resources are dependent on whether the resource is online (non-zero active power output) or offline.

A conventional resource unit is considered to be online if $g_{r_c, t} > 0$. The reserves that an online conventional resource unit can make available within the horizon $h$ ($AR_{r_c,h,t}^{ON}$) is given by:

$$AR_{r_c,h,t}^{ON} = \begin{cases}
          \mathrm{StartUp}_{r_c} \times h & 0 < g_{r_c,t} < \mathrm{MSL}_{r_c}, h \leq \mathrm{SUT}_{r_c,t} \\
          \min(\\ \hspace{0.2cm}(\mathrm{MSL}_{r_c} - g_{r_c,t}) + \mathrm{RampUp}_{r_c} \times (h - \mathrm{SUT}_{r_c,t}),\\ \hspace{0.2cm}\overline{g}_{r_c,t} - g_{r_c,t}\\) & 0 < g_{r_c,t} < \mathrm{MSL}_{r_c}, h > \mathrm{SUT}_{r_c,t} \\
          \min(\mathrm{RampUp}_{r_c} \times h, \overline{g}_{r_c,t} - g_{r_c,t}) & g_{r_c,t} \geq \mathrm{MSL}_{r_c}
      \end{cases}$$ {#eq:convonres}

The three conditions in [@eq:convonres] reflect the following:

  1. The unit is in its start-up sequence (i.e. $0<g_{r_c,t}$ < $\mathrm{MSL}_{r_c}$) and the reserve horizon ($h$) is shorter than or equal to the unit's start-up time ($\mathrm{SUT}_{r_c,t}$). In this case, the start-up ramp rate ($\mathrm{StartUp}_{r_c}$) dictates the quantity of reserves that the unit can provide.
  2. The unit is in its start-up sequence and the reserve horizon ($h$) is longer than the unit's start-up time ($\mathrm{SUT}_{r_c,t}$). In this case, the quantity of reserves that the unit can provide is the minimum of the total unit ramping potential within the reserve horizon (at rate $\mathrm{StartUp}_{r_c}$ up to the unit's minimum stable level, and $\mathrm{RampUp}_{r_c}$ beyond it) and the unit's headroom.
  3. The unit is operating above its minimum stable level. The quantity of reserves that the unit can provide is the minimum of the total unit ramping potential within the reserve horizon (at rate $\mathrm{RampUp}_{r_c}$) and the unit's headroom.

The reserves that an offline conventional resource unit can make available within the horizon $h$ is given by [@eq:convoffres], which has two conditions that resemble the first two conditions of [@eq:convonres]:

$$AR_{r_c,h,t}^{OFF} = \begin{cases}
          \mathrm{StartUp}_{r_c} \times h & g_{r_c,t}=0, h \leq \mathrm{SUT}_{r_c,t} \\
          \min(\\ \hspace{0.2cm} \mathrm{MSL}_{r_c} + \mathrm{RampUp}_{r_c} \times (h-\mathrm{SUT}_{r_c,t}),\\ \hspace{0.2cm} \overline{g}_{r_c,t} - g_{r_c,t}\\) & g_{r_c,t}=0,  h>\mathrm{SUT}_{r_c,t}
       \end{cases}$$ {#eq:convoffres}

To ensure that flexibility quantification only considers stable changes in active power output, footroom from conventional resource units is defined to be the maximum downwards flexibility they can provide without shutting down (i.e. down to their MSL).  As such, footroom can only be provided by online units operating above their MSL (first condition in @eq:convonfoot):

$$AF_{r_c,h,t}^{ON} = \begin{cases}
          \min(\mathrm{RampDown}_{r_c} \times h, g_{r_c,t} - \mathrm{MSL}_{r_c}) & g_{r_c,t} > \mathrm{MSL}_{r_c} \\
          0 & 0 < g_{r_c,t} \leq \mathrm{MSL}_{r_c}
      \end{cases}$$ {#eq:convonfoot}

#### Variable renewable energy {#sec:reserves-vrecalc}

Within the availability of their primary energy source and the timeframes of concern in this study, VRE are considered to be highly flexible [@nelsonInvestigatingEconomicValue2018;@holttinenDesignOperationEnergy2021]. Therefore, the provision of available reserves ($AR_{r_v, h, t}$) and footroom ($AF_{r_v, h, t}$) by VRE is not limited by ramp rates but rather by headroom and footroom:

$$ AR_{r_v,h,t}= g^f_{r_v,t}-g_{r_v,t}$$ {#eq:vreres}

$$ AF_{r_v,h,t}=g_{r_v,t}$$ {#eq:vrefoot}

In this study, $g_{r_v,t} < g^f_{r_v,t}$ can occur as the result of VRE curtailment due to oversupply.

#### Battery energy storage systems {#sec:reserves-besscalc}

BESS are also highly flexible and, unlike other resource types, can provide additional flexibility by switching from charging ($g_{r_b, t} < 0$) to discharging ($g_{r_b,t} > 0$), or vice-versa. This additional flexibility can be accounted for by including the maximum power capacity of the BESS ($\overline{g}_{r_b,t}$, which restricts BESS charging and discharging such that $|g_{r_b,t}| \leq \overline{g}_{r_b,t}$) in the equations for available reserves ([@eq:bessres]) and available footroom ([@eq:bessfoot]):

$$ AR_{r_b,h,t}=\overline{g}_{r_b,t}-g_{r_b,t}$$ {#eq:bessres}

$$ AF_{r_b,h,t}=\overline{g}_{r_b,t}+g_{r_b,t}$$ {#eq:bessfoot}

#### System-wide {#sec:reserves-syscalc}

At time $t$, the total reserves and footroom that can be made available to the system within the horizon $h$ are given by [@eq:restotal] and [@eq:foottotal], respectively:

$$ AR_{h,t}=\sum_{r_c \in \mathcal{R}_c}{(AR_{r_c,h,t}^{OFF} + AR_{r_c,h,t}^{ON})} + \sum_{r_v \in \mathcal{R}_v}{AR_{r_v,h,t}} + \sum_{r_b \in \mathcal{R}_b}{AR_{r_b,h,t}} $$ {#eq:restotal}

$$ AF_{h,t}=\sum_{r_c \in \mathcal{R}_c}{AF_{r_c,h,t}^{ON}} + \sum_{r_v \in \mathcal{R}_v}{AF_{r_v,h,t}} + \sum_{r_b \in \mathcal{R}_b}{AF_{r_b,h,t}} $$ {#eq:foottotal}

These equations are used to calculate system available reserves and footroom for all reserve horizons of interest ($h \in \mathcal{H}$) across all of the dispatch intervals in a given scenario year ($t \in \mathcal{T}$).

## Case Study: Two Regions in the National Electricity Market {#sec:reserves-casestudy}

### Scenarios

In this study, available reserves and footroom were quantified for NSW and SA in calendar year 2020 and for two resource mix scenarios in 2025 (see [@tbl:scenariodesc]). The 2025 scenarios roughly correspond to the Central and Step Change scenarios in AEMO's 2020 Integrated System Plan (ISP)[^19] [@australianenergymarketoperator2020ISPGeneration2020], a least-regrets transmission planning study that incorporates scenario-based capacity expansion modelling [@australianenergymarketoperator2020IntegratedSystem2020].

[^19]: The 2022 ISP was recently released [@australianenergymarketoperator2022IntegratedSystem2022]. For the planning horizon relevant to this study (i.e. to 2025), the 2022 ISP broadly reflects the outlook of its predecessor, with the exception that it draws on extensive consultation with electricity industry stakeholders in determining the Step Change scenario to be the most likely scenario.

+------------------+-------------------------------------------------------------------------+
|    Scenario      | Description                                                             |
+:================:+:=======================================================================:+
| 2020             | - Modelled using historical demand and existing resources               |
|                  |   - Synchronous units (gas-fired) must run for system strength in SA    |
+------------------+-------------------------------------------------------------------------+
|                  | - Based on existing policy settings at the time of 2020 ISP:            |
|                  |   - Moderate deployment of VRE and BESS                                 |
| 2025 Central     |   - Distributed solar PV has moderate impact on operational demand      |
|                  |   - Thermal unit retirements in both states                             |
|                  |   - Large hydropower capacity addition in NSW                           |
|                  |   - Fewer synchronous units must run for system strength in SA          |
+------------------+-------------------------------------------------------------------------+
|                  | - More aggressive transition:                                           |
|                  |   - Large deployments of VRE and BESS                                   |
| 2025 Step Change |   - Distributed solar PV has greater impact on operational demand       |
|                  |   - Further thermal unit retirements in NSW                             |
|                  |   - Large hydropower capacity addition in NSW                           |
|                  |   - Fewer synchronous units must run for system strength in SA          |
+------------------+-------------------------------------------------------------------------+

: Scenarios simulated for NSW and SA. {#tbl:scenariodesc}

Modelling SA and NSW across these three scenarios enables four sensitivities to be explored:

  1. **Conventional generation retirement**. For NSW, one coal-fired power station is retired in 2025 Central and two in 2025 Step Change. In SA, four gas-powered steam turbine (Gas-Steam) units and two combined-cycle gas turbine (CCGT) units are retired between 2020 and both 2025 scenarios.
  2. **Increasing deployment of VRE and BESS**. Additional VRE and BESS capacity is deployed in both states between 2020 and 2025 Central in AEMO's 2020 ISP. In the 2025 scenarios for both states, a greater quantity of VRE (predominantly solar PV) and BESS is installed in the Step Change scenario than in the Central scenario. The addition of 2 GW hydro generation in NSW by 2025 reflects the expansion of the region's largest hydro scheme (Snowy 2.0). The capacity mix of each state in 2020 and the changes in the mix for each 2025 scenario are shown in [@fig:capacities].
  3. **Contrast in resource mix and thus operational constraints**. In NSW in 2020, coal-fired generation is a large proportion of the generation fleet and is complemented by hydro generation, gas-fired generation (CCGTs and OCGTs) and VRE. In SA in 2020, VRE (especially wind) is a significant portion of the region's generation fleet. SA's synchronous generation consists of gas-fired generation across the flexibility spectrum, some of which must remain online to ensure there is sufficient system strength in SA for secure operation.
  4. **Greater variability in operational demand due to more distributed solar PV**. Operational demand is defined as the system demand that AEMO dispatches resources to meet (i.e. excluding demand met by DER). As the capacity of distributed solar PV in each region increases (i.e. from 2020 to 2025 Central to 2025 Step Change), operational demand in the middle of the day is eroded whilst ramping requirements in the morning (downwards) but especially the evening (upwards) increase. In other words, higher penetrations of distributed solar PV leads to a "deeper" duck curve [@australianenergymarketoperatorRenewableIntegrationStudy2020b].

<div id="fig:capacities" class="subfigures">

![](source/figures/nsw_capacities.png){#fig:nsw_capacities}

![](source/figures/sa_capacities.png){#fig:sa_capacities}

Capacity mix in NSW (a) and SA (b) in 2020, and additional deployments and retirements in 2025 Central and 2025 Step Change. 2020 resource mixes were adapted from AEMO's 2020 Inputs and Assumptions workbook [@australianenergymarketoperator2020InputsAssumptions2020]. 2025 scenario resource mixes were aligned with their namesake ISP scenarios [@australianenergymarketoperator2020ISPGeneration2020] and include committed generation (projects that are highly likely to proceed as they have acquired land, secured financing, set a firm construction commencement date and either finalised contracts for components or been granted planning approval) [@australianenergymarketoperatorGenerationInformation2022].
</div>

### Methodology {#sec:reserves-method}

For each region and scenario, the available reserves and footroom in the system were calculated from the results of a year-long time-sequential market simulation implemented in the commercial electricity market modelling tool PLEXOS [@energyexemplarPLEXOSEnergyMarket2021]. The PLEXOS market simulation consisted of a PASA phase to model maintenance and forced outages for conventional generation across the year, a Medium Term Schedule phase in NSW to schedule hydro generation according to monthly energy constraints, and a Short Term Schedule phase that carries out unit commitment and economic dispatch (UC-ED) at 5-minute resolution in daily steps[^20].

Each existing coal-fired (NSW) and Gas-Steam (SA) unit was explicitly modelled to accurately capture the consequences of partial and full outages of large capacity units. For other resource types, the operational constraints and attributes of individual units were averaged and applied across all units of a resource type. This enabled clustered UC-ED and thus reduced the computational burden of the Short Term Schedule phase [@palmintierHeterogeneousUnitClustering2014]. For baseload conventional generation and gas turbines, ramp rates in each direction were separated into a *market* ramp rate, which was used in the PLEXOS market simulation, and an *upper* ramp rate, which was used to calculate available reserves/footroom ([@sec:reserves-conventionalcalc]). A lower magnitude ramp rate in the market simulation (*market*) reflects participants' preferences to reduce cycling wear-and-tear due to demanding ramping during typical operation (especially for ageing assets) [@kumarPowerPlantCycling2012], whilst using a higher magnitude ramp rate to calculate a resource's available reserves and footroom (*upper*) ensures that the total available flexibility of a resource can be utilised if needed in a system emergency.

Both NSW and SA were modelled assuming a copper-plate network with no interconnection to other regions (i.e. single bus with no network constraints). The Short Term Schedule mixed-integer linear program was solved using the CPLEX Optimizer [@ibmCPLEXOptimizer2021] with a relative mixed-integer program gap tolerance of 0.07\%. The generation and synchronisation status of each resource was obtained from the solution and used to calculate the available reserves and footroom for each 5-minute interval using the equations outlined in @sec:reserves-modeloverview. A process flow diagram of the study methodology is shown in @fig:method_diagram.

In Appendix A, we outline our sources for key input data and assumptions (top row of @fig:method_diagram) and provide further details regarding how these data were used in the market simulation and/or the calculation of available reserves and footroom.

[^20]: A 12 hour look-ahead was used in the SA model to avoid "end-of-horizon effects" [@barrowsIEEEReliabilityTest2020], such as end-of-day decommitment of gas-fired generation.

![Process flow for modelling available reserves and footroom for each scenario in this case study.](source/figures/modelling_diagram.png){#fig:method_diagram width=100% short-caption="Process flow diagram for modelling available reserves and footroom for each scenario"}

### Limitations

There are two important caveats to this study. The first is that this study models each region in isolation – that is, resources in other NEM regions can neither assist in meeting demand nor provide available reserves or footroom through cross-regional interconnectors. During typical operating conditions, it is likely that any headroom/footroom on interconnectors would mean that a greater quantity of reserves/footroom are available to a region, albeit at different horizons due to modified dispatch patterns. For example, the inclusion of interconnectors in the SA model between SA and VIC and SA and NSW[^21] may increase the total available reserves/footroom in SA at the cost of a decrease in the reserves/footroom available within shorter horizons. This could arise from local mid-merit gas generators remaining offline in favour of inflexible but cheaper coal-fired generation in NSW and VIC.

However, modelling available reserves and footroom for isolated regions may provide a closer approximation to reality when balancing flexibility is scarce in a region. Under these circumstances, it is likely that interconnector flows will already be close to their limits. This will reduce or altogether prevent the available reserves/footroom provision from resources in neighbouring regions. Moreover, large interconnector flows may be prevented if there is a credible risk of regional separation (loss of synchronism between market regions due to interconnector circuit faults — a particular risk in the NEM due to limited interconnection between market regions); at present, AEMO co-optimises interconnector flow with regional FCAS procurement [@australianenergymarketoperatorConstraintFormulationGuidelines2010]. An additional consideration is that if an operating reserve product is implemented to improve the NEM's resilience to supply-demand shocks, regional procurement requirements may also limit the available reserves/footroom that can be procured over an interconnector. As such, the modelling of isolated regions may approximate actual operation when reserves/footroom are scarce and thus most valuable to the system.

The second caveat is that this study does not explicitly model FCAS procurement. If headroom or footroom reserved for FCAS is unable to also provide available reserves or footroom[^22], then modelling FCAS markets would reduce the reserves and footroom that are available within horizons less than or equal to 5 minutes. However, the actual headroom/footroom reduction would depend upon the following factors:

- Whether regional FCAS procurement constraints bind for the modelled region. If they do not, multi-regional or NEM-wide FCAS requirements can be satisfied by procuring FCAS in other market regions.
- The degree to which headroom/footroom is "re-offered" across sequential FCAS markets. For example, a single resource enabled for 10 MW across the three raise contingency FCAS markets would withdraw less system headroom than three resources enabled for 10 MW each for a particular FCAS market.
- Headroom that is offered into the 6 second and 60 second raise contingency FCAS market may not reflect sustained power provision. For example, frequency response from a steam-powered turbine may draw on steam stored in a boiler; a sustained response would require a longer timeframe due to slower boiler dynamics.

[^21]: At the time of writing, the interconnector between SA and NSW is under construction and due to commence operation in 2025/2026 [@electranettransgridProjectEnergyConnect].

[^22]: Exclusive headroom procurement for an operating reserve service (i.e. inability to offer the same headroom in FCAS markets) is currently being considered [@energysecurityboardPost2025Market2021].

### Results and discussion {#sec:reserves-results}

#### Synthetic daily profiles

*Synthetic daily profiles* (SDPs) were developed to quantify the time-varying spectrum of available reserves and footroom for each scenario. For a given horizon, the SDP value at a particular time is an aggregate value (mean or a specific percentile) calculated from the reserves/footroom available within that horizon at the end of that dispatch interval across all days in the simulated year. In other words, values from across the year for a given time of day are aggregated, and these are then "stitched" together to form a "synthetic day" curve for a particular horizon. Two aggregate values were calculated for each horizon curve:

1. The mean. This provides a picture of the average or "typical" availability of reserves and footroom at different times of the day for a particular scenario year; and
2. The bottom 1% (i.e. 1^st^ percentile or 1-in-100 day lowest). This measure better reflects the availability of reserves and footroom when they are scarce and thus when they are most needed[^23].

In addition to an infinite horizon (which corresponds to the maximum availability), curves were calculated for 1, 5, 15, 30 and 60 minute horizons. These horizons encompass the start-up times of hydro and flexible gas generation, and represent the likely timeframes over which the proposed operating reserve product will be required to respond.

[^23]: More extreme percentiles (i.e. < 1%) could better reflect the tight reliability standards adopted in many power systems - e.g. the NEM standard of a maximum expected unserved energy of 0.002% of the total energy demand of a NEM region in an Australian financial year [@australianenergymarketcommissionreliabilitypanel2022ReviewReliability2022]. However, the use of extreme percentiles would be more appropriate with a greater number of modelled days (i.e. several years).

#### Available reserve synthetic days {#sec:reserves-reserveSDPs}

Mean and bottom 1% available reserve SDPs were generated for the NSW scenarios and for the SA scenarios ([@fig:nswreserves; @fig:sareserves]). The mean SDPs across scenarios suggest that, on average, NSW has more than 2 GW and SA more than 600 MW of reserves available within 5+ minutes. These levels of reserves:

1. Correspond to approximately 15% and 20% of peak demand in 2020 in NSW and SA, respectively. These 5+ minute "reserve margins" (i.e. 5+ minute reserves as a percentage of peak demand) are comparable to lower-end reserve margins anticipated for the summer of 2022 in North American jurisdictions [@northamericanelectricreliabilitycorporation2022SummerReliability2022].
2. Exceed the highest N-1 contingency in 2020 (i.e. highest LOR2 trigger level declared in the last run of Pre-Dispatch PASA prior to delivery — see @sec:reserves-ahead_soint) by approximately 225% in NSW and 170% in SA [@prakashNEMSEER2023].

Furthermore, with additional BESS and flexible gas resources expected to be deployed, the mean 5+ minute reserve margins of both regions are higher for most parts of the day in the 2025 Step Change scenario. Though the market simulation relied on perfect foresight (additional uncertainty may reduce reserve margins), these results suggest that reasonable quantities of reserves are available in each region within a 5+ minute horizon.

![Mean (top row) and bottom 1% (bottom row) SDPs for available reserves in NSW in 2020 (leftmost column) and the two 2025 scenarios (rightmost columns).](./source/figures/NSW_reserves_all_profiles_by_di.png){#fig:nswreserves width=100% short-caption="NSW available reserves SDPs"}

![Mean (top row) and bottom 1% (bottom row) SDPs for available reserves in SA in 2020 (leftmost column) and the two 2025 scenarios (rightmost columns).](./source/figures/SA_reserves_all_profiles_by_di.png){#fig:sareserves width=100% short-caption="SA available reserves SDPs"}

Across scenarios, the following trends are apparent in the SDPs:

1. From 2020 to the 2025 Step Change scenario, a midday peak in the mean available reserves SDPs becomes more pronounced. This can be attributed to the increasing displacement of conventional generation by lower-cost utility-scale solar PV in dispatch (an outcome observed by @hummonFundamentalDriversCost2013 and @tanotoImpactHighSolar2021) and the progressive erosion of daytime operational demand due to higher penetrations of distributed solar PV. Particularly in SA, curtailed VRE and BESS also contribute to this reserve "surplus". BESS in particular are often charging during such periods of plentiful supply and low prices, and thus are able to offer up to double their active power rating as reserve (i.e. by switching from charging to discharging).
2. As is particularly clear in the bottom 1% SDPs for the 2025 scenarios, the availabilities of different reserve horizons tend to converge during periods of lower reserves or "relative scarcity", which include peak demand events in the morning and evening. The convergence may be driven by the retirement of baseload conventional generation and higher ramping requirements in the 2025 scenarios requiring more flexible, mid-merit resources to be online prior to and during these periods.

From this analysis, we can also gain an insight into the supply-side dynamics of a potential operating reserve product market. The first trend suggests that as energy transition proceeds, a reserve surplus during the daytime could suppress the price of an operating reserve product (a dynamic that is further explored by @frewCurtailmentParadoxTransition2021). Moreover, the convergence of availability across horizons during periods of "relative scarcity" suggests that relatively inflexible but cheaper resources are being preferentially ramped through dispatch at these times whilst more flexible but expensive resources are left in reserve. Since the majority of system headroom during these periods appears to be available within 5 to 15 minutes, operating reserves would likely be procured from these more flexible resources regardless of whether the product requires availability within 5 or 30 minutes. As such, concerns regarding limited providers of a 5-minute horizon product may also apply to a 30-minute horizon product during periods of relative scarcity (noting that several resource types in the NEM are already providing upwards flexibility within 5 minutes in the NEM, as shown in @fig:raise_delayed_supply).

#### Available footroom synthetic days {#sec:reserves-footroomSDPs}

Two types of SDPs were constructed for available footroom: one for *firm* footroom and the other for total footroom. The former refers to potential footroom provision from conventional resources and BESS, whereas the latter also includes footroom that can be provided by curtailing VRE. [@fig:nswfirmfoot;@fig:nswfoot] show mean and bottom 1% SDPs across NSW scenarios for firm footroom and total footroom, respectively. From the bottom 1% SDPs in @fig:nswfirmfoot, it is clear that firm system footroom can become very low in NSW in 2025 as remaining baseload conventional generators are driven to operate closer to their MSLs. However, such concerns could be alleviated if VRE provide footroom (@fig:nswfoot). A similar result was observed for the SA region.

![Mean (top row) and bottom 1% (bottom row) SDPs for available firm footroom (i.e. footroom provided only by "firm" resources: conventional and BESS) in NSW in 2020 (leftmost column) and the two 2025 scenarios (rightmost columns).](./source/figures/NSW_firmfootroom_all_profiles_by_di.png){#fig:nswfirmfoot width=100% short-caption="NSW firm footroom SDPs"}

![Mean (top row) and bottom 1% (bottom row) SDPs for available total footroom (including footroom that would be provided by curtailing VRE) in NSW in 2020 (leftmost column) and the two 2025 scenarios (rightmost columns).](./source/figures/NSW_footroom_all_profiles_by_di.png){#fig:nswfoot width=100% short-caption="NSW footroom SDPs"}

The available footroom in the system is likely sensitive to extent of conventional generation retirements. Further retirements may enable remaining conventional resources to operate at a higher loading, thereby increasing the available footroom in the system. Regardless, given that each region appears to suffer a lack of *firm* footroom for several hours during the day in the 2025 scenarios explored in this case study, mechanisms for procuring sustained downwards balancing flexibility should be considered alongside those for procuring sustained upwards balancing flexibility. One simple option would be to implement an operating *footroom* product, which, if VRE are permitted to provide this service, can enable conventional generation to operate closer to their MSL and thus reduce system operating costs and carbon emissions [@nelsonInvestigatingEconomicValue2018].

#### Short-term energy-limited reserves {#sec:reserves-stelr}

While the available reserves metric does not consider the duration for which reserve deployment can be sustained, we can infer whether reserves are short-term energy-limited (i.e. with a duration no more than a few hours) based on their resource type. For this analysis, BESS reserve power was calculated based on the BESS's state of charge at the end of each dispatch interval and the requirement to sustain provision for 15 minutes. This duration is consistent with the BESS power and capacity that is reserved in SA for the possibility of loss of interconnection [@australianenergymarketoperator2020SystemStrength2020]. In addition, the maximum available price-responsive demand available in each state was added to the available reserves in each dispatch interval (assuming an emergency response time of 5 minutes) to gain a better understanding of the maximum potential contribution of demand response. This corresponded to \~60 MW in SA and \~290 MW in NSW, based on AEMO analysis and forecasts in @australianenergymarketoperator2020InputsAssumptions2020. Both BESS and DR can be considered to be short-term energy-limited reserve providers. Though conventional generation fuel constraints (e.g reservoir schemes and the gas system) were not modelled in this market simulation, the contribution of conventional resources was separated into those of thermal and hydro to assess the importance of the energy constraints on each resource type to available reserves in NSW.

Tables \ref{tab:nsw_stel} and \ref{tab:sa_stel} show the median percentage across dispatch intervals in a scenario year of available reserves provided by a resources type for NSW and SA, respectively. Whilst hydro and thermal resources dominate 5 minute horizon reserve provision in 2020 in NSW and SA, respectively, short-term energy limited resources provide a greater proportion of reserves in this horizon in 2025. In particular, the median contribution of BESS to reserves available within 5 minutes is 16% for NSW and 40% for SA in the 2025 Step Change scenario. As the reserve horizon is extended to 30 minutes, a greater proportion of reserves are provided by conventional resources, which may be better positioned to sustain a response beyond the short-term[^24]. These results indicate that as energy transition progresses, a trade-off between reserve deployment speed and duration develops. This trend reaffirms the value of the sequential and hierarchical approach to reserve product design and deployment that has been adopted in many jurisdictions [@prakashInsightsDesigningEffective2022]. Moreover, it should be noted that unlike other mechanisms for procuring balancing flexibility, reserve services and products can specify duration/energy requirements and thus ensure that flexibility provision is sustained.

\begin{table}
  \centering
  \begin{tabular}{|l|l|l|l|l|l|l|}
    \hline
    \multirow{2}{*}{NSW Resources} &
      \multicolumn{2}{c}{2020} &
      \multicolumn{2}{c}{2025 Central} &
      \multicolumn{2}{c|}{2025 Step Change} \\
    & 5 min & 30 min & 5 min & 30 min & 5 min & 30 min \\
    \hline
    BESS (15 min) & 0\% & 0\% & 2\% & 1\% & 16\% & 14\% \\
    \hline
    DR & 9\% & 5\% & 5\% & 4\% & 5\% & 4\% \\
    \hline
    Hydro & 74\% & 43\% & 81\% & 60\% & 71\% & 61\% \\
    \hline
    Thermal & 18\% & 52\% & 12\% & 34\% & 8\% & 19\% \\
    \hline
  \end{tabular}
  \caption[NSW short-term energy limited reserves]{\label{tab:nsw_stel}Median of the percentage of each resource type's contribution to reserves available within 5 minutes and 30 minutes in every dispatch interval for each NSW scenario year. The median percentages are not necessarily coincident (i.e. from the same dispatch interval) and therefore may not sum to 100\%. Furthermore, some distributions are long-tailed, so a median does not capture occasional reserve provision by a resource type (e.g. VRE, for which all medians are 0\%).}
\end{table}

\begin{table}
  \centering
  \begin{tabular}{|l|l|l|l|l|l|l|}
    \hline
    \multirow{2}{*}{SA Resources} &
      \multicolumn{2}{c}{2020} &
      \multicolumn{2}{c}{2025 Central} &
      \multicolumn{2}{c|}{2025 Step Change} \\
    & 5 min & 30 min & 5 min & 30 min & 5 min & 30 min \\
    \hline
    BESS (15 min) & 14\% & 6\% & 24\% & 10\% & 40\% & 20\% \\
    \hline
    DR & 7\% & 3\% & 7\% & 3\% & 5\% & 3\% \\
    \hline
    Thermal & 71\% & 88\% & 61\% & 84\% & 45\% & 73\% \\
    \hline
  \end{tabular}
  \caption[SA short-term energy limited reserves]{\label{tab:sa_stel}Median of the percentage of each resource type's contribution to reserves available within 5 minutes and 30 minutes in every dispatch interval for each SA scenario year. The median percentages are not necessarily coincident (i.e. from the same dispatch interval) and therefore may not sum to 100\%. Furthermore, some distributions are long-tailed, so a median does not capture occasional reserve provision by a resource type (e.g. VRE, for which all medians are 0\%).}
\end{table}

[^24]: In reality, conventional resources are also susceptible to fuel constraints, as highlighted by the events preceding the 2022 NEM suspension [@australianenergymarketoperatorNEMMarketSuspension2022]. More sophisticated modelling of thermal coal availability, the gas system and hydro schemes, including their operation under different climate conditions, would be required to better understand the potential duration of available reserve provided by conventional generation.

### The role of balancing products

It is unclear whether introducing an operating reserve product will deliver material operational benefits to the NEM in light of the revenue risks, complexity, and implementation and ongoing costs associated with a new market. Instead, existing mechanisms may be able to deliver sufficient upwards flexibility, particularly if they can be augmented:

1. Market participants with forward market obligations are strongly incentivised to offer balancing flexibility to the market. The premium payment offered to the seller, along with a strong financial incentive to perform during periods of system stress, means that derivatives such as cap contracts somewhat resemble pay-for-performance capacity remuneration mechanisms[^25]. Participants would have further incentive if contracting were made mandatory [@maysPrivateRiskSocial2022], or if they increasingly resort to contracting to hedge pricing volatility that could occur as energy transition progresses [@devriesMarketSignalsAdequacy2022].

2. Market and system information and forecasts (e.g. the NEM's ahead processes) may be critical to ensuring that market participants schedule resources to provide flexibility to the system. Future work should not only seek to improve their accuracy and their treatment of uncertainties, but also to understand how they shape participant decision-making and thus which enhancements could provide the most value.

However, there remain some operational benefits of additional balancing products. Nested distribution-level markets and/or real-time market scheduling of aggregated resources have the potential to better enable balancing flexibility from DER. However, a key insight from @sec:reserves-stelr is that consideration should be given to the duration of this flexibility. System stress could coincide with periods in which DER owners wish to use these resources for themselves (e.g. a heatwave or if they are exposed to real-time market volatility to some extent) [@robertsVPPUserResearch2020]. In contrast, reserve products that specify response durations could provide the SO with certainty that flexibility is only procured from resources that are available for a minimum period of time. Any duration requirements would need to be balanced against the quantity and diversity of flexibility providers – primarily to ensure that product markets are competitive, but also because successive deployment of several short-term energy limited resources may be sufficient to meet system balancing needs over the course of a few hours. Furthermore, sustained footroom products might assist SOs in managing a lack of firm footroom (@sec:reserves-footroomSDPs). Typically, energy prices rise when upwards flexibility is scarce, thereby compensating providers of upward flexibility. In contrast, downwards flexibility providers are not strictly compensated through energy pricing, as oversupply could lead to dispatch curtailing, rather than remunerating flexible resources. Though this might mean flexible resources avoid financial losses, it comes at the cost of footroom available to the system. Accordingly, an "operating footroom" product that remunerates downwards flexibility offers a solution to the tension between dispatch incentives and the need for system footroom.

[^25]: However, derivatives are financial in nature and thus need not be "backed" by power system resources (i.e. they are not associated with any physical obligation).

## Conclusion and policy implications {#sec:reserves-conclusion}

State-of-the-art resource adequacy assessments are closing the gap between traditional capacity adequacy assessments, which focus on capacity reserve margins during peak demand events, and flexibility adequacy assessments that often model chronological operations [@stenclikQuantifyingRiskUncertain2021]. Yet flexibility adequacy assessments alone do not necessarily offer a better understanding of *what type* of balancing flexibility a system has and might need, and *how* best to make it available to the system. As resource mixes change dramatically during energy transition, system designers, planners and operators should quantify balancing flexibility capabilities to gain an appreciation of the availability of different resource types to inform operational practice design.

By quantifying balancing flexibility "margins" in two sub-systems of the Australian National Electricity Market (@sec:reserves-casestudy), we identify potential balancing flexibility dynamics and trends in future power systems. Firstly, systems with high penetrations of distributed and utility-scale solar PV will likely have reserve "surpluses" around the middle of the day and periods of relative reserve scarcity during morning and evening peak demand events. In such systems, the periods when reserves are most valuable do not necessarily correspond to the periods during which it is most efficient to curtail renewable energy generation (due to oversupply or to obtain reserves). As such, a key recommendation for policy-makers is to consider whether reserve product markets are needed to elicit sufficient balancing flexibility provision during these short periods of relative scarcity, or whether adjusting energy market settings, forward market obligations and/or market and system information processes can achieve this. Understanding the potential benefits of new reserve product markets is crucial because they can introduce additional costs, constraints and complexity whilst encroaching upon the functions of other operational practices. Secondly, our study highlights the importance of placing a greater emphasis on duration, as resources touted as essential future balancing flexibility providers (e.g. battery energy storage, demand response) may only be able to sustain a response for at most a few hours. Thirdly, we highlight the need to consider footroom and the benefits of enabling renewable energy to provide it. Footroom procurement and response duration specifications are underappreciated by prevailing market designs, and may be better addressed by policy-makers either modifying existing or creating new reserve product specifications.
