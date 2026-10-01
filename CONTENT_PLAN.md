# Content plan

Status and sources for every page in `docs/`. This file is not published.

Source paths are relative to the ProCap code base at `C:\Users\AndrinLandolt\core_engine\core_engine\Assets\` unless noted otherwise. `WhatsNew` means `core_engine\core_engine\WhatsNew_ProCap_2027.docx` and `§` refers to its section numbers.

Status values: `stub` (placeholder only), `draft` (content written, not reviewed), `review` (awaiting technical review), `done`.

## Home and What's new

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `README.md` | draft | Product intro, entry points | — |
| `whats-new.md` | stub | Release video, changelog PDF | Video: to be provided. PDF: put it in `docs/.gitbook/assets/` and embed it with `{% file src=".gitbook/assets/<name>.pdf" %}`. Embed the video with `{% embed url="<video URL>" %}`. WhatsNew is a candidate source for the PDF. |

## Getting started

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `getting-started/what-is-procap.md` | stub | Measurement principle: probe, tracking, multigrid, interpolation, visualization | `docs\technical\` (internal, use for concepts only) |
| `getting-started/system-requirements.md` | stub | Windows x64, GPU with compute shaders, supported tracking systems | Ask the product team |
| `getting-started/features-and-editions.md` | draft | Feature and limit matrix | `Scripts\Control\EditionCapabilities.cs`, `ProCapEdition.cs`, `ProCapVersion.cs` |
| `getting-started/installation-and-license-activation.md` | stub | Installer, folders next to the exe (`Internal`, `ProbeConfig`, `Templates`, `Legacy`), CodeMeter runtime, dongle, maintenance updates, Reader network server | `Scripts\Configuration\AppPaths.cs`. Missing `procap_manual/wibu.tex`. `docs\encryption\` is internal. |
| `getting-started/quick-start.md` | stub | End-to-end walkthrough | All sections |

## The workspace

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `workspace/README.md` | stub | Layout: header, hotbar, floating windows, 3D view | WhatsNew §1.1 |
| `workspace/start-screen.md` | stub | Recent projects (max. 15), **LOAD PROJECT** | `_scenes\LoadProject.unity`, LoadProjectShellView |
| `workspace/display-header.md` | stub | Master toggles, left-click vs right-click | WhatsNew §1.1, §1.2 |
| `workspace/hotbar-and-windows.md` | stub | Panel bubbles, list windows, Apply/Cancel | WhatsNew §1.1, `Scripts\UI\ProCapUi\Hotbar\` |
| `workspace/camera-and-navigation.md` | stub | Orbit, pan, zoom, saved views, lights | WhatsNew §3.11 |
| `workspace/gizmos.md` | stub | Transform gizmos | `Scripts\Interaction\Gizmo\` |
| `workspace/software-settings.md` | stub | Interface Scale, Skybox Settings (stored per machine) | WhatsNew §1.3, `Panels\SoftwareSettingsWindow\` |
| `workspace/warnings-and-notices.md` | stub | WARNING / NOTICE dialogs, revert behavior | WhatsNew §1.5 |

## Projects

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `projects/create-and-open.md` | stub | New project from `Templates\base_template`, open existing | `Scripts\Configuration\ProjectFileService.cs` |
| `projects/project-folder.md` | stub | `configFile.proCap`, `Input\`, `Output\`, `Output\ScreenShots` | `ProjectFileService.cs` |

## Scene setup

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `scene-setup/coordinate-system.md` | stub | Axes, origin, units, coordinate origin toggle | WhatsNew §1.1 (Coordinate Origin) |
| `scene-setup/domain-and-ground-plane.md` | stub | Domain size, position, orientation, resolution. Ground plane settings | WhatsNew §3.6, `Panels\DomainWindow\`, `Panels\GroundPlaneWindow\` |
| `scene-setup/models.md` | stub | STL import, **From Primitive**, mesh/wireframe overlay, CAD lighting | WhatsNew §3.4, §3.5, §3.10, `Panels\ModelsListWindow\`, `ModelSettingsWindow\`, `FromPrimitiveWindow\` |
| `scene-setup/interpolation-settings.md` | stub | Interpolation Type, epsilon, **Use MultiGrid**, **Split Point Threshold**, reload on apply | WhatsNew §2.1, §2.2, `Panels\InterpolationSettingsWindow\` |
| `scene-setup/save-and-reload-settings.md` | stub | Save (case info review), Save As (folder clone, confirmation if the destination is not empty), Reload (confirms, stops probes, reloads from disk) | WhatsNew §1.6, `Panels\SaveSettingsWindow\` |

## Visualization features

The landing page `visualization/visualization-features.md` uses the layout of the Motive "Toolbar" page: a toolbar strip image, followed by one expandable block per feature, each with an inline icon (`data-size="line"`). `visualization/probe-data.md` uses the same pattern.

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `visualization/visualization-features.md` | draft | Overview with expandable entries | — |
| `visualization/probe-data.md` | draft | Overview of the two probe data pages | — |
| `visualization/probe-data/current-state.md` | stub | Current State card and window, position feedback | `Panels\CurrentStateCard\`, `CurrentStateWindow\` |
| `visualization/probe-data/probe-data.md` | stub | Probe statistics, HUD | WhatsNew §4.1, `Panels\ProbeStatistics\` |
| `visualization/visualization-planes.md` | stub | Planes list and settings, surface streamlines, cut planes and outlines | WhatsNew §3.2, §3.7, `Panels\PlanesListWindow\`, `PlaneSettingsWindow\` |
| `visualization/isosurfaces.md` | stub | Isosurfaces list and settings | `Panels\IsosurfacesListWindow\`, `IsosurfaceSettingsWindow\` |
| `visualization/projections.md` | stub | Projection surfaces, analytics (force, moment, pivot) | WhatsNew §3.3, `Panels\ProjectionsListWindow\`, `ProjectionSettingsWindow\`, `AnalyticsWindow\` |
| `visualization/streamlines.md` | stub | Rakes, seed points, attach to probe | WhatsNew §4.8, `Panels\RakesListWindow\`, `RakeSettingsWindow\` |
| `visualization/plot-over-line.md` | stub | Line definition, plot window, plot files | WhatsNew §3.1, `Panels\PlotOverLineListWindow\`, `PlotOverLinePlotWindow\` |
| `visualization/voxel-eraser.md` | stub | Erasing regions of measurement data | WhatsNew §4.7, `Panels\VoxelEraserWindow\` |

## Measurement

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `measurement/quantities.md` | stub | Measured and derived quantities (magnitude, component, curl, divergence, Q-criterion, vorticity), ppV, ppVraw, PointDensity, ConfInt | WhatsNew §3.8, `Scripts\Quantities\Rules\` |
| `measurement/connecting-a-probe.md` | stub | Probe Panel, digital/analog probes, COM port / IP connection | WhatsNew §4.1, §4.2, `Panels\ProbeWindow\`, `Scripts\Features\ProbeFeature\` |
| `measurement/recording-a-measurement.md` | stub | **START MEASUREMENT**, recording, measurement note, `.proCapLog` | WhatsNew §4.3, §4.5, `Scripts\Features\Measurement\` |
| `measurement/measurement-replay.md` | stub | Replay, model-pose replay, Reader without tracker | WhatsNew §4.3–§4.5, §4.9, `Scripts\Features\ModelReplay\` |
| `measurement/data-export.md` | stub | **DATA EXPORT**: VTU (ParaView), raw data CSV, STL, screenshots | WhatsNew §4.6, `Panels\DataExportWindow\DataExportView.cs` |
| `measurement/keeping-track-of-the-data.md` | stub | Measurement notes, `LogFile.csv`, project folder organization (scope to be confirmed) | `Scripts\Features\Measurement\ProCapLogRecorder.cs` |

## Data processing

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `data-processing/import-measurement-data.md` | stub | Import `.proCapLog`, select multiple datasets, change interpolation settings at import | WhatsNew §4.5, `Scripts\DataStorage\ProCapLog\` |
| `data-processing/working-with-paraview.md` | stub | Opening `MultigridData_*.vtu` in ParaView | `DataExportView.cs` |

## References

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `reference/user-defined-functions.md` | stub | Defining custom quantities (confirm the relation to the "User-defined elements" edition feature) | `Scripts\Quantities\` |
| `reference/troubleshooting.md` | stub | Common warnings, memory limit, license errors | WhatsNew §1.5, §2.1 |

## The openWire protocol, supported probes, optical tracking systems

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `openwire/what-is-openwire.md` | stub | Purpose of the protocol | Not found in the code base, ask the product team |
| `openwire/arduino-student-kit.md` | stub | Student kit setup | Ask the product team |
| `openwire/openwire-test-bench.md` | stub | Test bench | Ask the product team |
| `probes/vectoflow-probes.md` | stub | Overview of the supported Vectoflow probes | `Internal\Probes\` registry (installation) |
| `probes/5-hole-iprobe.md` | stub | Setup and specifics | Ask the product team |
| `probes/micro-iprobe.md` | stub | Setup and specifics | Ask the product team |
| `probes/trisonica-sphere.md` | stub | Setup and specifics | Ask the product team |
| `tracking/optitrack.md` | stub | VRPN setup, rigid bodies | `Scripts\Features\TrackingFeature\` |
| `tracking/qualisys.md` | stub | QT2vrpn setup | `Scripts\Features\TrackingFeature\`, `Legacy\QT2Vrpn.exe` |
| `tracking/vicon.md` | stub | VRPN setup | `Scripts\Features\TrackingFeature\` |

## Placeholder assets to replace

* `docs/.gitbook/assets/icon-*.svg`: placeholder icons. Replace them with the real UI icons (keep the file names or update the references in `visualization/visualization-features.md` and `visualization/probe-data.md`).
* `docs/.gitbook/assets/visualization-toolbar.svg`: placeholder for a screenshot of the ProCap toolbar.

## Open questions

* Where are the sources of the existing customer manual (`procap_manual`, including `wibu.tex`)? It may contain content to reuse.
* Official system requirements (GPU, RAM, supported tracking systems and versions).
* Screenshots: who captures them, and in which edition and version?
* Support contact to publish in the documentation.
