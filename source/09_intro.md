\setcounter{page}{1}
\pagenumbering{arabic}
\doublespacing
\setlength{\parindent}{0.5in}
# Introduction {#sec:intro}

## Context and motivation

Mitigation of the wide-ranging, adverse impacts of climate change on ecological and human systems requires reducing and eventually halting global anthropogenic greenhouse gas emissions, of which largest source is the electricity sector [@portnerIPCC2022Climate2022; @internationalenergyagencyNetZero20502021]. Decarbonisation demands an unprecedented deployment of renewable energy, storage and transmission to not only to replace emissions-intensive electricity generated from burning fossil fuels, but also to meet projected increases in the demand for electricity driven by economic development and electrification [@internationalrenewableenergyagencyGlobalRenewablesOutlook2020]. Fortunately, investment in the energy transition is being bolstered by two reinforcing drivers: greater direct investment or support from policy-makers for low-carbon technologies and enablers, and declining technology and deployment costs – particularly for solar photovoltaic modules and lithium-ion batteries – thanks to experiential learning [@wayEmpiricallyGroundedTechnology2022; @roquesEvolutionEuropeanModel2021a; @joskowHierarchiesMarketsPartially2022].

Consequently, power systems are currently experiencing or soon expected to experience high instantaneous penetrations of variable renewable energy (VRE), of which solar photovoltaic (PV) and wind generation are the most prevalent forms [@australianenergymarketoperatorMaintainingPowerSystem2019; @matevosyanFutureInverterBasedResources2021]. The inherent variability, uncertainty and, in the case of inverter-based resources, asynchronicity of VRE can be problematic for balancing power systems (i.e. ensuring that active power supply and demand are more or less equal at each moment) that were originally designed to accommodate conventional (thermal and hydroelectric) generation [@elaOperatingReservesVariable2011; @kenyonStabilityControlPower2020]. Though modelling has indicated that 100% renewable power systems can feasibly be balanced [@hansenStatusPerspectives1002019; @ellistonLeastCost1002013; @rey-costaFirming100Renewable2023], these desktop studies assume that operational practices are appropriately configured to incentivise, control and/or coordinate power system resources such that they make sufficient balancing flexibility available to the system. This task – designing and configuring operational practices to ensure that high VRE power systems are successfully balanced – remains a significant and ongoing challenge that requires reassessing grid codes, system operator processes and electricity market design in jurisdictions that have introduced competition at the wholesale level [@papaefthymiou100RenewableEnergy2016].

In this thesis, I explore how policy-makers should design operational practices for balancing electricity markets given existing challenges and those posed by growing penetrations of VRE. I do so within the context of the Australian National Electricity Market (NEM), the power system and electricity market that services ~80% of the country's electricity consumption [@departmentofclimatechangeenergytheenvironmentandwaterNationalElectricityMarket2023].

## Research gap {#sec:intro-research_gap}

Whilst there is some degree of international consensus on high-level outcomes and the priority areas for designing operational balancing practices for electricity markets with growing penetrations of renewable energy, the multi-layered nature of the design problem, the presence of existing tensions and challenges, and a changing resource mix mean that the design process is complex and contested. Previous literature has emphasised the need for empirical research to identify feasible, flexible and contextually appropriate solutions, even if they may not be optimal. Through empirical studies of aspects of the Australian NEM, this thesis endeavours to address this knowledge gap in the Australian context. It also seeks to provide policy-makers in other jurisdictions with valuable insights drawn from the Australian experience and a framework for approaching the design of operational balancing practices in electricity markets undergoing transition.

## Research framework {#sec:intro-research_framework}

The **research question** of this thesis is outlined below:

> *Given existing design challenges and increasing penetrations of variable renewable energy resources as energy transition proceeds, how should we design operational practices for balancing electricity markets?*

I focus on three aspects of this question that are encompassed by the following **research objectives**:

1. *To determine what features are needed in centrally-coordinated arrangements for procuring frequency control services during energy transition.*

2. *To better understand how balancing flexibility capabilities in scheduling timeframes are changing during energy transition, and how these changes might impact the suitability and design of more decentralised operational balancing practices.*

3. *To explore how more decentralised operational balancing practices can be configured to maximise the deployability of  balancing flexibility in scheduling timeframes.*

I attempt to achieve these objectives through the following three **research methods**:

1. Review of academic and industry literature on the design of operational balancing practices from the Australian NEM and other jurisdictions.
2. Analysis of system and market data from the Australian NEM to provide empirical evidence for techno-economic modelling assumptions and to support the discussion of policy options.
3. Techno-economic (market) optimisation modelling. This includes the modelling of market regions of the NEM, and of market participation schedules for battery energy storage systems engaged in energy arbitrage.

The links between the research question, the research objectives and the research questions are shown in [@fig:research_framework] and are discussed in greater detail in [Chapter @sec:research_framework].

## Contributions

The most significant contributions of this thesis to addressing the research gap outlined in [@sec:intro-research_gap] include:

