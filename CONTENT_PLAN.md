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
| `getting-started/features-and-editions.md` | draft | Feature and limit matrix. Verified against the `live` branch on 2026-11-10 (retired features removed, new features added, Student models limit 5) | `Scripts\Control\EditionCapabilities.cs`, `ProCapEdition.cs`, `ProCapVersion.cs` |
| `getting-started/installation-and-license-activation.md` | stub | Installer, folders next to the exe (`Internal`, `ProbeConfig`, `Templates`, `Legacy`), CodeMeter runtime, dongle, maintenance updates, Reader network server | `Scripts\Configuration\AppPaths.cs`. Missing `procap_manual/wibu.tex`. `docs\encryption\` is internal. |
| `getting-started/quick-start.md` | draft | End-to-end walkthrough, 11 steps. Labels verified against the `live` branch on 2026-11-10, including **CLONE LAST** on the start screen | 2026.0 user manual quick-start guide (p. 55), updated to the 2027 labels from the code base (`LoadProjectShellView.prefab`, `FloatingWindowProbePanel.prefab`, `MeasurementWidget.prefab`, `MainUIView.prefab`) |

## ProCap projects

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `projects/start-screen.md` | stub | Recent projects (max. 15), **LOAD PROJECT** | `_scenes\LoadProject.unity`, LoadProjectShellView |
| `projects/create-and-open.md` | stub | New project from `Templates\base_template`, open existing | `Scripts\Configuration\ProjectFileService.cs` |
| `projects/project-folder.md` | stub | `configFile.proCap`, `Input\`, `Output\`, `Output\ScreenShots` | `ProjectFileService.cs` |

## The workspace

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `workspace/README.md` | stub | Layout: header, hotbar, floating windows, 3D view | WhatsNew §1.1 |
| `workspace/display-header.md` | stub | Master toggles (for example the **Current state** icon, which shows or hides the whole current state), left-click vs right-click | WhatsNew §1.1, §1.2 |
| `workspace/coordinate-system.md` | stub | Axes, origin, units, coordinate origin toggle | WhatsNew §1.1 (Coordinate Origin) |
| `workspace/hotbar-and-windows.md` | stub | Panel bubbles, list windows, Apply/Cancel | WhatsNew §1.1, `Scripts\UI\ProCapUi\Hotbar\` |
| `workspace/probe-statistics.md` | stub | HUD block: connection state (Disconnected, Connecting..., Connected, Calibrating..., Calibrated), data rate in Hz with dropped samples and reconnects, probe model, tracking warning | WhatsNew §4.1, `Panels\ProbeStatistics\` (lives in `ProbeDebug.prefab`, but the user confirmed on 2026-11-10 that customers see it). The software shows no title for the HUD; "Probe statistics" is a working title |
| `workspace/probe-data-card.md` | stub | Probe data card in the main workspace: velocity magnitude, value of the current-state quantity, probe tip position in mm, option to let the card follow the probe tip on screen (it returns to its place when tracking is lost). Not part of the current state; `visualization/current-state.md` only links to it | `Panels\CurrentStateCard\` (needs a screenshot for the labels) |
| `workspace/camera-and-navigation.md` | stub | Orbit, pan, zoom, saved views, lights | WhatsNew §3.11 |
| `workspace/gizmos.md` | stub | Transform gizmos. Written so far: selecting objects (orange selected outline, light-blue hover outline) and the quick actions bar in detail (Show or hide, Edit, Move or edit shape, Duplicate, Delete, Lock color map). Still to write: the gizmo itself (arrows, rings, local vs scene axes) | `Scripts\Interaction\Gizmo\`, `UI\ProCapUi\Interaction\StandardQuickActions.cs`, `Interaction\SelectionOutlineSystem.cs` |
| `workspace/general-settings.md` | stub | **General Settings** (opened from the header cog): Interface Scale, Skybox Settings (stored per machine), edition and version in the title | WhatsNew §1.3, §1.7, `Panels\SoftwareSettingsWindow\` |
| `workspace/save-and-reload.md` | stub | Save (case info review), Save As (folder clone, confirmation if the destination is not empty), Reload (confirms, stops probes, reloads from disk). The only page that covers saving and reloading | WhatsNew §1.6, `Panels\SaveSettingsWindow\` |
| `workspace/warnings-and-notices.md` | stub | WARNING / NOTICE dialogs, revert behavior | WhatsNew §1.5 |

## Setting up the scene

The landing page `scene-setup/setting-up-the-scene.md` uses the same expandable-with-icon layout as `visualization/visualization-features.md`.

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `scene-setup/setting-up-the-scene.md` | draft | Overview with expandable entries | — |
| `scene-setup/measurement-domain-and-interpolation.md` | draft | Title: "Measurement domain and interpolation settings". The combined **Domain Settings** panel: Dimensions, Voxel Settings, Interpolation Settings, Groundplane Settings, each with a screenshot crop and a settings table. Reload on apply, ground plane applies instantly, edition gating of MultiGrid and the `_INT` types. Verified against the `live` branch on 2026-11-10 | User screenshot of the 2027 panel. `Settings\UI\Panels\DomainSettings.panel.json` (labels), `Panels\DomainWindow\` (incl. the interpolation and ground-plane section controllers), `Configuration\Domain.cs`, `SketchDomain.cs`, `DomainApplier.cs`, `ProCapInterpolation\GPUInterpolation.cs`, WhatsNew §2.1, §2.2, §3.6 |
| `scene-setup/models.md` | draft | Title: "Model settings". Models panel (list), Model panel (General, Tracking), **+ Primitive**, relative tracking with **ZERO OFFSET**. Screenshot crops `models-list-panel.png`, `model-settings-panel.png` | User screenshot of the 2027 panels. `Settings\UI\Panels\ModelSettings.panel.json`, `FromPrimitive.panel.json`, `Panels\ModelsListWindow\`, `ModelSettingsWindow\`, `Shared\SceneListEntry.cs`, `Configuration\ModelHandler.cs`, `Model.cs`, WhatsNew §3.4, §3.5, §3.10 |
| `scene-setup/probe-settings.md` | draft | All probe configuration. The only page that covers probe configuration. Covers only the standard digital probes (iProbe, Sphere): Probe Connection State, Probe Selector, VRPN Settings, Digital Probe Settings, Signal Processing Settings, each with a screenshot crop. Other probe models' sections (for example Ambient Settings) are deliberately not described, only a note that settings vary by model | User screenshot of the 2027 panel. `Settings\UI\Panels\ProbeSettings.panel.json`, `Panels\ProbeWindow\`, `DataStorage\DataClasses.cs` (velocity clipping), `EditionCapabilities.cs` |

## Visualization features

The landing page `visualization/visualization-features.md` is only a list of expandable blocks, one per feature, each with an inline icon (`data-size="line"`). It has no subtitle, intro text or toolbar image.

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `visualization/visualization-features.md` | draft | Overview with expandable entries | — |
| `visualization/current-state.md` | draft | **Current State Settings** panel (Visibility Settings, Quantity Settings) with screenshot crop `current-state-settings-panel.png`, the indicators at the probe tip, one sentence linking to `workspace/probe-data-card.md`. Probe statistics and the HUD are covered in `workspace/probe-statistics.md` | User screenshot of the 2027 panel. `Settings\UI\Panels\CurrentStateSettings.panel.json`, `Panels\CurrentStateWindow\`, `Panels\CurrentStateCard\`, `RTVisualization\CurrentStateView.cs` |
| `visualization/visualization-planes.md` | draft | Visualization Planes panel (list), General, Scalar Settings, Vector Settings, surface streamlines, the plane in the 3D view (orange outline, gizmo, quick actions in brief, legend). Screenshot crops `visualization-planes-list-panel.png`, `plane-settings-*.png`, `visualization-plane-in-scene.png` | User screenshots of the 2027 panels. `Settings\UI\Panels\PlaneSettings.panel.json`, `Panels\PlaneSettingsWindow\`, `RTVisualization\PlaneGizmoTarget.cs`, `PlaneInteractableTarget.cs`, `SurfaceStreamlineDrawer.cs`, `Shaders\Visualization\Quiver.shader`, `UI\ProCapUi\Interaction\ColorMapHost.cs`, WhatsNew §3.2, §3.7 |
| `visualization/isosurfaces.md` | draft | Isosurfaces panel (list). The screenshot crop `isosurfaces-list-panel.png` still shows the old title "Iso Surfaces"; the software will change it to "Isosurfaces", so replace the crop with a new screenshot then and isosurface settings, with screenshot crops `isosurfaces-list-panel.png`, `isosurface-settings-panel.png` | User screenshot of the 2027 panels. `Settings\UI\Panels\IsosurfaceSettings.panel.json`, `Panels\IsosurfacesListWindow\`, `IsosurfaceSettingsWindow\`, `Configuration\Isosurface.cs`, `RTVisualization\IsosurfaceInteractableTarget.cs` |
| `visualization/projections.md` | draft | Projections panel (list), General, Scalar Settings, Vector Settings (surface streamlines), the projection in the 3D view (outline, quick actions incl. Σ, legend). Max. 5 projections, needs a model. Screenshot crops `projections-list-panel.png`, `projection-settings-*.png`, `projection-in-scene.png` | WhatsNew §3.3, `Panels\ProjectionsListWindow\`, `ProjectionSettingsWindow\`. Force and moment evaluation is covered in `visualization/surface-analytics.md` |
| `visualization/streamlines.md` | stub | Rakes, seed points, attach to probe | WhatsNew §4.8, `Panels\RakesListWindow\`, `RakeSettingsWindow\` |
| `visualization/plot-over-line.md` | stub | Line definition, plot window, plot files | WhatsNew §3.1, `Panels\PlotOverLineListWindow\`, `PlotOverLinePlotWindow\` |
| `visualization/surface-analytics.md` | stub | **Surface analytics** panel: pressure force, moment about a reference point, volume flow on model surfaces | `Panels\SurfaceAnalyticsListWindow\`, `SurfaceAnalysisWindow\`, `Resources\UI\Panels\SurfaceAnalyticsPanel.asset`, `EditionCapabilities.cs` (SurfaceAnalytics) |
| `visualization/voxel-eraser.md` | stub | Erasing regions of measurement data | WhatsNew §4.7, `Panels\VoxelEraserWindow\` |

## Measurement

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `measurement/quantities.md` | stub | Measured and derived quantities (magnitude, component, curl, divergence, Q-criterion, vorticity), ppV, ppVraw, PointDensity, ConfInt | WhatsNew §3.8, `Scripts\Quantities\Rules\` |
| `measurement/connecting-a-probe.md` | stub | Physical connection only: COM port / IP connection, checking that data arrives. Link to `scene-setup/probe-settings.md` for configuration | WhatsNew §4.1, §4.2, `Scripts\Features\ProbeFeature\` |
| `measurement/recording-a-measurement.md` | stub | **START MEASUREMENT**, recording, measurement note, `.proCapLog` | WhatsNew §4.3, §4.5, `Scripts\Features\Measurement\` |
| `measurement/measurement-replay.md` | stub | Replay, model-pose replay, Reader without tracker | WhatsNew §4.3–§4.5, §4.9, `Scripts\Features\ModelReplay\` |
| `measurement/data-export.md` | stub | **DATA EXPORT**: VTU (ParaView), raw data CSV, STL, screenshots | WhatsNew §4.6, `Panels\DataExportWindow\DataExportView.cs` |
| `measurement/keeping-track-of-the-data.md` | stub | Measurement notes, `LogFile.csv`, project folder organization (scope to be confirmed) | `Scripts\Features\Measurement\ProCapLogRecorder.cs` |

## Data processing

| Page | Status | Topics | Sources |
| --- | --- | --- | --- |
| `data-processing/import-measurement-data.md` | stub | Import `.proCapLog`, select multiple datasets, change interpolation settings at import, reprocess the raw data with a different signal processing threshold (linked from `scene-setup/probe-settings.md`) | WhatsNew §4.5, `Scripts\DataStorage\ProCapLog\` |
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

* None. All icons are PNGs cropped from ProCap screenshots.

## Open questions

* Where are the sources of the existing customer manual (`procap_manual`, including `wibu.tex`)? It may contain content to reuse.
* Official system requirements (GPU, RAM, supported tracking systems and versions).
* Screenshots: who captures them, and in which edition and version?
* Support contact to publish in the documentation.
* CAD lighting (WhatsNew §3.10): not documented for now, and not mentioned in the docs. Decide later where it belongs.
