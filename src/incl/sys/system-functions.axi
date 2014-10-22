PROGRAM_NAME='system-functions'

#if_not_defined __SYSTEM_FUNCTIONS__
#define __SYSTEM_FUNCTIONS__

#include 'system-devices'
#include 'system-structures'
#include 'system-constants'
#include 'system-variables'
#include 'system-library-api'
#include 'system-library-control'

#include 'system-events'

// special case
#include 'wake-on-lan'

#include 'debug'

/*
 * --------------------
 * System functions
 * --------------------
 */


define_function animateTpVideoSourceSelectionOpen ()
{
	channelOn (dvTpTableDebug, 1)	// both display animation elements - opens them via animation
	channelOn (dvTpTableDebug, 2)	// left display animation elements - hides it via animation
	channelOn (dvTpTableDebug, 3)	// right display animation elements - hides it via animation
	moderoEnableButtonPushes (dvTpTableDebug, 2)	// exit animation button
	moderoDisableButtonPushes (dvTpTableVideo, BTN_ADR_VIDEO_MONITOR_LEFT_PREVIEW_SNAPSHOT)	// left monitor
	moderoDisableButtonPushes (dvTpTableVideo, BTN_ADR_VIDEO_MONITOR_RIGHT_PREVIEW_SNAPSHOT)	// right monitor
}


define_function animateTpVideoSourceSelectionClose ()
{
	channelOff (dvTpTableDebug, 1)	// both display animation elements - closes them via animation
	channelOff (dvTpTableDebug, 2)	// left display animation elements - shows it via animation
	channelOff (dvTpTableDebug, 3)	// right display animation elements - shows it via animation
	moderoDisableButtonPushes (dvTpTableDebug, 2)	// exit animation button
	moderoEnableButtonPushes (dvTpTableVideo, BTN_ADR_VIDEO_MONITOR_LEFT_PREVIEW_SNAPSHOT)	// left monitor
	moderoEnableButtonPushes (dvTpTableVideo, BTN_ADR_VIDEO_MONITOR_RIGHT_PREVIEW_SNAPSHOT)	// right monitor
}

define_function showSourceControlPopup (integer input)
{
	select
	{
		active (input == dvDvxVidInEnzo.port):
		{
			//moderoEnablePopup (dvTpTableMain, POPUP_NAME_VOLUME_MODAL)
			moderoEnablePopup (dvTpTableMain, POPUP_NAME_SOURCE_CONTROL_BACKGROUNDS[input])
			moderoEnablePopup (dvTpTableMain, POPUP_NAME_SOURCE_CONTROL_ENZO)
			// deactivate the source selection drag areas
			disableDragItemsAll (vdvDragAndDropTpTable)
			sendCommand (vdvMultiPreview, "'SNAPSHOTS_INPUT-',itoa(input)")
		}
		
		active (input == dvDvxVidInPc.port):
		{
			//moderoEnablePopup (dvTpTableMain, POPUP_NAME_VOLUME_MODAL)
			moderoEnablePopup (dvTpTableMain, POPUP_NAME_SOURCE_CONTROL_BACKGROUNDS[input])
			moderoEnablePopup (dvTpTableMain, POPUP_NAME_SOURCE_CONTROL_PC)
			// deactivate the source selection drag areas
			disableDragItemsAll (vdvDragAndDropTpTable)
			sendCommand (vdvMultiPreview, "'SNAPSHOTS_INPUT-',itoa(input)")
		}
		
		active (input == dvDvxVidInBluray.port):
		{
			//moderoEnablePopup (dvTpTableMain, POPUP_NAME_VOLUME_MODAL)
			moderoEnablePopup (dvTpTableMain, POPUP_NAME_SOURCE_CONTROL_BACKGROUNDS[input])
			moderoEnablePopup (dvTpTableMain, POPUP_NAME_SOURCE_CONTROL_BLURAY_NAVIGATION)
			// deactivate the source selection drag areas
			disableDragItemsAll (vdvDragAndDropTpTable)
			sendCommand (vdvMultiPreview, "'SNAPSHOTS_INPUT-',itoa(input)")
		}
		
		/*active (input == dvDvxVidInTv.port):
		{
			//moderoEnablePopup (dvTpTableMain, POPUP_NAME_VOLUME_MODAL)
			moderoEnablePopup (dvTpTableMain, POPUP_NAME_SOURCE_CONTROL_BACKGROUNDS[input])
			moderoEnablePopup (dvTpTableMain, POPUP_NAME_SOURCE_CONTROL_BLURAY_TV_CHANNEL_LIST)
			// deactivate the source selection drag areas
			disableDragItemsAll (vdvDragAndDropTpTable)
			sendCommand (vdvMultiPreview, "'SNAPSHOTS_INPUT-',itoa(input)")
		}*/
	}
}


define_function resetDraggablePopup (dev dragAndDropVirtual, integer id)
{
	hideDraggablePopup (dragAndDropVirtual, id)
	showDraggablePopup (dragAndDropVirtual, id)
}

define_function resetAllDraggablePopups (dev dragAndDropVirtual)
{
    select
    {
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInSignageXpress.port)
			hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInBluray.port)
			hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInEnzo.port)
			hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInPc.port)
			hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInSignageXpert.port)
			hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInTx1.port)
			
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInSignageXpress.port)
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInBluray.port)
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInEnzo.port)
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInPc.port)
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInSignageXpert.port)
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInTx1.port)
		}
    }
}

define_function hideDraggablePopup (dev dragAndDropVirtual, integer id)
{
    select
    {
	active (dragAndDropVirtual == vdvDragAndDropTpTable):
	{
	    moderoDisablePopup (dvTpTableDragAndDrop, draggablePopupsTpTable[id])
	}
    }
}

define_function hideAllDraggablePopups (dev dragAndDropVirtual)
{
    select
    {
	active (dragAndDropVirtual == vdvDragAndDropTpTable):
	{
		hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInSignageXpress.port)
		hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInBluray.port)
		hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInEnzo.port)
		hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInPc.port)
		hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInSignageXpert.port)
		hideDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInTx1.port)
	}
    }
}

define_function showDraggablePopup (dev dragAndDropVirtual, integer id)
{
    select
    {
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			moderoEnablePopup (dvTpTableDragAndDrop, draggablePopupsTpTable[id])
		}
    }
}

define_function showDraggablePopupsAll (dev dragAndDropVirtual)
{
    select
    {
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInSignageXpress.port)
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInBluray.port)
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInEnzo.port)
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInPc.port)
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInSignageXpert.port)
			showDraggablePopup (vdvDragAndDropTpTable, dvDvxVidInTx1.port)
		}
    }
}

define_function addDragItem (dev dragAndDropVirtual, integer id)
{
    select
    {
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			sendCommand (vdvDragAndDropTpTable, "'DEFINE_DRAG_ITEM-',buildDragAndDropParameterString(id, dragAreasTpTable[id])")
		}
    }
}

define_function addDragItemsAll (dev dragAndDropVirtual)
{
    select
    {
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			addDragItem (vdvDragAndDropTpTable, dvDvxVidInSignageXpress.port)
			addDragItem (vdvDragAndDropTpTable, dvDvxVidInBluray.port)
			addDragItem (vdvDragAndDropTpTable, dvDvxVidInEnzo.port)
			addDragItem (vdvDragAndDropTpTable, dvDvxVidInPc.port)
			addDragItem (vdvDragAndDropTpTable, dvDvxVidInSignageXpert.port)
			addDragItem (vdvDragAndDropTpTable, dvDvxVidInTx1.port)
		}
    }
}


define_function enableDragItem (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			sendCommand (vdvDragAndDropTpTable, "'ACTIVATE_DRAG_ITEM-',buildDragAndDropParameterString(id, dragAreasTpTable[id])")
		}
	}
}

define_function enableDragItemsAll (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			enableDragItem (vdvDragAndDropTpTable, dvDvxVidInSignageXpress.port)
			enableDragItem (vdvDragAndDropTpTable, dvDvxVidInBluray.port)
			enableDragItem (vdvDragAndDropTpTable, dvDvxVidInEnzo.port)
			enableDragItem (vdvDragAndDropTpTable, dvDvxVidInPc.port)
			enableDragItem (vdvDragAndDropTpTable, dvDvxVidInSignageXpert.port)
			enableDragItem (vdvDragAndDropTpTable, dvDvxVidInTx1.port)
		}
	}
}


define_function disableDragItem (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			sendCommand (vdvDragAndDropTpTable, "'DEACTIVATE_DRAG_ITEM-',itoa(id)")
		}
	}
}