1. A review of the most prominent challenges to designing effective and efficient frequency control arrangements, and of the potential solutions to these challenges.
2. A comprehensive update to previous literature on frequency control in the NEM that includes recent experience with deteriorating frequency performance and the integration of VRE.
3. Arguments for delivering more robust frequency control arrangements that support investment in frequency control capabilities during energy transition.
4. A practical method to quantify the time-varying spectrum of system balancing flexibility capabilities for assessing, comparing and designing power system operational practices.
5. A case study that applies the method briefly described in Contribution 4 to test the sensitivity of balancing flexibility capabilities to conventional generation retirement, the rate of deployment of VRE and storage, resource mixes and operational constraints, and greater variability in operational demand.
6. A discussion of the role of balancing products in ensuring that sufficient balancing flexibility can be obtained from power system resources.
7. An analysis of historical centralised price forecast data from the NEM that highlights the increasing frequency and severity of errors in these forecasts.
8. Proposing a hypothesis that market participant (re)bidding may be partially responsible for the phenomena highlighted by Contribution 7.
9. Modelling the extent to which wholesale energy market arbitrage revenues might be reduced should the NEM's centralised price forecasts be used to optimise battery energy storage scheduling.
10. A discussion of potential changes to market participant scheduling strategies and market design to improve energy storage resource scheduling outcomes.

Contributions 1–3 can be found in [Chapter @sec:fcs], which consists of a journal article published in *Renewable and Sustainable Energy Reviews*. Contributions 4–6 are included in a journal article published in *Energy Policy* that constitutes [Chapter @sec:reserves]. Contributions 7–10 are reported in [Chapter @sec:info], which consists of a manuscript submitted to *Energy Economics*. 

Additional contributions related to this thesis include:

 - The development, improvement and maintenance of open-source software that facilitates accessing and analysing data from the Australian NEM (refer to the Works arising from this thesis and [Appendix @sec:appendix-joss]).
 - The submission of several responses to Australian NEM rule change and market design consultations related to the topic of this thesis (refer to Works arising from this thesis).

## Structure of the thesis

This thesis consists of 7 chapters and 4 appendices.

**[Chapter @sec:lit_review]** provides relevant context on power systems and power system operation, and an overview of the literature on the challenges with and the desirable outcomes of designing operational practices in electricity markets with growing penetrations of VRE.

**[Chapter @sec:research_framework]** outlines the motivating research question, the research objectives and research methods of this thesis in detail.

**[Chapter @sec:fcs]** considers the question of how frequency control arrangements should be designed with growing penetrations of VRE. In this chapter, I first provide an overview of typical frequency control arrangements, with a focus on restructured electricity industries in North America and Europe, and the main challenges faced in their design. I then describe the NEM's frequency control arrangements and the specific challenges posed by increasing penetrations of VRE. Based on an analysis of the performance of the NEM's frequency control arrangements in responding to these challenges, I conclude this chapter by offering four key insights to policy-makers.

**[Chapter @sec:reserves]** focuses on understanding balancing flexibility *capabilities* available in scheduling timeframes as VRE and storage become a larger part of system resource mixes. In this chapter, I first provide an overview of how balancing flexibility is enabled and procured in the NEM before describing a methodology to quantify available reserves and footroom across deployment horizons for various resource types. I then quantify the available reserves and footroom in two regions of the NEM for existing resource mixes in 2020 and potential resources mixes in 2025, with two scenarios for the latter. From the findings of this case study, I explore the role of reserve products in securing balancing flexibility. **[Appendix @sec:appendix-reserves_assumptions]** outlines the sources for key input data and assumptions, and provides further details regarding how these data were used in the analysis.
 
**[Chapter @sec:info]** explores how future pricing information and market participant operational strategies affect the *deployability* of balancing flexibility from energy storage resources. In this chapter, I first summarise market information, participation and clearing processes in the NEM in addition to providing context on grid-scale energy storage resource deployment, operation and market participation to date. Then, in a case study of the NEM, I examine errors in the NEM's centralised price forecasts, propose a hypothesis to explain increasing divergence and the occurrence of price swings in these forecasts, and then use the same centralised price forecasts to schedule a variety of battery energy storage systems for wholesale energy market arbitrage to assess the impact of imperfect foresight on arbitrage revenues. I conclude by discussing changes to market participant scheduling and market design that could maximise the balancing value of resources such as battery energy storage systems. **[Appendix @sec:appendix-milps]** presents the mixed-integer linear program formulations used in the storage modelling in [Chapter @sec:info], and **[Appendix @sec:appendix-discounting]** describes the methodology used to model a storage scheduler discounting price forecasts (one of the formulations used in the storage modelling in [Chapter @sec:info] and described in [Appendix @sec:appendix-milps]).

**[Chapter @sec:conclusion]** concludes the thesis. In this chapter, I summarise the contributions of this thesis and highlight avenues for further work.

**[Appendix @sec:appendix-joss]** is the Journal of Open Source Software article for `NEMSEER`, a Python package developed as a part of this thesis to download and handle historical NEM forecast data produced by the Australian Energy Market Operator.

