# experimental

Regex-based detectors (`data_patterns.py`, `adversarial.py`) moved out of the
`data_patterns` package. They are unused: these checks are expected to come from a
real network security tool. They still import `data_patterns.validation`.