define_function disableDragItemsAll (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			disableDragItem (vdvDragAndDropTpTable, dvDvxVidInSignageXpress.port)
			disableDragItem (vdvDragAndDropTpTable, dvDvxVidInBluray.port)
			disableDragItem (vdvDragAndDropTpTable, dvDvxVidInEnzo.port)
			disableDragItem (vdvDragAndDropTpTable, dvDvxVidInPc.port)
			disableDragItem (vdvDragAndDropTpTable, dvDvxVidInSignageXpert.port)
			disableDragItem (vdvDragAndDropTpTable, dvDvxVidInTx1.port)
		}
	}
}

define_function disableDropArea (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			sendCommand (vdvDragAndDropTpTable, "'DEACTIVATE_DROP_AREA-',itoa(id)")
		}
	}
}

define_function disableDropAreasAll (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			disableDropArea (vdvDragAndDropTpTable, dvDvxVidOutMonitorLeft.port)
			disableDropArea (vdvDragAndDropTpTable, dvDvxVidOutMonitorRight.port)
			disableDropArea (vdvDragAndDropTpTable, dvDvxVidOutMultiPreview.port)
		}
	}
}

define_function addDropArea (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			sendCommand (vdvDragAndDropTpTable, "'DEFINE_DROP_AREA-',buildDragAndDropParameterString(id, dropAreasTpTable[id])")
		}
	}
}

define_function addDropAreasAll (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			addDropArea (vdvDragAndDropTpTable, dvDvxVidOutMonitorLeft.port)
			addDropArea (vdvDragAndDropTpTable, dvDvxVidOutMonitorRight.port)
			addDropArea (vdvDragAndDropTpTable, dvDvxVidOutMultiPreview.port)
		}
	}
}

define_function enableDropArea (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			sendCommand (vdvDragAndDropTpTable, "'ACTIVATE_DROP_AREA-',itoa(id)")
		}
	}
}

define_function enableDropItemsAll (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropTpTable):
		{
			enableDropArea (vdvDragAndDropTpTable, dvDvxVidOutMonitorLeft.port)
			enableDropArea (vdvDragAndDropTpTable, dvDvxVidOutMonitorRight.port)
			enableDropArea (vdvDragAndDropTpTable, dvDvxVidOutMultiPreview.port)
		}
	}
}

define_function initArea (_area area, integer left, integer top, integer width, integer height)
{
    area.left = left
    area.top = top
    area.width = width
    area.height = height
}

define_function char[20] buildDragAndDropParameterString (integer id, _area area)
{
    return "itoa(id),',',itoa(area.left),',',itoa(area.top),',',itoa(area.width),',',itoa(area.height)"
}

define_function recallCameraPreset (integer cameraPreset)
{
	switch (cameraPreset)
	{
		case CAMERA_PRESET_1:
		{
			if (waitTimeCameraAdjustingToPreset1Pan)
			agentUsbPtzWebCamPanLeft (dvPtzCam, CAMERA_MAX_PAN_SPEED)
			if (waitTimeCameraAdjustingToPreset1Tilt)
			agentUsbPtzWebCamTiltDown (dvPtzCam, CAMERA_MAX_TILT_SPEED)
			if (waitTimeCameraAdjustingToPreset1Zoom)
			agentUsbPtzWebCamZoomOutStandardSpeed (dvPtzCam)
			if (waitTimeCameraAdjustingToPreset1Focus)
			agentUsbPtzWebCamFocusFarStandardSpeed (dvPtzCam)

			wait waitTimeCameraAdjustingToBasePosition
			{
				// adjust pan
				if (waitTimeCameraAdjustingToPreset1Pan)
				agentUsbPtzWebCamPanRight (dvPtzCam, cameraSpeedPreset1Pan)
				wait waitTimeCameraAdjustingToPreset1Pan
				{
					if (waitTimeCameraAdjustingToPreset1Pan)
					agentUsbPtzWebCamPanOff (dvPtzCam)
					// adjust tilt
					if (waitTimeCameraAdjustingToPreset1Tilt)
					agentUsbPtzWebCamTiltUp (dvPtzCam, cameraSpeedPreset1Tilt)
					wait waitTimeCameraAdjustingToPreset1Tilt
					{
						if (waitTimeCameraAdjustingToPreset1Tilt)
						agentUsbPtzWebCamTiltOff (dvPtzCam)
						// adjust zoom
						if (waitTimeCameraAdjustingToPreset1Zoom)
						agentUsbPtzWebCamZoomInStandardSpeed (dvPtzCam)
						wait waitTimeCameraAdjustingToPreset1Zoom
						{
							if (waitTimeCameraAdjustingToPreset1Zoom)
							agentUsbPtzWebCamZoomOff (dvPtzCam)
							// adjust focus
							if (waitTimeCameraAdjustingToPreset1Focus)
							agentUsbPtzWebCamFocusNearStandardSpeed (dvPtzCam)
							wait waitTimeCameraAdjustingToPreset1Focus
							{
								if (waitTimeCameraAdjustingToPreset1Focus)
								agentUsbPtzWebCamFocusOff (dvPtzCam)
							}
						}
					}
				}
			}
		}
		case CAMERA_PRESET_2: {}
		case CAMERA_PRESET_3: {}
	}
}


define_function turnOnDisplay (dev virtual)
{
	snapiDisplayEnablePower (virtual)
}

define_function turnOffDisplay (dev virtual)
{
	snapiDisplayDisablePower (virtual)
}

define_function turnOnDisplaysAll ()
{
	turnOnDisplay (vdvMonitorLeft)
	turnOnDisplay (vdvMonitorRight)
}

define_function turnOffDisplaysAll ()
{
	turnOffDisplay (vdvMonitorLeft)
	turnOffDisplay (vdvMonitorRight)
}




define_function showSourceOnDisplay (integer input, integer output)
{
	// switch the video
	dvxSwitchVideoOnly (dvDvxMain, input, output)
	
	// disable any test patterns on the output of the dvx
	// turn on the monitor
	select
	{
		active (output == dvDvxVidOutMonitorLeft.port):
		{
			dvxSetVideoOutputTestPattern (dvDvxVidOutMonitorLeft, DVX_TEST_PATTERN_OFF)
			turnOnDisplay (vdvMonitorLeft)
		}
		
		active (output == dvDvxVidOutMonitorRight.port):
		{
			dvxSetVideoOutputTestPattern (dvDvxVidOutMonitorRight, DVX_TEST_PATTERN_OFF)
			turnOnDisplay (vdvMonitorRight)
		}
	}
	
	// set flag to indicate that system is in use
	setFlagAvSystemInUse (TRUE)
}

define_function setFlagAvSystemInUse (integer boolean)
{
	isSystemAvInUse = boolean
}

define_function shutdownAvSystem ()
{
	// Blinds - raise blockouts and shades
	amxRelayPulse (dvRelaysRelBox, REL_BLOCKOUTS_CORNER_WINDOW_UP)
	amxRelayPulse (dvRelaysRelBox, REL_BLOCKOUTS_WALL_WINDOW_UP)
	amxRelayPulse (dvRelaysRelBox, REL_SHADES_CORNER_WINDOW_UP)
	amxRelayPulse (dvRelaysRelBox, REL_SHADES_WALL_WINDOW_UP)

	// Lights - recall the "all on" preset
	lightsEnablePresetAllOn ()

	// Video - Turn the monitors off and switch input "none" to the monitor and multi-preview outputs on the DVX
	snapiDisplayDisablePower (vdvMonitorLeft)
	snapiDisplayDisablePower (vdvMonitorRight)
	dvxSwitchVideoOnly (dvDvxMain, DVX_PORT_VID_IN_NONE, dvDvxVidOutMonitorLeft.port)
	dvxSwitchVideoOnly (dvDvxMain, DVX_PORT_VID_IN_NONE, dvDvxVidOutMonitorRight.port)
	dvxSwitchVideoOnly (dvDvxMain, DVX_PORT_VID_IN_NONE, dvDvxVidOutMultiPreview.port)

	// Audio - Switch input "none" to the speaker output on the DVX, unmute the audio and reset the volume to a base level for next use
	dvxSwitchAudioOnly (dvDvxMain, DVX_PORT_AUD_IN_NONE, dvDvxAudOutSpeakers.port)
	dvxSetAudioOutputVolume (dvDvxAudOutSpeakers, volumeDefault)
	dvxDisableAudioOutputMute (dvDvxAudOutSpeakers)

	// stop taking snapshots (no point constantly switching on the DVX anymore)
	//stopMultiPreviewSnapshots ()

	// recall Camera position
	recallCameraPreset (CAMERA_PRESET_1)

	// set flag to indicate that system is not in use
	isSystemAvInUse = FALSE

	// clear flags keeping track of selected video/audio inputs
	selectedVideoInputMonitorLeft = FALSE
	selectedVideoInputMonitorRight = FALSE
	selectedAudioInput = FALSE
	audioFollowingVideoOutput = FALSE
	
	
	userAcknowledgedSelectingInputWithNoSignal = false
	cancel_wait 'WAITING_FOR_USER_TO_ACKNOWLEDGE_SENDING_NO_SIGNAL_INPUT_TO_MONITOR'
	
	
	do_push(dvTpTableDebug,1)
}




