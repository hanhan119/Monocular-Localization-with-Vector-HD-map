Monocular-Localization-with-Vector-HD-map is a high-precision vehicle localization method based on monocular camera and high-precision vector map. In this project, we test the method in the simulation scene, including the test of typical urban scene, and discuss the impact of different number of road signs on the results.


## build:

Download it directly and extract it to any place of the computer. Open it with MATLAB and run. We tested it on MATLAB r2017a. 


## Run:

* run the localization method on a typical scenario:


```bash
    ./one_scenario/main.m
```

* run the localization in scenarios with different numbers of lamps:

```bash
    ./scenarios_analysis/main_lamps.m
```

* run the localization in scenarios with different numbers of lanes:

```bash
	./scenarios_analysis/main_lanes.m
```

* run the localization in scenarios with different numbers of trafficsigns:

```bash
	./scenarios_analysis/main_tfs.m
```


