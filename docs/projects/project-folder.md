---
description: The files and folders that make up a ProCap project.
---

# Project folder structure

A ProCap project is a folder. It holds everything that belongs to the project: the project settings, the model geometry, the measurement data and everything you export. A new project contains the `Input` folder and the `Output/Data` folder. ProCap creates the other folders when it first saves a file into them.

To move a project to another computer or share it, copy the whole project folder. To open it, select this top-level folder on the [start screen](start-screen.md), not one of its subfolders.

## Folder structure

```text
<project folder>
├── Input
│   ├── configFile.proCap
│   ├── configFile_old.proCap
│   ├── <model>.stl
│   ├── ProbeConfig
│   └── ProbeGeometry
└── Output
    ├── Data
    │   ├── <date>_<time>.proCapLog
    │   ├── LogFile.csv
    │   └── exported data
    ├── 1Dplots
    └── ScreenShots
```

## The Input folder

The `Input` folder holds the setup of the project.

| Content | Description |
| --- | --- |
| `configFile.proCap` | The project file. It stores all settings of the project: the measurement domain and interpolation, the models, the probe, and the visualization planes, isosurfaces and other visualization features. ProCap writes it when you [save](../workspace/save-and-reload.md). |
| `configFile_old.proCap` | A backup of the project file as it was when you opened the project. ProCap writes it the first time you save during a session. To go back to that state, copy it over `configFile.proCap`. |
| `*.stl` | The geometry of the models. Copy your STL files here to use them in the [Model settings](../scene-setup/models.md). Shapes you add with **+ Primitive** are saved here too. |
| `ProbeConfig` and `ProbeGeometry` | Only for custom probes that you developed yourself, for example with the [openWire test bench](../openwire/openwire-test-bench.md) and the [openWire protocol](../openwire/what-is-openwire.md). ProCap copies the probe's configuration (`.json`) into `ProbeConfig` and its 3D geometry (`.stl`) into `ProbeGeometry`. This way, the project keeps working on a computer where the custom probe is not installed. Probes supplied with ProCap are not copied. |

A new project starts with the project file and two example models, `ProCapLogo.STL` and `streamwise_logo.stl`. When you add a model with **+ Add**, ProCap uses `streamwise_logo.stl` as its placeholder geometry until you select your own file.

## The Output folder

The `Output` folder holds everything ProCap records and exports.

| Folder | Content |
| --- | --- |
| `Data` | The measurements and the exported data. |
| `1Dplots` | The images and CSV files you save from a [lineplot](../visualization/lineplot.md). |
| `ScreenShots` | The screenshots you take in ProCap. |

### The Data folder

| Content | Description |
| --- | --- |
| `<date>_<time>.proCapLog` | One file per measurement, with the raw data of the probe and the tracking system. The name is the date and time the measurement started, for example `2026-11-13_14-05-32.proCapLog`. You can [import](../data-processing/import-measurement-data.md) these files again to replay and reprocess the measurement. |
| `LogFile.csv` | The list of all measurements in the project, one line per measurement: file name, date, start time and the comment you entered for the measurement. See [Keeping track of the data](../measurement/keeping-track-of-the-data.md). |
| Exported data | The files you create with [Data export](../measurement/data-export.md): the interpolated flow field and the raw data as `.vtu` files for ParaView, the raw data as a `.csv` file, and the models as `.stl` files. |
