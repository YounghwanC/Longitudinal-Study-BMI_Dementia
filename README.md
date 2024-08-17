# BMI and Dementia: A Longitudinal Study Using GEE and Survival Analysis

## Overview

This project investigates the relationship between Body Mass Index (BMI) and the onset of dementia using longitudinal data. The analysis is conducted using Generalized Estimating Equations (GEE) and Survival Analysis, including the Cox Proportional Hazards model. The study utilizes data from the Health and Retirement Study, covering a period from 1996 to 2018, to explore how changes in BMI, along with factors such as gender and race, affect dementia risk over time. The full report detailing the methodology, results, and conclusions of this project can be found in the docs/ directory as BMI_and_Dementia_Study.pdf.

## Key Features

- **Longitudinal Data Analysis**: The project uses a large dataset with repeated measures collected over 12 waves from 1996 to 2018.
- **GEE Analysis**: Generalized Estimating Equations are employed to model the direct relationship between BMI and dementia status.
- **Survival Analysis**: Time-to-event data is analyzed using the Kaplan-Meier method and Cox Proportional Hazards model to account for the time-varying nature of dementia onset.
- **Stratified Analysis**: The study explores the effects of gender and race on dementia risk, stratifying the Cox model by these factors.

## Requirements

To run this project, you need the following:

- R (version 4.0 or later)
- R packages: `geepack`, `survival`, `ggplot2`

## License
This work is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute the content in this repository, provided you give appropriate credit to the original author.

## Contributing
Contributions to this repository are welcome. If you have suggestions or improvements, feel free to open an issue or submit a pull request.

## Contact
For any questions or further information, please contact:
- **Younghwan Brian Cho** - [yhcho9270@gmail.com](yhcho9270@gmail.com)

## Citation
If you use this work in your research, please cite as follows:
```plaintext
Cho, Y. B. (2022). BMI and Dementia: A Longitudinal Study Using GEE and Survival Analysis. [longitudinal-bmi-dementia], GitHub. [https://github.com/YounghwanC/longitudinal-bmi-dementia.git]
