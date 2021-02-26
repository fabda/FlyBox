# Code Repository

### __"Drosophila Aversive Behavior toward Erwinia carotovora carotovora Is Mediated by Bitter Neurons and Leukokinin"__
#### Bernard Charroux, Fabrice Daian, Julien Royet 
#### iScience. 2020 Jun 26;23(6):101152. Epub 2020 May 12.

doi: 10.1016/j.isci.2020.101152

## Flybox

This repository contains the Flybox Matlab code used to generate statistics of Fly behaviors described in the paper.

## Requirements

- Image Processing Toolbox is required

## How to use it ?

1) Start your Matlab instance and type "flybox2" into the console
2) Choose the AVI video you want to analyze
3) Type __FROM__ which second you want to start the analysis and then __TO__ which second you want to finish the analysis:

Example: if you choose to analyze the first 100th seconds of your video, choose _0_ into the first dialog box, press enter and then
choose _100_ into the second one.

4) Now you have to define the box locations and their experimental conditions:
-  draw by hand one rectangle defining the first box
  
Example: to draw a box: click on the top left corner of one box and drag to the bottom right corner. Once the box is correctly positionned you have
to double click into it to validate you choice.

- write into the dialog box the experimental condition within the box (for example: Wild Type, Mutant ...)
- write into the next dialog box the type of food within the leftmost droplet of the current box (eg. "water")
- write into the next dialog box the type of food withing the rightmost droplet of the current box (eg. "sugar")

The first box is now ready, you have now to repeat this steps for the 5 remaining boxes.

5) Once every boxes have been defined properly (location and experimental conditions), the analysis start.
6) Once the analysis is finished a message appears into the Matlab console to tell you where to find the directory containing the results (Figures and CSV files)