/*
 *
 *
 */
define_function sendSelectedInputToLeftMonitor (integer input, integer output)
{
	animateTpVideoSourceSelectionClose()
	
	showSourceOnDisplay (input, output)
	
	sendCommand (vdvMultiPreview, "'SNAPSHOTS'")
	
	channelOff (dvTpTableVideo, BTN_DROP_AREA_TP_TABLE_HIGHLIGHT_MONITOR_LEFT)
	
	if (input == dvDvxVidInPc.port)
	{
		wakeOnLan (MAC_ADDRESS_PC)
	}
	
	if ( (selectedAudioInput == DVX_PORT_AUD_IN_NONE) or
		 ((audioFollowingVideoOutput == dvDvxVidOutMonitorRight.port) and (signalStatusDvxInputMonitorRight != DVX_SIGNAL_STATUS_VALID_SIGNAL))  )
	{
		audioFollowingVideoOutput = dvDvxVidOutMonitorLeft.port
	}
	
	if (audioFollowingVideoOutput == dvDvxVidOutMonitorLeft.port)
	{
		dvxSwitchAudioOnly (dvDvxMain, input, dvDvxAudOutSpeakers.port)
	}
	
	// set flag to indicate that system is in use
	isSystemAvInUse = TRUE
}




/*
 *
 *
 */
define_function sendSelectedInputToRightMonitor (integer input, integer output)
{
	animateTpVideoSourceSelectionClose()
	
	showSourceOnDisplay (input, output)
	
	sendCommand (vdvMultiPreview, "'SNAPSHOTS'")
	
	channelOff (dvTpTableVideo, BTN_DROP_AREA_TP_TABLE_HIGHLIGHT_MONITOR_RIGHT)
	
	if (input == dvDvxVidInPc.port)
	{
		wakeOnLan (MAC_ADDRESS_PC)
	}

	if ( (selectedAudioInput == DVX_PORT_AUD_IN_NONE) or
		 ((audioFollowingVideoOutput == dvDvxVidOutMonitorLeft.port) and (signalStatusDvxInputMonitorLeft != DVX_SIGNAL_STATUS_VALID_SIGNAL))    )
	{
		audioFollowingVideoOutput = dvDvxVidOutMonitorRight.port
	}

	if (audioFollowingVideoOutput == dvDvxVidOutMonitorRight.port)
	{
		dvxSwitchAudioOnly (dvDvxMain, input, dvDvxAudOutSpeakers.port)
	}

	// set flag to indicate that system is in use
	isSystemAvInUse = TRUE
}








/*
 * Reports a valid signal on DXLink MFTX HDMI input.
 *
 * Need to be a little bit careful here. This could be an indicator to tell us someone
 * has just plugged a video source into a table HDMI input but it might also just be
 * a response to the signal status query that we send to each MFTX when the DVX boots.
 *
 * One thing we do know for sure is that if the AV system is already on and this notification
 * comes through just do nothing.
 *
 * We really only want to react to this notification if the system is off in which case
 * we turn the system on and route the DVX to the appropriate DXLink input corresponding
 * to the MFTX that triggered this notification MFTX.
 */
define_function tableInputDetected (dev dvTxVidIn)
{
	#warn '@BUG: amx-au-gc-boardroom-main'

	/*
	 * --------------------
	 * This code running as expected but the MFTX is reporting a valid signal twice when a new input is plugged in.
	 *
	 * The result is that this function is getting called twice.
	 *
	 * If a new laptop input is plugged in when the system is off this function gets called the first time the MFTX reports
	 * a valid signal and routes the newly found laptop video to the left monitor.
	 *
	 * But then the MFTX reports a valid signal again so this function gets called again. This time teh system is already on
	 * and nothing is routed to the right monitor so this function sends the laptop to the right monitor.
	 *
	 * In effect, what the user sees is that when the plug in their laptop it comes on on both screens.
	 *
	 * Not really an issue as far as the user is concerned (they may think the system is designed to do just that) but it's
	 * not what I want to happen!
	 * --------------------
	 */

	if (!isSystemAvInUse)
	{
		stack_var integer input

		select
		{
			active (dvTxVidIn == dvTxTable1VidInDigital):    input = dvDvxVidInTx1.port
			active (dvTxVidIn == dvTxTable1VidInAnalog):     input = dvDvxVidInTx1.port

			active (dvTxVidIn == dvTxTable2VidInDigital):    input = dvDvxVidInTx2.port
			active (dvTxVidIn == dvTxTable2VidInAnalog):     input = dvDvxVidInTx2.port

			active (dvTxVidIn == dvTxTable3VidInDigital):    input = dvDvxVidInTx3.port
			active (dvTxVidIn == dvTxTable3VidInAnalog):     input = dvDvxVidInTx3.port

			active (dvTxVidIn == dvTxTable4VidInDigital):    input = dvDvxVidInTx4.port
			active (dvTxVidIn == dvTxTable4VidInAnalog):     input = dvDvxVidInTx4.port
		}

		// route the DVX input for this TX to the DVX output for the left monitor
		dvxSwitchVideoOnly (dvDvxMain, input, dvDvxVidOutMonitorLeft.port)
		// route the audio from the DVX input for this TX to the DVX output for the speakers
		dvxSwitchAudioOnly (dvDvxMain, input, dvDvxAudOutSpeakers.port)
		// set the flag to show that the audio is following the left screen
		audioFollowingVideoOutput = dvDvxVidOutMonitorLeft.port

		// lower the shades, raise the blockouts
		amxRelayPulse (dvRelaysRelBox, REL_BLOCKOUTS_CORNER_WINDOW_UP)
		amxRelayPulse (dvRelaysRelBox, REL_BLOCKOUTS_WALL_WINDOW_UP)
		amxRelayPulse (dvRelaysRelBox, REL_SHADES_CORNER_WINDOW_DN)
		amxRelayPulse (dvRelaysRelBox, REL_SHADES_WALL_WINDOW_DN)

		// set up a nice lighting atmosphere for viewing the video
		lightsEnablePresetPresentation()

		// turn on the left monitor
		snapiDisplayEnablePower (vdvMonitorLeft)

		// flip the panel to the main page
		moderoSetPage (dvTpTableMain, PAGE_NAME_MAIN_USER)
		// show the source selection / volume control page
		moderoEnablePopup (dvTpTableMain, POPUP_NAME_SOURCE_SELECTION)
		moderoEnablePopup (dvTpTableMain, POPUP_NAME_VOLUME_NON_MODAL)
		
		//show the draggable source popups
		moderoEnablePopup (dvTpTableMain, POPUP_NAME_DRAGGABLE_SOURCES[dvDvxVidInSignageXpress.port])
		moderoEnablePopup (dvTpTableMain, POPUP_NAME_DRAGGABLE_SOURCES[dvDvxVidInBluray.port])
		moderoEnablePopup (dvTpTableMain, POPUP_NAME_DRAGGABLE_SOURCES[dvDvxVidInEnzo.port])
		moderoEnablePopup (dvTpTableMain, POPUP_NAME_DRAGGABLE_SOURCES[dvDvxVidInPc.port])
		moderoEnablePopup (dvTpTableMain, POPUP_NAME_DRAGGABLE_SOURCES[dvDvxVidInSignageXpert.port])
		moderoEnablePopup (dvTpTableMain, POPUP_NAME_DRAGGABLE_SOURCES[dvDvxVidInTx1.port])
		
		// activate the source selection drag areas
		enableDragItemsAll (vdvDragAndDropTpTable)
		
		// set the flag to show that the AV system is now in use
		isSystemAvInUse = TRUE
	}
	// system is in use - is there a monitor not being used?
	else if (selectedVideoInputMonitorLeft == DVX_PORT_VID_IN_NONE)
	{
		stack_var integer input

		select
		{
			active (dvTxVidIn == dvTxTable1VidInDigital):    input = dvDvxVidInTx1.port
			active (dvTxVidIn == dvTxTable1VidInAnalog):     input = dvDvxVidInTx1.port

			active (dvTxVidIn == dvTxTable2VidInDigital):    input = dvDvxVidInTx2.port
			active (dvTxVidIn == dvTxTable2VidInAnalog):     input = dvDvxVidInTx2.port

			active (dvTxVidIn == dvTxTable3VidInDigital):    input = dvDvxVidInTx3.port
			active (dvTxVidIn == dvTxTable3VidInAnalog):     input = dvDvxVidInTx3.port

			active (dvTxVidIn == dvTxTable4VidInDigital):    input = dvDvxVidInTx4.port
			active (dvTxVidIn == dvTxTable4VidInAnalog):     input = dvDvxVidInTx4.port
		}

		// route the DVX input for this TX to the DVX output for the left monitor
		dvxSwitchVideoOnly (dvDvxMain, input, dvDvxVidOutMonitorLeft.port)

		// audio
		if (  (selectedAudioInput == DVX_PORT_AUD_IN_NONE) or
		      ((audioFollowingVideoOutput == dvDvxVidOutMonitorRight.port) and (signalStatusDvxInputMonitorRight != DVX_SIGNAL_STATUS_VALID_SIGNAL))  )
		{
			audioFollowingVideoOutput = dvDvxVidOutMonitorLeft.port
		}

		if (audioFollowingVideoOutput == dvDvxVidOutMonitorLeft.port)
		{
			dvxSwitchAudioOnly (dvDvxMain, input, dvDvxAudOutSpeakers.port)
		}

		// turn on the left monitor
		snapiDisplayEnablePower (vdvMonitorLeft)
	}
	else if (selectedVideoInputMonitorRight == DVX_PORT_VID_IN_NONE)
	{
		stack_var integer input

		select
		{
			active (dvTxVidIn == dvTxTable1VidInDigital):    input = dvDvxVidInTx1.port
			active (dvTxVidIn == dvTxTable1VidInAnalog):     input = dvDvxVidInTx1.port

			active (dvTxVidIn == dvTxTable2VidInDigital):    input = dvDvxVidInTx2.port
			active (dvTxVidIn == dvTxTable2VidInAnalog):     input = dvDvxVidInTx2.port

			active (dvTxVidIn == dvTxTable3VidInDigital):    input = dvDvxVidInTx3.port
			active (dvTxVidIn == dvTxTable3VidInAnalog):     input = dvDvxVidInTx3.port

			active (dvTxVidIn == dvTxTable4VidInDigital):    input = dvDvxVidInTx4.port
			active (dvTxVidIn == dvTxTable4VidInAnalog):     input = dvDvxVidInTx4.port
		}

		// route the DVX input for this TX to the DVX output for the right monitor
		dvxSwitchVideoOnly (dvDvxMain, input, dvDvxVidOutMonitorRight.port)

		// audio
		if (  (selectedAudioInput == DVX_PORT_AUD_IN_NONE) or
		      ((audioFollowingVideoOutput == dvDvxVidOutMonitorLeft.port) and (signalStatusDvxInputMonitorLeft != DVX_SIGNAL_STATUS_VALID_SIGNAL))    )
		{
			audioFollowingVideoOutput = dvDvxVidOutMonitorRight.port
		}

		if (audioFollowingVideoOutput == dvDvxVidOutMonitorRight.port)
		{
			dvxSwitchAudioOnly (dvDvxMain, input, dvDvxAudOutSpeakers.port)
		}

		// turn on the right monitor
		snapiDisplayEnablePower (vdvMonitorRight)
	}
}


