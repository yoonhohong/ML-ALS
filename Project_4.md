# Project 4  

Title: 
Graphic representation for ALS progression: building Shiny applications with R   

Background and Motivation:  
- ALS motor phenotype is heterogeneous  
- disease progression is characterized by focal onset and spread to adjacent regions (see references)   
- one chart is worth hundreds of numbers and words  
- graphic representation can facilitate visual recognition of spatiotemporal pattern of ALS progression  

Method  
- R  
- Shiny package (https://shiny.rstudio.com/)   

Results  
- spatial view (radar graph; axis = ALSFRS items)  
- temporal view (spaghetti graph; x-axis = time, y-axis = ALSFRS scores)  
- both view with interactive and dynamic functionality using shiny applications    

Discussion  
- radar graph for visual recognition of regional (or functional) distribution of motor phenotype at specific time point  
- spaghetti graph to facilitate quick recognition of focality and spread pattern with disease progression     

References  

Ravits J, Laurie P, Fan Y, Moore DH. Implications of ALS focality: rostral-caudal distribution of lower motor neuron loss postmortem. Neurology. 2007;68:1576–1582.  
Ravits J1, Paul P, Jorg C. Implications of ALS focality: rostral-caudal distribution of lower motor neuron loss postmortem 
Neurology. 2007 May 8;68(19):1571-5.  
Ravits JM1, La Spada AR. ALS motor phenotype heterogeneity, focality, and spread: deconstructing motor neuron degeneration. Neurology. 2009 Sep 8;73(10):805-11.  
