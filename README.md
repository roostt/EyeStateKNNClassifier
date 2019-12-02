# EyeStateKNNClassifier
Prediction of Eye States using k-NN Algorithm using Different Distance Metrics and Number of Neighbour Parameters

This repository contains the original implementation of "Prediction of Eye States using k-NN Algorithm: A Comparison Study for Different Distance Metrics and Number of Neighbour Parameters" which has been published in 2019 Medical Technologies Congress (TIPTEKNO) [https://ieeexplore.ieee.org/xpl/conhome/8886343/proceeding].

Different distance metrics and number of neighbour parameters must be analysed and correctly interpreted in order to propose k-NN based approaches for different kind of problems. In this project, we performed an EEG-based eye state prediction using k-NN algorithm that is based on different distance metrics and number of neighbour parameters. Some of the details are as follows:

- Experiments carried out on EEG Eye State Data set which is available via the UCI Machine Learning repository [https://archive.ics.uci.edu/ml/datasets/EEG+Eye+State]. This dataset contains multivariate, sequential and time-series real-world EEG data. EEG Eye State.arf file converted to EEGEyeStateDataSet_Data.mat (contains all EEG data) and EEGEyeStateDataSet_Labels.mat (contains labels).
- Classification performances were evaluated for accuracy measurement using the ten-fold leave-one-out cross-validation technique and the optimum k value is searched in the range of 1 to 101.
- Code has been tested on Matlab 2018b software package and the experiments were performed using Intel Core i7 3.4 GHz with 8 GB RAM.

After downloading, you can run the program via the mainKNNClassifier.m file.

If you use EyeStateKNNClassifier in your project, please cite the following paper.

```
@INPROCEEDINGS{8895170,
author={C. M. {Yilmaz} and B. H. {Yilmaz} and C. {Kose}},
booktitle={2019 Medical Technologies Congress (TIPTEKNO)},
title={Prediction of Eye States using k-NN Algorithm: A Comparison Study for Different Distance Metrics and Number of Neighbour Parameters},
year={2019},
volume={},
number={},
pages={1-4},
keywords={eye state prediction;k-nearest-neighbour;braincomputer interface;EEG;distance metric},
doi={10.1109/TIPTEKNO.2019.8895170},
ISSN={2687-7775},
month={Oct},}
```