/*
 * --------------------
 * Lighting functions
 * --------------------
 */

define_function lightsEnablePresetAllOn()
{
	//snapiLightingSetLevelWithFade (vdvLighting, LIGHTING_ADDRESS_BOARD_ROOM_REAR, LIGHTING_LEVEL_100_PERCENT,5)
	//snapiLightingSetLevelWithFade (vdvLighting, LIGHTING_ADDRESS_BOARD_ROOM_FRONT, LIGHTING_LEVEL_100_PERCENT,5)
	
	channelOn (dvTpTableLighting, BTN_LIGHTING_PRESET_ALL_ON)
}

define_function lightsEnablePresetAllOff()
{
	//snapiLightingSetLevelWithFade (vdvLighting, LIGHTING_ADDRESS_BOARD_ROOM_REAR, LIGHTING_LEVEL_0_PERCENT,5)
	//snapiLightingSetLevelWithFade (vdvLighting, LIGHTING_ADDRESS_BOARD_ROOM_FRONT, LIGHTING_LEVEL_0_PERCENT,5)
	
	channelOn (dvTpTableLighting, BTN_LIGHTING_PRESET_ALL_OFF)
}

define_function lightsEnablePresetAllDim()
{
	//snapiLightingSetLevelWithFade (vdvLighting, LIGHTING_ADDRESS_BOARD_ROOM_REAR, LIGHTING_LEVEL_30_PERCENT,5)
	//snapiLightingSetLevelWithFade (vdvLighting, LIGHTING_ADDRESS_BOARD_ROOM_FRONT, LIGHTING_LEVEL_30_PERCENT,5)
	
	channelOn (dvTpTableLighting, BTN_LIGHTING_PRESET_ALL_DIM)
}

define_function lightsEnablePresetPresentation()
{
	//snapiLightingSetLevelWithFade (vdvLighting, LIGHTING_ADDRESS_BOARD_ROOM_REAR, LIGHTING_LEVEL_100_PERCENT,5)
	//snapiLightingSetLevelWithFade (vdvLighting, LIGHTING_ADDRESS_BOARD_ROOM_FRONT, LIGHTING_LEVEL_40_PERCENT,5)
	
	channelOn (dvTpTableLighting, BTN_LIGHTING_PRESET_PRESENTATION)
}

define_function lightsEnablePresetVc()
{
	//snapiLightingSetLevelWithFade (vdvLighting, LIGHTING_ADDRESS_BOARD_ROOM_REAR, LIGHTING_LEVEL_100_PERCENT,5)
	//snapiLightingSetLevelWithFade (vdvLighting, LIGHTING_ADDRESS_BOARD_ROOM_FRONT, LIGHTING_LEVEL_40_PERCENT,5)
	
	channelOn (dvTpTableLighting, BTN_LIGHTING_PRESET_VC_MODE)
}


/*
 * --------------------
 * Keyboard functions
 * --------------------
 */


define_function enableKeyboardCapsLock (dev dvTpKeyboard)
{
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_A, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_B, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_C, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_D, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_E, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_F, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_G, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_H, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_I, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_J, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_K, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_L, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_M, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_N, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_O, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_P, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Q, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_R, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_S, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_T, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_U, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_V, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_W, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_X, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Y, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Z, 0, 3, 0)
}

define_function disableKeyboardCapsLock (dev dvTpKeyboard)
{
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_A, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_B, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_C, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_D, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_E, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_F, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_G, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_H, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_I, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_J, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_K, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_L, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_M, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_N, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_O, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_P, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Q, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_R, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_S, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_T, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_U, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_V, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_W, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_X, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Y, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Z, 0, 1, 0)
}

define_function enableKeyboardShift (dev dvTpKeyboard)
{
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_A, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_B, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_C, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_D, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_E, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_F, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_G, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_H, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_I, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_J, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_K, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_L, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_M, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_N, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_O, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_P, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Q, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_R, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_S, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_T, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_U, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_V, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_W, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_X, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Y, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Z, 0, 3, 0)
	
	
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_1_EXCLAMATION_POINT, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_2_AT_SYMBOL, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_3_NUMBER_SIGN, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_4_DOLLAR_SIGN, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_5_PERCENT_SIGN, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_6_CARET, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_7_AMPERSAND, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_8_ASTERISK, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_9_OPENING_PARENTHESIS, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_0_CLOSING_PARENTHESIS, 0, 3, 0)
	
	
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_GRAVE_ACCENT_TILDE, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_MINUS_SIGN_UNDERSCORE, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_EQUAL_SIGN_PLUS_SIGN, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_OPENING_BRACKET_OPENING_BRACE, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_CLOSING_BRACKET_CLOSING_BRACE, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_BACKSLASH_VERTICAL_BAR, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_SEMICOLON_COLON, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_SINGLE_QUOTE_DOUBLE_QUOTE, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_COMMA_LESS_THAN_SIGN, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_FULLSTOP_GREATER_THAN_SIGN, 0, 3, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_SLASH_QUESTION_MARK, 0, 3, 0)
}


