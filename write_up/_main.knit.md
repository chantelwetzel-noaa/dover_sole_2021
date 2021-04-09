---
geometry: margin=1in
month: "April"
year: "2021"
preamble: |
output: sa4ss::techreport_pdf
bibliography: sa4ss.bib
lang: en
papersize: a4
---



<!--chapter:end:00a.Rmd-->

---
author:
  - name: Chantel R. Wetzel
    code: 1
    first: C
    middle: R
    family: Wetzel
  - name: Aaron M. Berger
    code: 2
    first: A
    middle: M
    family: Berger
author_list: Wetzel, C.R., A.M. Berger
affiliation:
  - code: 1
    address: Northwest Fisheries Science Center, U.S. Department of Commerce, National
      Oceanic and Atmospheric Administration, National Marine Fisheries Service, 2725
      Montlake Boulevard East, Seattle, Washington 98112
  - code: 2
    address: Northwest Fisheries Science Center, U.S. Department of Commerce, National
      Oceanic and Atmospheric Administration, National Marine Fisheries Service, 2032
      Southeast OSU Drive, Newport, Oregon 97365
address:
  - ^1^Northwest Fisheries Science Center, U.S. Department of Commerce, National Oceanic
    and Atmospheric Administration, National Marine Fisheries Service, 2725 Montlake
    Boulevard East, Seattle, Washington 98112
  - ^2^Northwest Fisheries Science Center, U.S. Department of Commerce, National Oceanic
    and Atmospheric Administration, National Marine Fisheries Service, 2032 Southeast
    OSU Drive, Newport, Oregon 97365
---

<!--chapter:end:00authors.Rmd-->

---
title: Status of Dover sole (_Microstomus pacificus_) along the U.S. West Coast in
  2021
---

<!--chapter:end:00title.Rmd-->


\vspace{20cm}


_These materials do not constitute a formal publication and are for information only. They are in a pre-review, pre-decisional state and should not be formally cited (or reproduced). They are to be considered provisional and do not represent any determination or policy of NOAA or the Department of Commerce._

\pagebreak
\pagenumbering{roman}
\setcounter{page}{1}

\renewcommand{\thetable}{\roman{table}}
\renewcommand{\thefigure}{\roman{figure}}


\setlength\parskip{0.5em plus 0.1em minus 0.2em}

<!--chapter:end:01a.Rmd-->

# One Page Summary{-}

\begin{itemize}

\item Fleet change

\item Key data sources

\item Data concerns

\item Major change in selectivity parameterization

\item Natural mortality uncertainty

\item The over-all stock size and status

\item Compare to the 2011 results

\end{itemize}

\newpage

<!--chapter:end:01b_onepage.Rmd-->


# Executive Summary{-}

## Stock{-}
This assessment reports the status of Dover sole (_Microstomus pacificus_) off the U.S. West coast using data through 2020. Dover sole are also harvested from the waters off British Columbia and in the Gulf of Alaska, and although those catches were not included in this assessment, it is not certain if those populations contribute to the biomass of Dover sole off of the U.S. West Coast.

## Landings{-}
Dover sole were first landed in California in the early part of the 20th century and the fishery began increasing landings in Oregon and Washington in the 1940's.  Landings remained relatively constant throughout the 1950's and 1960's before increasing rapidly into the early 1990's.  Subsequently, the landings declined (mostly in California) until 2007 when harvest guidelines increased the allowable catch.  Groundfish trawl fisheries land the majority of Dover sole while fixed gears, shrimp trawls, and recreational fisheries make up a very small amount of fishing mortality.  Some discarding of Dover sole occured in the fisheries, primarily prior to the implementation of the Catch Shares Program in 2011.  Discards were estimated in the model and total catches are reported, as opposed to landings.


![Landings by fleet used in the base model.\label{fig:es-catch}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/catch2 landings stacked.png){width=75% height=100% alt="Landings by fleet used in the base model."}

\input{tex_tables/a_Catches_ES.tex}

## Data and Assessment{-}

Dover sole off the west coast of the U.S. was assessed here using the length- and age-structured model Stock Synthesis (version 3.30.16).  The last assessment was done in 2011 and showed the stock to be increasing with a 2011 depletion level at 84 percent of virgin spawning biomass. In this assessment, aspects of the model including fleet structure, landings, data, and modelling assumptions were re-evaluated. The coastwide population was modeled allowing separate growth and mortality parameters for each sex (i.e., a two-sex model) from 1911 to 2020 and forecasted beyond 2020.

All of the data sources included in the base model for Dover sole have been re-evaluated for this assessment. Changes in varying degress have occurred in the data from those used in the previous assessment. The historical landings has been updated for California and Oregon relative to those used in 2011. Survey data from the Alaska and Northwest Fisheries Science Centers have been used to construct indices of abundance analyzed using a spatio-temporal delta-model (e.g., VAST). 

The definition of fishing fleets have changed from those in the 2011 assessment. The new assessment assumed two fishing fleets in the model: 1) a combined gear California fleet and 2) a combined gear Oregon/Washington fleet. The update in fleet grouping for Oregon and Washington was suggested by state representative during the pre-assessment data meeting. Separating data between Oregon and Washington can be challenging due to fishing and landing across state boundaries. 

This assessment uses landings data and discard estimates; survey indices of abundance, length- or age-composition data for each fishery or survey (with conditional age-at-length data used for the \gls{s-nwslope} and \gls{s-wcgbt}); information on weight-at-length, maurity-at-length, and fecundity-at-length; information on natural mortality and the steepness of the Beverton-Holt stock-recruitment relationship; and estiamtes of ageing error. Estimates of recruitment at equilibrium spawning output ($R_0$), annual recruitment deviations, sex-specific length-based selectivity of the fisheries and surveys, retention for each of the fishery fleets, catchability of the surveys, sex-specific growth, the time series of spawning output, age and size structure, and current and project future stock status are outputs of the model. 

A number of sources of uncertainty are explicitly included in this assessment. A base model was selected that best captures the central tendency for those sources of uncertainty considered in the model.

## Stock Biomass{-}

The estimated spawning biomass across all years had the most significant decline occuring in the late 1990s following high catch levels in the 1980s and early 1990s. 


\input{tex_tables/b_SSB_ES.tex}


