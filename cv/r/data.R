library(tidyverse)
library(dplyr)

edu <- tribble(
  ~degree, ~startYear, ~endYear, ~inst, ~where, ~detail,
  "National Autonomous University of Mexico (UNAM)", 2021, 2025, "Bachelors in Science in Genomic Sciences", "Juriquilla, Qro, MX", "GPA: 3.52",
  "National Autonomous University of Mexico (UNAM)", 2021, 2025, "Bachelors in Science in Genomic Sciences", "Juriquilla, Qro, MX", "Relevant Coursework: Calculus, Statististics, Linear Algebra, Molecular and Cell Biology, Statistical Models in Human Genetics, Human Genomics in Health and Disease, Cancer Genomics, Evolutionary Genomics, Bioinformatics and Statistics, Machine Learning Applications in Genomics."
)

research <- tribble(
  ~title, ~unit, ~startMonth, ~startYear, ~endMonth, ~endYear, ~where, ~detail,
  "Research Intern", "Laboratory of Molecular Cancer Biology, Center for Cancer Biology, VIB - KU Leuven", "August", 2024, "June", 2025, "Leuven, Belgium", "Supervisors: Chris Marine, PhD. & Joanna Pozniak, PhD.",
  "Research Intern", "Laboratory of Molecular Cancer Biology, Center for Cancer Biology, VIB - KU Leuven", "August", 2024, "June", 2025, "Leuven, Belgium", "Analyzed the perivascular niche in melanoma using Molecular Cartography spatial transcriptomics data.",
  "Research Intern", "Laboratory of Molecular Cancer Biology, Center for Cancer Biology, VIB - KU Leuven", "August", 2024, "June", 2025, "Leuven, Belgium", "Designed pipelines for transcript assignment, quality assessment, and robust cell-type annotation.",
  "Research Intern", "Laboratory of Molecular Cancer Biology, Center for Cancer Biology, VIB - KU Leuven", "August", 2024, "June", 2025, "Leuven, Belgium", "Built spatial neighbor graphs and co-occurrence models to study cell–cell interactions.",
  "Research Intern", "Laboratory of Molecular Cancer Biology, Center for Cancer Biology, VIB - KU Leuven", "August", 2024, "June", 2025, "Leuven, Belgium", "Contributed to and adapted Python pipelines for processing multiplexed tissue imaging data (NanoNail and CIVO micro-dosing devices)",
  "Research Intern", "Laboratory of Molecular Cancer Biology, Center for Cancer Biology, VIB - KU Leuven", "August", 2024, "June", 2025, "Leuven, Belgium", "Implemented automated image preprocessing and segmentation workflows using Cellpose and Dask for large-scale datasets.",
  "Research Intern", "Laboratory of Molecular Cancer Biology, Center for Cancer Biology, VIB - KU Leuven", "August", 2024, "June", 2025, "Leuven, Belgium", "Performed spatial analyses and clustering to evaluate treatment responses at single-cell resolution.",
  "Research Intern", "Laboratory of Molecular Cancer Biology, Center for Cancer Biology, VIB - KU Leuven", "August", 2024, "June", 2025, "Leuven, Belgium", "Processed and analyzed bulk RNA-seq data from treated melanoma cell lines using HPC workflows.",
  "Research Intern", "Laboratory of Molecular Cancer Biology, Center for Cancer Biology, VIB - KU Leuven", "August", 2024, "June", 2025, "Leuven, Belgium", "Identified treatment-specific gene signatures and enriched pathways through differential expression and functional analysis.",
  "Research Intern", "Laboratory of Molecular Cancer Biology, Center for Cancer Biology, VIB - KU Leuven", "August", 2024, "June", 2025, "Leuven, Belgium", "Quantified volumetric and surface changes in melanoma cell lines under Palbociclib treatment.",
  "Research Intern", "Laboratory of Molecular Cancer Biology, Center for Cancer Biology, VIB - KU Leuven", "August", 2024, "June", 2025, "Leuven, Belgium", "Applied vector-based models to characterize magnitude and direction of cellular responses.",
  
  "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2022, "July", 2024, "Juriquilla, Qro, MX", "Supervisors: Carla Daniela Robles Espinoza, PhD. & Martha Estefanía Vázquez Cruz, PhD.",
  "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2022, "July", 2024, "Juriquilla, Qro, MX", "Analyzed spatial proteomics data from acral lentiginous melanoma patient samples using GeoMx Digital Spatial Profiler (35 protein markers).",
  "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2022, "July", 2024, "Juriquilla, Qro, MX", "Developed and benchmarked machine learning models (Random Forest, Logistic Regression) to predict ulceration status from tumor and TME regions.",
  "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2022, "July", 2024, "Juriquilla, Qro, MX", "Applied advanced preprocessing and cross-validation strategies, achieving high predictive accuracy (PR-AUC ≈ 0.98 in TME samples).",
  "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2022, "July", 2024, "Juriquilla, Qro, MX", "Identified immune-related markers (e.g., CD8, PD-1) as key predictors of ulceration, providing potential clinical insights.",
  "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2022, "July", 2024, "Juriquilla, Qro, MX", "Documented analyses in R and prepared a comprehensive technical report with reproducible workflows.",
  
  "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2022, "July", 2024, "Juriquilla, Qro, MX", "Gained hands-on training in molecular biology techniques, including nucleic acid extraction, quantification, and agarose gel electrophoresis.",
  "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2022, "July", 2024, "Juriquilla, Qro, MX", "Cultured mammalian cell lines (NIH 3T3, A375 melanoma): thawing, passaging, contamination detection, and cryopreservation.",
  "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2022, "July", 2024, "Juriquilla, Qro, MX", "Performed bacterial transformation, plasmid amplification, and purification with quality control.",
  "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2022, "July", 2024, "Juriquilla, Qro, MX", "Applied functional assays (foci formation, crystal violet staining, scratch, proliferation) to assess oncogenic potential.",
  "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2022, "July", 2024, "Juriquilla, Qro, MX", "Conducted mammalian cell transfection and antibiotic selection; prepared buffers, reagents, and sterile culture media.",
)

# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "June", 2023, "July", 2024, "Juriquilla, Qro, MX", "Supervisors: Carla Daniela Robles Espinoza, PhD. & Martha Estefanía Vázquez Cruz, PhD.",
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "June", 2023, "July", 2024, "Juriquilla, Qro, MX", "Analyzed spatial proteomics data of Mexican patients with acral lentiginous melanoma from the GeoMx Digital Spatial Profiler platform (35 protein biomarkers).",
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "June", 2023, "July", 2024, "Juriquilla, Qro, MX", "Developed and benchmarked machine learning classification models (Random Forest, Logistic Regression) to predict ulceration status from tumor and tumor microenvironment (TME) regions.",
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "June", 2023, "July", 2024, "Juriquilla, Qro, MX", "Applied advanced preprocessing (correlation filtering, PCA, upsampling) with 10-fold cross-validation, achieving strong predictive performance (PR-AUC ≈ 0.98 in TME samples).",
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "June", 2023, "July", 2024, "Juriquilla, Qro, MX", "Identified immune-related markers (e.g., CD8, PD-1) as key predictors of ulceration, highlighting potential clinical insights.",
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "June", 2023, "July", 2024, "Juriquilla, Qro, MX", "Implemented all analyses in R (tidymodels, ranger, caret, vip) and prepared a comprehensive technical report with Quarto.",
# 
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "May", 2022, "October", 2022, "Juriquilla, Qro, MX", "Supervisors: Carla Daniela Robles Espinoza, PhD. & Christian Molina-Aguilar, PhD.",
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "May", 2022, "October", 2022, "Juriquilla, Qro, MX", "Acquired hands-on experience in molecular biology techniques, including DNA/RNA extraction from tissue and saliva (AllPrep® DNA/RNA/miRNA kit, PrepIT), nucleic acid quantification and purity assessment (Nanodrop 2000, Qubit™ dsDNA/RNA HS), and agarose gel electrophoresis.",
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "May", 2022, "October", 2022, "Juriquilla, Qro, MX", "Trained in cell culture of mammalian cell lines (NIH 3T3 fibroblasts, A375 melanoma): cell thawing, passaging, medium preparation and replacement, cryopreservation, contamination detection, and cell counting with Neubauer chamber.",
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "May", 2022, "October", 2022, "Juriquilla, Qro, MX", "Performed bacterial transformation and plasmid amplification, followed by plasmid purification and quality control.",
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "May", 2022, "October", 2022, "Juriquilla, Qro, MX", "Applied functional assays including foci formation, crystal violet staining, scratch assay, and proliferation assays to evaluate oncogenic potential.",
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "May", 2022, "October", 2022, "Juriquilla, Qro, MX", "Conducted mammalian cell transfection (lipofectamine-mediated) and subsequent antibiotic selection.",
# "Research Intern", "Cancer Genomics and Bioinformatics Lab, International Laboratory for Human Genome Research (LIIGH), UNAM", "May", 2022, "October", 2022, "Juriquilla, Qro, MX", "Gained proficiency in the preparation of laboratory buffers, reagents, and sterile culture media.",