define_function disableKeyboardShift (dev dvTpKeyboard, integer keyboardCapsLockState)
{
	if (keyboardCapsLockState == FALSE)
	{
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_A, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_B, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_C, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_D, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_E, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_F, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_G, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_H, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_I, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_J, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_K, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_L, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_M, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_N, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_O, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_P, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Q, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_R, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_S, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_T, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_U, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_V, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_W, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_X, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Y, 0, 1, 0)
		moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_Z, 0, 1, 0)
	}
	
	
	
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_1_EXCLAMATION_POINT, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_2_AT_SYMBOL, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_3_NUMBER_SIGN, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_4_DOLLAR_SIGN, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_5_PERCENT_SIGN, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_6_CARET, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_7_AMPERSAND, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_8_ASTERISK, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_9_OPENING_PARENTHESIS, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_0_CLOSING_PARENTHESIS, 0, 1, 0)
	
	
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_GRAVE_ACCENT_TILDE, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_MINUS_SIGN_UNDERSCORE, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_EQUAL_SIGN_PLUS_SIGN, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_OPENING_BRACKET_OPENING_BRACE, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_CLOSING_BRACKET_CLOSING_BRACE, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_BACKSLASH_VERTICAL_BAR, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_SEMICOLON_COLON, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_SINGLE_QUOTE_DOUBLE_QUOTE, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_COMMA_LESS_THAN_SIGN, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_FULLSTOP_GREATER_THAN_SIGN, 0, 1, 0)
	moderoEnableButtonAnimate (dvTpKeyboard, BTN_KEYBOARD_SLASH_QUESTION_MARK, 0, 1, 0)
}


/*
 * --------------------
 * Override dvx-listener callback functions
 * --------------------
 */

#define INCLUDE_DVX_NOTIFY_SWITCH_CALLBACK
define_function dvxNotifySwitch (dev dvxPort1, char signalType[], integer input, integer output)
{
	// dvxPort1 is port 1 on the DVX.
	// signalType contains the type of signal that was switched ('AUDIO' or 'VIDEO')
	// input contains the source input number that was switched to the destination
	// output contains the destination output number that the source was switched to

	switch (signalType)
	{
		case SIGNAL_TYPE_VIDEO:
		{
			select
			{
				active (output == dvDvxVidOutMonitorLeft.port):     selectedVideoInputMonitorLeft = input

				active (output == dvDvxVidOutMonitorRight.port):    selectedVideoInputMonitorRight = input
			}
		}
		case SIGNAL_TYPE_AUDIO:
		{
			select
			{
				active (output == dvDvxAudOutSpeakers.port):    selectedAudioInput = input
			}
		}
	}
}


#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_NAME_CALLBACK
define_function dvxNotifyVideoInputName (dev dvxVideoInput, char name[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// name is the name of the video input

	dvx.videoInputs[dvxVideoInput.port].name = name
}


#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_STATUS_CALLBACK
define_function dvxNotifyVideoInputStatus (dev dvxVideoInput, char signalStatus[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// signalStatus is the input signal status (DVX_SIGNAL_STATUS_NO_SIGNAL | DVX_SIGNAL_STATUS_UNKNOWN | DVX_SIGNAL_STATUS_VALID_SIGNAL)

	stack_var char oldSignalStatus[50]

	oldSignalStatus = dvx.videoInputs[dvxVideoInput.port].status

	if (signalStatus != oldSignalStatus)
	{
		dvx.videoInputs[dvxVideoInput.port].status = signalStatus
	}

	if (dvxVideoInput.port == selectedVideoInputMonitorLeft)
	{
		signalStatusDvxInputMonitorLeft = signalStatus
	}
	if (dvxVideoInput.port == selectedVideoInputMonitorRight)
	{
		signalStatusDvxInputMonitorRight = signalStatus
	}

	// Energy saving - switch off monitors when signal has been disconnected for some time
	// if signal
	switch (signalStatus)
	{
		case DVX_SIGNAL_STATUS_VALID_SIGNAL:
		{
			if (dvxVideoInput.port == selectedVideoInputMonitorLeft)
			{
				cancel_wait 'WAIT_FOR_SIGNAL_OF_INPUT_ROUTED_TO_LEFT_MONITOR_TO_RETURN'

			}
			if (dvxVideoInput.port == selectedVideoInputMonitorRight)
			{
				cancel_wait 'WAIT_FOR_SIGNAL_OF_INPUT_ROUTED_TO_RIGHT_MONITOR_TO_RETURN'
			}
		}
		case DVX_SIGNAL_STATUS_NO_SIGNAL:
		{
			if (dvxVideoInput.port == selectedVideoInputMonitorLeft)
			{
				wait waitTimeValidSignal 'WAIT_FOR_SIGNAL_OF_INPUT_ROUTED_TO_LEFT_MONITOR_TO_RETURN'
				{
					snapiDisplayDisablePower (vdvMonitorLeft)
					dvxSwitchVideoOnly (dvDvxMain, DVX_PORT_VID_IN_NONE, dvDvxVidOutMonitorLeft.port)
					off [selectedVideoInputMonitorLeft]

					if (audioFollowingVideoOutput == dvDvxVidOutMonitorLeft.port)
					{
						if (signalStatusDvxInputMonitorRight == DVX_SIGNAL_STATUS_VALID_SIGNAL)
						{
							dvxSwitchAudioOnly (dvDvxMain, selectedVideoInputMonitorRight, dvDvxAudOutSpeakers.port)
							audioFollowingVideoOutput = dvDvxVidOutMonitorRight.port
						}
						else
						{
							dvxSwitchAudioOnly (dvDvxMain, DVX_PORT_AUD_IN_NONE, dvDvxAudOutSpeakers.port)
							dvxSetAudioOutputVolume (dvDvxAudOutSpeakers, volumeDefault)
							off [selectedAudioInput]
							off [audioFollowingVideoOutput]
						}
					}
				}
			}

			if (dvxVideoInput.port == selectedVideoInputMonitorRight)
			{
				wait waitTimeValidSignal 'WAIT_FOR_SIGNAL_OF_INPUT_ROUTED_TO_RIGHT_MONITOR_TO_RETURN'
				{
					snapiDisplayDisablePower (vdvMonitorRight)
					dvxSwitchVideoOnly (dvDvxMain, DVX_PORT_VID_IN_NONE, dvDvxVidOutMonitorRight.port)
					off [selectedVideoInputMonitorRight]

					if (audioFollowingVideoOutput == dvDvxVidOutMonitorRight.port)
					{
						if (signalStatusDvxInputMonitorLeft == DVX_SIGNAL_STATUS_VALID_SIGNAL)
						{
							dvxSwitchAudioOnly (dvDvxMain, selectedVideoInputMonitorLeft, dvDvxAudOutSpeakers.port)
							audioFollowingVideoOutput = dvDvxVidOutMonitorLeft.port
						}
						else
						{
							dvxSwitchAudioOnly (dvDvxMain, DVX_PORT_AUD_IN_NONE, dvDvxAudOutSpeakers.port)
							dvxSetAudioOutputVolume (dvDvxAudOutSpeakers, volumeDefault)
							off [selectedAudioInput]
							off [audioFollowingVideoOutput]
						}
					}
				}
			}
		}
	}
}


#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_MUTE_CALLBACK
define_function dvxNotifyAudioOutMute (dev dvxAudioOutput, char muteStatus[])
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
	// muteStatus is the mute status (STATUS_ENABLE | STATUS_DISABLE)

	dvx.audioOutputs[dvxAudioOutput.port].muteStatus = muteStatus

	if (dvxAudioOutput == dvDvxAudOutSpeakers)
	{
		switch (muteStatus)
		{
			case STATUS_ENABLE:    moderoEnableButtonFeedback (dvTpTableAudio, BTN_AUDIO_VOLUME_MUTE)

			case STATUS_DISABLE:   moderoDisableButtonFeedback (dvTpTableAudio, BTN_AUDIO_VOLUME_MUTE)
		}
	}
}


#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_VOLUME_CALLBACK
define_function dvxNotifyAudioOutVolume (dev dvxAudioOutput, integer volume)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
	// volume is the volume value (range: 0 to 100)

	dvx.audioOutputs[dvxAudioOutput.port].volume = volume

	if (dvxAudioOutput == dvDvxAudOutSpeakers)
	{
		send_level dvTpTableAudio, BTN_LVL_VOLUME_DISPLAY, volume
	}
}

