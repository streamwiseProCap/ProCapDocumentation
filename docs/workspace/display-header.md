---
description: Show and hide elements of the 3D view, manage camera views, and save, import and export from the display header.
---

# Display header

The display header runs along the top of the [workspace](README.md). Its left part controls what the 3D view shows and holds the camera views. Its right part holds the project-wide commands: import and export, settings, undo and redo, saving and closing.

Hover over a button to see its name. A button that is not available, for example because the loaded data does not support the feature, is grayed out, and its tooltip tells you why.

## Visualization toggles

<figure><img src="../.gitbook/assets/display-header-left.png" alt="The left part of the display header with the visualization toggles and the camera views"><figcaption><p>Visualization toggles and camera views</p></figcaption></figure>

The <img src="../.gitbook/assets/icon-visualization-toggles.png" alt="" data-size="line"> **Visualization Toggles** show or hide whole groups of elements in the 3D view. A green button means that the group is shown.

* **Left click** shows or hides the group.
* **Right click** opens the settings panel of the group, where there is one.

| Button | Name | What it shows or hides |
| --- | --- | --- |
| <img src="../.gitbook/assets/icon-measurement-domain-and-interpolation.png" alt="" data-size="line"> | **Domain** | The outline of the [measurement domain](../scene-setup/measurement-domain-and-interpolation.md). A right click opens **Domain Settings**. |
| <img src="../.gitbook/assets/icon-coordinate-origin.png" alt="" data-size="line"> | **Coordinate Origin** | The axes at the origin of the [coordinate system](coordinate-system.md). |
| <img src="../.gitbook/assets/icon-ground-plane.png" alt="" data-size="line"> | **Ground Plane** | The [ground plane](../scene-setup/measurement-domain-and-interpolation.md#groundplane-settings). A right click opens **Domain Settings**, which holds the ground plane settings. |
| <img src="../.gitbook/assets/icon-position-feedback.png" alt="" data-size="line"> | **Position Feedback** | White guide lines from the probe tip to the coordinate planes. They help you judge where the probe is in the domain. |
| <img src="../.gitbook/assets/icon-current-state.png" alt="" data-size="line"> | **Current State** | The live reading at the probe tip. A right click opens **Current State Settings**. See [Current state](../visualization/current-state.md). |
| <img src="../.gitbook/assets/icon-models.png" alt="" data-size="line"> | **Models** | All [models](../scene-setup/models.md). |
| <img src="../.gitbook/assets/icon-visualization-planes.png" alt="" data-size="line"> | **Visualization Planes** | All [visualization planes](../visualization/visualization-planes.md). |
| <img src="../.gitbook/assets/icon-isosurfaces.png" alt="" data-size="line"> | **Isosurfaces** | All [isosurfaces](../visualization/isosurfaces.md). |
| <img src="../.gitbook/assets/icon-projections.png" alt="" data-size="line"> | **Projections** | All [projections](../visualization/projections.md). |
| <img src="../.gitbook/assets/icon-streamlines.png" alt="" data-size="line"> | **Streamlines** | All [streamlines](../visualization/streamlines.md). |
| <img src="../.gitbook/assets/icon-lineplot.png" alt="" data-size="line"> | **Lineplot** | All [lineplots](../visualization/lineplot.md). |
| <img src="../.gitbook/assets/icon-surface-analytics.png" alt="" data-size="line"> | **Surface analytics** | All [surface analyses](../visualization/surface-analytics.md). |
| <img src="../.gitbook/assets/icon-voxel-eraser.png" alt="" data-size="line"> | **Voxel Eraser** | The [voxel eraser](../visualization/voxel-eraser.md) cubes. A right click opens the **Voxel Eraser** panel. |

The group toggles from **Models** to **Surface analytics** do not change the visibility you set for each element in its panel. When you hide a group and show it again, ProCap shows only the elements that were visible before.

Your edition shows only the toggles for the features it includes. See [Features and editions](../getting-started/features-and-editions.md).

## Camera views

| Button | Name | Description |
| --- | --- | --- |
| <img src="../.gitbook/assets/icon-camera-views.png" alt="" data-size="line"> | **Camera Views** | Marks the camera group. |
| **1** to **4** | **Camera View 1** to **Camera View 4** | Four slots for camera views. A green slot holds a saved view. Right-click an empty slot to save the current view, left-click a saved slot to recall it, and right-click a saved slot to clear it. |
| <img src="../.gitbook/assets/icon-reset-camera.png" alt="" data-size="line"> | Reset camera | Returns the camera to the default view of the domain. |
| <img src="../.gitbook/assets/icon-screenshot.png" alt="" data-size="line"> | Screenshot | Takes a screenshot of the workspace. |

See [Camera and navigation](camera-and-navigation.md).

## Project commands

<figure><img src="../.gitbook/assets/display-header-right.png" alt="The right part of the display header with the project commands"><figcaption><p>Project commands</p></figcaption></figure>

| Button | Name | Description |
| --- | --- | --- |
| **FPS** | Frame rate | The current frame rate of the 3D view, in frames per second. |
| **Relative Pressure** | Relative Pressure | When checked, ProCap shows pressures relative to the mean static pressure of the measured data instead of absolute values. This applies to the visualizations, the current state and the lineplots. |
| <img src="../.gitbook/assets/icon-import-data.png" alt="" data-size="line"> | **Import Data** | Opens a file dialog to select recorded measurement data. See [Import of measurement data](../data-processing/import-measurement-data.md). |
| <img src="../.gitbook/assets/icon-export-data.png" alt="" data-size="line"> | **Export Data** | Opens the **DATA EXPORT** dialog. See [Data export](../measurement/data-export.md). |
| <img src="../.gitbook/assets/icon-general-settings.png" alt="" data-size="line"> | **General Settings** | Opens the [General settings](general-settings.md). |
| <img src="../.gitbook/assets/icon-undo.png" alt="" data-size="line"> | **Undo** | Undoes the last change to the project (Ctrl+Z). The tooltip names the change. |
| <img src="../.gitbook/assets/icon-redo.png" alt="" data-size="line"> | **Redo** | Redoes the last change you undid (Ctrl+Y). |
| <img src="../.gitbook/assets/icon-save.png" alt="" data-size="line"> | **Save** | Saves the project. Ctrl+S saves directly. See [Save, Save As and Reload](save-and-reload.md#save). |
| <img src="../.gitbook/assets/icon-save-as.png" alt="" data-size="line"> | **Save As** | Saves a copy of the project to another folder. See [Save As](save-and-reload.md#save-as). |
| <img src="../.gitbook/assets/icon-reload.png" alt="" data-size="line"> | **Reload** | Reloads the project as it was last saved. See [Reload](save-and-reload.md#reload). |
| <img src="../.gitbook/assets/icon-close-project.png" alt="" data-size="line"> | Close project | Closes the project and returns to the [start screen](../projects/start-screen.md). If the project has unsaved changes, ProCap asks whether to save them first. |
