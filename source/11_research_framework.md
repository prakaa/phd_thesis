# Research framework {#sec:research_framework}

This chapter outlines the motivating research question of this thesis, the objectives within the scope of this thesis and the research methods used to achieve these objectives. The research framework of this thesis is shown in [@fig:research_framework].

![Research framework of this thesis.](source/figures/research_framework.pdf){#fig:research_framework}

## Research question and objectives

The research question that this thesis aims to address is outlined below:

> **Given existing design challenges and increasing penetrations of variable renewable energy resources as energy transition proceeds, how should we design or, at the very least, approach the design of operational practices for balancing electricity markets?**

As the full scope of this research question is not possible to address within a single doctoral thesis, I focus on aspects of the design problem that are encompassed by the two following research objectives:

### Research Objective 1

>  To determine what features are needed in centrally-coordinated arrangements for procuring frequency control services during energy transition.

Frequency control services are a significant component of the SO's balancing toolkit and are critical to ensuring that imbalances are quickly addressed. The design of frequency control arrangements in restructured electricity industries will need to be revisited as resource mixes, network topologies and broader market arrangements and policy settings change with growing penetrations of variable renewable energy resources. Few of the studies that examine the changes required in frequency control arrangements during energy transition consider the design problem through both an engineering and economics lens, and even fewer draw on past experience with existing practices to inform future design. [Chapter @sec:fcs] aims to address these shortcomings in the existing literature and provide a perspective on what features are desirable in the market-based frequency control arrangements as jurisdictions decarbonise.

### Research Objective 2

> To better understand how the **capabilities** and **deployability** of balancing flexibility in scheduling timeframes are changing during energy transition, and whether these changes impact the suitability of more decentralised operational balancing practices.

In wholesale electricity markets, market participation decisions determine what sort and how much balancing flexibility is available within scheduling timeframes. There is a role for empirical studies examining whether decentralised operational balancing practices, such as markets, are purpose-fit to deliver the balancing flexibility requirements of electricity markets in transition. In [Chapter @sec:reserves], I quantify the time-varying spectrum of balancing flexibility available in two regions of the Australian NEM to assess the need for an additional reserve market. This chapter focuses on understanding the balancing flexibility **capabilities** available following market dispatch both now and into the near future, and using this knowledge to inform market design. Simply quantifying capabilities, however, is insufficient if market participants are unable or unwilling to offer them into the market. [Chapter @sec:info] explores how market information and operational strategies impact the **deployability** of balancing flexibility from energy-limited storage resources that are expected to contribute significantly to balancing electricity markets with high penetrations of variable renewable energy. Based on the empirical findings and a review of policy options, I also discuss scheduling and policy options to improve the availability and deployability of balancing flexibility from such resources.

### Case studies of the Australian National Electricity Market

Whilst this thesis aims to achieve these research objectives and thus produce insights for policy-makers worldwide, I draw on experiences from the Australian NEM and use its resource configurations and market arrangements in the case studies contained within this thesis. Research from the NEM should be interesting and applicable to electricity market designers elsewhere for several reasons:

1. Relative to other jurisdictions, the NEM regularly experiences high instantaneous penetrations of renewable energy (a maximum of 72.9% in November 2023[^8]) and variable renewable energy (a maximum of 71.9% in November 2023[^8]). As such, the changes in balancing flexibility capabilities and requirements in the NEM that are discussed in this thesis foreshadow those that are likely to occur in other jurisdictions as they decarbonise their electricity supply.
2. Since rooftop solar PV and other consumer-owned energy resources constitute a significant part of the resource mix (as high as 48% in a single market interval in October 2023[^8]), electricity market designers must, at the very least, consider their impact on system balancing and, ideally, facilitate the provision of balancing flexibility from these resources to the benefit of both the system and consumers. I touch on both of these aspects in this thesis; however, distributed and consumer-owned energy resources are not a focus of this thesis.
3. Many of  the world's electricity markets are considering or adopting design features, such as short market intervals and faster frequency control service markets, that have long been a part of the NEM's design. As such, the experience from the NEM outlined in this thesis can inform how or whether certain design features should be implemented elsewhere.

[^8]: Maximum as of the time of writing. Figure obtained using GPE NEMLog [@globalpowerenergyWelcomeGPENEMLog22023].

## Research methods

To achieve the objectives outlined in the previous subsection, I use the following research methods:

### Literature review 

Academic and industry literature on operational balancing practices from the NEM and other jurisdictions was reviewed to better understand the nature of the design problem and the success of, as well as remaining challenges with, the implementation of various balancing practices. Though a detailed literature review was completed for each study, a large portion of the output from the literature review is in [Chapter @sec:fcs]. The review demonstrated that though some challenges are universal, solutions must be tailored to each context given the diversity of system outcomes and operational practice configurations across jurisdictions worldwide (a challenge described in [@sec:lit_review-design_challenges]).
 
### System and market data analysis

Various analyses of system and market data from the Australian NEM were completed in [Chapters @sec:fcs;Chapters @sec:reserves] and [-@sec:info] to assess system and market outcomes, and to provide empirical evidence for market modelling assumptions (next subsection) and policy discussion in this thesis. Data was obtained using NEM-specific open-source packages including `NEMOSIS` [@gormanNEMOSISNEMOpen2018], `NEMSEER` [@prakashNEMSEERPythonPackage2023], the `AEMO Monthly Data Archive` tool [@prakashAEMOMonthlyData2023] and `nem-bidding-dashboard` [@gormanNembiddingdashboard2023], and analysed in Python and Julia [@bezansonJuliaFreshApproach2017] using `pandas` [@reback2020pandas]  and `DataFrames.jl` [@juliadataDataFramesJl2023] , respectively. Plots were generated using `matplotlib` [@hunterMatplotlib2DGraphics2007], `plotly` [@plotlytechnologiesinc.CollaborativeDataScience2015] or `Makie.jl` [@danischMakieJlFlexible2021].

### Techno-economic (market) modelling

Techno-economic optimisation modelling was completed as a part of the work presented in Chapters [-@sec:reserves] and [-@sec:info]. In [Chapter @sec:reserves], two market regions of the Australian NEM were modelled using PLEXOS, a commercial power system and electricity market modelling tool [@energyexemplarPLEXOSEnergyMarket2021]. It enables scheduling processes and bid-based electricity markets to be modelled. The longer-term scheduling and market modelling problems formulated by PLEXOS were solved using the CPLEX solver [@ibmCPLEXOptimizer2021]. In [Chapter @sec:info], an open-source Julia optimisation package (`JuMP`) was used to formulate mixed-integer linear programs that were then solved to produce market participation schedules for energy storage resources with different storage durations and operational objectives [@lubinJuMPRecentImprovements2023]. Each of the optimisation problems was solved using the open-source HiGHs solver [@huangfuParallelizingDualRevised2018] on Katana, a high-performance computational cluster supported by UNSW Research Technology Services [@unswresearchtechnologyservicesKatana2023]. Results from [Chapter @sec:reserves] were analysed using `pandas` [@reback2020pandas] and plotted using `matplotlib` [@hunterMatplotlib2DGraphics2007], and results from [Chapter @sec:info] were analysed using `DataFrames.jl` [@juliadataDataFramesJl2023] and plotted using `Makie.jl` [@danischMakieJlFlexible2021].