#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_MAXIMUM_VOLUME_CALLBACK
define_function dvxNotifyAudioOutMaximumVolume (dev dvxAudioOutput, integer maxVol)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
	// maxVol is the maximum volume setting for the audio output port (range: 0 to 100)

	if (dvxAudioOutput == dvDvxAudOutSpeakers)
	{
		moderoSetButtonBargraphUpperLimit (dvTpTableAudio, BTN_ADR_VOLUME_BARGRAPH_CONTROL, /*MODERO_BUTTON_STATE_ALL,*/ maxVol)
		moderoSetButtonBargraphUpperLimit (dvTpTableAudio, BTN_ADR_VOLUME_BARGRAPH_DISPLAY, /*MODERO_BUTTON_STATE_ALL,*/ maxVol)
	}
}


/*
 * --------------------
 * Override dxlink-listener callback functions
 * --------------------
 */


#define INCLUDE_DXLINK_NOTIFY_RX_VIDEO_OUTPUT_RESOLUTION_CALLBACK
define_function dxlinkNotifyRxVideoOutputResolution (dev dxlinkRxVideoOutput, char resolution[])
{
	// dxlinkRxVideoOutput is the D:P:S of the video output port on the DXLink receiver
	// cResolution is the video output resolution and refresh (HORxVER,REF)

	select
	{
		active(dxlinkRxVideoOutput == dvRxMonitorLeftVidOut):
		{
			moderoSetButtonText(dvTpTableDxlink,
					BTN_ADR_DXLINK_RX_OUTPUT_RESOLUTION_MONITOR_LEFT,
					MODERO_BUTTON_STATE_ALL,
					resolution)
		}

		active(dxlinkRxVideoOutput == dvRxMonitorRightVidOut):
			moderoSetButtonText (dvTpTableDxlink, BTN_ADR_DXLINK_RX_OUTPUT_RESOLUTION_MONITOR_RIGHT, MODERO_BUTTON_STATE_ALL, resolution)
	}
}


#define INCLUDE_DXLINK_NOTIFY_RX_VIDEO_OUTPUT_SCALE_MODE_CALLBACK
define_function dxlinkNotifyRxVideoOutputScaleMode (dev dxlinkRxVideoOutput, char scaleMode[])
{
	// dxlinkRxVideoOutput is the D:P:S of the video output port on the DXLink receiver
	// scaleMode contains the scaler mode (DXLINK_SCALE_MODE_AUTO | DXLINK_SCALE_MODE_BYPASS | DXLINK_SCALE_MODE_MANUAL)

	select
	{
		active(dxlinkRxVideoOutput == dvRxMonitorLeftVidOut):
		{
			switch (scaleMode)
			{
				case DXLINK_SCALE_MODE_AUTO:    moderoEnableButtonFeedback(dvTpTableDxlink, BTN_DXLINK_RX_SCALER_AUTO_MONITOR_LEFT)
				case DXLINK_SCALE_MODE_BYPASS:  moderoEnableButtonFeedback( dvTpTableDxlink, BTN_DXLINK_RX_SCALER_BYPASS_MONITOR_LEFT)
				case DXLINK_SCALE_MODE_MANUAL:  moderoEnableButtonFeedback( dvTpTableDxlink, BTN_DXLINK_RX_SCALER_MANUAL_MONITOR_LEFT)
			}
		}

		active(dxlinkRxVideoOutput == dvRxMonitorRightVidOut):
		{
			switch (scaleMode)
			{
				case DXLINK_SCALE_MODE_AUTO:    moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_RX_SCALER_AUTO_MONITOR_RIGHT)
				case DXLINK_SCALE_MODE_BYPASS:  moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_RX_SCALER_BYPASS_MONITOR_RIGHT)
				case DXLINK_SCALE_MODE_MANUAL:  moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_RX_SCALER_MANUAL_MONITOR_RIGHT)
			}
		}
	}
}


#define INCLUDE_DXLINK_NOTIFY_RX_VIDEO_OUTPUT_ASPECT_RATIO_CALLBACK
define_function dxlinkNotifyRxVideoOutputAspectRatio (dev dxlinkRxVideoOutput, char aspectRatio[])
{
	// dxlinkRxVideoOutput is the D:P:S of the video output port on the DXLink receiver
	// cAspectRatio is the aspect ratio (DXLINK_ASPECT_RATIO_ANAMORPHIC | DXLINK_ASPECT_RATIO_MAINTAIN | DXLINK_ASPECT_RATIO_STRETCH | DXLINK_ASPECT_RATIO_ZOOM)

	select
	{
		active(dxlinkRxVideoOutput == dvRxMonitorLeftVidOut):
		{
			switch (aspectRatio)
			{
				case DXLINK_ASPECT_RATIO_ANAMORPHIC:    moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_RX_ASPECT_ANAMORPHIC_MONITOR_LEFT)
				case DXLINK_ASPECT_RATIO_MAINTAIN:      moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_RX_ASPECT_MAINTAIN_MONITOR_LEFT)
				case DXLINK_ASPECT_RATIO_STRETCH:       moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_RX_ASPECT_STRETCH_MONITOR_LEFT)
				case DXLINK_ASPECT_RATIO_ZOOM:          moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_RX_ASPECT_ZOOM_MONITOR_LEFT)
			}
		}

		active(dxlinkRxVideoOutput == dvRxMonitorRightVidOut):
		{
			switch (aspectRatio)
			{
				case DXLINK_ASPECT_RATIO_ANAMORPHIC:    moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_RX_ASPECT_ANAMORPHIC_MONITOR_RIGHT)
				case DXLINK_ASPECT_RATIO_MAINTAIN:      moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_RX_ASPECT_MAINTAIN_MONITOR_RIGHT)
				case DXLINK_ASPECT_RATIO_STRETCH:       moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_RX_ASPECT_STRETCH_MONITOR_RIGHT)
				case DXLINK_ASPECT_RATIO_ZOOM:          moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_RX_ASPECT_ZOOM_MONITOR_RIGHT)
			}
		}
	}
}


#define INCLUDE_DXLINK_NOTIFY_TX_VIDEO_INPUT_AUTO_SELECT_CALLBACK
define_function dxlinkNotifyTxVideoInputAutoSelect (dev dxlinkTxPort1, char status[])
{
	// dvDxlinkTxPort1 is the port #1 on the DXLink Tx
	// cStatus contains the auto video input select status (STATUS_ENABLE | STATUS_DISABLE)

	switch (status)
	{
		case STATUS_ENABLE:
		{
			select
			{
				active (dxlinkTxPort1 == dvTxTable1Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_AUTO_1)
				active (dxlinkTxPort1 == dvTxTable2Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_AUTO_2)
				active (dxlinkTxPort1 == dvTxTable3Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_AUTO_3)
				active (dxlinkTxPort1 == dvTxTable4Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_AUTO_4)
			}
		}
		case STATUS_DISABLE:
		{
			select
			{
				active (dxlinkTxPort1 == dvTxTable1Main):   moderoDisableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_AUTO_1)
				active (dxlinkTxPort1 == dvTxTable2Main):   moderoDisableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_AUTO_2)
				active (dxlinkTxPort1 == dvTxTable3Main):   moderoDisableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_AUTO_3)
				active (dxlinkTxPort1 == dvTxTable4Main):   moderoDisableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_AUTO_4)
			}
		}
	}
}


#define INCLUDE_DXLINK_NOTIFY_TX_VIDEO_INPUT_STATUS_ANALOG_CALLBACK
define_function dxlinkNotifyTxVideoInputStatusAnalog (dev dxlinkTxAnalogVideoInput, char signalStatus[])
{
	// dxlinkTxAnalogVideoInput is the analog video input port on the DXLink Tx
	// signalStatus is the input signal status (DXLINK_SIGNAL_STATUS_NO_SIGNAL | DXLINK_SIGNAL_STATUS_UNKNOWN | DXLINK_SIGNAL_STATUS_VALID_SIGNAL)

	switch (signalStatus)
	{
		case DXLINK_SIGNAL_STATUS_UNKNOWN:    {}

		case DXLINK_SIGNAL_STATUS_NO_SIGNAL:  {}

		case DXLINK_SIGNAL_STATUS_VALID_SIGNAL:
		{
			tableInputDetected (dxlinkTxAnalogVideoInput)
		}
	}
}


