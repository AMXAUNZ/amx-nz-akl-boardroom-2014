PROGRAM_NAME='system-modules'

#if_not_defined __SYSTEM_MODULES__
#define __SYSTEM_MODULES__

#include 'system-devices'
#include 'system-variables'

/*
 * --------------------
 * Module Definitions
 * --------------------
 */

define_module

// Left and Right Display Monitors
'NEC_P402_Comm_dr1_0_0' mMonitorLeft (vdvMonitorLeft, dvMonitorLeft)
'NEC_P402_Comm_dr1_0_0' mMonitorRight (vdvMonitorRight, dvMonitorRight)

// Drag and Drop Interaction
'drag-and-drop' dragAndDropMod (vdvDragAndDropTpTable, dvTpTableDragAndDrop)

// Snapshot/Video Preview of DVX video sources on Touch Panel
'multi-preview-dvx' multiPreviewDvx (vdvMultiPreview,
                                     dvDvxVidOutMultiPreview, 
                                     dvTpTableVideo, 
                                     btnsVideoSnapshotPreviews,          // address codes
                                     btnAdrsVideoSnapshotPreviews,       // address codes
                                     btnAdrsVideoInputLabels,            // address codes
                                     btnAdrsVideoOutputSnapshotPreviews, // address codes
									 btnAdrsVideoOutputLabels,
                                     btnAdrVideoPreviewLoadingMessage,   // address code
                                     btnLoadingBarMultiState,            // channel code
                                     btnAdrLoadingBar,                   // address code
                                     btnAdrVideoPreviewWindow,           // address code
                                     btnExitVideoPreview,                // channel code
                                     popupNameVideoPreview,
                                     imageFileNameNoVideo)

#end_if