![Estimated time series of spawning output (circles and line: median; light broken lines: 95 percent intervals) for the base model.\label{fig:es-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/ts7_Spawning_biomass_(mt)_with_95_asymptotic_intervals_intervals.png){width=100% height=75% alt="Estimated time series of spawning output (circles and line: median; light broken lines: 95 percent intervals) for the base model."}


![Estimated time series of fraction of unfished spawning output (circles and line: median; light broken lines: 95 percent intervals) for the base model.\label{fig:es-depl}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/ts9_Relative_spawning_biomass_intervals.png){width=100% height=75% alt="Estimated time series of fraction of unfished spawning output (circles and line: median; light broken lines: 95 percent intervals) for the base model."}

## Recruitment{-}
Replace text.

\input{tex_tables/c_Recr_ES.tex}


![Estimated time series of age-0 recruits (1000s) for the base model with 95 percent intervals.\label{fig:es-recruits}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/ts11_Age-0_recruits_(1000s)_with_95_asymptotic_intervals.png){width=100% height=75% alt="Estimated time series of age-0 recruits (1000s) for the base model with 95 percent intervals."}

## Exploitation Status{-}
Replace text.

\input{tex_tables/d_SPR_ES.tex}


![Estimated 1 - relative spawning ratio (SPR) by year for the base model. The management target is plotted as a red horizontal line and values above this reflect harvest in excess of the proxy harvest rate.\label{fig:es-1-spr}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/SPR2_minusSPRseries.png){width=100% height=75% alt="Estimated 1 - relative spawning ratio (SPR) by year for the base model. The management target is plotted as a red horizontal line and values above this reflect harvest in excess of the proxy harvest rate."}


![Phase plot of estimated 1-SPR versus fraction unfished for the base model.\label{fig:es-phase}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/SPR4_phase.png){width=100% height=75% alt="Phase plot of estimated 1-SPR versus fraction unfished for the base model."}


--------------AARON STOP EDITING HERE----------------------



## Ecosystem Considerations{-}


Ecosytem factors have not been explicitly modeled in this assessment but there are several aspects of the California current ecosystem that may impact Dover sole population dynamics and warrant further research. Survival of Dover sole eggs and pelagic larvae that have a protracted pelagic phase are linked to water circulation patterns [@king_climate_2011]. The timing of settlement occurs typically between January and March and is correlated with Ekman transport, positive vertical velocity and relatively warm bottom temperatures [@toole_settlement_1997].  Markle et al. [-@markle_metamorphosis_1992] hypothesized that juvenile Dover sole move inshore to nursery habitat by making vertical ascents during the night off bottom until they encounter suitable habitat.  Tolimieri et al. [-@tolimieri_spatio-temporal_2020] identified multiple areas off the coast of southern California that had high densities of young Dover sole. This is consistent with the finding of Toole et al. [-@toole_seasonal_2011] that juvenile Dover sole 10 - 22 cm tended to move inshore during summer months. As Dover sole grow in body size they generally move offshore into deep waters. Changing water temperature due to climate change may alter the winter onshore Ekman transport which could have impacts on juvenile survival, result in distributional shifts of favorable spawning grounds, or nursery habitats of Dover sole.

## Reference Points{-}

The 2021 spawning output relative to unfished equilibrium spawning output is well above the management target of 25 percent of unfished spawning output. The fishing intensity has been below the current management harvest rate limit ($SPR_{30\%}$) across all modeled years (Figure \ref{fig:es-1-spr}).  The relative biomass compared to the ratio of the estimated SPR to the management target ($SPR_{30\%}$) across all model years are shown in Figure \ref{fig:es-phase} where warmer colors (red) represent early years and colder colors (blue) represent recent years.  The relative biomass and estimated SPR has been well above the management biomass target (25 percent) and well below the SPR target across all model years. Figure \ref{fig:es-yield} shows the equilibrium curve based on a steepness value fixed at 0.8 with vertical dashed lines to indicate the estimate of fraction unfish at the start of 2021 (current) and the estimated management targets calculated based on the relative target biomass (B target), the SPR target, and the maximum sustainable yield (MSY).


![Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivities and with steepness fixed at 0.80.\label{fig:es-yield}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/yield2_yield_curve_with_refpoints.png){width=100% height=75% alt="Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivities and with steepness fixed at 0.80."}

Reference points were calculated using the estimated selectivities and catch distributions among fleets in the most recent year of the model, 2020. Sustainable total yield, landings plus discards, using an $SPR_{30\%}$ is \ensuremath{2.28909\times 10^{4}} mt. The spawning output equivalent to 25 percent of the unfished spawning output ($SB_{25\%}$) calculated using the SPR target ($SPR_{30\%}$) was \ensuremath{7.4498\times 10^{4}} millions of eggs. Recent removals have been below the point estimate of the potential long-term yields calculated using an $SPR_{30\%}$ reference point and the population scale has been relatively stable in recent years.

\input{tex_tables/e_ReferencePoints_ES.tex}

## Management Performance{-}

Exploitation on Dover sole slowly increased starting around 1940 and reached a high the early 1990s. After peaking exploitation rates declined steadily through 2006, increased in 2007, but have steadily declined since. In the last ten years the annual catch limit (ACL) has been set well below the overfishing limit (OFL) and acceptable biological catch (ABC).  Total mortality has ranged between 10 - 15 percent of the ACL in the most recent five years.

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.83cm}>{\raggedright\arraybackslash}p{1.83cm}>{\raggedright\arraybackslash}p{1.83cm}>{\raggedright\arraybackslash}p{1.83cm}>{\raggedright\arraybackslash}p{1.83cm}}
\caption{(\#tab:ofl-es)The OFL, ABC, ACL, landings, and the estimated total mortality in metric tons.}\\
\toprule
Year & OFL & ABC & ACL & Landings & Est. Total mortality\\
\midrule
\endfirsthead
\caption[]{(\#tab:ofl-es)The OFL, ABC, ACL, landings, and the estimated total mortality in metric tons. \textit{(continued)}}\\
\toprule
Year & OFL & ABC & ACL & Landings & Est. Total mortality\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2011 & 44400 & 42436 & 25000 & 7782 & 7893\\
2012 & 44826 & 42843 & 25000 & 7328 & 7430\\
2013 & 92955 & 88865 & 25000 & 7970 & 8078\\
2014 & 77774 & 74352 & 25000 & 6449 & 6543\\
2015 & 66871 & 63929 & 50000 & 6327 & 6354\\
2016 & 59221 & 56615 & 50000 & 7318 & 7350\\
2017 & 89702 & 85755 & 50000 & 7892 & 7925\\
2018 & 90282 & 86310 & 50000 & 6421 & 6447\\
2019 & 91102 & 87094 & 50000 & 5767 & 5790\\
2020 & 92048 & 87998 & 50000 & 4688 & 4707\\*
\end{longtable}
\endgroup{}
\endgroup{}

## Unresolved Problems and Major Uncertainties{-}


The base case model was developed with the goal of balancing parsimony with realism and fitting the data. To achieve parsimony some simplification of model structure was assumed which may impact the interprettation and fit to specific data sets. The maturity-at-length or -at-age analysis conducted for this assessment and the length-at-age estimates identified possible differences in Dover sole south and north of Point Reyes. Currently, there is limited information on the movement of Dover sole by latitude or depth which would provide possible insights into the mechanisms behind these observed differences. Additionally, in recent years the majority of fishery data are arising from ports north of Point Reyes which limits the ability to support additional model complexity. Given the lack of information to inform the structure and parameterization of a spatial model, the base model opted to assume a homogenous population structure at this time. Future research into the biology and movement of Dover sole could facilite future spatial modeling efforts if appropriate. 

Dover sole life-history parameters exhibit strong relationships with depth that indicate the stock is more complex than the model assumes.  Small fish are found in shallow water, while mid-sized and larger fish are observed across all depths. Specifically, the \gls{s-wcgbt} observes some of the largest female Dover sole in waters less than 300 meters. The variability of sizes obseved by sex increases moving from deeper to shallower waters. Conversly, the median observed size by depth increases with depth. In addition, there is a pattern of sex ratio by depth with more males found in middle depths and more females found in shallow and deeper depths.  These patterns are apparent in the summer fisheries and surveys.  It is uncertain how the patterns affect the data (they may be a cause of the bimodal length distributions seen in the slope surveys) and if these patterns can be effectively modeled to produce better fits to the data and better predictions of biomass.

Uncertainty in natural mortality translates into uncertain estimates of status and sustainable fishing levels for Dover sole. In the base model, a balence between fixing and estimating this key parameter was struck by fixing female natural mortality at the median of the prior while estimating the relative difference in male natural mortality. The likelihood profile across values of female natural mortality values supported lower values which may not have been expected _apriori_ based on the available age data.  Additionally, the values of catchability for the \gls{s-wcgbt} and both slope surveys were above 2.0 (the survey observed biomass was at least twice the model estimated vulnerable biomass) when natural mortality was estimated due to a drop in the population scale. The shift in low estimated natural mortality and shifts in stock scale could be due to limited information about natural mortality for Dover sole in the data, the limited selection of female Dover sole by the fisheries and surveys, or could indicate model mis-specification. It is unclear what is driving this behavior in the model.

The selectivity parameters by sex for each survey seemed to be well estimated in the base model.  However, moving to the double-normal with offset parameterization from the 2011 selectivity form  had a substantial change in the model estimates of stock size. The best fit to the length and age data is achieved with the parameterization in the base model. Both this assessment and the previous assessment estimated maximum female selectivities well below 1.0, although the current analysis estimated slightly higher maximum female selectivity values for each of the surveys. There is inherent uncertainty that may not be fully captured in the within model uncertainty when female fish who represent spawning biomass are not fully observed by any fleet.           


## Scientific Uncertainty{-}


The model uncertainty around the 2021 estimate of spawning biomass was $\sigma$ = 0.17. The uncertainty estimated around the OFL was $\sigma$ = 0.16. The time-varying forecast uncertainty applied in the base model is based on the adopted value of $\sigma$ = 0.50 for a category 1 stock combined with a P* value of 0.45.

## Harvest Projections and Decision Table{-}

The forecast of stock abundance and yield was developed using the base model. The total catches in 2021 and 2021 were set at 10,000 mt for each year, since recent year removals are well below the ACLs. These values will be updated based on input provided by the Groundfish Management Team (GMT) of the PFMC. The management adopted ACL values for these years is 50,000 mt. The exploitation rate for 2021 and beyond is based upon an SPR of 30 percent and the 25:5 harvest control rule. The average exploitation rates, across recent years, by fleet were used to distribute catches during the forecast period. 

The ABC values were estimated using a category 1 $\sigma_y$ starting at 0.50 and increasing annually combined with a P* value of 0.45. The catches during the projection period were set equal to the year-specific ABC using the current flatfish harvest control rule, 25:5 (Table \ref{tab:project}). 

The axes of uncertainty and catch streams applied in the decision table will determined during the  STAR panel. 

\begingroup\fontsize{10}{12}\selectfont

\begin{landscape}\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:es-project)Projections of potential OFLs (mt), ABCs (mt), estimated spawning output, and fraction unfished. The adopted OFL, ABC, and ACL for 2021 and 2022 reflect adopted management limits and the assumed removal is the amount assumed in the projection for 2021 and 2022. The full ABC was assumed to be removed for 2023 - 2032}\\
\toprule
Year & Adopted OFL (mt) & Adopted ABC (mt) & Adopted ACL (mt) & Assumed Removal (mt) & OFL (mt) & ABC (mt) & Buffer & Spawning Output & Fraction Unfished\\
\midrule
\endfirsthead
\caption[]{(\#tab:es-project)Projections of potential OFLs (mt), ABCs (mt), estimated spawning output, and fraction unfished. The adopted OFL, ABC, and ACL for 2021 and 2022 reflect adopted management limits and the assumed removal is the amount assumed in the projection for 2021 and 2022. The full ABC was assumed to be removed for 2023 - 2032 \textit{(continued)}}\\
\toprule
Year & Adopted OFL (mt) & Adopted ABC (mt) & Adopted ACL (mt) & Assumed Removal (mt) & OFL (mt) & ABC (mt) & Buffer & Spawning Output & Fraction Unfished\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 93547 & 84192 & 50000 & 10000 & - & - & - & 232065 & 0.79\\
2022 & 87540 & 78436 & 50000 & 10000 & - & - & - & 231642 & 0.79\\
2023 & - & - & - & - & 63834 & 59684 & 0.935 & 230918 & 0.79\\
2024 & - & - & - & - & 55859 & 51949 & 0.93 & 207333 & 0.71\\
2025 & - & - & - & - & 49608 & 45937 & 0.926 & 187284 & 0.64\\
2026 & - & - & - & - & 44769 & 41277 & 0.922 & 170449 & 0.58\\
2027 & - & - & - & - & 41053 & 37646 & 0.917 & 156459 & 0.53\\
2028 & - & - & - & - & 38217 & 34892 & 0.913 & 144943 & 0.49\\
2029 & - & - & - & - & 36050 & 32770 & 0.909 & 135500 & 0.46\\
2030 & - & - & - & - & 34389 & 31088 & 0.904 & 127779 & 0.43\\
2031 & - & - & - & - & 33108 & 29797 & 0.9 & 121483 & 0.41\\
2032 & - & - & - & - & 32100 & 28762 & 0.896 & 116323 & 0.40\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}

## Research and Data Needs{-}


Investigating and or addressing the following items could improve future assessments of Dover sole: 

\begin{itemize}

\item Patterns with depth:  There are patterns of length and sex ratios with depth which may indicate that the stock is more complex than currently modeled.  Further research into the causes of these patterns as well as differences between seasons would help with understanding the stock characteristics such that a more realistic model could be built.  This may also provide further insight into migration and help determine if there are localized populations.

\item Stock boundaries: A common question in stock assessments is whether or not the entire stock is being accounted for. Dover sole live deeper than the range of the fisheries and surveys.  The assessment model attempts to account for out of area biomass through catchability coefficients and selectivity curves, but that portion of the stock is unknown and can only be guessed at.  Research into abundance in deep areas would be useful to verify that the assessment adequately predicts the entire spawning stock of Dover sole.

\item California Sampling for Ages: Since 1990, nearly 60 percent of fish aged have been landed at the Crescent City port, with some years 100 percent of aged fish coming from this port. In contrast, the majority of Dover sole are landed at the Eureka port (approximately 67 percent over the last 10 years). Ensuring that sampling is spread across California ports and otoliths selected for ageing are spread across ports proportional to area removals may provide additional insights to area specific population attributes.

\end{itemize}


<!--chapter:end:01executive.Rmd-->

\pagebreak
\setlength{\parskip}{5mm plus1mm minus1mm}
\pagenumbering{arabic}
\setcounter{page}{1}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}

\setcounter{table}{0}
\setcounter{figure}{0}

\setlength\parskip{0.5em plus 0.1em minus 0.2em}

<!--chapter:end:10a.Rmd-->

# Introduction

The Dover sole (_Microstomus pacificus_) is a flatfish belonging to the family Pleuronectidae and is called a sole although it is a flounder.  Dover sole has also been known by several different common names including slippery sole, lemon sole, smear dab, rubber sole, short finned sole, slime sole, and tongue sole.  Although there was little interest in Dover sole when the U.S. west coast trawl fishery first began in the late 19th century, the species is now commonly landed.

This is an assessment of the Dover sole population off of the U.S. west coast, including coastal waters of California, Oregon, and Washington from the U.S./Mexico border to the U.S./Canadian border (Figure \ref{fig:map}).  It does not include Canadian or Alaskan populations and assumes that these northern populations do not contribute to the stock being assessed here.


## Life History

Dover sole range from Baja California to the Bering Sea and eastern Aleutian Islands [@kramer_guide_1995]. Dover sole are generally found on mud or mud-sand bottom deeper than 20 fathoms (37 m) and out to deeper than 1,500 m [@jacobson_bathymetric_1993]. They feed on polychaete worms, pink shrimp, brittle stars, gammarid amphipods, and small bivalves [@pearcy_feeding_1978; @gabriel_feeding_1981].  Dover sole exhibit dimorphic growth by sex with females off the West Coast reaching a maximum length around 48 cm, approximately 5 cm greater than the males. Dover sole are estimated to live up to a maximum age of approximately 50 years.

Based on samples from the commercial fishery in northern California, Hagerman [-@hagerman_biology_1952] concluded that the spawning period for Dover sole is during November to March or April with heavy spawning during December to February.  In contrast, a later study by Markle et al. [-@markle_metamorphosis_1992] concluded that Dover sole off the coast of Oregon appear to reach peak spawning in early spring. Spawning occurs in relatively deep water [@hagerman_biology_1952] and prior to 1954 few Dover sole were caught during winter months because the fish are generally unavailable on the shelf during winter.  Dover sole eggs and larvae are buoyant [@hagerman_biology_1952] and this species has an extended larval phase lasting at least one year [@pearcy_distribution_1977; @markle_metamorphosis_1992; @butler_growth_1996].  Markle et al. [-@markle_metamorphosis_1992] postulate that Dover sole larvae may extend settlement by delaying metamorphosis to avoid unfavorable oceanographic conditions.  

Based on research survey tows, Jacobson and Hunter [-@jacobson_bathymetric_1993] found that the catches of Dover sole in a given area and depth zone were not randomly distributed by sex, with males and females tending to occur in separate patches. Furthermore, Dover sole appear to undergo ontogenetic shifts in their distribution with fish gradually moving to deeper water as they grow [@jacobson_depth_2001].  Westrheim et al. [-@westrheim_stock_1992] summarized the results from multiple tagging studies between 1948 - 1979 indicated seasonal movements of Dover sole onto the continental shelf in the summer and off the shelf in the winter, but little evidence of north-south movement or appreciable mixing between Pacific Marine Fisheries Commission (PMFC) statistical areas. However, a few tagged fish were observed to have moved long distances. For example, Westrheim and Morgan [-@westrheim_results_1963] reported that a fish caught and tagged in the Willapa Deep area off Washington was subsequently recaptured off Humboldt Bay, CA, 360 nautical miles south.  Barss et al. [-@barss_marine_1977] reported having records for 13 tagged fish that were recaptured after 10 or more years at liberty. The longest time a fish was at liberty was 22 years and was recaptured within 1 nautical mile of its original release location. Westrheim et al. [-@westrheim_stock_1992] noted the limited observed movement between PMFC areas (movement north and south) however, noted that a majority of the tagging work was done prior to the development of the deepwater trawl fishery for Dover sole (except PFMC area 1C).  Additionally, Dover sole larvae have an extensive pelagic period, greater than one year, which may allow larvae movement across the West Coast [@hagerman_biology_1952].

Ono et al. [-@ono_space-time_2016] examined movement patterns of Dover sole using \Gls{s-wcgbt} data collected off the West Coast in early summer and early fall. They found that Dover sole displayed ontogentic movement, moving to shallower and deeper water during summer months. Additionally, Dover sole appeared to move from areas southwest of San Fransisco and northwest of Eureka to the northern or southern edges of the U.S. coast in late summer, aggregating along the Washington coast and south of Point Conception in California [@ono_space-time_2016]. This movement pattern identified by Ono et al. [-@ono_space-time_2016] differs from the limited latitudal movement identified by early tagging studies of Dover sole [@westrheim_stock_1992].

Stock structure is not well understood. Based on tagging study results that show limited adult movement, there may be multiple stocks of Dover sole due to limited intermingling adult populations, but larvae probably intermingle during their long pelagic life [@westrheim_stock_1992].  Stepien [-@stepien_phylogeographical_1999] used sequences of mitochondrial DNA extracted from Dover sole sampled at six sites ranging from southern California to the Gulf of Alaska and found phylogeographical structure in West Coast Dover sole with spatial clustering of genetically similar individuals. However, there were several unusual clusters of specimens having apparently similar genetic make-up although they were geographically separated (i.e., fish from Alaska with similar genetics as fish from San Diego). 

## Ecosystem Considerations

Ecosytem factors have not been explicitly modeled in this assessment but there are several aspects of the California current ecosystem that may impact Dover sole population dynamics and warrant further research. Survival of Dover sole eggs and pelagic larvae that have a protracted pelagic phase are linked to water circulation patterns [@king_climate_2011]. The timing of settlement occurs typically between January and March and is correlated with Ekman transport, positive vertical velocity and relatively warm bottom temperatures [@toole_settlement_1997].  Markle et al. [-@markle_metamorphosis_1992] hypothesized that juvenile Dover sole move inshore to nursery habitat by making vertical ascents during the night off bottom until they encounter suitable habitat.  Tolimieri et al. [-@tolimieri_spatio-temporal_2020] identified multiple areas off the coast of southern California that had high densities of young Dover sole. This is consistent with the finding of Toole et al. [-@toole_seasonal_2011] that juvenile Dover sole 10 - 22 cm tended to move inshore during summer months. As Dover sole age they generally move offshore into deep waters. Changing water temperature due to climate change may alter the winter onshore Ekman transport which could have impacts on juvenile survival, result in distributional shifts of favorable spawning grounds, or nursery habitats of Dover sole.  


## Historical and Current Fishery Information

Trawl fishing with boats powered by sail began in California waters in 1876 and caught many flatfishes, including Dover sole [@hagerman_biology_1952].  Even though there are reports of Dover sole being sold in summer markets in San Francisco as early as 1878 (Lockington [-@lockington_report_1880] as referenced by Hagerman [-@hagerman_biology_1952]), it was not until the early part of the 20th century that landings of Dover sole were recorded.  In a 1936 biological report from the State of Washington Department of Fisheries Dover sole was described as "very slimy and is repulsive to handle" and "[i]t has no value as a commercial fish" [@smith_report_1936]. It was not long after 1936 that Dover sole were being landed in significant quantities up and down the U.S. west coast.  

Since Dover sole was considered a "repulsive" fish by some [@smith_report_1936] in the early years of the West Coast fishery development, it was likely discarded as bycatch when pursuing other more desirable species such as petrale sole (_Eopseta jordani_) and English sole (_Parophrys vetulus_). However, markets were eventually developed and landings began steadily increasing in the 1940's. While early Dover sole landings were first recorded in California, fisheries for Dover sole had developed in Oregon and Washington by the 1930's  (Table \ref{tab:allcatches} and Figure \ref{fig:catch}). Landings remained relatively constant throughout the 1950s and 1960s before increasing rapidly into the early 1990s.  Starting around 1980 landings in Oregon surpassed California landings, becoming the state with the highest landing of Dover sole. In recent years in California, the majority of removals of Dover sole have been landed in northern California ports (Eureka, Fort Bragg, and Crescent City). In Oregon the majority of recent landings occur at Astoria and Newport followed by Coos Bay and Brookings. In Washington, ports in Bellingham and Westport, have the highest landings in recent years.

Over the last twenty years, the landings declined (mostly in California) until 2007 when harvest guidelines increased the allowable catch based on the 2005 assessment results [@sampson_status_2005].  In 2015 the  Annual Catch Limit (ACL) of Dover sole increased from 25,000 to 50,000 mt for Dover sole with 95 percent of the ACL allocated to the trawl fishery. However, attainment of Dover sole has been low (less than 15 percent). The reasons for low attainment of Dover sole are complex. Dover sole co-occur with sablefish (_Anoplopoma fimbria_). Sablefish has been a constraining species for Dover sole landings due to the lower ACLs of sablefish and allocation challenges among sablefish fishing sectors. Additionally, in recent years there has been an increased competition in the whitefish markets with other inexpensive fish options (e.g. tilapia and catfish) which may have displaced U.S. wild caught species such as Dover sole [@norma-lopez_is_2009]. 

Groundfish trawl fisheries land the majority of Dover sole (greater than 99 percent total landings) while fixed gears, shrimp trawls, and recreational fisheries make up a very small amount of fishing mortality. Shrimp trawls have been using excluders which have reduced bycatch of many species including Dover sole. The trawl fisheries typically catch Dover sole while targeting the depwater complex consisting of Dover sole, sablefish, shortspine thornyhead (_Sebastolobus alascanus_), and longspine thornyhead (_Sebastolobus altivelis_, DTS deepwater complex) but also encounter Dover sole when targeting petrale sole or nearshore mix species. The fishery targets Dover sole across a range of depths (50 - 330 fathoms) depending upon the season (Scott Malvitch, personal communiction, ODFW).  

Historically, discarding of Dover sole occurred for a variety of reasons. Dover sole was discarded due to trip limits, small size, or even being too large. Dover sole of the largest size caught at deep depths  become "jellied" where the tissue becomes soft and has little marketability (Mike Okoniewski, personal communication). Since the introduction of individual fishery quotas (IFQ) in 2011, the discarding of all quota species, including Dover sole, has dramatically declined across the IFQ trawl fleet.  

## Summary of Management History and Performance

Management restrictions for Dover sole came largely into place in the early 1980's with the implementation of trip limits and quotas on DTS species, which mostly limited catches of Dover sole because of more restrictive trip limits on the higher priced sablefish and thornyheads. Trip limits specific for Dover sole were implement for portions of 1994, 1996, the start of 1997, and for years thereafter. Catches of the deepwater species during earlier years were controlled primarily by trip limits on the landings of sablefish and thornyheads, for which the fishers received much higher prices. 

In studies of trawl logbook data from California (1985-91), Washington (1986-92), and Oregon (1987-93), Sampson [-@sampson_effective_1997] tabulated how many trawl trips landed within 90 percent of the trip limits in effect at the time of each trip. Trips were sometimes constrained by the trip limits on sablefish (up to 43 percent of the trips landing in California, 32 percent of the trips landing in Oregon, and 27 percent of the trips landing in Washington). Trips were much less frequently constrained by the trip limits on the deepwater complex (up to 15 percent of the trips landing in California, 17 percent of the trips landing in Oregon, and 8 percent of the trips landing in Washington).

The introduction of the IFQ fishery in 2011 created an allocation system of quota pounds to vessels participating in the catch share program for species in the groundfish Fishery Management Plan. Overall, Dover sole removals have been well below the annual catch limits (ACLs) for Dover sole (Table \ref{tab:ofl}).

## Foreign Fisheries

Dover sole in Canadian waters are treated as two distinct stocks; a northern stock and a southern stock.  The fishery in the north began in the 1970's while the fishery off of the West Coast of Vancouver Island started in the late 1980's. Area quotas were used to manage the two stocks until the introduction of individual based quotas in 1996. A 1999 assessment reported that the stocks were being exploited at levels near the maximum sustainable yield [@department_of_fisheries_and_ocean_dover_1999]. The stock has not been assessed since, however, was slated for assessment in 2020 (it is unknown if this was done according to schedule). For the two areas combined (3C/D), the total allowable catch in recent years has been set at 1,375 mt [@department_of_fisheries_and_ocean_pacific_2019].

In the Gulf of Alaska the flatfish fishery has caught substantial quantities of Dover sole, with the peak of 9,740 mt in 1991 [@stockhausen_gulf_2006]. Gulf of Alaska catches or Dover sole have been well below the Total Allowable Catch (TAC) which was set at 9,501 in 2019 [@the_plan_team_for_the_groundfish_fisheries_of_the_gulf_of_alaska_stock_2019]. In 2020 the spawning biomass for Dover sole was estimated to be 27,935 mt, well above the biomass target for the Gulf of Alaska of 7,613 mt [@the_plan_team_for_the_groundfish_fisheries_of_the_gulf_of_alaska_stock_2019].  




<!--chapter:end:11introduction.Rmd-->

# Data
A description of each data source is provided below (Figure \ref{fig:data-plot}).

<!--chapter:end:20data.Rmd-->

## Fishery-Dependent Data

### Recent Commercial Fishery Landings

The commercial removals were extracted from the Pacific Fisheries Information Network (PacFIN) database for 1981 - 2020 for California and Washington and 1987 - 2020 for Oregon on January 28, 2021. The majority of removals for Dover sole arise from trawl gear (e.g., greater than 99 percent). Commercial removals for all gear types were combined into two area specific fleets: a California fleet and a combined Oregon/Washington fleet. This fleet structure was decided based on feedback received during the pre-assessment data webinar where combining Oregon and Washington was suggested due to cross state fishing and landing practices that make separating by state challenging.

#### Washington Prior to 1981

Historical commercial landings of non-shrimp trawl gear were reconstructed for Dover sole landed in Washington for use in the 2011 assessment by Greg Lippert (Washington Department Fish and Wildlife, WDFW).  Shrimp trawl, fixed gear, and recreational landings constitute a negligible amount of the total mortality for Dover sole.  Historical landings of Dover sole landed in the state of Washington were determined from various data sources using era specific understanding of fishing behavior.  For details please see Hicks and Wetzel [-@hicks_status_2011]. The historical landings for Washington were not revised for this assessment. 

#### Oregon Prior to 1986

Historical commercial fishery landings of Dover sole in Oregon for the years 1911 - 1986 were obtained from Alison Whitman (Oregon Department of Fish and Wildlife, ODFW). A description of the methods can be found in Karnowski et al. [-@karnowski_historical_2014]. The California catch reconstruction (discussed below, Ralston et al. [-@ralston_documentation_2010]) excluded fish that were caught in Oregon or Washington waters and landed at a California port. In contrast, Oregon's historical catch reconstruction was based on the port of landing. This disconnect between methods applied by California and Oregon was brought to light during the [2016 Catch Reconstruction workshop](https://www.pcouncil.org/documents/2017/03/i2_att1_catch_reconstruction_workshop_report_mar2017bb.pdf/).  Landings estimates between 1948 - 1968 for Dover sole that were identified to have occurred in Oregon or Washington waters and excluded from the California reconstruction were provided by John Field (Southwest Fishery Science Center, SWFSC, NOAA).  These landings of Dover sole were added to the Oregon/Washington fleet within the model. 


#### California Prior to 1981

Historical commercial fishery landings of Dover sole from 1948 - 1980 were obtained directly from E.J. Dick (SWFSC, NOAA) who retrieved the data from the California Cooperative Groundfish Survey data system (CALCOM). The method of reconstructing California historical landings are described by Ralston et al. [-@ralston_documentation_2010]. 

At present, no landing for Dover sole before 1948 are available in CALCOM.  For years prior to 1948, the landings from the 2005 assessment [@sampson_status_2005] were used (as was done in the 2011 assessment). The data from Sampson [-@sampson_status_2005] for the years of 1911 - 1947 include assumed discards of Dover sole from other fisheries operating at the time in California and represent total removals in comparison to the data from CALCOM account for only landed Dover sole. To account for this difference in the input catches for California a retention block was applied for 1911 - 1947 that assumed 100 percent retention (i.e., no additional discarding would be assumed since the removals during this period represent landings + discards). 

### Commercial Discards

Data on discards of Dover sole are available from a few different data sources.  Multiple historical discard studies were used in the model: estimates for the California trawl fishery discarding rate in 1992 (Humbolt State Study), Oregon at-sea discarding study between 1959 - 1961 [@hermann_results_1963], Pikitch discard study in Oregon and Washington between 1985 - 1987, 1974 discard rate analysis in Oregon (Methot et al. [-@methot_jr_assessment_1990] based on TenEyck and Demory [-@teneyck_utilization_1975]), and discard observations from the West Coast Groundfish Observer Program (WCGOP). 

Brodziak et al. [-@brodziak_assessment_1997] described a discard study during 1989 - 1996 by researchers from Humboldt State University. Across 28 observed trips in California waters a total of 21,950 pounds of Dover sole were discarded from a total catch of 172,737 pounds. The authors did not specify what portions of the discards were due to the small size of the fish versus due to trip limits. 

Hermann and Harry [-@hermann_results_1963] conducted a discard study in Oregon examining at-sea and landed length observation for multiple years between 1950 - 1961 (6 sampled years). The data consisted of length frequency measurements taken at-sea and comparable measurements taken at the docks, after sorting and discarding of small unmarketable fish. Retained and discarded fish were estimated by converting observations to pounds using average weights. Estimates of the total length distribution measured at-sea and landed fish were used in previous assessments of Dover sole [@sampson_status_2005; @hicks_status_2011], however, these data were not available for evaluation in this assessment and were only included as 'ghost' observations (allows to see the implied data fits without being incorporated in the model likelihood estimation). Hermann and Harry [-@hermann_results_1963] report did include estimates of at-sea catches and landed Dover sole for each year. Discard rates for well sampled years, 1959 - 1961, were  retained for use in this assessment. The discarding rate per year ranged from 0.112 - 0.232.

Based on sampling at-sea during summer 1974 in Oregon waters, TenEyck and Demory [-@teneyck_utilization_1975] estimated age-specific retention rates and reported age-at-50-percent-retention of 7.4 years for male Dover sole and 6.9 years for females, equivalent to lengths at 50 percent retention of about 33 cm. Based on data from the 1974 study, Methot et al. [-@methot_jr_assessment_1990] reported that the fraction discarded on a weight basis was 0.167.

A trawl discard study conducted in 1985 - 1987, referred to as the Pikitch study, organized by Ellen Pikitch resulted in discard rates and length observations for various groundfish species including Dover sole [@pikitch_evaluation_1988]. The northern and southern boundaries of the study were $48^\circ 42^\prime$ N, latitude and $42^\circ 60^\prime$ N, latitude respectively, which is primarily within the Columbia INPFC area, falling within Oregon/Washington waters [@pikitch_evaluation_1988; @rogers_numerical_1992].  Participation in the study was voluntary and included vessels using bottom, midwater, and shrimp trawl gears.  Observers on commercial vessels collected the data, estimated the total weight of the catch by tow, and recorded the weight of species retained and discarded in the sample.  Results of the Pikitch discard study were processed and provided by John Wallace (personal communication, Northwest Fishery Science Center, NWFSC, NOAA) in the form of ratios of discard weight to retained weight of Dover sole and sex-specific length frequencies.   

The final data for discard rate and length observations is from the WCGOP.  This program is part of the NWFSC and has been recording discard observations starting in 2003. Since 2011, when the IFQ program was implemented, observer coverage rates increased to nearly 100 percent for all the limited entry trawl vessels in the program and discard rates declined compared to pre-2011 rates. Discard rates were obtained for both the IFQ catch-share (observed and electronic monitored vessels) and the non-catch share sector for Dover sole. A single discard rate was calculated by weighting discard rates based on the commercial landings by each sector.  Coefficient of variations were calculated for the non-catch shares sector and pre-catch share years by bootstrapping vessels within ports because the observer program randomly chooses vessels within ports to be observed. Post trawl rationalization, all catch-share vessels have 100 percent observer coverage and discarding is assumed to be known. 

The discard rates across all data sources for the California and the Oregon/Washington fleets are shown in Table \ref{tab:disc-rates} and Figures \ref{fig:ca-disc-ob} - \ref{fig:orwa-disc-len-ob-2}. The mean weights of discarded Dover sole from WCGCOP data are shown in Figures \ref{fig:ca-disc-wght-ob} and \ref{fig:orwa-disc-wght-ob}. The discard length observations from the Pikitch study (Oregon/Washington only) and WCGOP are shown in Figures \ref{fig:ca-disc-len-ob} and \ref{fig:orwa-disc-len-ob-2}. The observed lengths discarded and the overall discard rate by the California fleet in recent years appeared to have roughly two periods: 2011 - 2014 and 2015 - 2019. The discard rates from 2015 - 2019 were lower than the earlier IFQ years (Figure \ref{fig:ca-disc-ob}) with a higher proportion of smaller fish discarded (Figure \ref{fig:ca-disc-len-ob}, except 2017). The number of discard length observations in California in recent years (2015 - 2019, samples ranged from 82 - 733 per year) was lower than the earlier years (2011 - 2014, samples ranged from 618 - 1310 per year).  This may be due to both a decrease in discarding of Dover sole and increase in the number of vessels using electronic monitoring (EM) where EM vessels only carry observers 20 percent of the time. There was a similar decline in length discard samples from WCGOP for the 2015 - 2019 period for Washington/Oregon but not to the extent observed in California. However, the discard rates and length discarded in Oregon/Washington appeared relatively consistent across the IFQ period.    

The observed discard length observations by year and sex for Dover sole from the Pikitch study were limited. In order to reduce the noise in these data sex-specific observations were combined based on the assumption that discarding of small fish was not sex specific (there was no indication of this in the data).    

### Commercial Fishery Length and Age Data

The PacFIN Biological Data System (BDS) contains data for Dover sole from ODFW (1987-present) and WDFW (1967- present), but only 1989 - present data from California Department of Fish and Game (CDFG). In contrast for California, the CALCOM database contains earlier length (1969 - 1988) and age samples (1981 - 1989) that are not currently available in PacFIN. Expanded length and age data from CALCOM for all years available were provided by E.J. Dick (personal communication, SWFSC, NOAA). Since there were early samples that were available in CALCOM and not PacFIN, the CALCOM expanded length and ages were used in this assessment. Early model sensitivities were conducted reflected little difference in model estimates for Dover sole, a well sampled species with large landings, when the same years of data were used betwen PacFIN or CALCOM. 

Commercial length-frequency distributions based on the fishing year were developed for each state for years where observations were available. For each fleet, the raw observations (compiled from the PacFIN and CALCOM databases) were expanded to the sample level, to allow for any fish that were not measured, then to the trip level to account for the relative size of the landing from which the sample was obtained. The expanded length observations were then expanded by the landings in each state. Post-expanded length data were comined into a single fleet for Oregon/Washington. Age frequencies were computed in the same manner.

Length and age data collected from commercial landings for each state are summarized by the number of trips and fish sampled by year (Tables \ref{tab:com-len-samps} and \ref{tab:com-age-samps}). The lengths sampled by port for California are shown in Figure \ref{fig:ca-len-port} based on port information in PacFIN. While the model used length data from CALCOM due to the early years of data available, the years where CALCOM and PacFIN overlap the samples should be the same.  Length observations in California generally range between 30 - 50 cm with females consisting of a higher proportion of the larger sizes due to dimorphic growth (Figure \ref{fig:ca-len-data}). Observed average size had high large variance prior to 1988, due to lower input sample sizes, with the variance of observations in recent year being low (Figure \ref{fig:mean-ca-len-data}). The length composition data aggregated across years for the California fishery shows that a higher proportion of males are selected relative to females and the peak length of males selected is lower than the female peak size (Figure \ref{fig:agg-len-data}). 

The age samples by port in California are shown in Figure \ref{fig:ca-age-port} based on data in PacFIN. Due to limited ageing capacity no otoliths from California between 2010 - 2020 were able to be read for this assessment. The majority of read otoliths for California were sampled primarily from fish landed at the Crescent City port, followed by samples from the Eureka and Fort Bragg ports. The mean age of sampled fish fluctuated between 11 - 17 years of age across years with available age data from California (Figures \ref{fig:ca-age-data} and \ref{fig:mean-ca-age-data}). The peak age observed in aged fish for males and females were around 10 years of age  (Figure \ref{fig:agg-age-data}). 

Length and age data collected from commercial landings for Oregon and Washington are summarized by the number of trips and fish sampled by year (Tables \ref{tab:com-len-samps} and \ref{tab:com-age-samps}). The length samples by port for Oregon and Washington are shown in Figure \ref{fig:or-len-port} and \ref{fig:wa-len-port}. The observed range of lengths by sex (and unsexed) combined between Oregon and Washington primarily range between 35 - 45 cm prior to 1985 then  slightly shift to a larger range of selected fish from 1985 - present (Figure \ref{fig:orwa-len-data}).  The mean lengths observed across available data years also show the increased variance in early year samples and the lower mean size observed, around 35 cm in recent years (Figure \ref{fig:mean-orwa-len-data}).  The length composition data aggregated across years for the Oregon/Washington fishery shows a higher proportion of males are selected relative to females, similar to that observed in California, but even more extreme with a sharp peak for male selected around 30 cm (Figure \ref{fig:agg-len-data}). For clarity, the aggregated length figure shows both female and unsexed lengths plotted in the top section of the fleet specific panel where the unsexed lengths are plotted behind the female lengths.  There  unsexed length compositions from Oregon/Washington were primarily from early data years. 

The read otoliths by port from Oregon and Washington are shown in Figures \ref{fig:or-age-port} and \ref{fig:wa-age-port}. There are a reduced number of otoliths read from Oregon and Washington since the last assessment in 2011 due to limited ageing capacity (Table \ref{tab:com-age-samps}). The mean age of sampled fish across all years ranged between 11-14 years of age in Oregon and Washington (Figures \ref{fig:orwa-age-data} and \ref{fig:mean-orwa-age-data}. The peak age observed in aged fish for males and females were around 10 years of age similar to the California fleet observations (Figure \ref{fig:agg-age-data}).  

The input sample sizes for each fleet in the model were calculated via the Stewart method (Ian Stewart, personal communication):

\begin{centering}

Input effN = $N_{\text{trips}} + 0.138 * N_{\text{fish}}$ if $N_{\text{fish}}/N_{\text{trips}}$ is $<$ 44

Input effN = $7.06 * N_{\text{trips}}$ if $N_{\text{fish}}/N_{\text{trips}}$ is $\geq$ 44

\end{centering}

To avoid double use of the length and age data from individual fish, the length and age data sources were each given 0.50 weight in the likelihood calculations when model fitting.  

<!--chapter:end:21f-.Rmd-->

## Fishery-Independent Data

Data from four research surveys have been used in this assessment to provide fishery-independent information about the abundance, distribution, and biological characteristics of Dover sole.  The longest time series of fishery independent data arises from the NWFSC West Coast Groundfish Bottom Trawl Survey (WCGBTS) which began in 2003. This survey samples the shelf and slope off the U.S. West Coast covering depths from 30 - 700 fathoms (55 - 1,280 meters) on an annual basis (excluding 2020 due to COVID-19). This assessment also used data from three additional fishery-independent surveys: \gls{s-tri}, \gls{s-aslope}, and \gls{s-nwslope}. The \gls{s-tri} began in 1980 and repeated every three years through 2004.  The \gls{s-aslope} conducted tows on the U.S. West Coast slope area using the research vessel R/V _Miller Freeman_, starting in 1996 for a subset of the coastline with full coverage between 1997 - 2001. The final survey, \gls{s-nwslope}, was a cooperative survey using commercial fishing vessels which began in 1998 as a survey for deepwater species (Dover sole, longspine thornyhead, shortspine thornyhead, and sablefish) survey and was expanded to other groundfish in 1999. 

### \acrlong{s-wcgbt} {#nwfsc-wcgbt}

The \gls{s-wcgbt} is based on a random-grid design; covering the coastal waters from a depth of 55 - 1,280 m [@bradburn_2003_2011]. This design generally uses four industry-chartered vessels per year assigned to a roughly equal number of randomly selected grid cells and divided into two 'passes' of the coast. Two vessels fish from north to south during each pass between late May to early October. This design therefore incorporates both vessel-to-vessel differences in catchability, as well as variance associated with selecting a relatively small number (approximately 700) of possible cells from a very large set of possible cells spread from the Mexican to the Canadian borders.

Dover sole are observed across a wide depth range with the largest and oldest individuals often being found in deeper depths (Figures \ref{fig:data-len-depth}, \ref{fig:data-age-depth}, and \ref{fig:cpue-len}). The majority of tows between 100 - 700 m observed Dover sole (Figure \ref{fig:pos-tows-sex-ratio}).  The sex ratio across depths varied with greater than 50 percent of the fish sampled between 200 - 800 m being male Dover sole, with observations of females dominating deeper depths. 

The data from the \gls{s-wcgbt} was analyzed using a spatio-temporal delta-model [@thorson_geostatistical_2015], implemented as an R package, VAST [@thorson_comparing_2017], which is publicly available [online](https://github.com/James-Thorson/VAST).  Spatial and spatio-temporal variation is specifically included in both encounter probability and positive catch rates, a logit-link for encounter probability and a log-link for positive catch rates.  Vessel-year effects were included for each unique combination of vessel and year in the data to account for the random selection of commercial vessels used during sampling [@helser_generalized_2004; @thorson_accounting_2014]. Spatial variation was approximated using 500 knots, and the model used the bias-correction algorithm [@thorson_implementing_2016] in Template Model Builder [@kristensen_tmb:_2016]. 

Data collected by the \gls{s-wcgbt} were used to generate an index of abundance from 2003 - 2019. The estimated index of abundance is shown in Table \ref{tab:indices} and Figure \ref{fig:wcgbt-index}.   The gamma distribution with random strata-year, pass, and vessel effects had the lowest AIC and was chosen as the final model. The Q-Q plot does not show meaningful departures from the assumed distribution (Figure \ref{fig:wcgbt-qq}) with no clear pattern in residuals (Figure \ref{fig:wcgbt-resid}).  The indices for the \gls{s-wcgbt} show a generally flat trend with a possible slight dip around 2010.  A comparison between the VAST and design based indices of abundance are shown in Figure \ref{fig:db-vs-vast}. The area stratification used in the design-based index calculation is shown in Table \ref{tab:wcgbts-strata}.

Length compositions were expanded based upon the stratification and the age data were used as conditional age-at-length data.  The number of tows that collected length measurements of Dover sole ranged between 400 - 600 tows per year (Table \ref{tab:wcgbt-len-samps}) with ages collected for Dover sole in nearly every tow length data were collected (Table \ref{tab:wcgbt-age-samps}). The reduced number of tows with lengths or age data collected in 2019 was due to a reduction in survey effort in that year alone (2 vessels vs. 4 vessels used for all other years).  

The expanded length frequencies by sex are shown in Figure \ref{fig:wcgbt-len-data}.  The mean length by year decreased between 2003-2005, increased until approximately 2012, and has been stable at a lower mean size from 2013-2019 (Figure \ref{fig:mean-wcgbt-len-data}). The age frequencies by sex are shown in Figure \ref{fig:wcgbt-age-data} and the mean age across years are shown in Figure \ref{fig:mean-wcgbt-age-data}. The length data aggregated across years shows a peak in the length observations of males between 30 - 35 cm (Figure \ref{fig:agg-len-data}). There was a wide range of female lengths observed and no clear peak.  

Fish with ages also have an associated length and each type of data have been used in the model. Age data from the \gls{s-wcgbt} were used as conditional-age-at-length data within the model, which avoids double use of fish with length and an age observation by explicitly stating the length associated with each aged fish.  Hence, the length and conditional-age-at-length data from the \gls{s-wcgbt} were given full weight in likelihood calculations when model fitting. 

The input sample sizes for length and marginal age-composition data for all fishery-independent surveys were calculated according to Stewart and Hamel [-@stewart_bootstrapping_2014], which determined that the approximate realized sample size for flatfish species was $3.09*N_{\text{tow}}$. The effective sample size of conditional-age-at-length data was set at the number of fish at each length by sex and by year. The conditional-age-at-length data were not expanded and were binned by according to length, age, sex, and year.


### \acrlong{s-tri}

The \gls{s-tri} was first conducted by the \gls{afsc} in 1977, and the survey continued until 2004 [@weinberg_2001_2002]. Its basic design was a series of equally-spaced east-to-west transects across the continental shelf from which searches for tows in a specific depth range were initiated. The survey design changed slightly over time. In general, all of the surveys were conducted in the mid summer through early fall. The 1977 survey was conducted from early July through late September. The surveys from 1980 through 1989 were conducted from mid-July to late September. The 1992 survey was conducted from mid July through early October. The 1995 survey was conducted from early June through late August. The 1998 survey was conducted from early June through early August. Finally, the 2001 and 2004 surveys were conducted from May to July.

Haul depths ranged from 91 - 457 m during the 1977 survey with no hauls shallower than 91 m. Due to haul performance issues and truncated sampling with respect to depth, the data from 1977 were omitted from this analysis. The surveys in 1980, 1983, and 1986 covered the U.S. west coast south to 36.8\textdegree N. latitude and a depth range of 55 - 366 m. The surveys in 1989 and 1992 covered the same depth range but extended the southern range to 34.5\textdegree N. latitude (near Point Conception). From 1995 through 2004, the surveys covered the depth range 55 - 500 m and surveyed south to 34.5\textdegree N. latitude. In 2004, the final year of the \gls{s-tri} series, the \gls{nwfsc} \gls{fram} conducted the survey following similar protocols to earlier years. Due to changes in survey timing, the \gls{s-tri} data have been split into independent early (1980 - 1992) and late (1995 - 2004) survey time series. The split of the time series was done in the base model via a shift in catchability (Q) between the 1992 and 1995 survey years.

Data collected by the \gls{s-tri} were used to generate an indices of abundance using VAST, described above in Section \ref{nwfsc-wcgbt}. Spatial variation was approximated using 500 knots and the model used the bias-correction algorithm [@thorson_implementing_2016] in Template Model Builder [@kristensen_tmb:_2016]. The indices of abundance were estimated using VAST separately for the early and late periods of the survey. The estimated early and late indices of abundance are shown in Table \ref{tab:indices} and Figures \ref{fig:tri-early-index} and \ref{fig:tri-late-index}.  The lognormal distribution with random strata-year and vessel effects had the lowest AIC and was chosen as the final model. The Q-Q plots examining potential departure from the assumed distribution are shown in Figures \ref{fig:tri-early-qq} and \ref{fig:tri-late-qq}. The Q-Q plot for the early period did not show meaningful departures from the assumed distribution, however, the late period Q-Q plot had some departures from expected but there was no  clear pattern in residuals (Figures \ref{fig:tri-early-resid} and \ref{fig:tri-late-resid}).  The indices for the early and late periods of the \gls{s-tri} were generally flat with a slight increase in 2001 and a sharp increase in 2004. The 2004 data point increased at a rate beyond what may be anticipated for a longer lived flatfish life history such as Dover sole.  A similar spike in abundance in 2004 has been observed for other species sampled (e.g., petrale sole) observed in the \gls{s-tri} which may be indicative of a change in the application of the survey rather than an increase in biomass. A comparison between the VAST and design based indices of abundance are shown in Figure \ref{fig:db-vs-vast}. The area stratification used in the design-based index calculation are shown in Tables \ref{tab:tri-early-strata} and \ref{tab:tri-late-strata}.

Length bins from 8 to 60 cm in 2 cm increments were used to summarize the length frequency of the survey catches in each year. Tables \ref{tab:tri-early-len-samps} and \ref{tab:tri-late-len-samps} shows the number of lengths taken by the survey per year. The length frequency distributions for the \gls{s-tri} from 1980 - 2004 are shown in Figure \ref{fig:tri-len-data}. The stratifications for length data expansions are provided in Tables \ref{tab:tri-early-strata} and \ref{tab:tri-late-strata}. The mean length observed by year is show in Figure \ref{fig:mean-tri-len-data}. The lengths aggregated by sex are shown in Figure \ref{fig:agg-len-data}. 

There are no Dover sole age data from the \gls{s-tri}.  

The input sample sizes for length data were calculated using the same approach for the \gls{s-wcgbt} data described in Section \ref{nwfsc-wcgbt}. 

### \acrlong{s-aslope}

The \gls{s-aslope} operated during the months of October to November aboard the R/V _Miller Freeman_. Partial survey coverage of the U.S. west coast occurred during the years 1988 - 1996 and complete coverage (north of $34^\circ 30^\prime$ N. latitude) during the years 1997 and 1999-2001. Typically, only these four years that are seen as complete surveys are included in groundfish stock assessments.

Data collected by the \gls{s-aslope} were used to generate an indices of abundance using VAST, described above in Section \ref{nwfsc-wcgbt}. Spatial variation was approximated using 500 knots, and the model used the bias-correction algorithm [@thorson_implementing_2016] in Template Model Builder [@kristensen_tmb:_2016]. The estimated index of abundance is shown in Table \ref{tab:indices} and Figure \ref{fig:afsc-index}.  The gamma distribution with random strata-year and vessel effects had the lowest AIC and was chosen as the final model. The Q-Q plots do not show any meaningful departures from the assumed distribution (Figure \ref{fig:afsc-qq}) with no clear pattern in residuals (Figure \ref{fig:afsc-resid}).  The index for the \gls{s-aslope} was generally flat with a slight increase in 2001. A comparison between the VAST and design based indices of abundance are shown in Figure \ref{fig:db-vs-vast}. The area stratification used in the design-based index calculation is shown in Table \ref{tab:afsc-strata}.

Length bins from 8 to 60 cm in 2 cm increments were used to summarize the length frequency of the survey catches in each year. Table \ref{tab:afsc-len-samps} shows the number of lengths taken by the survey per year. The length frequency distributions for the \gls{s-aslope} are shown in Figure \ref{fig:afsc-len-data}. The stratifications for length data expansions are provided in Table \ref{tab:afsc-strata}. The mean length observed by year is show in Figure \ref{fig:afsc-len-data}. The lengths aggregated by sex show a peak in males observed around 30 cm with a wide range of female lengths being observed with a slight peak around 30 cm and a second peak around 40 - 45 cm (Figure \ref{fig:agg-len-data})

During the 2011 STAR panel review, an issue with the \gls{s-aslope} age data was identified. Aged fish for Dover sole did not appear to be a representative sample of the lengths observed and these data were not used in the 2011 assessment. Additional explorations were conducted examining these data for use in this assessment and a similar conclusion was reached that the length of aged fish did not appear to be a random representative sample of all observed lengths. These data were not used in this assessment.

The input sample sizes for length data were calculated using the same approach for the \gls{s-wcgbt} data described in Section \ref{nwfsc-wcgbt}. 

### \acrlong{s-nwslope}

The \gls{s-nwslope} covered waters throughout the summer from 183 m to 1,280 m north of $34^\circ 30^\prime$ N. latitude, which is near Point Conception, from 1999 and 2002. The survey sampled 80 fixed east - west transects of latitude, separated by 10 minutes of latitude.  Five stations in each transect were selected from two depth categories: shallow strata (184 - 549 m) and deep strata (550 - 1,280 m). There were a total of 400 possible stations to sample from each year, with 302 - 327 successful tows on average per year. The survey was conducted from mid-August to mid-October in 1998 but was somewhat earlier in 1999 and 2000 (late-June to late- September). 

Data collected by the \gls{s-nwslope} were used to generate an indices of abundance using VAST, described above in Section \ref{nwfsc-wcgbt}. Spatial variation was approximated using 500 knots, and the model used the bias-correction algorithm [@thorson_implementing_2016] in Template Model Builder [@kristensen_tmb:_2016]. The estimated index of abundance is shown in Table \ref{tab:indices} and Figure \ref{fig:nwfsc-index}.  The gamma distribution with random strata-year and vessel effects had the lowest AIC and was chosen as the final model. The Q-Q plots do not show any meaningful departures from the assumed distribution (Figure \ref{fig:nwfsc-qq}) with no clear pattern in residuals (Figure \ref{fig:nwfsc-resid}).  The index for the \gls{s-nwslope} was generally flat with a slight increase in 2002. A comparison between the VAST and design based indices of abundance are shown in Figure \ref{fig:db-vs-vast}. The area stratification used in the design-based index calculation is shown in Table \ref{tab:nwfsc-strata}.

Length bins from 8 to 60 cm in 2 cm increments were used to summarize the length frequency of the survey catches in each year. Table \ref{tab:nwfsc-len-samps} shows the number of lengths taken by the survey per year. The length frequency distributions for the \gls{s-nwslope} are shown in Figure \ref{fig:nw-slope-len-data}. The stratifications for length data expansions are provided in Table \ref{tab:nwfsc-strata}. The mean length observed by year ranged between 33 - 36 cm and is show in Figure \ref{fig:mean-nw-slope-len-data}. The selected lengths aggregated across years by the \gls{s-nwslope} was similar to the lengths observed by the other slope survey \gls{s-aslope} (Figure \ref{fig:agg-len-data}). 

Age data from the \gls{s-nwslope} were used as conditional age-at-length age data within the model. Table \ref{tab:nwfsc-age-samps} show the number of ages taken by the survey per year. The age frequency observed by the \gls{s-nwslope} ranged between 2-60 years of age with a median age of 13 and 10 for females and males, respectively (Figures \ref{fig:nw-slope-age-data} and \ref{fig:mean-nw-slope-age-data}).

The input sample sizes for length data were calculated using the same approach for the \gls{s-wcgbt} data described in Section \ref{nwfsc-wcgbt}. The effective sample size of conditional-age-at-length data was set at the number of fish at each length by sex and by year. The conditional-age-at-length data were not expanded and were binned by according to length, age, sex, and year.


<!--chapter:end:21s-.Rmd-->

## Biological Data

### Natural Mortality

Natural mortality is a parameter that is often highly uncertain in fish stocks.  There are no current published estimates of natural mortality, aside from what has been used in previous assessments which were based upon maximum ages.  Assessments of Dover sole off the West Coast in 1997 and 2005 both fixed this parameter at 0.09 yr^-1^ for both males and females [@brodziak_assessment_1997; @sampson_status_2005]. The 2011 assessment estimate natural mortality at 0.117 yr^-1^ for females and 0.142 yr^-1^ for males [@hicks_status_2011]. 

Hamel [-@hamel_method_2015] developed a method for combining meta-analytic approaches relating the $M$ rate to other life-history parameters such as longevity, size, growth rate, and reproductive effort to provide a prior on $M$. In that same issue of *ICES Journal of Marine Science*, Then et al. [-@then_evaluating_2015] provided an updated data set of estimates of $M$ and related life history parameters across a large number of fish species from which to develop an $M$ estimator for fish species in general. They concluded by recommending $M$ estimates be based on maximum age alone, based on an updated Hoenig non-linear least squares estimator $M = 4.899A^{-0.916}_{max}$. The approach of basing $M$ priors on maximum age alone was one that was already being used for West Coast rockfish assessments. However, in fitting the alternative model forms relating $M$ to $A_{\text{max}}$, Then et al. [-@then_evaluating_2015] did not consistently apply their transformation. In particular, in real space, one would expect substantial heteroscedasticity in both the observation and process error associated with the observed relationship of $M$ to $A_{\text{max}}$. Therefore, it would be reasonable to fit all models under a log transformation. This was not done. Re-evaluating the data used in Then et al. [-@then_evaluating_2015] by fitting the one-parameter $A_{\text{max}}$ model under a log-log transformation (such that the slope is forced to be -1 in the transformed space [@hamel_method_2015]), the point estimate for $M$ is:

\begin{centering}

$M=\frac{5.4}{A_{\text{max}}}$

\end{centering}

The above is also the median of the prior. The prior is defined as a lognormal distribution with mean $ln(5.4/A_{\text{max}})$ and standard error = 0.438.  The maximum age was selected based on available age data from all West Coast data sources. The oldest aged Dover sole was 69 years, captured by the commercial fishery in 1989. Examining all aged fish a maximum age of 50 was selected. Across all data sources there were limited observation greater than 50 years of age (79 observations in total). In the fish that have been aged from the \Gls{s-wcgbt} there have been 41 observations of fish greater that 50 years old (25 females and 16 males). There was little support for a sex-specific differences in maximum age. However, age data are subject to ageing error which could impact this estimate of longevity.  Using a maximum age of 50, the median of the prior was 0.108 yr^-1^ with an standard error of 0.48, the default value of the Hamel [-@hamel_method_2015] method.
  

### Maturation and Fecundity

Estimates of maturity at length and age have been variable between studies.  Hagerman [-@hagerman_biology_1952] reported that 50 percent of 35 cm female Dover sole were mature with 100 percent maturity-at-length of 45 cm.  Yoklovich and Pikitch [-@yoklavich_reproductive_1989] reported a smaller size at 50 percent maturity.  Hunter et al. [-@hunter_fecundity_1992] reported that different collection times and methods of analysis resulted in different estimates of maturity at length and suggest that differences reported between Hagerman [-@hagerman_biology_1952] and Yoklavich and Pikitch [-@yoklavich_reproductive_1989] may have been due these differences rather than changes in maturity.  Brodziak and Mikus [-@brodziak_variation_2000] found significant north-south differences in maturity curves derived for INPFC areas, with fish maturing at smaller sizes in the north.  Their estimate of length at 50 percent maturity was less than 35 cm, as reported by Hagerman [-@hagerman_biology_1952].

The maturity-at-length assumed in this assessment was based on new Dover sole maturity reads conducted by Melissa Head (NWFSC, NOAA) examining a total of 428 samples collected by the \gls{s-wcgbt} survey. The 50 percent size-at-maturity was estimated at 32.8 cm and slope of -0.28 with maturity asymptoting to 1.0 for larger fish. The shape of the new maturity-at-length and a comparison to the maturity curve used in the 2011 assessment is shown in Figure \ref{fig:compare-mat-at-len}. The new maturity-at-length curve was based on the estimate of functional maturity, an approach that classifies maturity with developing oocytes as mature or immature based on the proportion of vitellogenin in the cytoplasm and the measured frequency of atretic cells (Melissa Head, personal communication, NWFSC, NOAA). 

Maturity-at-length was examined spatially splitting Dover sole samples into north and south of Point Reyes off the California coast (approximately $38^\circ 0^\prime$ N. Lat.).  Spatial difference in life history traits is commonly observed in groundfish species off the West Coast.  The northern group had 334 maturity samples and the southern group had 94 maturity samples. The estimated length at 50 percent maturity were significantly different for fish in the north and south, with fish in the south maturing at larger sizes (39.84 cm) relative to fish in the north (31.23 cm, Figure \ref{fig:spat-mat-at-len}). These results are consistent in trend with those from Brodziak and Mikus [-@brodziak_variation_2000] who also determined that fish in the north appear to mature at smaller sizes relative to fish in the south.  The size and age of fish observed in shallower depths (less than 400 m) varies between the north and south (Figure \ref{fig:samples-north-south}). In the north a wide range of sizes and ages are observed at shallower depths, while only younger and smaller fish are observed at shallower depths in the south. This pattern in sizes and age are also apparent when looking at all observations of Dover sole by the \gls{s-wcgbt} (Figure \ref{fig:fish-by-lat}) with a distinct break in observations around San Francisco, just south of Point Reyes. The mechanisms leading to these differences across the coast are unclear. This maturity analysis only evaluated data on a coastwide basic or split into two areas, future work should be done to determine if differences in maturity slowly changes across latitude vs. distinct changes by area.    

This assessment did not account for these spatial differences in maturity and assumed a homogeneous population structure for Dover sole off the West Coast due to challenges in the ability to split data by area combined with the uncertain spatial migration patterns of Dover sole off the West Coast. Future analysis should be conducted to further understand potential patterns in life history traits across the coast combined with tagging studies which could provide insight in movement.    

Fecundity is related to body size of Dover sole. Yoklavich and Pikitch [-@yoklavich_reproductive_1989] estimated fecundity of Dover sole off the Oregon coast reporting that 40 cm female produce about 40,000 oocytes and a 55 cm female produce about 160,000 oocytes.  Hunter et al. [-@hunter_fecundity_1992] estimated the fecundity of Dover sole samples off the coasts of Oregon and California and found no statistical difference in the fecundity by area and estimated no statistical difference in Oregon between their results and those from Yoklavich and Pikitch [-@yoklavich_reproductive_1989].

The relationship of fecundity to weight concluded by Yoklavich and Pikitch [-@yoklavich_reproductive_1989] was nearly linear when translated from length to weight. Based on the work of Yoklavich and Pikitch [-@yoklavich_reproductive_1989] fecundity was assumed to be equal to body weight in this assessment (e.g., spawning output equal to spawning biomass).  


### Length-Weight Relationship

Weight-at-length data collected by the \gls{s-wcgbt} were used to externally estimate weight-length relationship for both sexes of Dover sole.  Weight-at-length was generally similar between females and males (Figure \ref{fig:est-len-wght}).  Males were estimated to weigh more at the larger lengths (>40 cm) compared to females.  However, the majority of observations of fish greater than 50 cm are predominated by female fish because males generally do not tend to grow as large in comparison. The following estimate of the weight-at-length relationship was used by sex in this assessment:

\begin{centering}

Females: $\alpha$ = 2.97e-06; $\beta$ = 3.33

Males: $\alpha$ = 2.6e-06; $\beta$ = 3.37

\end{centering}

where weight is measured in grams and length in cm.

### Growth (Length-at-Age)

The length-at-age was estimated for male and female Dover sole using data collected from the \Gls{s-wcgbt} survey. Figure \ref{fig:est-len-at-age} shows the lengths and ages for all years and all data as well as predicted von Bertalanffy fits to the data. Females grow larger reaching a maximum around 48 cm, while males reach maximum size around 43 cm. However, there is considerable variation in length-at-age for both sexes. 

Brodziak and Mikus [-@brodziak_variation_2000] reported differences in growth curves between some INPFC areas using data collected on the continental slope (183 - 1280 m).  Using data collected during the \Gls{s-wcgbt} (55 - 1280m) variation in length-at-age was investigated for four different regions along the coast: south of Point Conception, north of Point Conception to the California/Oregon border, Oregon, and Washington.  Figure \ref{fig:est-len-at-age-region} shows the differences between female and male growth curves in each of these areas. The $L_{\infty}$ for males south of Point Conception was the largest of the areas, although the differences in maximum size were relatively small. The difference is sizes for females was also minimal, with females generally reaching larger sizes in the northern areas. 

Coastwide sex-specific growth parameters were externally estimated at the following values:

\begin{centering}

Females $L_{\infty}$ = 48.5; $L1$ = 11.1 cm; $k$ = 0.117 per year

Males $L_{\infty}$ = 43.1 cm; $L1$ = 15.5 cm; $k$ = 0.106 per year

\end{centering}

These values were used as starting parameter values within the base model prior to estimating each parameter for male and female Dover sole.

The \gls{s-wcgbt} was used to examine the variation in length-at-age by year. The base model assumes that length-at-age and weight-at-age were static across the modeled years.  However, if there are significant variations in growth by year that are not accounted for in the model, could result in bias parameter and model estimates due to the model attributing patterns in the data to other sources (e.g., recruitment, growth parameters). Variations in growth by year could result from annual recruitment strength or positive and negative oceanographic conditions. The \gls{s-wcgbt} data did not indicate large meaningful variations in observed length-at-age or weight-at-age across the survey years (Figures \ref{fig:tv-len-at-age} and \ref{fig:tv-wght-at-age}). 


### Sex Ratio

The sex ratio observed by depth showed interesting patterns.  First, because males grow to a smaller size, the proportion of females at intermediate lengths is less than 50 percent, and is 100 percent at larger lengths (Figure \ref{fig:sex-by-len}).  This inter-plays with the pattern of larger fish in deeper water and results in fewer females at intermediate depths (250-750 m) and nearly all females in the deepest depths (Figure \ref{fig:fem-by-lat-depth}).  Sex ratio was slightly variable over latitude but showed no specific pattern (Figure \ref{fig:fem-by-lat-depth}). The assessment assumed a sex ratio of 50:50 at the time of settlement. 


### Ageing Precision and Bias

Uncertainty surrounding the age-reading error process for Dover sole was incorporated by estimating ageing error by age. Age-composition data used in the model were from break-and-burn otolith reads. In the early years of data, age reads based on scales reads, however, after examining the distribution of ages by length there were concerns about the potential bias in these data (Figure \ref{fig:scale-age}). These age reads were not used in the base model and were not used in the 2005 or 2011 assessments of Dover sole.  

Aged Dover sole used in the assessment we aged by either the Cooperative Ageing Project (CAP) in Newport, Oregon or the California Department of Fish and Wildlife (CDFW). Otoliths collected by each survey, Oregon fishery, and Washington fishery data were read by the CAP ageing lab. Otoliths collected from the California fishery were aged by CDFW.  Within lab ageing error was estimated for both CAP and CDFW. Break-and-burn double reads of more than 8,000 otoliths were provided by the CAP lab (unpublished data) and 160 double reads from CDFW (unpublished data).  An ageing error estimate was made based on these double reads using a computational tool specifically developed for estimating ageing error [@punt_quantifying_2008] and using release 1.1.0 of the R package \href{https://github.com/nwfsc-assess/nwfscAgeingError}{nwfscAgeingError} [@thorson_nwfscageingerror:_2012] for input and output diagnostics. A linear standard error was estimated by age where there is more variability in the age of older fish (Figure \ref{fig:age-error}). Sensitivities to alternative ageing error estimates (curvlinear relationship with age) were conducted during model development and the model was was relatively insensitive to alternative ageing error assumptions. 


## Environmental and Ecosystem Data

This assessment did not explicitly incorporate environmental data. 

<!--chapter:end:22biology.Rmd-->

# Assessment Model

## Summary of Previous Assessments and Reviews


### History of Modeling Approaches 

The previous assessment of Dover sole was conducted in 2011 [@hicks_status_2011] estimated the fractio unfished of Dover sole off the U.S. west coast at 84 percent, well above the target biomass (25 percent of unfished).  The 2011 assessment modeled the Dover sole using three state-specific fishing fleets with four fishery-independent surveys. The model estimated sex-specific natural mortality, growth, and selectivity. The 2011 assessment of Dover sole included some new concepts, mainly new features of Stock Synthesis at the time. Selectivity curves for both slope surveys were modeled using cubic splines which allows for greater flexibility in the shape of selectivity. The sex-specific selectivities were estimated where female selectivity was not forced to asymptote at 1.0, allowing for the possibility of differential maximum selection by sex. The estimate of spawning biomass of 393,507 mt in 2011 was highly uncertain the 95 percent confidence interval ranging between with the 81,000 - 705,000.  This estimated stock size was considerably higher than the final year spawning biomass in from the 2005 assessment of 188,987 mt.

The 2005 assessment of Dover sole also concluded that the biomass of Dover sole off of the U.S. west coast was well above the target biomass (40 percent management target at that time), at 63 percent of unfished biomass [@sampson_status_2005].  The 2005 assessment assumed a different fishery fleet structure from that used in 2011. Two fisheries fleets, a southern fleet from Eureka to Conception and a northern fleet from U.S. Vancouver to Columbia based on International North Pacific Fisheries Commission was assumed, with sex-specific, domed selection curves based on length for each fleet. This assessment used three survey time-series with dome-shaped sex-specific selectivity with female Dover sole never being fully selected (maximum selectivity less than 1.0).


### Response to the 2011 STAR Panel Recommendations and SSC 

*General Research Recommendations*

**Recommendation**: Complete and review the Washington catch reconstruction and review the California and Oregon catch reconstructions. The accuracy and wide availability of consistent basic information is essential to the development of Pacific coast assessments. In addition to the raw data, the reliability and availability of more spatially dis-aggregated forms of the data should be investigated to determine if they could be used to develop more spatially explicit models without causing sacrifices in accuracy.

**Response**: In 2016 a [groundfish historical catch reconstruction workshop](https://www.pcouncil.org/documents/2017/03/i2_att1_catch_reconstruction_workshop_report_mar2017bb.pdf/) was held to review catch reconstructions (landings prior to 1981) for California, Oregon, and Washington. During this workshop a divergence in approaches between California and Oregon catch reconstructions was identified. The California catch reconstruction did not include fish caught north of the California/Oregon border by trawlers that landed at ports in California between 1948 - 1968 and these fish were not accounted in the Oregon catch reconstruction. Flatfish (petrale sole and Dover sole) were approximately 75 percent of these landings. Estimates of these landings attributed to Dover sole were provided by Dr. John Field and were added to historical catches for the Oregon/Washington fleet in this assessment. Additionally, while California has created catch reconstruction for many species going back to the early 1900s, Dover sole historical catches are not available prior to 1948.  Future assessments of Dover sole would benefit from extending the catch reconstruction to earlier years, especially for species that have experienced long time series of exploitation. WDFW is still undertaking efforts to develop historical catch reconstructions for groundfish species landed in Washington's waters and significant progress has been made. After discussions with WDFW it was determined that the historical catches used in the 2011 assessment still represented the best estimates of Dover sole removals. 


**Recommendation**: The difficulties encountered in the Dover sole assessment and some other flatfish assessments with respect to the linkage between selectivities require addressing. Although in many instances sized based selectivity may be appropriate, when sexes separate spatially there is a requirement for models to at least be able to investigate complete independence between genders. It is important that this be implemented in an updated version of Stock Synthesis.

**Response**: Stock Synthesis now provides additional flexibility in the parameterization of sex-specific selectivity curves for both the double normal and logistic selectivity functions. To take advantage of this new flexibility fleets in this assessment assumed double normal selectivity parameterization.  The new approach in Stock Synthesis allows the user to specify a sex (male or female) to apply the main parameter lines with the other sex being estimated as offsets from the main selectivity curve.  The offset selectivity estimates sex-specific parameters for the peak, ascending width, descending with, final selectivity, and a scale parameter.   


**Recommendation**: The panel investigated the use of age-specific natural mortality in both assessments presented during the STAR panel. In each case, one of the reasons for exploring different mortality schedules was the difficulty in fitting the imbalanced abundance at age information (as seen through residuals to fits), either in the sex ratio at older ages (Dover sole) or the ratio of young to old fish (sablefish). The use of Lorenzen M based on a decline in natural mortality by the inverse of the growth rate implies a link with predation; however, wider use and development of some guidance on the appropriateness of the implementation in other stock assessments should be investigated.

**Response**: Alternative parameterization of natural mortality by age and sex were explored during model development. Assuming either Lorenzen natural mortality or linear changes in natural mortality at age had limited impact in model estimates and generally did not result in large improvements in the fits to data. Estimating natural mortality for Dover sole was challenging in general due to variable observations by sex, size, and age resulting from complex ontogenetic movement patterns.


**Recommendation**: Currently the only available error distribution for age information is the multinomial probability function. It appears that this may have some impact with respect to underestimating strong year classes and it would be desirable to explore the use of alternative error assumptions in order to analyze survey information, in particular where variance estimates in catches-at-age may be less than independent on abundance.

**Response**: The current verion of Stock Synthesis now allow for either multinomial or a Dirichlet Multinomial error distribution (linear or saturation). Both of the Dirichlet Multinomial parameterizations were explored during model development. The Dirichlet Multinomial approach in Stock Synthesis incorporates data weighting via an estimated parameter into the error distribution. The estimated parameter for data weight for each data source and type had issues of hitting the upper data weight bound (1.0). This method does not appear to work as intended for Dover sole.       


**Recommendation**: There should be new studies of maturity by length and age based on more comprehensive coastwide and depth-based sampling and using histological techniques for determining maturity stage. Given that there is uncertainty regarding the temporal stability of maturity schedules, there should be periodic monitoring to explore for changes in maturity.

**Response**: A new coastwide estimate of functional maturity was developed for use in this assessment.  The new functional maturity estimate of length at 50 percent maturity was similar to the assumed maturity in the 2011 assessment, however, the new slope reflected a more gradual increase in maturity-at-length. This new analysis also identified large spatial differences in maturity-at-length and -age spatially north and south of Point Reyes in California. This assessment did not explicitly account for this potential difference in maturity-at-length due to limited information on Dover sole movement patterns (latitudal or/and water depth).  Additionally, the fine scale information of historical data (catches, lengths, and age) creates challenges from splitting data by area.  Additional, research should be conducted to evaluate movement and the variation in life history traits in Dover sole off the West Coast to improve future assessments. 


**Recommendation**: Update the STAR Terms of Reference (TOR) to ensure that assessment documents include standard plots (or tables) of likelihood profiles that include likelihood components by data source and fleet. Such plots are an important diagnostic tool for displaying tensions among data sources profiles. 

**Response**: The groundfish assessment TOR now requires standardized tables and figures and are provided in this assessment. Likelihood tables with the contribution by data type for the base model and each sensitivity are provided.

*Recommendations Specific to Dover sole*

**Recommendation**: Researching ageing error, particularly aging bias, is important for Dover sole given the current base models difficulty with reconciling some tensions between different data sources regarding the sex ratio at the oldest ages. In addition, the ability of the model to track cohorts accurately would be significantly disrupted if there were severe size-based bimodality in cohorts caused by vastly different times of settlement (Dover sole are thought to have a larval period of 6 - 18 months). Consequently, larval period should also be examined.

**Response**: A new ageing analysis was conducted for otoliths read by the CAP lab and CDFW. The ageing error analysis for otoliths read by the CAP lab consisted of over 8,000 double reads of Dover sole otoliths. The ageing error analysis for otoliths read by CDFW used the same data that were available in 2011. In regards to age at settlement, Stock Synthesis now provides the ability to account for this explicitly.  A range of alternative age at settlement and timing were explored during model development. Model fits to data did not appreciably improve across these sensitivities.  Additionally, estimates across models were similar with the base model where the main difference appeared to be the years associated with particular recruitment deviation.    


**Recommendation**: For the \gls{s-wcgbt}, raw age and length information appeared to imply persistently different sex ratios when viewed in isolation. The concern is that there is some unrepresentative sampling occurring in the age distribution as ages are sub-sampled from length. The sampling procedure should be investigated more closely and potentially improved.

**Response**: Examinations of the \gls{s-wcgbt} data were conducted examining the observations by sex across depths and examining potential non-representative sampling by sex, length, and age.  The sex ratio across depths for Dover sole are approximately 50:50 at shallower depth sampled by the survey, shifting to a higher proportion of males observed in mid-depths (300 - 800 m), and then shifting to a higher proportion of females at the deepest depths. This sex ratio pattern was observed across all of the four surveys used in this assessment implying a biological mechanism rather than non-representative sampling. 

**Recommendation**: The conclusions of the NMFS workshop on developing priors on catchability were not available to the Panel. These should be made available and the information reconsidered specifically with respect to Dover sole, in an attempt to reconcile the relatively low catchability estimates for the surveys, particularly the NWFSC WCGBT survey which is thought to cover the majority of the stock distribution.

**Response**: Unfortunately, there is still limited guidance regarding what catchability values by survey and species would be considered reasonable or expected. The derived catchability in this base model for the \gls{s-wcgbt} was greater than the 2011 value (0.69). The catchability for the \gls{s-wcgbt} fluctuated above and below 1.0 within models explored during development of the base model. This change in the catchability was not driven by a single change in the model structure but due to an aggregate of minor changes (i.e., combine Oregon and Washington into a single fleet, update and reprocess data based on current methodologies, if natural mortality was estimated). 


**Recommendation**: Having simplified the model compared to previous assessments, especially with respect to uniform growth, it is important to continue investigating if this is likely to introduce undesirable levels of bias into the assessment process as more information becomes available. Spatial information on the distribution by age/size of females, particularly in the southern part of the range, particularly across the stratification boundaries of the survey as well as between stocks, should be the primary focus of this work. 

**Response**: This is an area of needed ongoing research. 


### Response to 2021 Groundfish Subcommittee Requests 

To be completed after the STAR panel.


<!--chapter:end:30model.Rmd-->

## Model Structure and Assumptions

### Modeling Platform and Structure

The assessment was conducted used Stock Synthesis version 3.30.16 developed by Dr. Richard Methot at the NOAA, NWFSC [@methot_stock_2013]. This most recent version was used because it included improvements and corrections to older model versions.  The previous assessment of Dover sole also used Stock Synthesis but an earlier version, 3.21f; model bridging was performed between both versions of Stock Synthesis and are shown discussed below.  The R package [r4ss](https://github.com/r4ss/r4ss), version 1.38.0, along with R version 4.0.1 were used to investigate and plot model fits. 

### Model Selection and Evaluation

The base assessment model for Dover sole was developed to balance parsimony and realism, and the goal was to estimate a spawning output trajectory for the population of Dover sole off the west coast of the U.S. The model contains many assumptions to achieve parsimony and uses many different sources of data to estimate reality. A series of investigative model runs were done to achieve the final base model.

### Model Changes from the Last Assessment 

The assessment model structure was similar to that used in 2011 but there were a few meaningful changes to the model structure.  

First, in 2011 the options for estimating sex-specific selectivity were more restrictive than those available for use in this assessment. This assessment estimated sex-specific selectivity for all fishery and survey fleets in the model where the selectivity is estimated for a specified sex and the selectivity parameters for the other sex are full offsets with a scale parameter (parameters for the peak, ascending width, descending with, final selectivity, and a scale parameter).  In contrast, the option used in the 2011 assessment allowed for offset sex-selectivity estimation, however, the scaling of selectivity by sex were linked based on user inputs (i.e., referred to as "dogleg" parameterization where two parameters estimate the relative difference in log-space for male selectivity). Male Dover sole were generally determined to have a higher selectivity likely due their shallower depth distribution compared to females.  Both fishery fleets and the \gls{s-tri} and \gls{s-wcgbt} parameterized males as the base selectivity with female selectivity as full offsets from the males. After model exploration selectivity from both slope surveys, \gls{s-nwslope} and \gls{s-aslope}, were model using a cubic spline selectivity form, same as was done in the 2011 assessment. The use of the cubic spline selectivity allowed better fits to the length composition data which appeared to have bimodality across female Dover sole sampled. Both of these surveys observed a higher frequency of females compared to the other data sources, likely related to the deep water sampling design of these surveys, and male selectivity was estimated relative to female selectivity (i.e., estimated via dogleg parameterization).   

This assessment simplified the fleet structure by collapsing data and catches from Oregon and Washington into a single fleet. Vessels fishing out of Oregon and Washington often fish across state lines where the landed state port may not accurately reflect the area of removals. During the pre-assessement data webinar state representatives from WDFW and ODFW supported the aggregation of data from these states into a single fishing fleet within the model.  

A minor change in parameterization from the 2011 assessment was the change in estimating male biological parameters (natural mortality, growth) as offsets from the female parameters. The 2011 assessment STAR panel expressed concerns regarding potential confounding between the estimation of sex-specific selectivity and natural mortality. Switching to an biological offset parameterization creates a linkage between parameters by sex. The 2011 assessment determined that the estimates of natural mortality by sex were highly uncertain, however, joint likelihood profiles showed that the difference in natural mortality by sex was well defined.  An offset parameterization provides the flexibility to estimate all sex-specific natural mortality and growth parameters or to fix a parameter by sex (typically females) and only estimate the relative difference to the fixed parameter for the other sex. 

Data weighting approaches and application have evolved considerably since 2011 when the last assessment of Dover sole was conducted. Currently, there are three alternative approaches for data weighting that are been approved for West Coast groundfish stock assessments: 1) Francis method, 2) McAllister-Ianelli Harmonic Mean method, or 3) Dirichlet-Multinomial method. The base  model was weighted using the "Francis method", which was based on equation TA1.8 in Francis [-@francis_data_2011]. This formulation looks at the mean length or age and the variance of the mean to determine if across years, the variability is explained by the model. If the variability around the mean does not encompass the model predictions, then that data source should be down-weighted. This method accounts for correlation in the data (i.e., the multinomial distribution).  Sensitivities were performed examining the difference in weighting using McAllister-Ianelli Harmonic Mean Weighting [-@mcallister_bayesian_1997] and the Dirichlet Multinomial Weighting [-@thorson_model-based_2017].

The final major changes relative to the 2011 assessment was the treatment of select biological parameters: natural mortality and the the maturity-at-length.  The maturity-at-length was updated based on new research conducted by Melissa Head (NOAA, NWFSC). The new estimate was based on relatively new concept of functional maturity, an approach that classifies maturity with developing oocytes as mature or immature based on the proportion of vitellogenin in the cytoplasm and the measured frequency of atretic cells. 

The method of developing a natural mortality prior has changed since the last assessment conducted in 2011.  The current approach used for stock assessments of West Coast groundfish is based on Hamel [-@hamel_method_2015]. Additionally, this assessment did not estimate female natural mortality and fixed the parameter at the median of the prior, 0.108 yr^-1^. During model development the estimate of female natural mortality was deemed to be unrealistic due to low parameter estimates (around 0.08 yr^-1^) which did not appear to be supported by the data. However, the relative difference in the natural mortality between male and female Dover sole appeared to be well defined.  Using the offset parameterization allowed for the estimation of male natural mortality only in the base model.  The 2011 assessment freely estimated (no offsets) sex specific natural mortality values (female = 0.116 yr^-1^ and male = 0.143 yr^-1^).    


### Bridging Analysis

The exploration of models began by bridging from the 2011 assessment to Stock Synthesis version 3.30.16, which produced minor differences in scale but similar is status (Figures \ref{fig:bridge-ssb} and \ref{fig:bridge-depl}). The data bridging process, where data were updated through 2010, were updated in a step-wise additive fashion where the fleet structure was modified (e.g., change to two fleets compared to three state specific fleets used in 2011), catches, indices, discard rates and mean weights, lengths and ages were updated in that order. The estimated stock scale dropped relative to the 2011 bridge model when the fleet structure was revised, declined further when discard rates were updated, but increased when lengths and ages were updated with the final scale and status similar to the 2011 model (Figures \ref{fig:data-bridge-ssb} and \ref{fig:data-bridge-depl}). 

The next step in the model bridging analysis was to update all data sources through 2020 and apply a current data weighting method. The catches, indices, lengths, ages, and discard data (rates, mean weights, and discarded length observations) through 2020 were all added to the model in an additive step-wise fashion. The length and age data for the California fleet reflect the data available in PacFIN because CALCOM data used in the final model were not available at the time. The estimated spawning output had large fluctuations, below and above the 2011 estimated time series, based on each updated data set (Figure \ref{fig:all-data-bridge-ssb}). The estimated relative stock status across models ended up with similar final estimates in the final model year, 2021 (Figure \ref{fig:all-data-bridge-depl}), although showed alternative trajectory patterns during the interim years.

The final step in the model bridging evaluated the impact of updated biological parameter starting values, updated prior value for natural mortality, switching to estimating male biological parameters as offsets from females, and updating all fishery and survey selectivity parameterization using the double-normal selectivity pattern with females estimated as offsets from males.  All changes were done in an additive fashion.  Updating the starting biological parameters and prior for natural mortality resulted in limited changes in the model relative to the "Update - 2020 All Data" model (Figures \ref{fig:structure-bridge-ssb} and \ref{fig:structure-bridge-depl}). Switching to estimate male biological parameters as offset from the female parameters resulted in a down-ward shift in the estimated scale of the stock. The 2011 assessment noted challenges of estimating sex-specific natural mortality given the complexity of sex-specific selectivity, however, noted that the relative difference in natural mortality by sex was better informed. The final model bridging comparison updated the parameterization of sex-specific selectivity resulted in a significant decrease in the uncertainty of stock scale resulting in a large decrease in the estimated stock scale and the relative stock status more depleted compared to previous model updates (Figure \ref{fig:structure-bridge-ssb} and \ref{fig:structure-bridge-depl}). The selectivity form used in this model bridging reflects the initial parameterization with females estimated as offsets for all fleets and maximum female selectivity being less the 1.0. The final model was updated from this initial parameter structure based on numerous model explorations but this comparisons shows the general impact of the initial switch to the new selectivity assumptions.


### Key Assumptions and Structural Choices

The specifications of the assessment are listed in Table \ref{tab:model-structure}. The model is a two-sex, age-structured model starting in 1911 with an accumulated age group at 60 years. Growth and natural mortality were assumed time invariant with a constant growth estimated and female natural mortality fixed at the median of the prior and the relative offset of male natural mortality was estimated. The lengths in the population were tracked by 1 cm intervals and the length data were binned into 2 cm intervals. Stock Synthesis estimates growth in the age and size plus group. To avoid issues with additional estimated growth in the plus groups, the selection of the maximum age and length bins were selected to ensure that the numbers of fish in the plus group would be low. 

Time blocks on selectivity and retention parameters were used to allow for shifts in selectivity and retention curves. Time blocks for the peak of the selectivity parameter for the California and Oregon/Washington fleet were 1911 - 1984, 1985 - 1995, and 1996 - 2021. These blocks were based on what seemed to be large scale management changes to the DTS fishery, but were also influenced by choices in previous Dover sole assessments [@sampson_status_2005; @hicks_status_2011]. Time blocks for the fishery retention in Oregon/Washington were 1911 - 1988, 1989 - 2003, 2004 - 2010, and 2011 - 2021. California did not have as much historical discard data, thus the time blocks on retention for this fleet were defined as 1911 - 2003, 2004 - 2010, 2011 - 2014, and 2015 - 2021. The 2011 - 2014 and 2015 - 2021 retention blocks for the California fleet were based on observed changes in the discard rates and lengths from WCGOP between the early IFQ and recent IFQ years.

The specification of when to estimate recruitment deviations is an assumption that affects the estimate of early model uncertainty around stock scale and status. Recruitment deviations were estimated from 1880 - 2018 to appropriately quantify uncertainty in the early model years. The earliest length-composition data occur in 1967 and the earliest age data were in 1981. The most informed years for estimating recruitment deviations were from about the mid-1990 to 2014. The period from 1880 - 1974 was fit using an early series with little or no bias adjustment, the main period of recruitment deviates occurred from 1975 - 2018 with an upward and downward ramping of bias adjustment, and 2019 onward were fit using forecast recruitment deviates with no bias adjustment. Methot and Taylor [-@methot_adjusting_2011] summarize the reasoning behind varying levels of bias adjustment based on the information available to estimate the deviates. The standard deviation of recruitment variability was assumed to be 0.35 based on the estimated variation in recruitment from the base model.

The following distributions were assumed for data fitting: survey indices were lognormal, total discards were a t-distribution with 30 degrees of freedom, and the compositional data had a multinomial error structure.


### Priors

Priors were applied only to parameters for steepness ($h$) and natural mortality ($M$). The steepness prior is based on the Myers [-@myers_maximum_1999] meta-analysis of flatfish steepness and the natural mortality prior is based on a meta-analysis completed by Hamel [-@hamel_method_2015]. The prior for steepness assumed a beta distribution with a mean equal to 0.80 (Figure \ref{fig:h-prior}). 

The prior distribution for natural mortality was based on the Hamel [-@hamel_method_2015] meta-analytic approach with  an assumed maximum age of 50 years for both males and females. The prior assumed a log normal distribution for natural mortality. The log normal prior has a median of 0.09 and a standard error of 0.438. 


### Data Weighting

Length from the four surveys, conditional age-at-length compositions from the \gls{s-wcgbt} and \gls{s-nwslope}, and length and marginal age compositions from the fishery fleets were fit and appropriately weighted within the model. Length and marginal age data started with a sample size determined from the equation listed in Section \ref{commercial-fishery-length-and-age-data} for both fishing fleets in the model. Input sample sizes for survey length data were calculated according according the method described in Section \ref{nwfsc-wcgbt}.  It was assumed for age-at-length data that each age was a random sample within the length bin and the model started with a sample size equal to the number of fish in that length bin.

Extra variability parameters were estimated and added to the input variance for the indices of abundance for three surveys in the model; 1) \gls{s-tri}, 2) \gls{s-nwslope}, and 3) \gls{s-aslope}. Estimating additional variance for the \gls{s-wcgbt} was explored and determined to not be required. WCGOP discard rate data during the pre-IFQ period (prior to 2011) were bootstrapped to provide uncertainty of the total discards. The IFQ fishery has 100 percent observer coverage and a low default uncertainty of 0.05 was assumed for discard rates from 2011 - 2021.

The base assessment model was weighted using the Francis method, which was based on equation TA1.8 in Francis [@francis_data_2011]. Sensitivities were performed examining the difference between the McAllister and Ianelli [@mcallister_bayesian_1997] method (Harmonic Mean weighting) and and the Dirichlet Multinomial Weighting [-@thorson_model-based_2017]  approaches. The weights applied to each length and age data set for the base model are shown in Table \ref{tab:dw} uncer the Francis method column.


### Estimated and Fixed Parameters

There were 229 estimated parameters in the base model. These included one parameter for $R_0$, 10 parameters for growth, 1 parameter for male natural mortality, 3 parameters for extra variability for the survey indices, 61 parameters for length-based selectivity, retention, and time blocking of the fleets and the surveys, 141 recruitment deviations (including 31 pre-model estimates), and 12 forecast recruitment deviations (Table \ref{tab:params}).

Fixed parameters in the model were as follows. Steepness was fixed at 0.80, the mean of the prior. A sensitivity analysis and a likelihood profile were performed for steepness. Natural mortality was fixed at 0.108 yr^-1^ for females, the median of the prior. Estimation of female natural mortality was explored during model development. The estimate of female natural mortality was low (around 0.082 yr^-1^) relative to the median of the prior which was based on maximum age. There were limited observations of fish greater than 50 years of age, so a natural mortality that would be associated with a maximum around 65 years of age did not seem well supported. Additionally, the population scale with female natural mortality estimated appearred low, where the catchability for the \gls{s-aslope}, \gls{s-nwslope}, and \gls{s-wcgbt} were around or above 2.0. The decision to fix natural mortality in the base model were based on each of these factors combined.  

The standard deviation of recruitment deviates was fixed at 0.35. Maturity-at-length was fixed as described above in Section \ref{maturation-and-fecundity}. Length-weight parameters were fixed at external estimates based on \gls{s-wcgbt} length-weight observations (Figure \ref{fig:est-len-wght}).

Sex-specific and dome-shaped selectivity was explored for all fleets within the model. Older Dover sole, particularly females, are often found in deeper waters and may move into areas that limit their availability to fishing gear. 

<!--chapter:end:32structure.Rmd-->

## Base Model Results

The base model parameter estimates along with approximate asymptotic standard errors (SD column) are shown in Table \ref{tab:params} and the likelihood components are shown in Table \ref{tab:likes}. Estimates of derived reference points and approximate 95 percent asymptotic confidence intervals are shown in Table \ref{tab:referenceES}. Estimates of stock size over time are shown in Table \ref{tab:timeseries}. 

### Parameter Estimates

The male natural mortality parameter was estimated as a relative offset from the fixed female value within the model. Male natural mortality was estimated to be 0.114 yr^-1^ and the female natural mortality was fixed at 0.108 yr^-1^.  The female value was fixed at the median of the prior.  

The estimates of growth parameters by sex varied relative to the externally estimated starting values.  The length at age 1 and the maximum length estimates for both sexes was slightly less than the external estimates but were well within the 95 percent confidence interval given the estimated uncertainty (Table \ref{tab:params} and Figure \ref{fig:mod-est-len-age}). The estimated $k$ for female and male fish were greater than the values estimated externally using only available survey data (0.132 yr^-1^ for females and 0.138 yr^-1^ for males).  The majority of growth for female and male Dover sole growth occurs at younger ages, reaching near maximum length by age 20-25, depending upon sex, with female Dover sole reaching  larger maximum lengths (Figure \ref{fig:mod-est-len-age}). 

Length-based selectivity curves were estimated for the fishery and survey fleets by sex.  The estimated selectivities are shown in Figure \ref{fig:selex}. The selectivity for both commercial fleets (California and Oregon/Washington) were parameterized using the double-normal selectivity where female selectivity was estimated as an offset from males. Dome-shape selectivity was explore for each of these fleets by sex during model development. The best fit to the California length data by sex was achieved with a asymptotic male selectivity and a dome-shaped selectivity for females with maximimum selection estimated less than 1.0.  The selectivity for the Oregon/Washington fleet was estimated to be dome-shaped for both sexes with maximum female selectivity less than 1.0. The selectivity for both commercial fleets shifted rightward or leftward by blocked year period, likely driven by management or fishery changes across time.

The selectivity of the \gls{s-tri} and the \gls{s-wcgbt} in the base model were estimated using the double-normal parameterization, allowing for dome-shaped selectivity. Female selectivity parameters were estimated as offsets from the male parameters. The \gls{s-tri} which surveyed depths 55 - 549 meters, only a subset of the depth range of Dover sole, had peak selectivity for both sexes around 30 cm and reduced selectivity for larger sizes where maximum female selectivity was less than 1.0. The \gls{s-wcgbt} which samples a wide range of depths (55 -1280 m) had the highest female selectivity across sizes but maximum selectivity was still less than 1.0.  The two slope survey, \gls{s-aslope} and \gls{s-nwslope}, that focused sampling at deeper depths were parameterized using a cubic spline function with allows for bi-modal selectivity peaks across size. 

Retention curves were assumed to be asymptotic. The estimated curves for each commercial fleet based on the historical time blocks and discarded length composition data are shown in Figure \ref{fig:retention}. The earliest retention curve for California, 1911-1947, was fixed left skewed for full retention since the input catches for this period included estimates of discard mortality.  The retention curves for both commercial fleets since the start of the IFQ fishery have shifted leftward indicating very limited discarding of Dover sole. 

The catchability for each of the surveys was analytically solved comparing observed to expected vulnerable biomass across all years.  The catchabiltiy for the \gls{s-tri} was 0.219 and 0.467 for the early and late periods, respectively.  The catchability for the \gls{s-aslope} and the \gls{s-nwslope} was 1.043 and 1.045 respectively. The \gls{s-wcgbt} catchability was 1.072. 

Additional survey variability, process error added directly to each year's input standard deviation for the \gls{s-tri}, applied to both the early and late period of the survey, the \gls{s-aslope}, and the \gls{s-nwslope} was estimated within the model.  The model estimated a large added variance of 0.317 for the \gls{s-tri}.
The added variance estimate for both of the slope surveys were similar at 0.042 and 0.044. No added variance was estimated for the \gls{s-wcgbt}.

The time series of estimated recruitments and annual recruitment deviations are shown in Figures \ref{fig:recruits} and \ref{fig:rec-devs}). Years with the highest recruitment deviations were estimated to have occurred in 2000 and 2009 with the lowest between 2003 - 2005. There is little information regarding recruitment prior to 1970 but are estimated in the base model to account for uncertainty around the unfished condition. Estimated recruitment deviations during years with the majority of the compositional data, after 1980, have relatively high uncertainty intervals indicating lack of support for clear strong or poor recruitment years across data sources. Recruitment deviations after 2015 are relatively uninformed with estimated deviations near zero where recruitment is estimated primarily based on the spawner-recruit curve (Figure \ref{fig:bh-curve}). The recruitment bias adjustment applied within the model across years is shown in Figure \ref{fig:bias-adj}.