#define INCLUDE_DXLINK_NOTIFY_TX_VIDEO_INPUT_STATUS_DIGITAL_CALLBACK
define_function dxlinkNotifyTxVideoInputStatusDigital (dev dxlinkTxDigitalVideoInput, char signalStatus[])
{
	// dxlinkTxDigitalVideoInput is the digital video input port on the DXLink Tx
	// signalStatus is the input signal status (DXLINK_SIGNAL_STATUS_NO_SIGNAL | DXLINK_SIGNAL_STATUS_UNKNOWN | DXLINK_SIGNAL_STATUS_VALID_SIGNAL)

	switch (signalStatus)
	{
		case DXLINK_SIGNAL_STATUS_UNKNOWN:    {}

		case DXLINK_SIGNAL_STATUS_NO_SIGNAL:  {}

		case DXLINK_SIGNAL_STATUS_VALID_SIGNAL:
		{
			tableInputDetected (dxlinkTxDigitalVideoInput)
		}
	}
}


#define INCLUDE_DXLINK_NOTIFY_TX_SWITCH_CALLBACK
define_function dxlinkNotifyTxSwitch (dev dxlinkTxPort1, integer input, integer output)
{
	// dxlinkTxPort1 is port 1 on the DXLink Tx.
	// input contains the input port on the DXLink TX that has been selected (DXLINK_PORT_VIDEO_INPUT_ANALOG | DXLINK_PORT_VIDEO_INPUT_DIGITAL)
	// output contains the output of the DXLink TX. This is always DXLINK_PORT_VIDEO_OUTPUT.

	switch (input)
	{
		case DXLINK_PORT_VIDEO_INPUT_ANALOG:
		{
			select
			{
				active (dxlinkTxPort1 == dvTxTable1Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_VGA_1)
				active (dxlinkTxPort1 == dvTxTable2Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_VGA_2)
				active (dxlinkTxPort1 == dvTxTable3Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_VGA_3)
				active (dxlinkTxPort1 == dvTxTable4Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_VGA_4)
			}
		}
		case DXLINK_PORT_VIDEO_INPUT_DIGITAL:
		{
			select
			{
				active (dxlinkTxPort1 == dvTxTable1Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_HDMI_1)
				active (dxlinkTxPort1 == dvTxTable2Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_HDMI_2)
				active (dxlinkTxPort1 == dvTxTable3Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_HDMI_3)
				active (dxlinkTxPort1 == dvTxTable4Main):   moderoEnableButtonFeedback (dvTpTableDxlink, BTN_DXLINK_TX_HDMI_4)
			}
		}
	}
}


/*
 * --------------------
 * Override pdu-listener callback functions
 * --------------------
 */



#define INCLUDE_PDU_NOTIFY_POWER_SENSE_TRIGGER_CALLBACK
define_function pduNotifyPowerSenseTrigger (dev pduPort1, integer outlet, float triggerValue)
{
	// pduPort1 is port 1 on the PDU
	// outlet is the outlet of the PDU which is reporting the power sense trigger value
	// triggerValue is the power sense trigger value

	moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_TRIGGER[outlet], MODERO_BUTTON_STATE_ALL, ftoa(triggerValue))
}


#define INCLUDE_PDU_NOTIFY_OUTLET_OVER_POWER_SENSE_TRIGGER_CALLBACK
define_function pduNotifyOutletOverPowerSenseTrigger (dev pduOutletPort)
{
	// dvPduOutlet is an outlet device on the PDU which has gone over the power sense trigger value
	select
	{
		active (pduOutletPort == dvPduOutlet1):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[1], MODERO_BUTTON_STATE_ALL, 'Above')
		active (pduOutletPort == dvPduOutlet2):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[2], MODERO_BUTTON_STATE_ALL, 'Above')
		active (pduOutletPort == dvPduOutlet3):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[3], MODERO_BUTTON_STATE_ALL, 'Above')
		active (pduOutletPort == dvPduOutlet4):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[4], MODERO_BUTTON_STATE_ALL, 'Above')
		active (pduOutletPort == dvPduOutlet5):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[5], MODERO_BUTTON_STATE_ALL, 'Above')
		active (pduOutletPort == dvPduOutlet6):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[6], MODERO_BUTTON_STATE_ALL, 'Above')
		active (pduOutletPort == dvPduOutlet7):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[7], MODERO_BUTTON_STATE_ALL, 'Above')
		active (pduOutletPort == dvPduOutlet8):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[8], MODERO_BUTTON_STATE_ALL, 'Above')
	}
}


#define INCLUDE_PDU_NOTIFY_OUTLET_UNDER_POWER_SENSE_TRIGGER_CALLBACK
define_function pduNotifyOutletUnderPowerSenseTrigger (dev pduOutletPort)
{
	// pduOutletPort is an outlet device on the PDU which has gone under the power sense trigger value
	select
	{
		active (pduOutletPort == dvPduOutlet1):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[1], MODERO_BUTTON_STATE_ALL, 'Below')
		active (pduOutletPort == dvPduOutlet2):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[2], MODERO_BUTTON_STATE_ALL, 'Below')
		active (pduOutletPort == dvPduOutlet3):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[3], MODERO_BUTTON_STATE_ALL, 'Below')
		active (pduOutletPort == dvPduOutlet4):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[4], MODERO_BUTTON_STATE_ALL, 'Below')
		active (pduOutletPort == dvPduOutlet5):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[5], MODERO_BUTTON_STATE_ALL, 'Below')
		active (pduOutletPort == dvPduOutlet6):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[6], MODERO_BUTTON_STATE_ALL, 'Below')
		active (pduOutletPort == dvPduOutlet7):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[7], MODERO_BUTTON_STATE_ALL, 'Below')
		active (pduOutletPort == dvPduOutlet8):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_SENSE_STATUS[8], MODERO_BUTTON_STATE_ALL, 'Below')
	}
}


#define INCLUDE_PDU_NOTIFY_OUTLET_RELAY_CALLBACK
define_function pduNotifyOutletRelay (dev pduOutletPort, integer relayStatus)
{
	// dvPduOutlet is an outlet device on the PDU
	// nRelayStatus indicates whether the relay is on (TRUE) or off (FALSE)
	switch (relayStatus)
	{
		case TRUE:
		{
			select
			{
				active (pduOutletPort == dvPduOutlet1):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[1], MODERO_BUTTON_STATE_ALL, 'On')
				active (pduOutletPort == dvPduOutlet2):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[2], MODERO_BUTTON_STATE_ALL, 'On')
				active (pduOutletPort == dvPduOutlet3):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[3], MODERO_BUTTON_STATE_ALL, 'On')
				active (pduOutletPort == dvPduOutlet4):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[4], MODERO_BUTTON_STATE_ALL, 'On')
				active (pduOutletPort == dvPduOutlet5):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[5], MODERO_BUTTON_STATE_ALL, 'On')
				active (pduOutletPort == dvPduOutlet6):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[6], MODERO_BUTTON_STATE_ALL, 'On')
				active (pduOutletPort == dvPduOutlet7):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[7], MODERO_BUTTON_STATE_ALL, 'On')
				active (pduOutletPort == dvPduOutlet8):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[8], MODERO_BUTTON_STATE_ALL, 'On')
			}
		}
		case FALSE:
		{
			select
			{
				active (pduOutletPort == dvPduOutlet1):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[1], MODERO_BUTTON_STATE_ALL, 'Off')
				active (pduOutletPort == dvPduOutlet2):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[2], MODERO_BUTTON_STATE_ALL, 'Off')
				active (pduOutletPort == dvPduOutlet3):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[3], MODERO_BUTTON_STATE_ALL, 'Off')
				active (pduOutletPort == dvPduOutlet4):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[4], MODERO_BUTTON_STATE_ALL, 'Off')
				active (pduOutletPort == dvPduOutlet5):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[5], MODERO_BUTTON_STATE_ALL, 'Off')
				active (pduOutletPort == dvPduOutlet6):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[6], MODERO_BUTTON_STATE_ALL, 'Off')
				active (pduOutletPort == dvPduOutlet7):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[7], MODERO_BUTTON_STATE_ALL, 'Off')
				active (pduOutletPort == dvPduOutlet8):     moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_RELAY_STATUS[8], MODERO_BUTTON_STATE_ALL, 'Off')
			}
		}
	}
}


#define INCLUDE_PDU_NOTIFY_INPUT_VOLTAGE_CALLBACK
define_function pduNotifyInputVoltage (dev pduPort1, float voltage)
{
	// pduPort1 is the first device on the PDU
	// voltage is the input voltage (V): Resolution to 0.1V (data scale factor = 10)
	moderoSetButtonText (dvTpTablePower, BTN_ADR_POWER_INPUT_VOLTAGE, MODERO_BUTTON_STATE_ALL, ftoa(voltage))
}


