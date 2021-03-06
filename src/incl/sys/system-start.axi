PROGRAM_NAME='system-start'

#if_not_defined __SYSTEM_START__
#define __SYSTEM_START__

#include 'system-devices'
#include 'system-structures'
#include 'system-constants'
#include 'system-variables'
#include 'system-functions'
#include 'system-library-api'
#include 'system-library-control'

/*
 * --------------------
 * Startup code
 * --------------------
 */
define_start

RmsSourceUsageAssignAsset(dvDvxVidInBluray.port, vdvBluray)
RmsSourceUsageAssignAsset(dvDvxVidInEnzo.port, dvEnzo)
RmsSourceUsageAssignAsset(dvDvxVidInPc.port, rmsPc)
RmsSourceUsageAssignAsset(dvDvxVidInTx1.port, vdvLaptop1)
RmsSourceUsageAssignAsset(dvDvxVidInSignageXpress.port, vdvSignageXpress)
RmsSourceUsageAssignAsset(dvDvxVidInSignageXpert.port, vdvSignageXpert)

// reset all sources on program startup
RmsSourceUsageReset();

initArea (dropAreasTpTable[dvDvxVidOutMonitorLeft.port], 438, 164, 320, 180)
initArea (dropAreasTpTable[dvDvxVidOutMonitorRight.port], 1163, 164, 320, 180)
initArea (dropAreasTpTable[dvDvxVidOutMultiPreview.port], 771, 164, 379, 180)

initArea (dragAreasTpTable[dvDvxVidInSignageXpress.port], 528, 376, 134, 105)
initArea (dragAreasTpTable[dvDvxVidInBluray.port],        674, 376, 134, 105)
initArea (dragAreasTpTable[dvDvxVidInEnzo.port],          820, 376 ,134, 105)
initArea (dragAreasTpTable[dvDvxVidInPc.port],            966, 376, 134, 105)
initArea (dragAreasTpTable[dvDvxVidInSignageXpert.port],  1112,376, 134, 105)
initArea (dragAreasTpTable[dvDvxVidInTx1.port],           1258,376, 134, 105)

{
    stack_var integer i
    
    i = 1
    
    for (i = 1; i <= DVX_MAX_VIDEO_INPUTS; i++)
    {
	draggablePopupsTpTable[i] = "'draggable-source-',itoa(i)"
    }
}


// rebuild the event table after setting the variable device and channel code array values
//rebuild_event()   // not needed unless assigning values to dev or dev array variables during runtime





#end_if