### Fits to the Data

There are numerous types of data for which the fits are discussed: survey abundance indices, discard data (rates, mean body weights, and length compositions), length composition data for the fisheries and surveys, marginal age compositions for the fisheries, and conditional age-at-length observations for the \gls{s-wcgbt} and \gls{s-nwslope}.

The fits to the survey indices are shown in Figures \ref{fig:wcgbt-index-fit} - \ref{fig:nwslope-index-fit}. The \gls{s-wcgbt} is the longest index of abundance for West Coast groundfish and was fit reasonably well for Dover sole with no estimated added variance (Figure \ref{fig:wcgbt-index-fit}). The index was variable with a slight dip around 2011 - 2013 but was relatively flat across years. The index of abundance for the \gls{s-tri} was fit as two periods, early 1980 - 1992 and late 1995 - 2004 using a shift in catchability. The year specific standard deviation estimated by VAST (thick black bars) was low compared to the large added variance (thin black lines) estimated within the model in order to fit each period of the index of abundance (Figure \ref{fig:tri-index-fit}). Even with the large estimated added variance the model did not fit the sharp peak in the 2004 estimate from the \gls{s-tri}. The indices from both slope surveys, \gls{s-aslope} and \gls{s-nwslope}, were generally flat and fit by the base model (Figures \ref{fig:afsc-index-fit} and \ref{fig:nwslope-index-fit}). For both surveys the estimated added variance allowed better fits to single year values from each of these surveys: \gls{s-aslope} 2001 estimate and and \gls{s-nwslope} values in 2000  and 2002. 

