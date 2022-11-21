# Python script that obtains both csv and joins them by the Accident_Index. Then it saves the complete results in one file and creates a file with around 100 samples

import math
import pandas as pd
import os
import seaborn as sns

accidents = pd.read_csv("./Bycicles-accidents-project/dataset/Accidents.csv")
bikers = pd.read_csv("./Bycicles-accidents-project/dataset/Bikers.csv")
bikers = bikers.rename({'Gender': 'biker_gender', 'Severity': 'biker_severity_injury', 'Age_Grp': 'biker_age_group'}, axis=1)  

result = pd.merge(accidents, bikers, on="Accident_Index")

result.to_csv("final_dataset_full.csv", header=True, sep=";", decimal=".", index=False)

result_100 = result[round(len(result)*0.50187):round(len(result)*0.502)]

print(len(result_100))

result_100.to_csv("final_dataset_100samples.csv", header=True, sep=";", decimal=".", index=False)