# Content plan

Status and sources for every page in `docs/`. This file is not published.

Source paths are relative to the ProCap code base at `C:\Users\AndrinLandolt\core_engine\core_engine\Assets\` unless noted otherwise. `WhatsNew` means `core_engine\core_engine\WhatsNew_ProCap_2027.docx` and `§` refers to its section numbers.

Status values: `stub` (placeholder only), `draft` (content written, not reviewed), `review` (awaiting technical review), `done`.

## Getting started

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `README.md` | draft | Product intro, entry points | — |
| `getting-started/what-is-procap.md` | stub | Measurement principle: probe, tracking, multigrid, interpolation, visualization | `docs\technical\` (internal, use for concepts only) |
| `getting-started/editions.md` | draft | Feature and limit matrix | `Scripts\Control\EditionCapabilities.cs`, `ProCapEdition.cs`, `ProCapVersion.cs` |
| `getting-started/system-requirements.md` | stub | Windows x64, GPU with compute shaders, supported tracking systems | Ask the product team |
| `getting-started/installation.md` | stub | Installer, folders next to the exe (`Internal`, `ProbeConfig`, `Templates`, `Legacy`) | `Scripts\Configuration\AppPaths.cs` |
| `getting-started/licensing.md` | stub | CodeMeter runtime, dongle, maintenance updates, Reader network server | Missing `procap_manual/wibu.tex`; `docs\encryption\` is internal |
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
| `projects/save-and-reload.md` | stub | Save (case info review), Save As (folder clone), Reload | WhatsNew §1.6, `Panels\SaveSettingsWindow\` |
| `projects/project-folder.md` | stub | `configFile.proCap`, `Input\`, `Output\`, `Output\ScreenShots` | `ProjectFileService.cs` |

## Scene setup

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `scene-setup/domain.md` | stub | Size, position, orientation, resolution | WhatsNew §3.6, `Panels\DomainWindow\` |
| `scene-setup/ground-plane.md` | stub | Ground plane settings | `Panels\GroundPlaneWindow\` |
| `scene-setup/models.md` | stub | STL import, **From Primitive**, mesh/wireframe overlay, CAD lighting | WhatsNew §3.4, §3.5, §3.10, `Panels\ModelsListWindow\`, `ModelSettingsWindow\`, `FromPrimitiveWindow\` |
| `scene-setup/interpolation.md` | stub | Interpolation Type, epsilon, **Use MultiGrid**, **Split Point Threshold**, reload on apply | WhatsNew §2.1, §2.2, `Panels\InterpolationSettingsWindow\` |

## Measurement

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `measurement/probes.md` | stub | Probe Panel, HUD, digital/analog probes, Pitot and Surrey probes, COM port / IP connection | WhatsNew §4.1, §4.2, `Panels\ProbeWindow\`, `Scripts\Features\ProbeFeature\` |
| `measurement/custom-probes.md` | stub | `ProbeConfig\Config`, `ProbeConfig\Geometry` (JSON + STL) | `Scripts\Configuration\AppPaths.cs` |
| `measurement/tracking.md` | stub | Qualisys, Vicon, OptiTrack via VRPN, active/relative tracking | `Scripts\Features\TrackingFeature\` |
| `measurement/recording.md` | stub | **START MEASUREMENT**, recording, measurement note, `.proCapLog` | WhatsNew §4.3, §4.5, `Scripts\Features\Measurement\` |
| `measurement/current-state.md` | stub | Current State card and window, position feedback | `Panels\CurrentStateCard\`, `CurrentStateWindow\` |
| `measurement/replay.md` | stub | Replay, log import, model-pose replay, Reader without tracker | WhatsNew §4.3–§4.5, §4.9, `Scripts\DataStorage\ProCapLog\`, `Scripts\Features\ModelReplay\` |
| `measurement/voxel-eraser.md` | stub | Erasing regions | WhatsNew §4.7, `Panels\VoxelEraserWindow\` |

## Visualization

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `visualization/quantities.md` | stub | Measured and derived quantities (magnitude, component, curl, divergence, Q-criterion, vorticity), ppV, ppVraw, PointDensity, ConfInt | WhatsNew §3.8, `Scripts\Quantities\Rules\` |
| `visualization/color-maps.md` | stub | Palettes, legends, auto color bar | WhatsNew §3.9, `Scripts\Configuration\ColorMaps\` |
| `visualization/visualization-planes.md` | stub | Planes list and settings, surface streamlines, cut planes and outlines | WhatsNew §3.2, §3.7, `Panels\PlanesListWindow\`, `PlaneSettingsWindow\` |
| `visualization/isosurfaces.md` | stub | Isosurfaces list and settings | `Panels\IsosurfacesListWindow\`, `IsosurfaceSettingsWindow\` |
| `visualization/streamlines.md` | stub | Rakes, seed points, attach to probe | WhatsNew §4.8, `Panels\RakesListWindow\`, `RakeSettingsWindow\` |
| `visualization/projections.md` | stub | Projection surfaces, analytics (force, moment, pivot) | WhatsNew §3.3, `Panels\ProjectionsListWindow\`, `ProjectionSettingsWindow\`, `AnalyticsWindow\` |
| `visualization/plot-over-line.md` | stub | Line definition, plot window, plot files | WhatsNew §3.1, `Panels\PlotOverLineListWindow\`, `PlotOverLinePlotWindow\` |

## Export and reference

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `export/data-export.md` | stub | **DATA EXPORT**: VTU (ParaView), raw data CSV, STL | WhatsNew §4.6, `Panels\DataExportWindow\DataExportView.cs` |
| `export/screenshots.md` | stub | Screenshot view, `Output\ScreenShots` | WhatsNew §4.6 |
| `reference/file-formats.md` | stub | `.proCap`, `.proCapLog`, `LogFile.csv`, `.vtu`, `.csv`, `.stl`, probe JSON | See pages above |
| `reference/glossary.md` | stub | Domain, voxel, multigrid, rake, projection, current state, … | — |
| `reference/troubleshooting.md` | stub | Common warnings, memory limit, license errors | WhatsNew §1.5, §2.1 |
| `release-notes/procap-2027.md` | stub | Customer feature list since 2026.0 | WhatsNew (whole document) |

## Open questions

* Where are the sources of the existing customer manual (`procap_manual`, including `wibu.tex`)? It may contain content to reuse.
* Official system requirements (GPU, RAM, supported tracking systems and versions).
* Screenshots: who captures them, and in which edition and version?
* Support contact to publish in the documentation.