The observed WCGOP discard rates were fit by each fleet in the model using time blocks (Figures \ref{fig:ca-disc-fit} - \ref{fig:orwa-disc-fit}). The discard rates were fit well for California fleet based on the retention blocks in the model.  The fits to the discard rates for the Oregon/Washington fleet were more variable compared to the California fleet (Figure \ref{fig:orwa-disc-fit}). The estimated discard rate for the early block 1910 - 2001 were driven by fits to the Pikitch discard rates, which had low uncertainty in the annual discard rate, compared to the earlier discard rates which were more uncertain. Additionally, the Pikitch discard lengths were the sole source of discard size observations for this period.  The WCGOP data between 2002 - 2010 had equally split years of higher and lower discard rate observations with the model fitting the lower discard rates well due to the low uncertainty intervals on years with low discard rates (i.e., there were similar standard deviations across years but result in tighter intervals on lower discard rates). The fit to the mean weight of discarded Dover sole was good for both fishing fleets in the model (Figures \ref{fig:ca-disc-mbw-fit} and \ref{fig:orwa-disc-mbw-fit}).

The  WCGOP discard lengths by the California fleet were relatively well fit, expect for the most recent years where the observed lengths were quite variable (Figures \ref{fig:ca-disc-len-fit} and \ref{fig:ca-disc-pearson}). The period of variable lengths in recent years coincides with a decline in the number of observations by year.  The fits to the WCGOP discard lengths for the Oregon/Washington fleet fit well (Figures \ref{fig:orwa-disc-len-fit-1} - \ref{fig:orwa-disc-pearson}). The Pikitch discard lengths had little variability across size and the estimated model fit encapsulated the peak in the lengths but not the sharpness in observed discarding (1985 -1987 in Figure \ref{fig:orwa-disc-len-fit-1}).

