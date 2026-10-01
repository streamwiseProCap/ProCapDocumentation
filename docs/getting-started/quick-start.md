---
description: Set up the system, then record and export your first measurement.
---

# Quick start

Use this guide when you want a quick overview of setting up and running a measurement with ProCap. Each step links to the page that describes it in detail.

{% hint style="info" %}
**Editions:** Live measurement is available in Professional, Compact and Student. With Professional Reader, open an existing project and continue with [Measurement replay](../measurement/measurement-replay.md).
{% endhint %}

## Before you start

You need:

* A motion-capture system with a rigid body defined for your probe.
* A supported probe. Analog probes also need their pressure sensor module and DAQ board.
* The geometry of your model as an `.stl` file.

## Set up and record a measurement

1. **Prepare the motion-capture system.** Power up and connect the cameras, then start the motion-capture software. If necessary, calibrate the cameras and adjust the global coordinate system. Check that the rigid body for the probe is loaded and that the probe is tracked correctly. See [OptiTrack](../tracking/optitrack.md), [Qualisys](../tracking/qualisys.md) or [Vicon](../tracking/vicon.md).
2. **Prepare the model geometry.** Export your model as an `.stl` file. See [Models](../scene-setup/models.md).
3. **Connect the probe.** Connect the probe to the computer. For an analog probe, also connect the pressure sensor module and the DAQ board. See [Connecting a probe](../measurement/connecting-a-probe.md).
4. **Create or open a project.** Start ProCap. On the **LOAD PROJECT** start screen, do one of the following:
   * Select **CREATE NEW** to start a new project.
   * Select **BROWSE** and choose an existing project to use as a starting point.

   Select the top-level folder of the project, not its `Input` folder. If you create a new project, select or create an empty folder, and ProCap copies the files it needs into it. Then select **LOAD**. See [Start screen](../projects/start-screen.md) and [Create and open projects](../projects/create-and-open.md).
5. **Adjust the probe settings.** Open the **Probe Panel** from the hotbar. Check the probe settings and, under **VRPN Settings**, the **Tracker Type** and **Tracker name** of your probe's rigid body. Select **APPLY**. See [Probe settings](../scene-setup/probe-settings.md).
6. **Add the model and set up the domain.**
   * Copy the `.stl` file into the `Input` folder of the project.
   * Open the **Models List** from the hotbar and select **ADD**. In the model settings, select your file in the **File** list and adjust the position of the model. See [Models](../scene-setup/models.md).
   * Open **Domain Settings** from the hotbar. Adjust the size and position of the measurement domain, then select **SAVE & RELOAD**. See [Measurement domain and interpolation](../scene-setup/measurement-domain-and-interpolation.md).
7. **Check the setup.** ProCap shows the tracked probe and model live in the 3D view. Check that both are positioned and tracked correctly. See [Current state](../visualization/probe-data/current-state.md).
8. **Save the project.** When you are happy with the settings, select **Save** in the display header. See [Save, Save As and Reload](../workspace/save-and-reload.md).
9. **Start the measurement.**
   1. In the **Probe Panel**, select **CONNECT**.
   2. With the flow switched off, select **ZERO OFFSET** to correct the zero-velocity offset of the probe.
   3. Switch on the flow, then select **START MEASUREMENT**.

   See [Recording a measurement](../measurement/recording-a-measurement.md).
10. **Stop the measurement.** When you are done, select **STOP MEASUREMENT**.
11. **Export the data.** Select **Export Data** in the display header. In the **DATA EXPORT** dialog, choose the data you want and select **Export**. See [Data export](../measurement/data-export.md).

## Next steps

* Explore the measured flow field with the [visualization features](../visualization/visualization-features.md).
* Process the exported data further in [ParaView](../data-processing/working-with-paraview.md).