#define INCLUDE_PDU_NOTIFY_TEMPERATURE_CALLBACK
define_function pduNotifyTemperature (dev pduPort1, float temperature)
{
	// pduPort1 is the first device on the PDU
	// temperature is the temperature (degrees C or F): Resolution to 0.1C (data scale factor = 10)
	moderoSetButtonText (dvTpTablePower, BTN_ADR_POWER_TEMPERATURE, MODERO_BUTTON_STATE_ALL, ftoa(temperature))
}


#define INCLUDE_PDU_NOTIFY_OUTLET_POWER_CALLBACK
define_function pduNotifyOutletPower (dev pduOutletPort, float wattage)
{
	// pduOutletPort is the outlet on the PDU reporting its power
	// wattage is the power (W): Resolution to 0.1W (data scale factor = 10)
	select
	{
		active (pduOutletPort == dvPduOutlet1):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CONSUMPTION[1], MODERO_BUTTON_STATE_ALL, ftoa(wattage))
		active (pduOutletPort == dvPduOutlet2):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CONSUMPTION[2], MODERO_BUTTON_STATE_ALL, ftoa(wattage))
		active (pduOutletPort == dvPduOutlet3):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CONSUMPTION[3], MODERO_BUTTON_STATE_ALL, ftoa(wattage))
		active (pduOutletPort == dvPduOutlet4):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CONSUMPTION[4], MODERO_BUTTON_STATE_ALL, ftoa(wattage))
		active (pduOutletPort == dvPduOutlet5):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CONSUMPTION[5], MODERO_BUTTON_STATE_ALL, ftoa(wattage))
		active (pduOutletPort == dvPduOutlet6):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CONSUMPTION[6], MODERO_BUTTON_STATE_ALL, ftoa(wattage))
		active (pduOutletPort == dvPduOutlet7):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CONSUMPTION[7], MODERO_BUTTON_STATE_ALL, ftoa(wattage))
		active (pduOutletPort == dvPduOutlet8):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CONSUMPTION[8], MODERO_BUTTON_STATE_ALL, ftoa(wattage))
	}
}


#define INCLUDE_PDU_NOTIFY_OUTLET_CURRENT_CALLBACK
define_function pduNotifyOutletCurrent (dev pduOutletPort, float current)
{
	// pduOutletPort is the outlet on the PDU reporting its current
	// current is the curren (A): Resolution to 0.1A (data scale factor = 10)
	select
	{
		active (pduOutletPort == dvPduOutlet1):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CURRENT_DRAW[1], MODERO_BUTTON_STATE_ALL, ftoa(current))
		active (pduOutletPort == dvPduOutlet2):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CURRENT_DRAW[2], MODERO_BUTTON_STATE_ALL, ftoa(current))
		active (pduOutletPort == dvPduOutlet3):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CURRENT_DRAW[3], MODERO_BUTTON_STATE_ALL, ftoa(current))
		active (pduOutletPort == dvPduOutlet4):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CURRENT_DRAW[4], MODERO_BUTTON_STATE_ALL, ftoa(current))
		active (pduOutletPort == dvPduOutlet5):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CURRENT_DRAW[5], MODERO_BUTTON_STATE_ALL, ftoa(current))
		active (pduOutletPort == dvPduOutlet6):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CURRENT_DRAW[6], MODERO_BUTTON_STATE_ALL, ftoa(current))
		active (pduOutletPort == dvPduOutlet7):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CURRENT_DRAW[7], MODERO_BUTTON_STATE_ALL, ftoa(current))
		active (pduOutletPort == dvPduOutlet8):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_CURRENT_DRAW[8], MODERO_BUTTON_STATE_ALL, ftoa(current))
	}
}


#define INCLUDE_PDU_NOTIFY_OUTLET_POWER_CALLBACK
define_function pduNotifyOutletEnergy (dev pduOutletPort, float accumulatedEnergy)
{
	// pduOutletPort is the outlet on the PDU reporting its accumulated energy
	// accumulatedEnergy is the accumulated energy reading or power over time (W-hr): Resolution to 0.1W-hr (data scale factor = 10)
	select
	{
		active (pduOutletPort == dvPduOutlet1):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_ENERGY_USAGE[1], MODERO_BUTTON_STATE_ALL, ftoa(accumulatedEnergy))
		active (pduOutletPort == dvPduOutlet2):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_ENERGY_USAGE[2], MODERO_BUTTON_STATE_ALL, ftoa(accumulatedEnergy))
		active (pduOutletPort == dvPduOutlet3):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_ENERGY_USAGE[3], MODERO_BUTTON_STATE_ALL, ftoa(accumulatedEnergy))
		active (pduOutletPort == dvPduOutlet4):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_ENERGY_USAGE[4], MODERO_BUTTON_STATE_ALL, ftoa(accumulatedEnergy))
		active (pduOutletPort == dvPduOutlet5):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_ENERGY_USAGE[5], MODERO_BUTTON_STATE_ALL, ftoa(accumulatedEnergy))
		active (pduOutletPort == dvPduOutlet6):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_ENERGY_USAGE[6], MODERO_BUTTON_STATE_ALL, ftoa(accumulatedEnergy))
		active (pduOutletPort == dvPduOutlet7):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_ENERGY_USAGE[7], MODERO_BUTTON_STATE_ALL, ftoa(accumulatedEnergy))
		active (pduOutletPort == dvPduOutlet8):   moderoSetButtonText (dvTpTablePower, BTNS_ADR_POWER_ENERGY_USAGE[8], MODERO_BUTTON_STATE_ALL, ftoa(accumulatedEnergy))
	}
}


#define INCLUDE_PDU_NOTIFY_AXLINK_VOLTAGE_CALLBACK
define_function pduNotifyAxlinkVoltage (dev pduPort2, float voltage)
{
	// pduPort2 is an Axlink bus on the PDU
	// voltage is the voltage (V): Resolution to 0.1V (data scale factor = 10)
	moderoSetButtonText (dvTpTablePower, BTN_ADR_POWER_AXLINK_VOLTAGE, MODERO_BUTTON_STATE_ALL, ftoa(voltage))
}


#define INCLUDE_PDU_NOTIFY_TEMPERATURE_SCALE_CELCIUS
define_function pduNotifyTemperatureScaleCelcius (dev pduPort1)
{
	// pduPort1 is the first device on the PDU
}


#define INCLUDE_PDU_NOTIFY_TEMPERATURE_SCALE_FAHRENHEIT
define_function pduNotifyTemperatureScaleFahrenheit (dev pduPort1)
{
	// pduPort1 is the first device on the PDU
}




/*
 * --------------------
 * Override controlports-listener callback functions
 * --------------------
 */


#define INCLUDE_CONTROLPORTS_NOTIFY_IO_INPUT_ON_CALLBACK
define_function amxControlPortNotifyIoInputOn (dev ioPort, integer ioChanCde)
{
	// ioPort is the IO port.
	// ioChanCde is the IO channel code.

	if (ioPort == dvDvxIos)
	{
		switch (ioChanCde)
		{
			case IO_OCCUPANCY_SENSOR:
			{
				// occupancy has been detected - meaning the room was previously vacant
				isRoomOccupied = TRUE
				
				// Set lights to "all on" mode as people have entered the room
				lightsEnablePresetAllOn ()
				
				// wake up the touch panel
				moderoWake (dvTpTableMain)
			}
		}
	}
}



#define INCLUDE_CONTROLPORTS_NOTIFY_IO_INPUT_OFF_CALLBACK
define_function amxControlPortNotifyIoInputOff (dev ioPort, integer ioChanCde)
{
	// ioPort is the IO port.
	// ioChanCde is the IO channel code.

	if (ioPort == dvDvxIos)
	{
		switch (ioChanCde)
		{
			case IO_OCCUPANCY_SENSOR:
			{
				// room is now unoccupied (note: Will take 8 minutes minimum to trigger after person leaves room)
				isRoomOccupied = FALSE
				
				// Set lights to "all off" mode as there have been no people in the room for at least 8 minutes
				lightsEnablePresetAllOff ()
				
				// Flip the touch panel to the splash screen
				moderoSetPage (dvTpTableMain, PAGE_NAME_SPLASH_SCREEN)
				
				// Send the panel to sleep
				moderoSleep (dvTpTableMain)
				
				// shutdown the system if it was being used (i.e., someone just walked away without pressing the shutdown button on the panel)
				if (isSystemAvInUse)
				{
					countTimesPeopleLeftWithoutShuttingDownSystem++
					shutdownAvSystem ()
				}
			}
		}
	}
}






#end_if