Fits to the length data are shown based on the proportions of lengths observed by year and the Pearson residuals-at-length for all fleets. Detailed fits to the length data by year and fleet are provided in [Appendix A](#len-fit-data). Length composition aggregated fits by fleet are reasonably well fit and are shown in Figure \ref{fig:agg-fits}. The poorest fit was for unsexed length compositions from either the discard observations and the early year unsexed lengths from the Oregon/Washington fleet. There was little evidence for patterns of poor fits to the California length data Pearson residuals (Figure \ref{fig:ca-disc-pearson}). The Pearson residuals for the Oregon/Washington fleet were relatively small (maximum residual size = 1.66) similar to the California data but there was some evidence of the observations being greater than the predicted values (filled circles) for males around 36 cm (Figure \ref{fig:orwa-pearson}). The Oregon/Washington fleet had a high proportion of males observed at this size, greater than the proportion observed in the California fleet (Figure \ref{fig:agg-fits}). There was evidence of a slight female residual pattern around the largest sizes observed for Oregon/Washington, although the size of the residual was small. During model development increasing the selectivity of large female fish did not improve the fit to these data.  The mean length observed by year for both the California and Oregon/Washington fleet had larger mean lengths during the early years of available data (Figures \ref{fig:ca-mean-len} and \ref{fig:orwa-mean-len}). The mean of lengths observed in recent years by the California fleet ranged between 38 - 42 cm and ranged between 35-40 cm for the Oregon/Washington fleet.  

The observed ages aggregated across years for the California and Washington/Oregon fleet are shown in Figure \ref{fig:agg-age-fits}. The maximum size of the Pearson residuals for both fleets was generally small (maximum = 2.66, Figures \ref{fig:ca-pearson-age} and \ref{fig:orwa-pearson-age}). The mean age by year for California ranged between 12 - 18 years of age and the Oregon/Washington mean age was slightly lower ranging between 11 - 15 years of age (Figures \ref{fig:ca-mean-age} and \ref{fig:orwa-mean-age}). 
 
The length data from each survey were generally fit well (Figure \ref{fig:agg-fits}. The Pearson residuals for each survey show little evidence for model misfit to the data (Figures \ref{fig:tri-pearson} - \ref{fig:wcgbt-pearson}). The \gls{s-tri} observed the lowest mean length across years (less than 32 cm excluding 1980) and both slope surveys observed mean lengths ranging between 32 - 35.5 cm (Figures \ref{fig:tri-mean-len} - \ref{fig:nwslope-mean-len}). The mean length observed by the \gls{s-wcgbt} showed a slight pattern of increasing mean length between 2004 - 2012 and then a drop in mean length in 2013 which remained relatively constant around 33 - 34 cm for subsequent years (Figure \ref{fig:wcgbt-mean-len}).  

The ages from the \gls{s-nwslope} and \gls{s-wcgbt} were used as conditional-age-at-length data in the base model. The Pearson residuals by year for both data sets are available in the [Appendix]{#detailed-caal}. The fits to the conditional age-at-length data across ages and lengths each year are shown in Figures \ref{fig:nwslope-caal-fit-1} - \ref{fig:wcgbt-caal-fit-4} where the expected fit (blue line) general matches the observations except at the largest lengths where the number of observations by age, length, and year are limited. The observed mean age by year from the \gls{s-nwslope} was either above of below the model predicted mean age by year but within the confidence interval by year (Figure \ref{fig:nwslope-mean-caal}). The observed mean age and the model predictions were reasonably consistent until 2010for the \gls{s-wcgbt} (Figure \ref{fig:wcgbt-mean-age}). However, the recent years observed mean age (between 12 - 14 years of age) by year were greater compared to the model expected mean age (approximately 11.5 - 12 years of age).

### Population Trajectory

The predicted spawning biomass is given in Table \ref{tab:timeseries} and plotted in Figure \ref{fig:ssb}. The predicted spawning biomass time series shows a slow decline in spawning biomass from the 1950s through the mid-1990s as catches increased between 1940 and the late 1980s (Figure \ref{fig:catch}). The predicted spawning biomass begins to slowly increase around 2000 through the final model year 2020 likely driven by a decrease in removals over the last 25 years. The estimated total biomass follows the same general trend as observed in the spawning biomass (Figure \ref{fig:tot-bio}). The estimated spawning biomass relative to unfished equilibrium spawning biomass has remained relatively high, never dropping below 0.60, and well above the current management target of 0.25 (Figure \ref{fig:depl}). The relative biomass at the start of 2021 is estimated at 0.79.

Female Dover sole were never fully selected by either fishery or any survey since the largest females tend to move to deeper depths that extend beyond the maximum depth sampled. This behavior results in a subset of the spawning biomass that is unobserved and unavailable. The model predicted available and unavailable spawning biomass is shown in Figure \ref{fig:unavail-bio}. The estimates of the unavailable spawning biomass are based on the catch by fleet, the model estimated numbers-at-age, and the derived age-specific selectivity all by year. The estimated unavailable spawning biomass is shown broken out by small and large fish where small fish are defined as fish less than the age of derived peak selectivity. The sharp increase in small fish reflected in the upper right panel is primarily an artifact of the Oregon/Washington fleet beginning around this time, later than the California fleet, and then drops when selectivity and retention changes during the mid-1980s. There is a large portion of the female spawning biomass estimated to be unavailable relative to the available spawning biomass.

Recruitment deviations were estimated for the entire time series that was modeled (Figure \ref{fig:rec-devs} and discussed in Section \ref{parameter-estimates}). Recruitment deviations were estimated to be above average in the late 1990s, below average in the early 2000s, and then generally above average between 2008 - 2012.  The stock-recruit curve resulting from a value of steepness fixed at 0.8 is shown in Figure \ref{fig:sr-curve} with estimated recruitments also shown. The stock is predicted to have never fallen to low enough levels that the effects of steepness are obvious.  Steepness was not estimated in this model, but a likelihood profile across steepness values are shown in Section \ref{likelihood-profiles}.

<!--chapter:end:33results.Rmd-->

## Model Diagnostics

### Convergence

Proper convergence was determined by starting the minimization process from dispersed values of the maximum likelihood estimates to determine if the model found a better minimum. Starting parameters were jittered by 5 percent. This was repeated 100 times with only 1 out of 100 runs returning to the base model likelihood. However, a better, lower negative log-likelihood, model fit was not found. In the jittering analysis models with similar log-likelihood values (difference < 0.50 units) were often found with little difference in overall model estimates indicating a relatively flat likelihood surface around the maximum likelihood estiamat. Through the jittering done as explained and likelihood profiles, we are confident that the base model as presented represents the best fit to the data given the assumptions made. There were no difficulties in inverting the Hessian to obtain estimates of variability, although much of the early model investigation was done without attempting to estimate a Hessian.

### Sensitivity Analyses

Sensitivity analyses were conducted to examine the relative influence of specific changes to data inputs and model structural assumptions to further address uncertainty associated with the base model estimates and derived management quantities.  The majority of the sensitivity models are the result of a single change relative to base model (i.e., they are not the result of cumulative changes such as the modeling approach used with the bridging analysis). Comparisons of likelihood values and estimates of key parameters from the sensitivity analysis are shown in Tables \ref{tab:sensitivities1} and \ref{tab:sensitivities2}. Many additional sensitivity runs were explored during development and testing of the base model. This section focuses on the main data and structural sensitivity model runs and includes the following:

Data Sensitivities

\begin{enumerate}
   
  \item Remove the California commercial length data
  
  \item Remove the Oregon/Washington commercial length data
  
  \item Remove the AFSC slope survey length data
  
  \item Remove the Triennial survey length data
  
  \item Remove the NWFSC slope survey length data
  
  \item Remove the NWFSC WCGBT survey length data
  
  \item Remove the California commercial age data
  
  \item Remove the Oregon/Washington commercial age data
  
  \item Remove the NWFSC slope survey age data
  
  \item Remove the NWFSC WCGBT survey age data
  
  \item Remove the AFSC slope survey index
  
  \item Remove the Triennial survey index
  
  \item Remove the NWFSC slope survey index
  
  \item Remove the NWFSC WCGBT survey index
  
\end{enumerate}

Structural Sensitivities

\begin{enumerate}
   
  \item Estimate Lorenzen natural mortality ($M$) by sex with the change of $M$ occurring at approximately age-at-50-percent maturity of 10 years old;

  \item Allow the model to estimate sex-specific $M$ values;

  \item Fix $M$ values by sex at the estimates from the 2011 assessment of Dover sole;
  
  \item Fix $M$ values for each sex at the median of the prior distribution (0.108);
  
  \item Mirror the selectivity by sex and retention for the CA and OR/WA fishing fleets;

  \item Assume the 2011 parameterization of fishery selectivity;

  \item Assume the 2011 parameterization of survey selectivity;

  \item Fix the NWFSC Slope Survey female selectivity to asymptote at 1.0;

  \item Assume the 2011 length-at-maturity estimate;
  
  \item No estimation of recruitment deviations;
  
  \item Use of the McAllister and Ianelli method for data-weighting (Table \ref{tab:dw});
  
  \item Use of the Dirichlet Multinomial method for data-weighting (Table \ref{tab:dw}); and
  
  \item Fix the extra standard deviation parameters for the AFSC Slope, NWFSC Slope, and Triennial Surveys at a near negligible level (0.01).

\end{enumerate}

In general, the base model was the most sensitive (i.e., spawning biomass estimates beyond the 95 percent confidence interval for the base model) to models that applied alternative approaches to estimating or fixing natural mortality parameters and when the largest source of age data (\gls{s-wcgbt}) was removed. Fixing sex-specific $M$ at the 2011 assessment estimates (i.e., higher than the base model) resulted in an increase in overall spawning stock biomass and the fraction of unfished biomass (i.e., stock status), while adding the estimation of female $M$ or sex-specific Lorenzen $M$ (i.e., lower values than the base model) resulted in decreases relative to the base model (Table \ref{tab:sensitivities2}; Figures \ref{fig:sens-m-ssb} and \ref{fig:sens-m-relssb}). In general, natural mortality (fixed or estimated) ranged from 0.082 to 0.116 for females and 0.082 to 0.142 for males across sensitivity runs. The total negative log likelihood was slightly less for the models that estimated female $M$ and sex-specific Lorenzen $M$, suggesting a slightly better fit to the available data. However, natural mortality is often a difficult parameter to estimate in stock assessment such that model misspecification is always a concern. These two alternative $M$ models were not chosen as the base model for the following reasons. First, estimates near the lower range of $M$ values relate to a longevity of about 65 years (following from Hamel [-@hamel_method_2015]), which is not well supported by the observed data (i.e., few observations more than 50 years old). Second, the scale of the population was considerably reduced to the point where catchability doubled for the surveys, which for the \gls{s-wcgbt} and slope surveys meant unrealistically high (at or above 2) catchability coefficients. Third, the lack of contrast in data and in the population trajectory through time, as seen with Dover sole, are often limitations to estimating $M$ reliably without auxiliary information (e.g., tagging data), due to the inability of the model to decipher otherwise confounding causes of demographic change [@Wang1999; @Lee_est_m_2011].

The removal of ages from the \gls{s-wcgbt} (i.e., a considerable amount of the total available age data) resulted in lower estimates of spawning biomass and the fraction of unfished biomass compared to the inclusion of these data in the base model (Figures \ref{fig:sens-age-ssb} and \ref{fig:sens-age-relssb}). This result is not surprising given that these age data suggest a higher population scale (Figure \ref{fig:r0-profile}) compared to other sources of age information. Whereas the removal of the Oregon/Washington commercial age data had the opposite effect (increase spawning biomass), though not quite as large of an effect as the removal of the \gls{s-wcgbt} age data. The removal of other sources of age data led to largely insensitive results relative to the base model, as did the removal on any one source of length data (Figures \ref{fig:sens-length-ssb} and \ref{fig:sens-length-relssb}) or survey index (Figures \ref{fig:sens-index-ssb} and \ref{fig:sens-index-relssb}).  

Other changes in model structure that led to moderately sensitive results (i.e., divergent from, but within the 95 percent confidence interval of, the base model) include assumptions based upon selectivity (Figures \ref{fig:sens-select-ssb} and \ref{fig:sens-select-relssb}) and the method for weighting data (Figures \ref{fig:sens-biodata-ssb} and \ref{fig:sens-biodata-relssb}). While the McAllister and Ianneli approach to data weighting led to an 11 percent, on average, decline in spawning biomass across the time series compared to the base model, it had less of an impact on overall stock status (76 percent compared to 79 percent in 2021, respectively). In general, the Francis approach to data weighting that was used in the base model applied less weight relative to input sample sizes compared to the McAllister and Ianelli approach (Table \ref{tab:dw}). The Dirichlet multinomial approach to data weighting was abandoned due to inconsistent results relative to input sample sizes and parameters hitting bounds. Specifying survey selectivity patterns to match the form used in the 2011 assessment was the most sensitive among alternative selectivity scenarios examined in terms of overall stock size, and was also the most plausible of these in terms of the lowest total likelihood (Table \ref{tab:sensitivities2}), though not lower than the base model. This difference in stock size is largely explained by the increase in the male natural mortality estimate (Table \ref{tab:sensitivities2}).   

### Likelihood Profiles

Likelihood profiles were conducted for $R_0$, steepness, and sex-specific natural mortality values separately. These likelihood profiles were conducted by fixing the parameter at specific values and estimated the remaining parameters based on the fixed parameter value.

In regards to values of log($R_0$), the negative log-likelihood was minimized at approximately log($R_0$) of 12.27  (Figure \ref{fig:r0-profile}).  The estimate of log($R_0$) was informed by a relatively consistent signal from length data across fleets and survey. While the length data across sources supported log($R_0$) values around 12.0, the age data primarily informed by the \gls{s-wcgbt} supported higher values.  The stock scale was highly sensitive to values with the final stock status ranging between 0.60 to 1.0 (Figures \ref{fig:r0-ssb} and \ref{fig:r0-depl}.

For steepness, the negative log-likelihood supported values between 0.40 - 1.0 (Figure \ref{fig:r0-profile}).  Likelihood components by data source show that the  age data from the \gls{s-wcgbt} support a lower steepness values while the length data across most fleets in the model were relatively flat.  The surveys generally provide very little information concerning steepness but tend to support higher values of steepness. The estimated spawning biomass for Dover sole diverges most at the start of the timeseries (estimates of $SB0$) and across the final 25 years of the model (Figure \ref{fig:h-ssb})  The stock was estimated to be most depleted at the end of the time series with lower values of steepness (Figure \ref{fig:h-depl}).

The negative log-likelihood was minimized at a female natural mortality value 0.08 with values from 0.07 - 0.09 supported based on the total negative-log-likelihood (Figure \ref{fig:m-profile}). The profile was run under the base model assumption that the offset of male natural mortality was estimate based on the fixed female natural mortality.  The length data was generally uniformative across fleets and surveys except for the \gls{s-aslope} that supported lower natural mortality values. The age data from this \gls{s-wcgbt} supported lower female natural mortality values. The stock scale and status was highly variable across natural mortality values where lower values resulted in lower stock scale and status (Figures \ref{fig:m-ssb} and \ref{fig:m-depl}).

The negative log-likelihood was minimized at a male natural mortality offset value of 0.05 (a value of 0.114 yr^-1^ converted into regular space) with offset values from 0.0 - 0.1 supported based on the total negative-log-likelihood (Figure \ref{fig:m-male-profile}). The profile was run under the base model assumption that the female natural mortality was fixed at 0.108.  The length data generally supported offset values of -0.1 - 0.1. The age data from this \gls{s-wcgbt} supported higher male offset natural mortality values. The stock scale and status was highly variable across male natural mortality values where lower values resulted in lower stock scale and status (Figures \ref{fig:m-male-ssb} and \ref{fig:m-male-depl}). 

### Retrospective Analysis

A ten-year retrospective analysis was conducted by peeling off years of data ranging from 2010 - 2019 (i.e., "Data -1 Years" corresponds to data through 2019). The estimated spawning output was generally consistent with the base model when recent years of data were removed (Figures \ref{fig:retro-ssb}). Although, when the 9 and 10 years of data were removed (data availabel through 2010 and 2011) the estimate of stock scale dropped relative to the base model and other retrospective runs. The estimates of fraction unfished were fairly consistent with the base model (Figure \ref{fig:retro-depl}), except the retrospective run with 10 years of data removed estimated a slightly more depeleted stock relative to the base model trajectory.

### Historical Analysis

The estimated spawning output from previous assessments since 2001 are shown in Figure \ref{fig:past-assess}. The estimate of stock scale from the base model is considerably lower relative to the 2011 assessment estimate which was highly uncertain. The base model $SB_0$ was highly similar to the value estimated by the 2005 assessment, the stock trajectory from the base model diverged between 1960-2005 in comparison to the 2005 estimate. The relative stock status of the base model was relatively consistent in trend and scale with the estimate from the 2011 assessment, although slightly less optomistic but still well above the management target.  

<!--chapter:end:34diagnostics.Rmd-->

# Management 

## Reference Points


The 2021 estimate of fraction unfished is well above the management target of 25 percent of unfished spawning biomass. The fishing intensity has been below the current management spawner-per-recruit (SPR) harvest rate limit ($SPR_{30\%}$) across all modeled years (Figure \ref{fig:1-spr}).  The fraction unfished compared to the ratio of the estimated SPR to the management target ($SPR_{30\%}$) across all model years are shown in Figure \ref{fig:phase} where warmer colors (red) represent early years and colder colors (blue) represent recent years.  The relative biomass and estimated SPR has been well above the management biomass target (25 percent) and well below the SPR target across all model years. Figure \ref{fig:yield} shows the equilibrium curve based on a steepness value fixed at 0.8 with vertical dashed lines to indicate the estimate of fraction unfished at the start of 2021 (current) and the estimated management targets calculated based on the relative target biomass (B target), the SPR target, and the maximum sustainable yield (MSY).

Reference points were calculated using the estimated selectivities and catch distributions among fleets in the most recent year of the model, 2020 (Table \ref{tab:referenceES}). Sustainable total yield, landings plus discards, using an $SPR_{30\%}$ is \ensuremath{2.28909\times 10^{4}} mt. The spawning biomass equivalent to 25 percent of the unfished spawning biomass ($SB_{25\%}$) calculated using the SPR target ($SPR_{30\%}$) was \ensuremath{7.4498\times 10^{4}} millions of eggs. Recent removals have been below the point estimate of the potential long-term yields calculated using an $SPR_{30\%}$ reference point and the population scale has been relatively stable in recent years.

 

## Unresolved Problems and Major Uncertainties


The base case model was developed with the goal of balancing parsimony with realism and fitting the data. To achieve parsimony some simplification of model structure was assumed which may impact the interprettation and fit to specific data sets. The maturity-at-length or -at-age analysis conducted for this assessment and the length-at-age estimates identified possible differences in Dover sole south and north of Point Reyes. Currently, there is limited information on the movement of Dover sole by latitude or depth which would provide possible insights into the mechanisms behind these observed differences. Additionally, in recent years the majority of fishery data are arising from ports north of Point Reyes which limits the ability to support additional model complexity. Given the lack of information to inform the structure and parameterization of a spatial model, the base model opted to assume a homogenous population structure at this time. Future research into the biology and movement of Dover sole could facilite future spatial modeling efforts if appropriate. 

Dover sole life-history parameters exhibit strong relationships with depth that indicate the stock is more complex than the model assumes.  Small fish are found in shallow water, while mid-sized and larger fish are observed across all depths. Specifically, the \gls{s-wcgbt} observes some of the largest female Dover sole in waters less than 300 meters. The variability of sizes obseved by sex increases moving from deeper to shallower waters. Conversly, the median observed size by depth increases with depth. In addition, there is a pattern of sex ratio by depth with more males found in middle depths and more females found in shallow and deeper depths.  These patterns are apparent in the summer fisheries and surveys.  It is uncertain how the patterns affect the data (they may be a cause of the bimodal length distributions seen in the slope surveys) and if these patterns can be effectively modeled to produce better fits to the data and better predictions of biomass.

Uncertainty in natural mortality translates into uncertain estimates of status and sustainable fishing levels for Dover sole. In the base model, a balence between fixing and estimating this key parameter was struck by fixing female natural mortality at the median of the prior while estimating the relative difference in male natural mortality. The likelihood profile across values of female natural mortality values supported lower values which may not have been expected _apriori_ based on the available age data.  Additionally, the values of catchability for the \gls{s-wcgbt} and both slope surveys were above 2.0 (the survey observed biomass was at least twice the model estimated vulnerable biomass) when natural mortality was estimated due to a drop in the population scale. The shift in low estimated natural mortality and shifts in stock scale could be due to limited information about natural mortality for Dover sole in the data, the limited selection of female Dover sole by the fisheries and surveys, or could indicate model mis-specification. It is unclear what is driving this behavior in the model.

The selectivity parameters by sex for each survey seemed to be well estimated in the base model.  However, moving to the double-normal with offset parameterization from the 2011 selectivity form  had a substantial change in the model estimates of stock size. The best fit to the length and age data is achieved with the parameterization in the base model. Both this assessment and the previous assessment estimated maximum female selectivities well below 1.0, although the current analysis estimated slightly higher maximum female selectivity values for each of the surveys. There is inherent uncertainty that may not be fully captured in the within model uncertainty when female fish who represent spawning biomass are not fully observed by any fleet.           

## Harvest Projections and Decision Tables

The forecast of stock abundance and yield was developed using the base model. The total catches in 2021 and 2021 were set at 10,000 mt for each year, since recent year removals have been well below the ACLs. These values will be updated based on input provided by the Groundfish Management Team (GMT) of the PFMC. The management adopted ACL values for these years is 50,000 mt. The exploitation rate for 2021 and beyond is based upon an SPR of 30 percent and the 25:5 harvest control rule. The average exploitation rates, across recent years, by fleet were used to distribute catches during the forecast period. 

The ABC values were estimated using a category 1 $\sigma_y$ starting at 0.50 and increasing annually during the forecast period combined with a P* value of 0.45. The catches during the projection period were set equal to the year-specific ABC using the current flatfish harvest control rule, 25:5 (Table \ref{tab:project}). 

The axes of uncertainty and catch streams applied in the decision table will determined during the  STAR panel. 


## Evaluation of Scientific Uncertainty


The model uncertainty around the 2021 estimate of spawning biomass was $\sigma$ = 0.17. The uncertainty estimated around the OFL was $\sigma$ = 0.16. The time-varying forecast uncertainty applied in the base model is based on the adopted value of $\sigma$ = 0.50 for a category 1 stock combined with a P* value of 0.45.

## Regional Management Considerations

Currently Dover sole are managed using a coastwide harvest; therefore this assessment does not provide a recommended method for allocating harvests regionally. There is currently no genetic evidence that there are distinct biological stocks of Dover sole off the U.S. coast. The limited historical tagging data available describes adult movement suggesting that there may be significant movement across depth but limited movement across latitude.


## Research and Data Needs


Investigating and or addressing the following items could improve future assessments of Dover sole: 

\begin{itemize}

\item Patterns with depth:  There are patterns of length and sex ratios with depth which may indicate that the stock is more complex than currently modeled.  Further research into the causes of these patterns as well as differences between seasons would help with understanding the stock characteristics such that a more realistic model could be built.  This may also provide further insight into migration and help determine if there are localized populations.

\item Stock boundaries: A common question in stock assessments is whether or not the entire stock is being accounted for. Dover sole live deeper than the range of the fisheries and surveys.  The assessment model attempts to account for out of area biomass through catchability coefficients and selectivity curves, but that portion of the stock is unknown and can only be guessed at.  Research into abundance in deep areas would be useful to verify that the assessment adequately predicts the entire spawning stock of Dover sole.

\item California Sampling for Ages: Since 1990, nearly 60 percent of fish aged have been landed at the Crescent City port, with some years 100 percent of aged fish coming from this port. In contrast, the majority of Dover sole are landed at the Eureka port (approximately 67 percent over the last 10 years). Ensuring that sampling is spread across California ports and otoliths selected for ageing are spread across ports proportional to area removals may provide additional insights to area specific population attributes.

\end{itemize}

<!--chapter:end:40management.Rmd-->

# Acknowledgments

Many people were instrumental in the successful completion of this assessment and their contribution is greatly appreciated.  This assessment draws heavily on the text and analyses from previous Dover sole assessments and has benefited greatly from the efforts of all authors contributing to those analyses. 

Theresa Tsou (WDFW) and Greg Lippert (WDFW) provided Washington historical catches and quickly addresssed our multiple questions in order to better understand the data. Alison Whitman (ODFW) provided Oregon  historical catches, corrected PacFIN catches, and quickly uploaded age data that were critical to this assessment. Melissa Mandrup (CDFW) and Brenda Erwin (CDFW) provided timely answers and resolutions regarding California data. 

This assessment was greatly benefitted from thoughtful input we received during the pre-assessemnt data webinar. We would like to specifically thank Mike Okoniewski (Pacific Seafood) and Scott Malvitch (ODFW) who generously offered their time to answer specific questions we had regarding fishing practices for Dover sole across the West Coast.  We are very grateful to Patrick McDonald and the team of agers at CAP for their hard work reading numerous otoliths and availability to answer questions when needed.  Curt Whitmire provided updated survey age data in a timely manner which was critical for early analysis. Jason Jannot and Kayleigh Somers assisted with data from the WCGOP and entertained my many questions. E.J. Dick provided CALCOM expanded length and age samples and quickly addressed our questions about California data. We appreciate Melissa Head's effort to produce updated maturity estimates for the assessment. Also, we would like to acknowledge our survey team and their dedication to improving the assessments we do. The data they collect is essential to the assessment of West Coast stocks. 

The assessment was greatly improved through the streamlining of data processing tools (Kelli Johnson and Ian Taylor) and the many discussions within the Population Ecology team in the FRAM division at the NWFSC.



<!--chapter:end:41acknowledgments.Rmd-->

\clearpage

# References
<!-- If you want to references to appear somewhere before the end, add: -->
<div id="refs"></div>
<!-- where you want it to appear -->
<!-- The following sets the appropriate indentation for the references
  but it cannot be used with bookdown and the make file because it leads
  to a bad pdf.
\noindent
\vspace{-2em}
\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\setlength{\parskip}{8pt}
 -->

<!--chapter:end:49bibliography.Rmd-->

\clearpage
# Tables


<!-- ======================================================= -->
<!-- ***************    Catches      *********************** --> 
<!-- ======================================================= -->

\include{tex_tables/Catches_All_Years.tex}

\newpage

<!-- ======================================================= --> 
<!-- *********** Removals vs. OFL/ACL   ******************** --> 
<!-- ======================================================= --> 


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.83cm}>{\raggedright\arraybackslash}p{1.83cm}>{\raggedright\arraybackslash}p{1.83cm}>{\raggedright\arraybackslash}p{1.83cm}>{\raggedright\arraybackslash}p{1.83cm}}
\caption{(\#tab:ofl)The OFL, ABC, ACL, landings, and the estimated total mortality in metric tons.}\\
\toprule
Year & OFL & ABC & ACL & Landings & Est. Total Mortality\\
\midrule
\endfirsthead
\caption[]{(\#tab:ofl)The OFL, ABC, ACL, landings, and the estimated total mortality in metric tons. \textit{(continued)}}\\
\toprule
Year & OFL & ABC & ACL & Landings & Est. Total Mortality\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2011 & 44400 & 42436 & 25000 & 7782 & 7893\\
2012 & 44826 & 42843 & 25000 & 7328 & 7430\\
2013 & 92955 & 88865 & 25000 & 7970 & 8078\\
2014 & 77774 & 74352 & 25000 & 6449 & 6543\\
2015 & 66871 & 63929 & 50000 & 6327 & 6354\\
2016 & 59221 & 56615 & 50000 & 7318 & 7350\\
2017 & 89702 & 85755 & 50000 & 7892 & 7925\\
2018 & 90282 & 86310 & 50000 & 6421 & 6447\\
2019 & 91102 & 87094 & 50000 & 5767 & 5790\\
2020 & 92048 & 87998 & 50000 & 4688 & 4707\\*
\end{longtable}
\endgroup{}
\endgroup{}

\newpage

<!-- ======================================================= -->
<!-- ***************   Discard Data  *********************** --> 
<!-- ======================================================= -->

\include{tex_tables/discard_rate_table.tex}


<!-- ======================================================= -->
<!-- *************** Commercial Data *********************** --> 
<!-- ======================================================= -->

\include{tex_tables/Com_Length_Samples_by_State_CALCOM.tex}

\include{tex_tables/Com_Age_Samples_by_State_CALCOM.tex}

<!-- ======================================================= -->
<!-- ***************   Survey  Data  *********************** --> 
<!-- ======================================================= -->

\include{tex_tables/index_table.tex}


\include{tex_tables/nwfsc_wgbts_strata.tex}

\include{tex_tables/nwfsc_wcgbts_length_samps.tex}

\include{tex_tables/nwfsc_wcgbts_age_samps.tex}


<!-- ======================================================= -->
<!-- *************** Triennial  Data *********************** --> 
<!-- ======================================================= -->


\include{tex_tables/triennial_early_strata.tex}

\include{tex_tables/triennial_late_strata.tex}

\include{tex_tables/triennial_early_length_samps.tex}

\include{tex_tables/triennial_late_length_samps.tex}

<!-- ======================================================= -->
<!-- *************** AFSC Slope Data  ********************** --> 
<!-- ======================================================= -->


\include{tex_tables/afsc_slope_strata.tex}

\include{tex_tables/afsc_slope_length_samps.tex}

<!-- ======================================================= -->
<!-- *************** NWFSC Slope  Data ********************* --> 
<!-- ======================================================= -->


\include{tex_tables/nwfsc_slope_strata.tex}

\include{tex_tables/nwfsc_slope_length_samps.tex}

\include{tex_tables/nwfsc_slope_age_samps.tex}

<!-- ======================================================= -->
<!-- ***********   Model Structure      ******************** --> 
<!-- ======================================================= -->

\include{tex_tables/model_info.tex}

<!-- ======================================================= -->
<!-- ***********   Model Parameters     ******************** --> 
<!-- ======================================================= -->


\begingroup\fontsize{9}{11}\selectfont

\begin{landscape}\begingroup\fontsize{9}{11}\selectfont

\begin{longtable}[t]{>{\raggedright\arraybackslash}p{7cm}lllll>{\raggedright\arraybackslash}p{4cm}}
\caption{(\#tab:params)List of parameters used in the base model, including estimated values and standard deviations (SD), bounds (minimum and maximum), estimation phase (negative values not estimated), status (indicates if parameters are near bounds), and prior type information (mean and SD).}\\
\toprule
Parameter & Value & Phase & Bounds & Status & SD & Prior (Exp.Val, SD)\\
\midrule
\endfirsthead
\caption[]{(\#tab:params)List of parameters used in the base model, including estimated values and standard deviations (SD), bounds (minimum and maximum), estimation phase (negative values not estimated), status (indicates if parameters are near bounds), and prior type information (mean and SD). \textit{(continued)}}\\
\toprule
Parameter & Value & Phase & Bounds & Status & SD & Prior (Exp.Val, SD)\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
NatM p 1 Fem GP 1 & 0.108 & -2 & (0.05, 0.2) & NA & NA & Log Norm (-2.226, 0.48)\\
L at Amin Fem GP 1 & 7.994 & 2 & (3, 25) & OK & 0.6519700 & None\\
L at Amax Fem GP 1 & 48.052 & 3 & (35, 60) & OK & 0.3001350 & None\\
VonBert K Fem GP 1 & 0.132 & 2 & (0.03, 0.2) & OK & 0.0041634 & None\\
CV young Fem GP 1 & 0.156 & 3 & (0.01, 1) & OK & 0.0117583 & None\\
CV old Fem GP 1 & 0.080 & 4 & (0.01, 1) & OK & 0.0034354 & None\\
Wtlen 1 Fem GP 1 & 0.000 & -99 & (0, 0.1) & NA & NA & None\\
Wtlen 2 Fem GP 1 & 3.332 & -99 & (2, 4) & NA & NA & None\\
Mat50% Fem GP 1 & 32.840 & -99 & (20, 40) & NA & NA & None\\
Mat slope Fem GP 1 & -0.278 & -99 & (-1, 0) & NA & NA & None\\
Eggs/kg inter Fem GP 1 & 1.000 & -99 & (-3, 3) & NA & NA & None\\
Eggs/kg slope wt Fem GP 1 & 0.000 & -99 & (-3, 3) & NA & NA & None\\
NatM p 1 Mal GP 1 & 0.054 & 3 & (-1, 1) & OK & 0.0359919 & Normal (0, 0.2)\\
L at Amin Mal GP 1 & 0.258 & 3 & (-1, 1) & OK & 0.0946283 & None\\
L at Amax Mal GP 1 & -0.135 & 4 & (-1, 1) & OK & 0.0094279 & None\\
VonBert K Mal GP 1 & 0.046 & 3 & (-1, 1) & OK & 0.0454348 & None\\
CV young Mal GP 1 & -0.122 & 4 & (-1, 1) & OK & 0.1162650 & None\\
CV old Mal GP 1 & -0.026 & 5 & (-1, 1) & OK & 0.0665667 & None\\
Wtlen 1 Mal GP 1 & 0.000 & -99 & (0, 0.1) & NA & NA & None\\
Wtlen 2 Mal GP 1 & 3.371 & -99 & (2, 4) & NA & NA & None\\
CohortGrowDev & 1.000 & -4 & (0, 1) & NA & NA & None\\
FracFemale GP 1 & 0.500 & -99 & (1e-06, 0.999999) & NA & NA & None\\
SR LN(R0) & 12.270 & 1 & (6, 17) & OK & 0.1273000 & None\\
SR BH steep & 0.800 & -7 & (0.22, 1) & NA & NA & Normal (0.8, 0.09)\\
SR sigmaR & 0.350 & -99 & (0.15, 0.55) & NA & NA & None\\
SR regime & 0.000 & -99 & (-2, 2) & NA & NA & None\\
SR autocorr & 0.000 & -99 & (0, 0) & NA & NA & None\\
Early InitAge 31 & 0.000 & 2 & (-5, 5) & act & 0.3499870 & dev (NA, NA)\\
Early InitAge 30 & 0.000 & 2 & (-5, 5) & act & 0.3499850 & dev (NA, NA)\\
Early InitAge 29 & 0.000 & 2 & (-5, 5) & act & 0.3499840 & dev (NA, NA)\\
Early InitAge 28 & 0.000 & 2 & (-5, 5) & act & 0.3499820 & dev (NA, NA)\\
Early InitAge 27 & 0.000 & 2 & (-5, 5) & act & 0.3499800 & dev (NA, NA)\\
Early InitAge 26 & 0.000 & 2 & (-5, 5) & act & 0.3499770 & dev (NA, NA)\\
Early InitAge 25 & 0.000 & 2 & (-5, 5) & act & 0.3499750 & dev (NA, NA)\\
Early InitAge 24 & 0.000 & 2 & (-5, 5) & act & 0.3499720 & dev (NA, NA)\\
Early InitAge 23 & 0.000 & 2 & (-5, 5) & act & 0.3499690 & dev (NA, NA)\\
Early InitAge 22 & 0.000 & 2 & (-5, 5) & act & 0.3499660 & dev (NA, NA)\\
Early InitAge 21 & 0.000 & 2 & (-5, 5) & act & 0.3499620 & dev (NA, NA)\\
Early InitAge 20 & 0.000 & 2 & (-5, 5) & act & 0.3499580 & dev (NA, NA)\\
Early InitAge 19 & 0.000 & 2 & (-5, 5) & act & 0.3499530 & dev (NA, NA)\\
Early InitAge 18 & 0.000 & 2 & (-5, 5) & act & 0.3499480 & dev (NA, NA)\\
Early InitAge 17 & 0.000 & 2 & (-5, 5) & act & 0.3499430 & dev (NA, NA)\\
Early InitAge 16 & 0.000 & 2 & (-5, 5) & act & 0.3499370 & dev (NA, NA)\\
Early InitAge 15 & 0.000 & 2 & (-5, 5) & act & 0.3499300 & dev (NA, NA)\\
Early InitAge 14 & 0.000 & 2 & (-5, 5) & act & 0.3499230 & dev (NA, NA)\\
Early InitAge 13 & 0.000 & 2 & (-5, 5) & act & 0.3499150 & dev (NA, NA)\\
Early InitAge 12 & -0.001 & 2 & (-5, 5) & act & 0.3499060 & dev (NA, NA)\\
Early InitAge 11 & -0.001 & 2 & (-5, 5) & act & 0.3498970 & dev (NA, NA)\\
Early InitAge 10 & -0.001 & 2 & (-5, 5) & act & 0.3498860 & dev (NA, NA)\\
Early InitAge 9 & -0.001 & 2 & (-5, 5) & act & 0.3498750 & dev (NA, NA)\\
Early InitAge 8 & -0.001 & 2 & (-5, 5) & act & 0.3498640 & dev (NA, NA)\\
Early InitAge 7 & -0.001 & 2 & (-5, 5) & act & 0.3498510 & dev (NA, NA)\\
Early InitAge 6 & -0.001 & 2 & (-5, 5) & act & 0.3498370 & dev (NA, NA)\\
Early InitAge 5 & -0.001 & 2 & (-5, 5) & act & 0.3498220 & dev (NA, NA)\\
Early InitAge 4 & -0.001 & 2 & (-5, 5) & act & 0.3498050 & dev (NA, NA)\\
Early InitAge 3 & -0.001 & 2 & (-5, 5) & act & 0.3497870 & dev (NA, NA)\\
Early InitAge 2 & -0.001 & 2 & (-5, 5) & act & 0.3497680 & dev (NA, NA)\\
Early InitAge 1 & -0.001 & 2 & (-5, 5) & act & 0.3497460 & dev (NA, NA)\\
Early RecrDev 1911 & -0.002 & 2 & (-5, 5) & act & 0.3497230 & dev (NA, NA)\\
Early RecrDev 1912 & -0.002 & 2 & (-5, 5) & act & 0.3496970 & dev (NA, NA)\\
Early RecrDev 1913 & -0.002 & 2 & (-5, 5) & act & 0.3496690 & dev (NA, NA)\\
Early RecrDev 1914 & -0.002 & 2 & (-5, 5) & act & 0.3496390 & dev (NA, NA)\\
Early RecrDev 1915 & -0.002 & 2 & (-5, 5) & act & 0.3496050 & dev (NA, NA)\\
Early RecrDev 1916 & -0.002 & 2 & (-5, 5) & act & 0.3495690 & dev (NA, NA)\\
Early RecrDev 1917 & -0.003 & 2 & (-5, 5) & act & 0.3495280 & dev (NA, NA)\\
Early RecrDev 1918 & -0.003 & 2 & (-5, 5) & act & 0.3494840 & dev (NA, NA)\\
Early RecrDev 1919 & -0.003 & 2 & (-5, 5) & act & 0.3494360 & dev (NA, NA)\\
Early RecrDev 1920 & -0.004 & 2 & (-5, 5) & act & 0.3493830 & dev (NA, NA)\\
Early RecrDev 1921 & -0.004 & 2 & (-5, 5) & act & 0.3493250 & dev (NA, NA)\\
Early RecrDev 1922 & -0.004 & 2 & (-5, 5) & act & 0.3492610 & dev (NA, NA)\\
Early RecrDev 1923 & -0.005 & 2 & (-5, 5) & act & 0.3491920 & dev (NA, NA)\\
Early RecrDev 1924 & -0.005 & 2 & (-5, 5) & act & 0.3491160 & dev (NA, NA)\\
Early RecrDev 1925 & -0.005 & 2 & (-5, 5) & act & 0.3490320 & dev (NA, NA)\\
Early RecrDev 1926 & -0.006 & 2 & (-5, 5) & act & 0.3489410 & dev (NA, NA)\\
Early RecrDev 1927 & -0.007 & 2 & (-5, 5) & act & 0.3488400 & dev (NA, NA)\\
Early RecrDev 1928 & -0.007 & 2 & (-5, 5) & act & 0.3487300 & dev (NA, NA)\\
Early RecrDev 1929 & -0.008 & 2 & (-5, 5) & act & 0.3486090 & dev (NA, NA)\\
Early RecrDev 1930 & -0.008 & 2 & (-5, 5) & act & 0.3484800 & dev (NA, NA)\\
Early RecrDev 1931 & -0.009 & 2 & (-5, 5) & act & 0.3483390 & dev (NA, NA)\\
Early RecrDev 1932 & -0.010 & 2 & (-5, 5) & act & 0.3481850 & dev (NA, NA)\\
Early RecrDev 1933 & -0.011 & 2 & (-5, 5) & act & 0.3480160 & dev (NA, NA)\\
Early RecrDev 1934 & -0.012 & 2 & (-5, 5) & act & 0.3478300 & dev (NA, NA)\\
Early RecrDev 1935 & -0.013 & 2 & (-5, 5) & act & 0.3476260 & dev (NA, NA)\\
Early RecrDev 1936 & -0.014 & 2 & (-5, 5) & act & 0.3474010 & dev (NA, NA)\\
Early RecrDev 1937 & -0.015 & 2 & (-5, 5) & act & 0.3471540 & dev (NA, NA)\\
Early RecrDev 1938 & -0.017 & 2 & (-5, 5) & act & 0.3468820 & dev (NA, NA)\\
Early RecrDev 1939 & -0.018 & 2 & (-5, 5) & act & 0.3465840 & dev (NA, NA)\\
Early RecrDev 1940 & -0.020 & 2 & (-5, 5) & act & 0.3462580 & dev (NA, NA)\\
Early RecrDev 1941 & -0.022 & 2 & (-5, 5) & act & 0.3459050 & dev (NA, NA)\\
Early RecrDev 1942 & -0.024 & 2 & (-5, 5) & act & 0.3455280 & dev (NA, NA)\\
Early RecrDev 1943 & -0.026 & 2 & (-5, 5) & act & 0.3451410 & dev (NA, NA)\\
Early RecrDev 1944 & -0.028 & 2 & (-5, 5) & act & 0.3447570 & dev (NA, NA)\\
Early RecrDev 1945 & -0.029 & 2 & (-5, 5) & act & 0.3443810 & dev (NA, NA)\\
Early RecrDev 1946 & -0.031 & 2 & (-5, 5) & act & 0.3440340 & dev (NA, NA)\\
Early RecrDev 1947 & -0.032 & 2 & (-5, 5) & act & 0.3437420 & dev (NA, NA)\\
Early RecrDev 1948 & -0.033 & 2 & (-5, 5) & act & 0.3435200 & dev (NA, NA)\\
Early RecrDev 1949 & -0.032 & 2 & (-5, 5) & act & 0.3433990 & dev (NA, NA)\\
Early RecrDev 1950 & -0.031 & 2 & (-5, 5) & act & 0.3434180 & dev (NA, NA)\\
Early RecrDev 1951 & -0.029 & 2 & (-5, 5) & act & 0.3435870 & dev (NA, NA)\\
Early RecrDev 1952 & -0.025 & 2 & (-5, 5) & act & 0.3439230 & dev (NA, NA)\\
Early RecrDev 1953 & -0.020 & 2 & (-5, 5) & act & 0.3444390 & dev (NA, NA)\\
Early RecrDev 1954 & -0.014 & 2 & (-5, 5) & act & 0.3451440 & dev (NA, NA)\\
Early RecrDev 1955 & -0.006 & 2 & (-5, 5) & act & 0.3459740 & dev (NA, NA)\\
Early RecrDev 1956 & 0.002 & 2 & (-5, 5) & act & 0.3468460 & dev (NA, NA)\\
Early RecrDev 1957 & 0.011 & 2 & (-5, 5) & act & 0.3476500 & dev (NA, NA)\\
Early RecrDev 1958 & 0.019 & 2 & (-5, 5) & act & 0.3481720 & dev (NA, NA)\\
Early RecrDev 1959 & 0.024 & 2 & (-5, 5) & act & 0.3481670 & dev (NA, NA)\\
Early RecrDev 1960 & 0.025 & 2 & (-5, 5) & act & 0.3474870 & dev (NA, NA)\\
Early RecrDev 1961 & 0.023 & 2 & (-5, 5) & act & 0.3462650 & dev (NA, NA)\\
Early RecrDev 1962 & 0.019 & 2 & (-5, 5) & act & 0.3449250 & dev (NA, NA)\\
Early RecrDev 1963 & 0.018 & 2 & (-5, 5) & act & 0.3440230 & dev (NA, NA)\\
Early RecrDev 1964 & 0.024 & 2 & (-5, 5) & act & 0.3438290 & dev (NA, NA)\\
Early RecrDev 1965 & 0.035 & 2 & (-5, 5) & act & 0.3440890 & dev (NA, NA)\\
Early RecrDev 1966 & 0.046 & 2 & (-5, 5) & act & 0.3440780 & dev (NA, NA)\\
Early RecrDev 1967 & 0.052 & 2 & (-5, 5) & act & 0.3430640 & dev (NA, NA)\\
Early RecrDev 1968 & 0.053 & 2 & (-5, 5) & act & 0.3408960 & dev (NA, NA)\\
Early RecrDev 1969 & 0.051 & 2 & (-5, 5) & act & 0.3377750 & dev (NA, NA)\\
Early RecrDev 1970 & 0.045 & 2 & (-5, 5) & act & 0.3339940 & dev (NA, NA)\\
Early RecrDev 1971 & 0.036 & 2 & (-5, 5) & act & 0.3302760 & dev (NA, NA)\\
Early RecrDev 1972 & 0.034 & 2 & (-5, 5) & act & 0.3277400 & dev (NA, NA)\\
Early RecrDev 1973 & 0.058 & 2 & (-5, 5) & act & 0.3277570 & dev (NA, NA)\\
Early RecrDev 1974 & 0.116 & 2 & (-5, 5) & act & 0.3299830 & dev (NA, NA)\\
Main RecrDev 1975 & 0.175 & 1 & (-5, 5) & act & 0.3249090 & dev (NA, NA)\\
Main RecrDev 1976 & 0.170 & 1 & (-5, 5) & act & 0.3194670 & dev (NA, NA)\\
Main RecrDev 1977 & 0.077 & 1 & (-5, 5) & act & 0.3079680 & dev (NA, NA)\\
Main RecrDev 1978 & -0.027 & 1 & (-5, 5) & act & 0.2940390 & dev (NA, NA)\\
Main RecrDev 1979 & -0.083 & 1 & (-5, 5) & act & 0.2825360 & dev (NA, NA)\\
Main RecrDev 1980 & -0.119 & 1 & (-5, 5) & act & 0.2722570 & dev (NA, NA)\\
Main RecrDev 1981 & -0.192 & 1 & (-5, 5) & act & 0.2652520 & dev (NA, NA)\\
Main RecrDev 1982 & -0.246 & 1 & (-5, 5) & act & 0.2607530 & dev (NA, NA)\\
Main RecrDev 1983 & -0.221 & 1 & (-5, 5) & act & 0.2564420 & dev (NA, NA)\\
Main RecrDev 1984 & -0.204 & 1 & (-5, 5) & act & 0.2571300 & dev (NA, NA)\\
Main RecrDev 1985 & -0.144 & 1 & (-5, 5) & act & 0.2559530 & dev (NA, NA)\\
Main RecrDev 1986 & -0.104 & 1 & (-5, 5) & act & 0.2641320 & dev (NA, NA)\\
Main RecrDev 1987 & 0.043 & 1 & (-5, 5) & act & 0.2750120 & dev (NA, NA)\\
Main RecrDev 1988 & 0.275 & 1 & (-5, 5) & act & 0.2644450 & dev (NA, NA)\\
Main RecrDev 1989 & 0.125 & 1 & (-5, 5) & act & 0.2870610 & dev (NA, NA)\\
Main RecrDev 1990 & 0.131 & 1 & (-5, 5) & act & 0.2892640 & dev (NA, NA)\\
Main RecrDev 1991 & 0.295 & 1 & (-5, 5) & act & 0.2775250 & dev (NA, NA)\\
Main RecrDev 1992 & 0.273 & 1 & (-5, 5) & act & 0.2650400 & dev (NA, NA)\\
Main RecrDev 1993 & -0.010 & 1 & (-5, 5) & act & 0.2590830 & dev (NA, NA)\\
Main RecrDev 1994 & -0.170 & 1 & (-5, 5) & act & 0.2439250 & dev (NA, NA)\\
Main RecrDev 1995 & -0.170 & 1 & (-5, 5) & act & 0.2305950 & dev (NA, NA)\\
Main RecrDev 1996 & -0.111 & 1 & (-5, 5) & act & 0.2425970 & dev (NA, NA)\\
Main RecrDev 1997 & 0.390 & 1 & (-5, 5) & act & 0.2005750 & dev (NA, NA)\\
Main RecrDev 1998 & 0.391 & 1 & (-5, 5) & act & 0.2083130 & dev (NA, NA)\\
Main RecrDev 1999 & 0.121 & 1 & (-5, 5) & act & 0.2380310 & dev (NA, NA)\\
Main RecrDev 2000 & 0.537 & 1 & (-5, 5) & act & 0.1646990 & dev (NA, NA)\\
Main RecrDev 2001 & 0.034 & 1 & (-5, 5) & act & 0.2040620 & dev (NA, NA)\\
Main RecrDev 2002 & -0.374 & 1 & (-5, 5) & act & 0.2074260 & dev (NA, NA)\\
Main RecrDev 2003 & -0.476 & 1 & (-5, 5) & act & 0.1978180 & dev (NA, NA)\\
Main RecrDev 2004 & -0.450 & 1 & (-5, 5) & act & 0.1907800 & dev (NA, NA)\\
Main RecrDev 2005 & -0.419 & 1 & (-5, 5) & act & 0.1924790 & dev (NA, NA)\\
Main RecrDev 2006 & -0.252 & 1 & (-5, 5) & act & 0.1885100 & dev (NA, NA)\\
Main RecrDev 2007 & -0.019 & 1 & (-5, 5) & act & 0.1767170 & dev (NA, NA)\\
Main RecrDev 2008 & 0.218 & 1 & (-5, 5) & act & 0.1632500 & dev (NA, NA)\\
Main RecrDev 2009 & 0.517 & 1 & (-5, 5) & act & 0.1423250 & dev (NA, NA)\\
Main RecrDev 2010 & 0.253 & 1 & (-5, 5) & act & 0.1761350 & dev (NA, NA)\\
Main RecrDev 2011 & 0.024 & 1 & (-5, 5) & act & 0.1993930 & dev (NA, NA)\\
Main RecrDev 2012 & 0.181 & 1 & (-5, 5) & act & 0.1762300 & dev (NA, NA)\\
Main RecrDev 2013 & -0.214 & 1 & (-5, 5) & act & 0.2153530 & dev (NA, NA)\\
Main RecrDev 2014 & -0.195 & 1 & (-5, 5) & act & 0.2233590 & dev (NA, NA)\\
Main RecrDev 2015 & -0.023 & 1 & (-5, 5) & act & 0.2512550 & dev (NA, NA)\\
Main RecrDev 2016 & -0.001 & 1 & (-5, 5) & act & 0.3100570 & dev (NA, NA)\\
Main RecrDev 2017 & -0.006 & 1 & (-5, 5) & act & 0.3393210 & dev (NA, NA)\\
Main RecrDev 2018 & -0.001 & 1 & (-5, 5) & act & 0.3446800 & dev (NA, NA)\\
Late RecrDev 2019 & 0.000 & 6 & (-5, 5) & act & 0.3500000 & dev (NA, NA)\\
Late RecrDev 2020 & 0.000 & 6 & (-5, 5) & act & 0.3500000 & dev (NA, NA)\\
LnQ base AFSC Slope(3) & -0.514 & -1 & (-25, 25) & NA & NA & None\\
Q extraSD AFSC Slope(3) & 0.042 & 3 & (0, 2) & OK & 0.0440172 & None\\
LnQ base Triennial(4) & -1.519 & 1 & (-10, 2) & OK & 0.2239780 & None\\
Q extraSD Triennial(4) & 0.317 & 3 & (0, 2) & OK & 0.0962624 & None\\
LnQ base NWFSC Slope(5) & 0.129 & -1 & (-25, 25) & NA & NA & None\\
Q extraSD NWFSC Slope(5) & 0.044 & 3 & (0, 2) & OK & 0.0388581 & None\\
LnQ base NWFSC WCGBT(6) & 0.070 & -1 & (-25, 25) & NA & NA & None\\
LnQ base Triennial(4) BLK4add 1995 & 0.756 & 3 & (-15, 15) & OK & 0.2799050 & None\\
Size DblN peak CA(1) & 37.419 & 1 & (15, 50) & OK & 0.6528580 & None\\
Size DblN top logit CA(1) & -15.000 & -3 & (-15, 7) & NA & NA & None\\
Size DblN ascend se CA(1) & 3.473 & 3 & (-10, 10) & OK & 0.1418580 & None\\
Size DblN descend se CA(1) & 6.000 & -4 & (-10, 10) & NA & NA & None\\
Size DblN start logit CA(1) & -20.000 & -9 & (-20, 30) & NA & NA & None\\
Size DblN end logit CA(1) & 10.000 & -4 & (-10, 10) & NA & NA & None\\
Retain L infl CA(1) & 25.682 & 2 & (10, 40) & OK & 1.1243100 & None\\
Retain L width CA(1) & 1.389 & 3 & (0.1, 5) & OK & 0.3298070 & None\\
Retain L asymptote logit CA(1) & 5.767 & 3 & (-10, 10) & OK & 0.2175330 & None\\
Retain L maleoffset CA(1) & 0.000 & -9 & (-10, 10) & NA & NA & None\\
SzSel Fem Peak CA(1) & 0.858 & 2 & (-20, 20) & OK & 0.6002580 & None\\
SzSel Fem Ascend CA(1) & 0.000 & -4 & (-5, 5) & NA & NA & None\\
SzSel Fem Descend CA(1) & 0.000 & -4 & (-10, 10) & NA & NA & None\\
SzSel Fem Final CA(1) & -11.283 & 3 & (-20, 10) & OK & 1.0255000 & None\\
SzSel Fem Scale CA(1) & 0.669 & 3 & (0.01, 1) & OK & 0.0697448 & None\\
Size DblN peak OR WA(2) & 36.462 & 2 & (15, 50) & OK & 0.0656806 & None\\
Size DblN top logit OR WA(2) & -11.469 & -3 & (-15, 5) & NA & NA & None\\
Size DblN ascend se OR WA(2) & 3.183 & 3 & (-10, 10) & OK & 0.0470625 & None\\
Size DblN descend se OR WA(2) & -9.977 & -4 & (-10, 10) & NA & NA & None\\
Size DblN start logit OR WA(2) & -20.000 & -9 & (-20, 30) & NA & NA & None\\
Size DblN end logit OR WA(2) & -0.524 & 2 & (-10, 10) & OK & 0.1895980 & None\\
Retain L infl OR WA(2) & 23.601 & 2 & (15, 40) & OK & 0.6895470 & None\\
Retain L width OR WA(2) & 1.561 & 3 & (0.1, 5) & OK & 0.1746760 & None\\
Retain L asymptote logit OR WA(2) & 6.273 & 3 & (-10, 10) & OK & 0.1758390 & None\\
Retain L maleoffset OR WA(2) & 0.000 & -9 & (-10, 10) & NA & NA & None\\
SzSel Fem Peak OR WA(2) & 5.067 & 2 & (-20, 20) & OK & 0.1074580 & None\\
SzSel Fem Ascend OR WA(2) & 1.242 & -4 & (-5, 5) & NA & NA & None\\
SzSel Fem Descend OR WA(2) & -0.888 & -4 & (-10, 10) & NA & NA & None\\
SzSel Fem Final OR WA(2) & -0.654 & 3 & (-20, 10) & OK & 0.2386450 & None\\
SzSel Fem Scale OR WA(2) & 0.534 & 3 & (0.1, 1) & OK & 0.0424478 & None\\
SizeSpline Code AFSC Slope(3) & 0.000 & -9 & (0, 2) & NA & NA & None\\
SizeSpline GradLo AFSC Slope(3) & 0.413 & 3 & (-0.001, 10) & OK & 0.0495267 & None\\
SizeSpline GradHi AFSC Slope(3) & -0.123 & 3 & (-1, 1) & OK & 0.0876719 & None\\
SizeSpline Knot 1 AFSC Slope(3) & 20.000 & -99 & (8, 60) & NA & NA & None\\
SizeSpline Knot 2 AFSC Slope(3) & 34.000 & -99 & (8, 60) & NA & NA & None\\
SizeSpline Knot 3 AFSC Slope(3) & 38.000 & -99 & (8, 60) & NA & NA & None\\
SizeSpline Knot 4 AFSC Slope(3) & 48.000 & -99 & (8, 60) & NA & NA & None\\
SizeSpline Val 1 AFSC Slope(3) & -2.101 & 2 & (-9, 7) & OK & 0.1740300 & None\\
SizeSpline Val 2 AFSC Slope(3) & 0.462 & 2 & (-9, 7) & OK & 0.0763358 & None\\
SizeSpline Val 3 AFSC Slope(3) & 0.000 & -99 & (-9, 7) & NA & NA & None\\
SizeSpline Val 4 AFSC Slope(3) & 0.444 & 2 & (-9, 7) & OK & 0.1727740 & None\\
SzSel MaleDogleg AFSC Slope(3) & 45.000 & -4 & (-10, 60) & NA & NA & None\\
SzSel MaleatZero AFSC Slope(3) & 0.000 & -5 & (-10, 10) & NA & NA & None\\
SzSel MaleatDogleg AFSC Slope(3) & 0.874 & 5 & (-10, 10) & OK & 0.1192610 & None\\
SzSel MaleatMaxage AFSC Slope(3) & -3.003 & -5 & (-10, 10) & NA & NA & None\\
Size DblN peak Triennial(4) & 31.124 & 2 & (15, 55) & OK & 0.4219320 & None\\
Size DblN top logit Triennial(4) & -9.119 & -3 & (-10, 5) & NA & NA & None\\
Size DblN ascend se Triennial(4) & 4.007 & 3 & (-10, 10) & OK & 0.1225830 & None\\
Size DblN descend se Triennial(4) & 2.992 & -4 & (-10, 10) & NA & NA & None\\
Size DblN start logit Triennial(4) & -20.000 & -9 & (-20, 30) & NA & NA & None\\
Size DblN end logit Triennial(4) & -2.566 & 3 & (-10, 10) & OK & 0.6052600 & None\\
SzSel Fem Peak Triennial(4) & 0.000 & -4 & (-20, 20) & NA & NA & None\\
SzSel Fem Ascend Triennial(4) & 0.000 & -4 & (-5, 5) & NA & NA & None\\
SzSel Fem Descend Triennial(4) & 0.000 & -4 & (-10, 10) & NA & NA & None\\
SzSel Fem Final Triennial(4) & 1.166 & 4 & (-20, 20) & OK & 0.6189130 & None\\
SzSel Fem Scale Triennial(4) & 0.698 & 3 & (0.01, 1) & OK & 0.0749704 & None\\
SizeSpline Code NWFSC Slope(5) & 0.000 & -9 & (0, 2) & NA & NA & None\\
SizeSpline GradLo NWFSC Slope(5) & 0.770 & 3 & (-0.001, 10) & OK & 0.2628160 & None\\
SizeSpline GradHi NWFSC Slope(5) & -0.199 & 3 & (-1, 1) & OK & 0.1431560 & None\\
SizeSpline Knot 1 NWFSC Slope(5) & 20.000 & -99 & (8, 60) & NA & NA & None\\
SizeSpline Knot 2 NWFSC Slope(5) & 34.000 & -99 & (8, 60) & NA & NA & None\\
SizeSpline Knot 3 NWFSC Slope(5) & 38.000 & -99 & (8, 60) & NA & NA & None\\
SizeSpline Knot 4 NWFSC Slope(5) & 48.000 & -99 & (8, 60) & NA & NA & None\\
SizeSpline Val 1 NWFSC Slope(5) & -4.012 & 2 & (-9, 7) & OK & 0.8145320 & None\\
SizeSpline Val 2 NWFSC Slope(5) & 0.317 & 2 & (-9, 7) & OK & 0.1373030 & None\\
SizeSpline Val 3 NWFSC Slope(5) & 0.000 & -99 & (-9, 7) & NA & NA & None\\
SizeSpline Val 4 NWFSC Slope(5) & 0.375 & 2 & (-9, 7) & OK & 0.2689290 & None\\
SzSel MaleDogleg NWFSC Slope(5) & 45.000 & -4 & (-10, 60) & NA & NA & None\\
SzSel MaleatZero NWFSC Slope(5) & 0.000 & -5 & (-10, 10) & NA & NA & None\\
SzSel MaleatDogleg NWFSC Slope(5) & 0.880 & 5 & (-10, 10) & OK & 0.1660520 & None\\
SzSel MaleatMaxage NWFSC Slope(5) & -5.624 & -5 & (-10, 10) & NA & NA & None\\
Size DblN peak NWFSC WCGBT(6) & 33.691 & 2 & (15, 55) & OK & 0.2174900 & None\\
Size DblN top logit NWFSC WCGBT(6) & -2.968 & -3 & (-15, 5) & NA & NA & None\\
Size DblN ascend se NWFSC WCGBT(6) & 4.077 & 3 & (-10, 10) & OK & 0.0445981 & None\\
Size DblN descend se NWFSC WCGBT(6) & -0.815 & -4 & (-10, 10) & NA & NA & None\\
Size DblN start logit NWFSC WCGBT(6) & -10.000 & -9 & (-20, 30) & NA & NA & None\\
Size DblN end logit NWFSC WCGBT(6) & 1.049 & 3 & (-10, 10) & OK & 0.2704930 & None\\
SzSel Fem Peak NWFSC WCGBT(6) & 0.000 & -4 & (-15, 15) & NA & NA & None\\
SzSel Fem Ascend NWFSC WCGBT(6) & 0.000 & -4 & (-5, 5) & NA & NA & None\\
SzSel Fem Descend NWFSC WCGBT(6) & 3.013 & -4 & (-10, 10) & NA & NA & None\\
SzSel Fem Final NWFSC WCGBT(6) & -0.952 & 4 & (-20, 20) & OK & 0.3046470 & None\\
SzSel Fem Scale NWFSC WCGBT(6) & 0.649 & 4 & (0.01, 1) & OK & 0.0371037 & None\\
Size DblN peak CA(1) BLK1repl 1910 & 39.938 & 4 & (15, 55) & OK & 0.7448700 & None\\
Size DblN peak CA(1) BLK1repl 1985 & 35.578 & 4 & (15, 55) & OK & 0.7699650 & None\\
Retain L infl CA(1) BLK2repl 1910 & 10.000 & -4 & (10, 40) & NA & NA & None\\
Retain L infl CA(1) BLK2repl 1948 & 28.901 & 5 & (15, 40) & OK & 0.5102720 & None\\
Retain L infl CA(1) BLK2repl 2011 & 25.233 & 5 & (15, 40) & OK & 1.4874500 & None\\
Retain L width CA(1) BLK2repl 1910 & 0.100 & -4 & (0.1, 5) & NA & NA & None\\
Retain L width CA(1) BLK2repl 1948 & 0.992 & 5 & (0.1, 5) & OK & 0.2835660 & None\\
Retain L width CA(1) BLK2repl 2011 & 1.055 & 5 & (0.1, 5) & OK & 0.5451350 & None\\
Retain L asymptote logit CA(1) BLK2repl 1910 & 10.000 & -4 & (-10, 10) & NA & NA & None\\
Retain L asymptote logit CA(1) BLK2repl 1948 & 2.375 & 5 & (-10, 10) & OK & 0.0839036 & None\\
Retain L asymptote logit CA(1) BLK2repl 2011 & 3.265 & 5 & (-10, 10) & OK & 0.0539576 & None\\
SzSel Fem Peak CA(1) BLK1repl 1910 & 0.978 & 4 & (-50, 50) & OK & 0.8112050 & None\\
SzSel Fem Peak CA(1) BLK1repl 1985 & 1.007 & 4 & (-50, 50) & OK & 0.8754770 & None\\
Size DblN peak OR WA(2) BLK1repl 1910 & 42.434 & 4 & (15, 55) & OK & 0.5659470 & None\\
Size DblN peak OR WA(2) BLK1repl 1985 & 35.499 & 4 & (15, 55) & OK & 0.0149884 & None\\
Retain L infl OR WA(2) BLK3repl 1910 & 27.904 & 5 & (15, 40) & OK & 0.6798150 & None\\
Retain L infl OR WA(2) BLK3repl 2002 & 27.172 & 5 & (15, 40) & OK & 0.6943230 & None\\
Retain L width OR WA(2) BLK3repl 1910 & 0.843 & 5 & (0.1, 5) & OK & 0.3719160 & None\\
Retain L width OR WA(2) BLK3repl 2002 & 1.378 & 5 & (0.1, 5) & OK & 0.3438220 & None\\
Retain L asymptote logit OR WA(2) BLK3repl 1910 & 2.340 & 5 & (-10, 10) & OK & 0.0859856 & None\\
Retain L asymptote logit OR WA(2) BLK3repl 2002 & 3.286 & 5 & (-10, 10) & OK & 0.1054710 & None\\
SzSel Fem Peak OR WA(2) BLK1repl 1910 & 10.066 & 4 & (-50, 50) & OK & 0.5665890 & None\\
SzSel Fem Peak OR WA(2) BLK1repl 1985 & 4.841 & 4 & (-50, 50) & OK & 0.2462730 & None\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}

<!-- ======================================================= -->
<!-- ***********    Like Contributions  ******************** --> 
<!-- ======================================================= -->


\include{tex_tables/likelihoods.tex}

<!-- ======================================================= -->
<!-- ********  Reference Points & Management *************** --> 
<!-- ======================================================= -->

\include{tex_tables/e_ReferencePoints_ES.tex}

<!-- ======================================================= -->
<!-- ***********       Time Series      ******************** --> 
<!-- ======================================================= -->

\include{tex_tables/TimeSeries.tex}

\newpage


<!-- ======================================================= -->
<!-- ****************     Sensitivities      *************** --> 
<!-- ======================================================= -->

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:dw)Data weights applied by each alternative data weighting method. Weights for the Dirichlet
              multinomial are not shown due to inconsistent results relative to input sample sizes and parameters
              hitting bounds.}\\
\toprule
Data & Francis & McAllister Ianelli & Dirichlet Multinomial\\
\midrule
\endfirsthead
\caption[]{(\#tab:dw)Data weights applied by each alternative data weighting method. Weights for the Dirich \textit{(continued)}}\\
\toprule
Data & Francis & McAllister Ianelli & Dirichlet Multinomial\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
California Lengths & 0.082 & 0.182 & 0.972\\
Oregon/Washington Lengths & 0.093 & 0.084 & 0.951\\
AFSC Slope Lengths & 1.856 & 3.117 & 1.000\\
Triennial Lengths & 0.243 & 0.618 & 1.000\\
NWFSC Slope Lengths & 0.286 & 1.395 & 1.000\\
NWFSC WCGBT Lengths & 0.409 & 1.115 & 1.000\\
California Ages & 0.119 & 0.505 & 1.000\\
Oregon/Washington Ages & 0.189 & 0.563 & 1.000\\
NWFSC Slope Ages & 0.034 & 0.184 & 1.000\\
NWFSC WCGBT Ages & 0.111 & 0.157 & 1.000\\*
\end{longtable}
\endgroup{}
\endgroup{}

\newpage

\include{tex_tables/sensitivities_crw.tex}

\include{tex_tables/sensitivities2_crw.tex}

<!-- ======================================================= -->
<!-- ********  Reference Points & Management *************** --> 
<!-- ======================================================= -->

\begingroup\fontsize{10}{12}\selectfont

\begin{landscape}\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:project)Projections of potential OFLs (mt), ABCs (mt), estimated spawning output, and fraction unfished. The adopted OFL, ABC, and ACL for 2021 and 2022 reflect adopted management limits and the assumed removal is the amount assumed in the projection for 2021 and 2022. The full ABC was assumed to be removed for 2023 - 2032}\\
\toprule
Year & Adopted OFL (mt) & Adopted ABC (mt) & Adopted ACL (mt) & Assumed Removal (mt) & OFL (mt) & ABC (mt) & Buffer & Spawning Output & Fraction Unfished\\
\midrule
\endfirsthead
\caption[]{(\#tab:project)Projections of potential OFLs (mt), ABCs (mt), estimated spawning output, and fraction unfished. The adopted OFL, ABC, and ACL for 2021 and 2022 reflect adopted management limits and the assumed removal is the amount assumed in the projection for 2021 and 2022. The full ABC was assumed to be removed for 2023 - 2032 \textit{(continued)}}\\
\toprule
Year & Adopted OFL (mt) & Adopted ABC (mt) & Adopted ACL (mt) & Assumed Removal (mt) & OFL (mt) & ABC (mt) & Buffer & Spawning Output & Fraction Unfished\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 93547 & 84192 & 50000 & 10000 & - & - & - & 232065 & 0.79\\
2022 & 87540 & 78436 & 50000 & 10000 & - & - & - & 231642 & 0.79\\
2023 & - & - & - & - & 63834 & 59684 & 0.935 & 230918 & 0.79\\
2024 & - & - & - & - & 55859 & 51949 & 0.93 & 207333 & 0.71\\
2025 & - & - & - & - & 49608 & 45937 & 0.926 & 187284 & 0.64\\
2026 & - & - & - & - & 44769 & 41277 & 0.922 & 170449 & 0.58\\
2027 & - & - & - & - & 41053 & 37646 & 0.917 & 156459 & 0.53\\
2028 & - & - & - & - & 38217 & 34892 & 0.913 & 144943 & 0.49\\
2029 & - & - & - & - & 36050 & 32770 & 0.909 & 135500 & 0.46\\
2030 & - & - & - & - & 34389 & 31088 & 0.904 & 127779 & 0.43\\
2031 & - & - & - & - & 33108 & 29797 & 0.9 & 121483 & 0.41\\
2032 & - & - & - & - & 32100 & 28762 & 0.896 & 116323 & 0.40\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}



<!--chapter:end:52tables.Rmd-->

\clearpage
# Figures

<!-- ====================================================================== --> 
<!-- *******************    Assessment Map      *************************** --> 
<!-- ====================================================================== --> 


![Map of the assessment area..\label{fig:map}](figs/map.png){width=100% height=100% alt="Map of the assessment area.."}

<!-- ====================================================================== -->  
<!-- ****************** Catches Used in the Model ************************* --> 
<!-- ====================================================================== -->  


![Landings by fleet used in the base model.\label{fig:catch}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/catch2 landings stacked.png){width=100% height=100% alt="Landings by fleet used in the base model."}

<!-- ====================================================================== --> 
<!-- ******************* Data Used in the Model *************************** --> 
<!-- ====================================================================== --> 


![Summary of data sources used in the base model.\label{fig:data-plot}](figs/data_plot.png){width=100% height=100% alt="Summary of data sources used in the base model."}

<!-- ======================================================= -->
<!-- ***************   Discard Data  *********************** --> 
<!-- ======================================================= -->


![Observed discard rates for the California fleet.\label{fig:ca-disc-ob}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/discard_dataCA.png){width=100% height=100% alt="Observed discard rates for the California fleet."}


![Observed discard rates for the Oregon/Washington fleet.\label{fig:orwa-disc-ob}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/discard_dataOR_WA.png){width=100% height=100% alt="Observed discard rates for the Oregon/Washington fleet."}


![Observed discard mean weights for the California fleet.\label{fig:ca-disc-wght-ob}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/bodywt_data_fltCA.png){width=100% height=100% alt="Observed discard mean weights for the California fleet."}


![Observed discard mean weights for the Oregon/Washington fleet.\label{fig:orwa-disc-wght-ob}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/bodywt_data_fltOR_WA.png){width=100% height=100% alt="Observed discard mean weights for the Oregon/Washington fleet."}


![Observed discard lengths for the California fleet.\label{fig:ca-disc-len-ob}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_flt1mkt1.png){width=100% height=100% alt="Observed discard lengths for the California fleet."}


![Observed discard lengths for the Oregon/Washington fleet.\label{fig:orwa-disc-len-ob-1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_flt2mkt1_page1.png){width=100% height=100% alt="Observed discard lengths for the Oregon/Washington fleet."}


![Observed discard lengths for the Oregon/Washington fleet.\label{fig:orwa-disc-len-ob-2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_flt2mkt1_page2.png){width=100% height=100% alt="Observed discard lengths for the Oregon/Washington fleet."}


<!-- ======================================================= -->
<!-- *************** Commercial Data *********************** --> 
<!-- ======================================================= -->


![The number of length samples by port and year from California.\label{fig:ca-len-port}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/commercial_comps/plots/Length_by_CA_port.png){width=100% height=100% alt="The number of length samples by port and year from California."}


![Length composition data from the California commercial fleet.\label{fig:ca-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_bubflt1mkt2_page4.png){width=100% height=100% alt="Length composition data from the California commercial fleet."}


![Mean length for California commercial fleet with 95 percent confidence intervals.\label{fig:mean-ca-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_data_weighting_TA1.8_CA.png){width=100% height=100% alt="Mean length for California commercial fleet with 95 percent confidence intervals."}


![Length composition data aggregated across years by fleet.\label{fig:agg-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat__aggregated_across_time.png){width=100% height=100% alt="Length composition data aggregated across years by fleet."}


![The number of read otoliths samples by port and year from California.\label{fig:ca-age-port}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/commercial_comps/plots/Age_by_CA_port.png){width=100% height=100% alt="The number of read otoliths samples by port and year from California."}


![Age composition data from the California commercial fleet.\label{fig:ca-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agedat_bubflt1mkt2_page2.png){width=100% height=100% alt="Age composition data from the California commercial fleet."}


![Mean age for California commercial fleet with 95 percent confidence intervals.\label{fig:mean-ca-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agedat_data_weighting_TA1.8_CA.png){width=100% height=100% alt="Mean age for California commercial fleet with 95 percent confidence intervals."}


![Age composition data aggregated across years by fleet.\label{fig:agg-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agedat__aggregated_across_time.png){width=100% height=100% alt="Age composition data aggregated across years by fleet."}


![The number of length samples by port and year from Oregon.\label{fig:or-len-port}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/commercial_comps/plots/Length_by_OR_port.png){width=100% height=100% alt="The number of length samples by port and year from Oregon."}


![The number of length samples by port and year from Washington.\label{fig:wa-len-port}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/commercial_comps/plots/Length_by_WA_port.png){width=100% height=100% alt="The number of length samples by port and year from Washington."}



![Length composition data from the Oregon/Washington commercial fleet.\label{fig:orwa-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_bubflt2mkt2_page3.png){width=100% height=100% alt="Length composition data from the Oregon/Washington commercial fleet."}


![Mean length for Oregon/Washington commercial fleet with 95 percent confidence intervals.\label{fig:mean-orwa-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_data_weighting_TA1.8_OR_WA.png){width=100% height=100% alt="Mean length for Oregon/Washington commercial fleet with 95 percent confidence intervals."}


![The number of read otoliths samples by port and year from Oregon.\label{fig:or-age-port}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/commercial_comps/plots/Age_by_OR_port.png){width=100% height=100% alt="The number of read otoliths samples by port and year from Oregon."}

\newpage


![The number of read otoliths samples by port and year from Washington.\label{fig:wa-age-port}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/commercial_comps/plots/Age_by_WA_port.png){width=100% height=100% alt="The number of read otoliths samples by port and year from Washington."}


![Age composition data from the Oregon/Washington commercial fleet.\label{fig:orwa-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agedat_bubflt2mkt2_page2.png){width=100% height=100% alt="Age composition data from the Oregon/Washington commercial fleet."}


![Mean age for Oregon/Washington commercial fleet with 95 percent confidence intervals.\label{fig:mean-orwa-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agedat_data_weighting_TA1.8_OR_WA.png){width=100% height=100% alt="Mean age for Oregon/Washington commercial fleet with 95 percent confidence intervals."}

<!-- ======================================================= -->
<!-- ***************  NWFSC WCGBT Survey ******************* --> 
<!-- ======================================================= -->


![Observed length by depth from each survey.\label{fig:data-len-depth}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/Length_by_Depth_by_Source.png){width=100% height=100% alt="Observed length by depth from each survey."}

\newpage


![Observed age by depth from the NWFSC Slope and WCGBT surveys.\label{fig:data-age-depth}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/Age_by_Depth.png){width=100% height=100% alt="Observed age by depth from the NWFSC Slope and WCGBT surveys."}

\newpage	


![The catch-per-unit-effort (log-scale), lengths by sex observed by depth and latitude for the WCGBTS. The solid lines indicate the average length by depth or latitude by sex (red - females, blue - males, grey - unsexed).\label{fig:cpue-len}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/plots/Dover_sole_NWFSC_WCGBTS_CPUE_Depth_Latitude.png){width=100% height=100% alt="The catch-per-unit-effort (log-scale), lengths by sex observed by depth and latitude for the WCGBTS. The solid lines indicate the average length by depth or latitude by sex (red - females, blue - males, grey - unsexed)."}

\clearpage


![Observed proportion of positve tows and sex ratio by depth bins (m) from the WCGBTS.\label{fig:pos-tows-sex-ratio}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/wcgbts/plots/WCGBTS_presence_by_depth_bin.png){width=100% height=100% alt="Observed proportion of positve tows and sex ratio by depth bins (m) from the WCGBTS."}


\newpage


![Q-Q and diagnostics for the WCGBTS.\label{fig:wcgbt-qq}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/dover_sole/data/NWFSC.Combo_gamma/QQ_Fn/Posterior_Predictive-Histogram-1.jpg){width=100% height=100% alt="Q-Q and diagnostics for the WCGBTS."}

\newpage


![Residuals for the WCGBTS index.\label{fig:wcgbt-resid}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/dover_sole/data/NWFSC.Combo_gamma/quantile_residuals_on_map.png){width=100% height=100% alt="Residuals for the WCGBTS index."}

\newpage


![The estimated index of abundance for the WCGBTS.\label{fig:wcgbt-index}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/dover_sole/data/NWFSC.Combo_gamma/VASTWestCoast_Index_2019.png){width=100% height=100% alt="The estimated index of abundance for the WCGBTS."}


![VAST based indices compared to the design-based indices for each fleet.\label{fig:db-vs-vast}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/plots/db_index_comparison.png){width=100% height=100% alt="VAST based indices compared to the design-based indices for each fleet."}


![Length composition data from the WCGBTS.\label{fig:wcgbt-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_bubflt6mkt0_page2.png){width=100% height=100% alt="Length composition data from the WCGBTS."}


![Mean length for WCGBTS with 95 percent confidence intervals.\label{fig:mean-wcgbt-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_data_weighting_TA1.8_NWFSC_WCGBT.png){width=100% height=100% alt="Mean length for WCGBTS with 95 percent confidence intervals."}


![Age composition data from the WCGBTS.\label{fig:wcgbt-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_gstagedat_bubflt6mkt0_page2.png){width=100% height=100% alt="Age composition data from the WCGBTS."}


![Mean age for WCGBTS with 95 percent confidence intervals.\label{fig:mean-wcgbt-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALdat_data_weighting_TA1.8_condAgeNWFSC_WCGBT.png){width=100% height=100% alt="Mean age for WCGBTS with 95 percent confidence intervals."}

\newpage

<!-- ======================================================= -->
<!-- ***************     Triennial   *********************** --> 
<!-- ======================================================= -->


![The estimated index of abundance for the early Triennial survey.\label{fig:tri-early-index}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/dover_sole/data/Triennial_lognormal_early/VASTWestCoast_Index_1992.png){width=100% height=100% alt="The estimated index of abundance for the early Triennial survey."}


![The estimated index of abundance for the late Triennial survey.\label{fig:tri-late-index}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/dover_sole/data/Triennial_lognormal_late/VASTWestCoast_Index_2004.png){width=100% height=100% alt="The estimated index of abundance for the late Triennial survey."}

\newpage


![Q-Q and diagnostics for the early Triennial survey (1980 - 1992).\label{fig:tri-early-qq}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/dover_sole/data/Triennial_lognormal_early/QQ_Fn/Posterior_Predictive-Histogram-1.jpg){width=100% height=100% alt="Q-Q and diagnostics for the early Triennial survey (1980 - 1992)."}


![Q-Q and diagnostics for the late Triennial survey (1995 - 2004).\label{fig:tri-late-qq}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/dover_sole/data/Triennial_lognormal_late/QQ_Fn/Posterior_Predictive-Histogram-1.jpg){width=100% height=100% alt="Q-Q and diagnostics for the late Triennial survey (1995 - 2004)."}

\newpage	


![Residuals for the early Triennial survey.\label{fig:tri-early-resid}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/dover_sole/data/Triennial_lognormal_early/quantile_residuals_on_map.png){width=100% height=100% alt="Residuals for the early Triennial survey."}


![Residuals for the late Triennial survey.\label{fig:tri-late-resid}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/dover_sole/data/Triennial_lognormal_late/quantile_residuals_on_map.png){width=100% height=100% alt="Residuals for the late Triennial survey."}

\newpage



![Length composition data from the Triennial survey.\label{fig:tri-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_bubflt4mkt0.png){width=100% height=100% alt="Length composition data from the Triennial survey."}


![Mean length for Triennial with 95 percent confidence intervals.\label{fig:mean-tri-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_data_weighting_TA1.8_Triennial.png){width=100% height=100% alt="Mean length for Triennial with 95 percent confidence intervals."}

<!-- ======================================================= -->
<!-- ***************   AFSC Slope    *********************** --> 
<!-- ======================================================= -->



![The estimated index of abundance for the AFSC Slope survey.\label{fig:afsc-index}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/afsc_slope/VASTWestCoast_Index_2001.png){width=100% height=100% alt="The estimated index of abundance for the AFSC Slope survey."}

\newpage


![Q-Q and diagnostics for the AFSC Slope survey .\label{fig:afsc-qq}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/afsc_slope/QQ_Fn/Posterior_Predictive-Histogram-1.jpg){width=100% height=100% alt="Q-Q and diagnostics for the AFSC Slope survey ."}

\newpage	


![Residuals for the AFSC Slope survey.\label{fig:afsc-resid}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/afsc_slope/quantile_residuals_on_map.png){width=100% height=100% alt="Residuals for the AFSC Slope survey."}


![Length composition data from the AFSC Slope survey.\label{fig:afsc-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_bubflt3mkt0.png){width=100% height=100% alt="Length composition data from the AFSC Slope survey."}


![Mean length for AFSC Slope survey with 95 percent confidence intervals.\label{fig:mean-afsc-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_data_weighting_TA1.8_AFSC_Slope.png){width=100% height=100% alt="Mean length for AFSC Slope survey with 95 percent confidence intervals."}

<!-- ======================================================= -->
<!-- ***************   NWFSC Slope   *********************** --> 
<!-- ======================================================= -->



![The estimated index of abundance for the NWFSC Slope survey.\label{fig:nwfsc-index}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/nwfsc_slope/VASTWestCoast_Index_2002.png){width=100% height=100% alt="The estimated index of abundance for the NWFSC Slope survey."}

\newpage


![Q-Q and diagnostics for the NWFSC Slope survey .\label{fig:nwfsc-qq}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/nwfsc_slope/QQ_Fn/Posterior_Predictive-Histogram-1.jpg){width=100% height=100% alt="Q-Q and diagnostics for the NWFSC Slope survey ."}

\newpage	


![Residuals for the NWFSC Slope survey.\label{fig:nwfsc-resid}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey_indices/nwfsc_slope/QQ_Fn/pearson_residuals_2.png){width=100% height=100% alt="Residuals for the NWFSC Slope survey."}


![Length composition data from the NWFSC Slope survey.\label{fig:nw-slope-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_bubflt5mkt0.png){width=100% height=100% alt="Length composition data from the NWFSC Slope survey."}


![Mean length for NWFSC Slope survey with 95 percent confidence intervals.\label{fig:mean-nw-slope-len-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lendat_data_weighting_TA1.8_NWFSC_Slope.png){width=100% height=100% alt="Mean length for NWFSC Slope survey with 95 percent confidence intervals."}


![Age composition data from the NWFSC Slope survey.\label{fig:nw-slope-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_gstagedat_bubflt5mkt0.png){width=100% height=100% alt="Age composition data from the NWFSC Slope survey."}


![Mean age for NWFSC Slope survey with 95 percent confidence intervals.\label{fig:mean-nw-slope-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALdat_data_weighting_TA1.8_condAgeNWFSC_Slope.png){width=100% height=100% alt="Mean age for NWFSC Slope survey with 95 percent confidence intervals."}

<!-- ======================================================= -->  
<!-- ******************   Biology  ************************* --> 
<!-- ======================================================= -->  


![Comparison of the maturity-at-length assumed in the 2011 assessment and the new estimate used in the base model.\label{fig:compare-mat-at-len}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/Maturity_Comparison.png){width=100% height=100% alt="Comparison of the maturity-at-length assumed in the 2011 assessment and the new estimate used in the base model."}


![Comparison of the maturity-at-length between fish sample north and south of Point Reyes.\label{fig:spat-mat-at-len}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/Maturity_by_Area.png){width=100% height=100% alt="Comparison of the maturity-at-length between fish sample north and south of Point Reyes."}


![Comparison of the observed sizes and ages by depth between fish sample north and south of Point Reyes for maturity and all female observations by the WCGBTS.\label{fig:samples-north-south}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/Maturity_Samples_by_Area.png){width=100% height=100% alt="Comparison of the observed sizes and ages by depth between fish sample north and south of Point Reyes for maturity and all female observations by the WCGBTS."}


![Comparison of the observed sizes and ages by latitude where the vertical black dashed line at Point Reyes.\label{fig:fish-by-lat}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/Len_Age_by_Latitude.png){width=100% height=100% alt="Comparison of the observed sizes and ages by latitude where the vertical black dashed line at Point Reyes."}


![Externally estimated length-weight by sex.\label{fig:est-len-wght}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/Length_Weight_2020.png){width=100% height=100% alt="Externally estimated length-weight by sex."}


![Externally estimated length-at-age by sex.\label{fig:est-len-at-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/Length_Age_by_Sex_2020.png){width=100% height=100% alt="Externally estimated length-at-age by sex."}


![Externally estimated length-at-age by sex for four regions off the West Coast.\label{fig:est-len-at-age-region}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/Length_Age_by_Area_1panel.png){width=100% height=100% alt="Externally estimated length-at-age by sex for four regions off the West Coast."}


![Temporal patterns in mean length-at-age (cm) data. Colors correspond to different length-at-age values as shown in the legend, with red being the smallest fish (across all years and ages) and blue being the largest fish.\label{fig:tv-len-at-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/LengthAgeData_heatmap.png){width=100% height=100% alt="Temporal patterns in mean length-at-age (cm) data. Colors correspond to different length-at-age values as shown in the legend, with red being the smallest fish (across all years and ages) and blue being the largest fish."}


![Temporal patterns in mean weight-at-age (kg) data. Colors correspond to different weight-at-age values as shown in the legend, with red being the lightest fish (across all years and ages) and blue being the heaviest fish.\label{fig:tv-wght-at-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/WeightAgeData_heatmap.png){width=100% height=100% alt="Temporal patterns in mean weight-at-age (kg) data. Colors correspond to different weight-at-age values as shown in the legend, with red being the lightest fish (across all years and ages) and blue being the heaviest fish."}


![Fraction female by length observed by the WCGBTS.\label{fig:sex-by-len}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/wcgbts/plots/2011_strata/NWFSC WCGBTS_length_fraction_female.png){width=100% height=100% alt="Fraction female by length observed by the WCGBTS."}


![Fraction female observations by depth and latitude from the WCGBTS.\label{fig:fem-by-lat-depth}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/Frac_Female_Lat_Depth.png){width=100% height=100% alt="Fraction female observations by depth and latitude from the WCGBTS."}


![Comparison between break-and-burn versus scale age reads.\label{fig:scale-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/biology/plots/PacFIN_Age_Method.png){width=100% height=100% alt="Comparison between break-and-burn versus scale age reads."}


![The standard deviation by age for two ageing error applied to age data in the base model (method 1: CAP Lab, method 2: CDFW).\label{fig:age-error}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/numbers5_ageerrorSD.png){width=100% height=100% alt="The standard deviation by age for two ageing error applied to age data in the base model (method 1: CAP Lab, method 2: CDFW)."}



<!-- ======================================================= -->  
<!-- ******************   Bridge   ************************* --> 
<!-- ======================================================= -->


![Model version bridge comparison of estimated spawning biomass.\label{fig:bridge-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_bridging/_plots/model_bridge_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Model version bridge comparison of estimated spawning biomass."}


![Model version bridge comparison of estimated fraction unfished.\label{fig:bridge-depl}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_bridging/_plots/model_bridge_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Model version bridge comparison of estimated fraction unfished."}


![Data updated through 2010 bridge comparison of estimated spawning biomass.\label{fig:data-bridge-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_bridging/_plots/data_2010_bridge_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Data updated through 2010 bridge comparison of estimated spawning biomass."}


![Data updated through 2010 bridge comparison of estimated fraction unfished.\label{fig:data-bridge-depl}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_bridging/_plots/data_2010_bridge_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Data updated through 2010 bridge comparison of estimated fraction unfished."}


![All data updated through 2020 bridge comparison of estimated spawning biomass.\label{fig:all-data-bridge-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_bridging/_plots/1.9_all_data_2020_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="All data updated through 2020 bridge comparison of estimated spawning biomass."}


![All data updated through 2020 bridge comparison of estimated fraction unfished.\label{fig:all-data-bridge-depl}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_bridging/_plots/1.9_all_data_2020_compare4_Bratio_uncertainty.png){width=100% height=100% alt="All data updated through 2020 bridge comparison of estimated fraction unfished."}


![Estimated spawning biomass based on select structural changes and parameter updates.\label{fig:structure-bridge-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_bridging/_plots/2.0_offset_selex_bridge_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Estimated spawning biomass based on select structural changes and parameter updates."}


![Estimated fraction of unfished based on select structural changes and parameter updates.\label{fig:structure-bridge-depl}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_bridging/_plots/2.0_offset_selex_bridge_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Estimated fraction of unfished based on select structural changes and parameter updates."}


<!-- ====================================================================== -->
<!-- *********************    Priors            ********************** --> 
<!-- ====================================================================== -->



![Prior distribution for steepness.\label{fig:h-prior}](figs/h_prior.png){width=100% height=100% alt="Prior distribution for steepness."}

<!-- ====================================================================== -->
<!-- *********************  Model Est. Biology       ********************** --> 
<!-- ====================================================================== -->


![Model estimated length-at-age in the bginning of the year. Shaded area indicates 95 percent distribution of length-at-age around the estimaed growth curve.\label{fig:mod-est-len-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/bio1_sizeatage.png){width=100% height=100% alt="Model estimated length-at-age in the bginning of the year. Shaded area indicates 95 percent distribution of length-at-age around the estimaed growth curve."}

<!-- ====================================================================== -->
<!-- *********************    Selectivity            ********************** --> 
<!-- ====================================================================== -->


![Selectivity by fleet.\label{fig:selex}](figs/selectivity.png){width=100% height=100% alt="Selectivity by fleet."}


![Estimated retention curves by time block.\label{fig:retention}](figs/dover_retention.png){width=100% height=100% alt="Estimated retention curves by time block."}


<!-- ======================================================= -->  
<!-- ****************** Recruitment ************************ --> 
<!-- ======================================================= -->



![Estimated time series of age-0 recruits (1000s).\label{fig:recruits}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/ts11_Age-0_recruits_(1000s)_with_95_asymptotic_intervals.png){width=100% height=100% alt="Estimated time series of age-0 recruits (1000s)."}


![Estimated time series of recruitment deviations.\label{fig:rec-devs}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/recdevs2_withbars.png){width=100% height=100% alt="Estimated time series of recruitment deviations."}


![Stock-recruit curve. Point colors indicate year, with warmer colors indicating earlier years and cooler colors in showing later years.\label{fig:bh-curve}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/SR_curve.png){width=100% height=100% alt="Stock-recruit curve. Point colors indicate year, with warmer colors indicating earlier years and cooler colors in showing later years."}


![Recruitment bias adjustment applied in the base model.\label{fig:bias-adj}](figs/recruit_fit_bias_adjust.png){width=100% height=100% alt="Recruitment bias adjustment applied in the base model."}

<!-- ====================================================================== -->
<!-- ****************** Fit to the Index Data  **************************** --> 
<!-- ====================================================================== -->


![Fit to the NWFSC WCGBTS index of abundance.\label{fig:wcgbt-index-fit}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/index2_cpuefit_NWFSC_WCGBT){width=100% height=100% alt="Fit to the NWFSC WCGBTS index of abundance."}


![Fit to the Triennial survey index of abundance. Thicker lines indicate input uncertainty before the addition of estimated additional uncertainty parameter.\label{fig:tri-index-fit}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/index2_cpuefit_Triennial){width=100% height=100% alt="Fit to the Triennial survey index of abundance. Thicker lines indicate input uncertainty before the addition of estimated additional uncertainty parameter."}


![Fit to the AFSC Slope survey index of abundance. Thicker lines indicate input uncertainty before the addition of estimated additional uncertainty parameter.\label{fig:afsc-index-fit}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/index2_cpuefit_AFSC_Slope){width=100% height=100% alt="Fit to the AFSC Slope survey index of abundance. Thicker lines indicate input uncertainty before the addition of estimated additional uncertainty parameter."}


![Fit to the NWFSC Slope survey index of abundance. Thicker lines indicate input uncertainty before the addition of estimated additional uncertainty parameter.\label{fig:nwslope-index-fit}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/index2_cpuefit_NWFSC_Slope){width=100% height=100% alt="Fit to the NWFSC Slope survey index of abundance. Thicker lines indicate input uncertainty before the addition of estimated additional uncertainty parameter."}



<!-- ====================================================================== -->
<!-- ****************** Fit to the Discard Data *************************** --> 
<!-- ====================================================================== -->


![Fit to the annual discard rates for the California fleet.\label{fig:ca-disc-fit}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/discard_fitCA.png){width=100% height=100% alt="Fit to the annual discard rates for the California fleet."}


![Fit to the annual discard rates for the Oregon/Washington fleet.\label{fig:orwa-disc-fit}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/discard_fitOR_WA.png){width=100% height=100% alt="Fit to the annual discard rates for the Oregon/Washington fleet."}


![Fit to the annual mean body weight observations for the California fleet.\label{fig:ca-disc-mbw-fit}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/bodywt_fit_fltCA.png){width=100% height=100% alt="Fit to the annual mean body weight observations for the California fleet."}


![Fit to the annual mean body weight observations for the Oregon/Washington fleet.\label{fig:orwa-disc-mbw-fit}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/bodywt_fit_fltOR_WA.png){width=100% height=100% alt="Fit to the annual mean body weight observations for the Oregon/Washington fleet."}


![Fit to the annual length composition of discarded fish for the California fleet.\label{fig:ca-disc-len-fit}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt1mkt1.png){width=100% height=100% alt="Fit to the annual length composition of discarded fish for the California fleet."}


![Pearson residuals to annual length composition of discarded fish for the California fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:ca-disc-pearson}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_residsflt1mkt1.png){width=100% height=100% alt="Pearson residuals to annual length composition of discarded fish for the California fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Fit to the annual length composition of discarded fish for the Oregon/Washington fleet.\label{fig:orwa-disc-len-fit-1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt2mkt1_page1.png){width=100% height=100% alt="Fit to the annual length composition of discarded fish for the Oregon/Washington fleet."}



![Fit to the annual length composition of discarded fish for the Oregon/Washington fleet.\label{fig:orwa-disc-len-fit-2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt2mkt1_page2.png){width=100% height=100% alt="Fit to the annual length composition of discarded fish for the Oregon/Washington fleet."}


![Pearson residuals to annual length composition of discarded fish for the Oregon/Washington fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:orwa-disc-pearson}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_residsflt2mkt1_page2.png){width=100% height=100% alt="Pearson residuals to annual length composition of discarded fish for the Oregon/Washington fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}

<!-- ====================================================================== -->
<!-- ****************** Fit to the Composition Data **************************** --> 
<!-- ====================================================================== -->


![Aggregated length composition fit across time by fleet.\label{fig:agg-fits}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit__aggregated_across_time.png){width=100% height=100% alt="Aggregated length composition fit across time by fleet."}


![Pearson residuals to annual length composition for the California fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:ca-pearson}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_residsflt1mkt2_page4.png){width=100% height=100% alt="Pearson residuals to annual length composition for the California fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Pearson residuals to annual length composition for the Oregon/Washington fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:orwa-pearson}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_residsflt2mkt2_page3.png){width=100% height=100% alt="Pearson residuals to annual length composition for the Oregon/Washington fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Mean length observations for the California fleet.\label{fig:ca-mean-len}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_data_weighting_TA1.8_CA.png){width=100% height=100% alt="Mean length observations for the California fleet."}


![Mean length observations for the Oregon/Washington fleet.\label{fig:orwa-mean-len}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_data_weighting_TA1.8_OR_WA.png){width=100% height=100% alt="Mean length observations for the Oregon/Washington fleet."}


![Aggregated age composition fit across time by fleet.\label{fig:agg-age-fits}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agefit__aggregated_across_time.png){width=100% height=100% alt="Aggregated age composition fit across time by fleet."}


![Pearson residuals to annual age composition for the California fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:ca-pearson-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agefit_residsflt1mkt2_page2.png){width=100% height=100% alt="Pearson residuals to annual age composition for the California fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Pearson residuals to annual age composition for the Oregon/Washington fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:orwa-pearson-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agefit_residsflt2mkt2_page2.png){width=100% height=100% alt="Pearson residuals to annual age composition for the Oregon/Washington fleet. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Mean age observations for the California fleet.\label{fig:ca-mean-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agefit_data_weighting_TA1.8_CA.png){width=100% height=100% alt="Mean age observations for the California fleet."}


![Mean age observations for the Oregon/Washington fleet.\label{fig:orwa-mean-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agefit_data_weighting_TA1.8_OR_WA.png){width=100% height=100% alt="Mean age observations for the Oregon/Washington fleet."}


![Pearson residuals to annual length composition for the Triennial survey. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:tri-pearson}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_residsflt4mkt0.png){width=100% height=100% alt="Pearson residuals to annual length composition for the Triennial survey. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Pearson residuals to annual length composition for the AFSC Slope survey. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:afsc-pearson}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_residsflt3mkt0.png){width=100% height=100% alt="Pearson residuals to annual length composition for the AFSC Slope survey. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Pearson residuals to annual length composition for the NWFSC Slope survey. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:nwslope-pearson}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_residsflt5mkt0.png){width=100% height=100% alt="Pearson residuals to annual length composition for the NWFSC Slope survey. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Pearson residuals to annual length composition for the NWFSC WCGBTS. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:wcgbt-pearson}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_residsflt6mkt0_page2.png){width=100% height=100% alt="Pearson residuals to annual length composition for the NWFSC WCGBTS. Closed bubbles are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Mean length observations for the Triennial.\label{fig:tri-mean-len}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_data_weighting_TA1.8_Triennial.png){width=100% height=100% alt="Mean length observations for the Triennial."}


![Mean length observations for the AFSC Slope survey.\label{fig:afsc-mean-len}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_data_weighting_TA1.8_AFSC_Slope.png){width=100% height=100% alt="Mean length observations for the AFSC Slope survey."}


![Mean length observations for the NWFSC Slope survey.\label{fig:nwslope-mean-len}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_data_weighting_TA1.8_NWFSC_Slope.png){width=100% height=100% alt="Mean length observations for the NWFSC Slope survey."}


![Mean length observations for the NWFSC WCGBTS.\label{fig:wcgbt-mean-len}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_data_weighting_TA1.8_NWFSC_WCGBT.png){width=100% height=100% alt="Mean length observations for the NWFSC WCGBTS."}


![Conditional age-at-length for mean age and standard deviation for the NWFSC Slope survey (plot 1 of 2) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution.\label{fig:nwslope-caal-fit-1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_Andre_plotsflt5mkt0_page1.png){width=100% height=100% alt="Conditional age-at-length for mean age and standard deviation for the NWFSC Slope survey (plot 1 of 2) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution."}


![Conditional age-at-length for mean age and standard deviation for the NWFSC Slope survey (plot 2 of 2) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution.\label{fig:nwslope-caal-fit-2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_Andre_plotsflt5mkt0_page2.png){width=100% height=100% alt="Conditional age-at-length for mean age and standard deviation for the NWFSC Slope survey (plot 2 of 2) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution."}


![Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 1 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution.\label{fig:wcgbt-caal-fit-1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_Andre_plotsflt6mkt0_page1.png){width=100% height=100% alt="Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 1 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution."}


![Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 2 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution.\label{fig:wcgbt-caal-fit-2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_Andre_plotsflt6mkt0_page2.png){width=100% height=100% alt="Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 2 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution."}


![Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 3 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution.\label{fig:wcgbt-caal-fit-3}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_Andre_plotsflt6mkt0_page3.png){width=100% height=100% alt="Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 3 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution."}


![Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 4 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution.\label{fig:wcgbt-caal-fit-4}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_Andre_plotsflt6mkt0_page4.png){width=100% height=100% alt="Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 4 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution."}


![Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 5 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution.\label{fig:wcgbt-caal-fit-5}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_Andre_plotsflt6mkt0_page5.png){width=100% height=100% alt="Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 5 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution."}


![Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 6 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution.\label{fig:wcgbt-caal-fit-6}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_Andre_plotsflt6mkt0_page6.png){width=100% height=100% alt="Conditional age-at-length for mean age and standard deviation for the NWFSC WCGBT (plot 6 of 6) Left plots are mean conditional age-at-length by size-class (observed and predicted) with 90 percent confidence intervals based on adding 1.64 standard error  of mean to the data. Right plots in each pair are standard error of mean age-at-length (observed and predicted) with 90 percent confidence intervalss based on the chi-square distribution."}


![Mean age from conditional age-at-length data for the NWFSC Slope survey.\label{fig:nwslope-mean-caal}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_data_weighting_TA1.8_condAgeNWFSC_Slope.png){width=100% height=100% alt="Mean age from conditional age-at-length data for the NWFSC Slope survey."}


![Mean age observations from the conditional age-at-length data from the NWFSC WCGBTS.\label{fig:wcgbt-mean-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_data_weighting_TA1.8_condAgeNWFSC_WCGBT.png){width=100% height=100% alt="Mean age observations from the conditional age-at-length data from the NWFSC WCGBTS."}


<!-- ======================================================= -->  
<!-- ****************** Time Series ************************ --> 
<!-- ======================================================= -->



![Estimated time series of spawning biomass.\label{fig:ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/ts7_Spawning_biomass_(mt)_with_95_asymptotic_intervals_intervals.png){width=100% height=100% alt="Estimated time series of spawning biomass."}


![Estimated time series of total biomass.\label{fig:tot-bio}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/ts1_Total_biomass_(mt).png){width=100% height=100% alt="Estimated time series of total biomass."}


![Estimated time series of fraction of unfished spawning biomass.\label{fig:depl}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/ts9_Fraction_of_unfished_with_95_asymptotic_intervals_intervals.png){width=100% height=100% alt="Estimated time series of fraction of unfished spawning biomass."}


![Proportion of biomass unavailable due to selectivity for small and large fish..\label{fig:unavail-bio}](figs/unavailable_biomass.png){width=100% height=100% alt="Proportion of biomass unavailable due to selectivity for small and large fish.."}


![Stock recruit curve where point color indicate year, with warmer colors (yellow to green) indicating earlier years and cooler colors (blue) showing later years.\label{fig:sr-curve}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/SR_curve.png){width=100% height=100% alt="Stock recruit curve where point color indicate year, with warmer colors (yellow to green) indicating earlier years and cooler colors (blue) showing later years."}


<!-- ====================================================================== -->
<!-- ******************    Reference Points    **************************** --> 
<!-- ====================================================================== -->



![Estimated 1 - relative spawning ratio (SPR) by year.\label{fig:1-spr}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/SPR2_minusSPRseries.png){width=100% height=100% alt="Estimated 1 - relative spawning ratio (SPR) by year."}


![Phase plot of the relative biomass (also referred to as fraction unfished) versus the SPR ratio where each point represents the biomass ratio at the start of the year and the relative fishing intensity in that same year. Lines through the final point show the 95 percent intervals based on the asymptotic uncertainty for each dimension. The shaded ellipse is a 95 percent region which accounts for the estiamted correlations between the biomass ratio and SPR ratio..\label{fig:phase}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/SPR4_phase.png){width=100% height=100% alt="Phase plot of the relative biomass (also referred to as fraction unfished) versus the SPR ratio where each point represents the biomass ratio at the start of the year and the relative fishing intensity in that same year. Lines through the final point show the 95 percent intervals based on the asymptotic uncertainty for each dimension. The shaded ellipse is a 95 percent region which accounts for the estiamted correlations between the biomass ratio and SPR ratio.."}


![Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivities and with steepness fixed at 0.80.\label{fig:yield}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/yield2_yield_curve_with_refpoints.png){width=100% height=100% alt="Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivities and with steepness fixed at 0.80."}


<!-- ======================================================= -->  
<!-- ****************** Sensitivities ********************** --> 
<!-- ======================================================= -->


![Estimates of spawning biomass for the base model and alternative sensitivity models that remove (-) sources of length data.\label{fig:sens-length-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_1_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Estimates of spawning biomass for the base model and alternative sensitivity models that remove (-) sources of length data."}


![Estimates of relative spawning biomass for the base model and alternative sensitivity models that remove (-) sources of length data.\label{fig:sens-length-relssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_1_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Estimates of relative spawning biomass for the base model and alternative sensitivity models that remove (-) sources of length data."}


![Estimates of spawning biomass for the base model and alternative sensitivity models that remove (-) sources of age data.\label{fig:sens-age-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_2_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Estimates of spawning biomass for the base model and alternative sensitivity models that remove (-) sources of age data."}


![Estimates of relative spawning biomass for the base model and alternative sensitivity models that remove (-) sources of age data.\label{fig:sens-age-relssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_2_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Estimates of relative spawning biomass for the base model and alternative sensitivity models that remove (-) sources of age data."}


![Estimates of spawning biomass for the base model and alternative sensitivity models that remove (-) sources of index data.\label{fig:sens-index-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_3_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Estimates of spawning biomass for the base model and alternative sensitivity models that remove (-) sources of index data."}


![Estimates of relative spawning biomass for the base model and alternative sensitivity models that remove (-) sources of index data.\label{fig:sens-index-relssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_3_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Estimates of relative spawning biomass for the base model and alternative sensitivity models that remove (-) sources of index data."}


![Estimates of spawning biomass for the base model and alternative sensitivity models to natural mortality including estimating females, estimating an age-specific Lorenzen relationship for males and females, fixing male and female parameters at the median of the prior, and fixing natural mortality at estimates
from the 2011 assessment.\label{fig:sens-m-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_4_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Estimates of spawning biomass for the base model and alternative sensitivity models to natural mortality including estimating females, estimating an age-specific Lorenzen relationship for males and females, fixing male and female parameters at the median of the prior, and fixing natural mortality at estimates
from the 2011 assessment."}


![Estimates of relative spawning biomass for the base model and alternative sensitivity models to natural mortality including estimating females, estimating an age-specific Lorenzen relationship for males and females, fixing male and female parameters at the median of the prior, and fixing natural mortality at estimates
from the 2011 assessment.\label{fig:sens-m-relssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_4_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Estimates of relative spawning biomass for the base model and alternative sensitivity models to natural mortality including estimating females, estimating an age-specific Lorenzen relationship for males and females, fixing male and female parameters at the median of the prior, and fixing natural mortality at estimates
from the 2011 assessment."}


![Estimates of spawning biomass for the base model and alternative sensitivity models to selectivity including the parameterization of fishery selectivity following the 2011 assessment, the parameterization of survey selectivity following the 2011 assessment, mirroring California  and Oregon/Washington commercial selectivity, and forcing one index (the NWFSC slope survey) to be asymptotic.\label{fig:sens-select-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_5_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Estimates of spawning biomass for the base model and alternative sensitivity models to selectivity including the parameterization of fishery selectivity following the 2011 assessment, the parameterization of survey selectivity following the 2011 assessment, mirroring California  and Oregon/Washington commercial selectivity, and forcing one index (the NWFSC slope survey) to be asymptotic."}


![Estimates of relative spawning biomass for the base model and alternative sensitivity models to selectivity including the parameterization of fishery selectivity following the 2011 assessment, the parameterization of survey selectivity following the 2011 assessment, mirroring California  and Oregon/Washington commercial selectivity, and forcing one index (the NWFSC slope survey) to be asymptotic.\label{fig:sens-select-relssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_5_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Estimates of relative spawning biomass for the base model and alternative sensitivity models to selectivity including the parameterization of fishery selectivity following the 2011 assessment, the parameterization of survey selectivity following the 2011 assessment, mirroring California  and Oregon/Washington commercial selectivity, and forcing one index (the NWFSC slope survey) to be asymptotic."}


![Estimates of spawning biomass for the base model and alternative sensitivity models including using the maturity ogive from the 2011 assessment, estimating no recruitment deviations, effectively not allowing extra survey variance (standard deviation), and applying the McAllistar and Ianelli approach to data weighting.\label{fig:sens-biodata-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_6_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Estimates of spawning biomass for the base model and alternative sensitivity models including using the maturity ogive from the 2011 assessment, estimating no recruitment deviations, effectively not allowing extra survey variance (standard deviation), and applying the McAllistar and Ianelli approach to data weighting."}


![Estimates of relative spawning biomass for the base model and alternative sensitivity models including using the maturity ogive from the 2011 assessment, estimating no recruitment deviations, effectively not allowing extra survey variance (standard deviation), and applying the McAllistar and Ianelli approach to data weighting.\label{fig:sens-biodata-relssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities/_plots/7.0.1_base_6_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Estimates of relative spawning biomass for the base model and alternative sensitivity models including using the maturity ogive from the 2011 assessment, estimating no recruitment deviations, effectively not allowing extra survey variance (standard deviation), and applying the McAllistar and Ianelli approach to data weighting."}

<!-- ======================================================= -->  
<!-- ******************  Likelihoods  ********************** --> 
<!-- ======================================================= -->


![Change in the negative log-likelihood across a range of log(R0) values.\label{fig:r0-profile}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_SR_LN(R0)/piner_panel_SR_LN(R0).png){width=100% height=100% alt="Change in the negative log-likelihood across a range of log(R0) values."}


![Change in the estimate of spawning biomass across a range of log(R0) values.\label{fig:r0-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_SR_LN(R0)/SR_LN(R0)_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning biomass across a range of log(R0) values."}


![Change in the estimate of fraction unfished across a range of log(R0) values.\label{fig:r0-depl}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_SR_LN(R0)/SR_LN(R0)_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of log(R0) values."}


![Change in the negative log-likelihood across a range of steepness values.\label{fig:h-profile}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_SR_BH_steep/piner_panel_SR_BH_steep.png){width=100% height=100% alt="Change in the negative log-likelihood across a range of steepness values."}


![Change in the estimate of spawning biomass across a range of steepness values.\label{fig:h-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_SR_BH_steep/SR_BH_steep_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning biomass across a range of steepness values."}


![Change in the estimate of fraction unfished across a range of steepness values.\label{fig:h-depl}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_SR_BH_steep/SR_BH_steep_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of steepness values."}


![Change in the negative log-likelihood across a range of female natural mortality values.\label{fig:m-profile}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_NatM_p_1_Fem_GP_1/piner_panel_NatM_p_1_Fem_GP_1.png){width=100% height=100% alt="Change in the negative log-likelihood across a range of female natural mortality values."}


![Change in the estimate of spawning biomass across a range of female natural mortality values.\label{fig:m-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_NatM_p_1_Fem_GP_1/NatM_p_1_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning biomass across a range of female natural mortality values."}


![Change in the estimate of fraction unfished across a range of female natural values.\label{fig:m-depl}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_NatM_p_1_Fem_GP_1/NatM_p_1_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of female natural values."}


![Change in the negative log-likelihood across a range of offset male natural mortality values.\label{fig:m-male-profile}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_NatM_p_1_Mal_GP_1/piner_panel_NatM_p_1_Mal_GP_1.png){width=100% height=100% alt="Change in the negative log-likelihood across a range of offset male natural mortality values."}


![Change in the estimate of spawning biomass across a range of offset male natural mortality values.\label{fig:m-male-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_NatM_p_1_Mal_GP_1/NatM_p_1_Mal_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning biomass across a range of offset male natural mortality values."}


![Change in the estimate of fraction unfished across a range of male natural values.\label{fig:m-male-depl}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_profile_NatM_p_1_Mal_GP_1/NatM_p_1_Mal_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of male natural values."}

<!-- ======================================================= -->  
<!-- ****************** Retrospective ********************** --> 
<!-- ======================================================= -->


![Change in the estimate of spawning biomass when the most recent 10 years of data area removed sequentially.\label{fig:retro-ssb}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_retro/compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Change in the estimate of spawning biomass when the most recent 10 years of data area removed sequentially."}


![Change in the estimate of fraction unfished when the most recent 10 years of data area removed sequentially.\label{fig:retro-depl}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base_retro/compare4_Bratio_uncertainty.png){width=100% height=100% alt="Change in the estimate of fraction unfished when the most recent 10 years of data area removed sequentially."}

<!-- ======================================================= -->  
<!-- ************* Compare w/ 2011 & 2005 ****************** --> 
<!-- ======================================================= -->


![Estimates of spawning output (also referred to as spawning biomass) across the base model and previous assessments of Dover sole.\label{fig:past-assess}](figs/assessment_history.png){width=100% height=100% alt="Estimates of spawning output (also referred to as spawning biomass) across the base model and previous assessments of Dover sole."}

<!--chapter:end:53figures.Rmd-->

\clearpage

# Appendix A

## Detailed Fit to Length Composition Data {#len-fit-data}


![Length comps, retained, CA (plot 1 of 4).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_lenfit_flt1mkt2_page1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt1mkt2_page1.png){width=100% height=100% alt="Length comps, retained, CA (plot 1 of 4).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Length comps, retained, CA (plot 2 of 4).\label{fig:comp_lenfit_flt1mkt2_page2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt1mkt2_page2.png){width=100% height=100% alt="Length comps, retained, CA (plot 2 of 4)."}

![Length comps, retained, CA (plot 3 of 4).\label{fig:comp_lenfit_flt1mkt2_page3}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt1mkt2_page3.png){width=100% height=100% alt="Length comps, retained, CA (plot 3 of 4)."}

![Length comps, retained, CA (plot 4 of 4).\label{fig:comp_lenfit_flt1mkt2_page4}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt1mkt2_page4.png){width=100% height=100% alt="Length comps, retained, CA (plot 4 of 4)."}

![Length comps, discard, CA.<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_lenfit_flt1mkt1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt1mkt1.png){width=100% height=100% alt="Length comps, discard, CA.<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Length comps, retained, OR_WA (plot 1 of 3).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_lenfit_flt2mkt2_page1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt2mkt2_page1.png){width=100% height=100% alt="Length comps, retained, OR_WA (plot 1 of 3).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Length comps, retained, OR_WA (plot 2 of 3).\label{fig:comp_lenfit_flt2mkt2_page2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt2mkt2_page2.png){width=100% height=100% alt="Length comps, retained, OR_WA (plot 2 of 3)."}

![Length comps, retained, OR_WA (plot 3 of 3).\label{fig:comp_lenfit_flt2mkt2_page3}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt2mkt2_page3.png){width=100% height=100% alt="Length comps, retained, OR_WA (plot 3 of 3)."}

![Length comps, discard, OR_WA (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_lenfit_flt2mkt1_page1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt2mkt1_page1.png){width=100% height=100% alt="Length comps, discard, OR_WA (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Length comps, discard, OR_WA (plot 2 of 2).\label{fig:comp_lenfit_flt2mkt1_page2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt2mkt1_page2.png){width=100% height=100% alt="Length comps, discard, OR_WA (plot 2 of 2)."}

![Length comps, whole catch, AFSC_Slope.<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_lenfit_flt3mkt0}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt3mkt0.png){width=100% height=100% alt="Length comps, whole catch, AFSC_Slope.<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Length comps, whole catch, Triennial.<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_lenfit_flt4mkt0}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt4mkt0.png){width=100% height=100% alt="Length comps, whole catch, Triennial.<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Length comps, whole catch, NWFSC_Slope.<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_lenfit_flt5mkt0}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt5mkt0.png){width=100% height=100% alt="Length comps, whole catch, NWFSC_Slope.<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Length comps, whole catch, NWFSC_WCGBT (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_lenfit_flt6mkt0_page1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt6mkt0_page1.png){width=100% height=100% alt="Length comps, whole catch, NWFSC_WCGBT (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Length comps, whole catch, NWFSC_WCGBT (plot 2 of 2).\label{fig:comp_lenfit_flt6mkt0_page2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_lenfit_flt6mkt0_page2.png){width=100% height=100% alt="Length comps, whole catch, NWFSC_WCGBT (plot 2 of 2)."}

\clearpage

## Detailed Fit to Age Composition Data 



![Age comps, retained, CA (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_agefit_flt1mkt2_page1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agefit_flt1mkt2_page1.png){width=100% height=100% alt="Age comps, retained, CA (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Age comps, retained, CA (plot 2 of 2).\label{fig:comp_agefit_flt1mkt2_page2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agefit_flt1mkt2_page2.png){width=100% height=100% alt="Age comps, retained, CA (plot 2 of 2)."}

![Age comps, retained, OR_WA (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_agefit_flt2mkt2_page1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agefit_flt2mkt2_page1.png){width=100% height=100% alt="Age comps, retained, OR_WA (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Age comps, retained, OR_WA (plot 2 of 2).\label{fig:comp_agefit_flt2mkt2_page2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_agefit_flt2mkt2_page2.png){width=100% height=100% alt="Age comps, retained, OR_WA (plot 2 of 2)."}

\clearpage

## Detailed Fit to Conditional-Age-at-Length Composition Data {#detailed-caal}


![Pearson residuals, whole catch, NWFSC_Slope (max=10.43) (plot 1 of 2).\label{fig:comp_condAALfit_residsflt5mkt0_page1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_residsflt5mkt0_page1.png){width=100% height=100% alt="Pearson residuals, whole catch, NWFSC_Slope (max=10.43) (plot 1 of 2)."}

![Pearson residuals, whole catch, NWFSC_Slope (max=10.43) (plot 1 of 2) (plot 2 of 2).\label{fig:comp_condAALfit_residsflt5mkt0_page2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_residsflt5mkt0_page2.png){width=100% height=100% alt="Pearson residuals, whole catch, NWFSC_Slope (max=10.43) (plot 1 of 2) (plot 2 of 2)."}

![Pearson residuals, whole catch, NWFSC_WCGBT (max=13.53) (plot 1 of 5) (plot 2 of 5) (plot 3 of 5) (plot 4 of 5).\label{fig:comp_condAALfit_residsflt6mkt0_page4}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_residsflt6mkt0_page4.png){width=100% height=100% alt="Pearson residuals, whole catch, NWFSC_WCGBT (max=13.53) (plot 1 of 5) (plot 2 of 5) (plot 3 of 5) (plot 4 of 5)."}

![Pearson residuals, whole catch, NWFSC_WCGBT (max=13.53) (plot 1 of 5) (plot 2 of 5) (plot 3 of 5) (plot 4 of 5) (plot 5 of 5).\label{fig:comp_condAALfit_residsflt6mkt0_page5}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_residsflt6mkt0_page5.png){width=100% height=100% alt="Pearson residuals, whole catch, NWFSC_WCGBT (max=13.53) (plot 1 of 5) (plot 2 of 5) (plot 3 of 5) (plot 4 of 5) (plot 5 of 5)."}

![Pearson residuals, whole catch, NWFSC_Slope (max=10.43).\label{fig:comp_condAALfit_residsflt5mkt0}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_residsflt5mkt0.png){width=100% height=100% alt="Pearson residuals, whole catch, NWFSC_Slope (max=10.43)."}

![Pearson residuals, whole catch, NWFSC_WCGBT (max=13.53) (plot 1 of 3).\label{fig:comp_condAALfit_residsflt6mkt0_page1}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_residsflt6mkt0_page1.png){width=100% height=100% alt="Pearson residuals, whole catch, NWFSC_WCGBT (max=13.53) (plot 1 of 3)."}

![Pearson residuals, whole catch, NWFSC_WCGBT (max=13.53) (plot 1 of 3) (plot 2 of 3).\label{fig:comp_condAALfit_residsflt6mkt0_page2}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_residsflt6mkt0_page2.png){width=100% height=100% alt="Pearson residuals, whole catch, NWFSC_WCGBT (max=13.53) (plot 1 of 3) (plot 2 of 3)."}

![Pearson residuals, whole catch, NWFSC_WCGBT (max=13.53) (plot 1 of 3) (plot 2 of 3) (plot 3 of 3).\label{fig:comp_condAALfit_residsflt6mkt0_page3}](//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/7.0.1_base/plots/comp_condAALfit_residsflt6mkt0_page3.png){width=100% height=100% alt="Pearson residuals, whole catch, NWFSC_WCGBT (max=13.53) (plot 1 of 3) (plot 2 of 3) (plot 3 of 3)."}

<!--chapter:end:54appendix.Rmd-->