publications <- tribble(
  ~title, ~details,
  "The microenvironment of ulcerated acral melanoma is characterised by an inflammatory milieu and an enhanced humoral immune response.", "Vazquez-Cruz, M. E., Basurto-Lozada, P., Molina-Aguilar, C., Orozco-Ruiz, S., Van Haastrecht, B., Simonin-Wilmer, I., Martinez-Said, H., Alvarez-Cano, A., Garcia-Ortega, D. Y., Hidalgo-Miranda, A., Hinojosa-Ugarte, D., Ferreira, I., Tavares-De-La-Paz, L. A., Olguin, J. E., Salinas, I., Rodriguez-Perez, A., Martinez-Gomez, J. M., Van Der Zee, I., Grimes, D. R., . . . Robles-Espinoza, C. D. (2025). The microenvironment of ulcerated acral melanoma is characterised by an inflammatory milieu and an enhanced humoral immune response. medRxiv (Cold Spring Harbor Laboratory). https://doi.org/10.1101/2025.05.05.25325616"
)

presentations <- tribble(
  ~conference, ~where, ~month, ~year, ~title, ~detail,
  "Mini-Symposium: Acral Melanoma Research in Latin America", "International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2024, "Machine Learning models for ulceration prediction in mexican melanoma cohort", "Presented research on applying machine learning (Random Forest, Logistic Regression, LASSO) to spatial proteomics data from Mexican acral melanoma patients.",
  "Mini-Symposium: Acral Melanoma Research in Latin America", "International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2024, "Machine Learning models for ulceration prediction in mexican melanoma cohort", "Discussed methodology (data preprocessing, feature selection, PCA, upsampling) and evaluation metrics (PR-AUC).",
  "Mini-Symposium: Acral Melanoma Research in Latin America", "International Laboratory for Human Genome Research (LIIGH -UNAM)", "May", 2024, "Machine Learning models for ulceration prediction in mexican melanoma cohort", "Highlighted potential clinical applications of computational models in melanoma prognosis.",
)

teaching <- tribble(
  ~area, ~accomplishment, ~month ,~year, ~where, ~detail,
  "Invited Speaker", "5th Summer School: Introduction to Genomic Sciences, LIIGH-UNAM", "July", 2025, "Remotely", "Talk title: De genes, código y decisiones: lecciones sobre el inicio de una carrera científica",
  "Invited Speaker", "5th Summer School: Introduction to Genomic Sciences, LIIGH-UNAM", "July", 2025, "Remotely", "Delivered am interactive talk as part of the “My Science and My Life” series.",
  "Invited Speaker", "5th Summer School: Introduction to Genomic Sciences, LIIGH-UNAM", "July", 2025, "Remotely", "Shared personal trajectory and lessons for early-career students, combining genomics, coding, and career decision-making.",
  
  "Guest Instructor", "Undergraduate Program in Genomic Sciences, UNAM", "November", 2024, "Remotely", "Assisted in teaching 'Introduction to Single-Cell and Spatial Transcriptomics' lecture for third-semester undergraduate students.",
  "Guest Instructor", "Undergraduate Program in Genomic Sciences, UNAM", "November", 2024, "Remotely", "Clarified core concepts and addressed student questions to facilitate understanding.",
)

awards <- tribble(
  ~area, ~accomplishment, ~year, ~where, ~detail,
  "Phi Theta Kappa Academic Honor Society", "Granted to individuals in the 90th percentile of their graduating class", 2015, "Cosumnes River College",NA,
  "Galt Community Character Coalition Honesty Award", "Awarded by the Galt City Council", 2010, "City Of Galt",NA
)

courses <- tribble(
  ~area, ~accomplishment, ~month, ~year, ~where, ~detail,
  "Hands-on introduction to targeted spatial transcriptomics data analysis", "VIB Training", "December", 2024, "Leuven, Belgium", NA,
  "Machine Learning & Deep Learning Workshop", "VIB Training", "November", 2024, "Ghent, Belgium", NA,
  "Nextflow for reproducible and automated data analysis", "VIB Training", "November", 2024, "Leuven, Belgium", NA,
  "Introduction to NGS analysis", "VIB Training", "October", 2024, "Leuven, Belgium", NA,
  "Docker and Apptainer (Singularity) for reproducible and automated data analysis", "VIB Training", "October", 2024, "Leuven, Belgium", NA,
)

skills <- tribble(
  ~area, ~skills,
  "Programming Languages", "R, Python, Bash, SQL, MATLAB, Git",
  "Bioinformatic skills", "GitHub, High Performance Computing (HPC), Conda, Docker, Nextflow, RMarkdown, Quarto, Jupyter Notebooks",
  "Data Analysis & Visualization", "tidyverse, ggplot2, plotly, seaborn, matplotlib, pandas, numpy",
  "Omics data types", "Bulk RNA-seq, Single-cell RNA-seq, Spatial Transcriptomics, Proteomics, Genome Wide Association Studies (GWAS), Next-Generation Sequencing (NGS)",
  "Laboratory skills", "DNA/RNA extraction and quantification, Mammalian cell culture, Bacterial transformation, plasmid prep, lipofectamine transfection, Functional assays",
  "Languages", "Spanish (native), English (proficient)",
  "Interests", "Computational biology and cancer genomics"
)
