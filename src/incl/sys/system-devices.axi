PROGRAM_NAME='system-devices'

#if_not_defined __SYSTEM_DEVICES__
#define __SYSTEM_DEVICES__

#include 'system-library-api'
#include 'system-constants'


define_constant


/*
 * --------------------
 * Device id's
 * --------------------
 */

integer DEV_ID_MASTER                               = 0
integer DEV_ID_TOUCH_PANEL_TABLE                    = 10001
integer DEV_ID_ENZO                                 = 9001
integer DEV_ID_TX_1                                 = 7001
integer DEV_ID_TX_2                                 = 7002
integer DEV_ID_TX_3                                 = 7003
integer DEV_ID_TX_4                                 = 7004
integer DEV_ID_RX_MONITOR_LEFT                      = 8001
integer DEV_ID_RX_MONITOR_RIGHT                     = 8002
integer DEV_ID_DVX_CONTROLLER                       = 5001
integer DEV_ID_DVX_SWITCHER                         = 5002
integer DEV_ID_RELAY_BOX                            = 69
integer DEV_ID_KEYPAD_1                             = 213
integer DEV_ID_KEYPAD_2                             = 214
integer DEV_ID_PDU_1                                =  85
integer DEV_ID_PDU_2                                =  86
integer DEV_ID_PDU_3                                =  87
integer DEV_ID_PDU_4                                =  88
integer DEV_ID_PDU_5                                =  89
integer DEV_ID_PDU_6                                =  90
integer DEV_ID_PDU_7                                =  91
integer DEV_ID_PDU_8                                =  92
integer DEV_ID_DUMMY                                = 32000
integer DEV_ID_VIRTUAL_DRAG_AND_DROP_TP_TABLE       = 33001
integer DEV_ID_VIRTUAL_MULTI_PREVIEW                = 33002
integer DEV_ID_VIRTUAL_RMS_SOURCE_USAGE             = 33003
integer DEV_ID_VIRTUAL_RMS_ASSET_PC                 = 33004
integer DEV_ID_VIRTUAL_RMS_ASSET_BLURAY             = 33005
integer DEV_ID_VIRTUAL_RMS_ASSET_SIGNAGE_XPRESS     = 33006
integer DEV_ID_VIRTUAL_RMS_ASSET_SIGNAGE_XPERT      = 33007
integer DEV_ID_VIRTUAL_RMS_ASSET_LAPTOP_1           = 33008
integer DEV_ID_DUET_MODULE_VIRTUAL_RMS              = 41001
integer DEV_ID_DUET_MODULE_VIRTUAL_MONITOR_LEFT     = 41002
integer DEV_ID_DUET_MODULE_VIRTUAL_MONITOR_RIGHT    = 41003
integer DEV_ID_DUET_MODULE_VIRTUAL_LIGHTING         = 41004

/*
 * --------------------
 * Device ports
 * --------------------
 */

 // Virtual device main port
integer PORT_VIRTUAL_MAIN       = 1

// IP socket device ports (note: IP socket ports start at 2)
integer PORT_IP_SOCKET_LIGHTING      = 2
integer PORT_IP_SOCKET_WAKE_ON_LAN   = 3
integer PORT_IP_SOCKET_MONITOR_LEFT  = 4
integer PORT_IP_SOCKET_MONITOR_RIGHT = 5

// Touch Panel Ports
integer PORT_TP_MAIN            = 1
integer PORT_TP_LIGHTING        = 2
integer PORT_TP_VIDEO           = 3
integer PORT_TP_AUDIO           = 4
integer PORT_TP_BLINDS          = 5
integer PORT_TP_POWER           = 6
integer PORT_TP_CAMERA          = 7
integer PORT_TP_DXLINK          = 8
integer PORT_TP_DEVICE_INFO     = 9
integer PORT_TP_OCCUPANCY       = 10
integer PORT_TP_ENZO            = 11
integer PORT_TP_ENZO_KEYBOARD   = 12
integer PORT_TP_BLURAY          = 13
integer PORT_TP_DEBUG           = 100

// DVX Controller Serial Ports
integer PORT_DVX_CONTROLLER_MAIN    = 1
integer PORT_DVX_SERIAL_1           = 1
integer PORT_DVX_SERIAL_2           = 2
integer PORT_DVX_SERIAL_3           = 3
integer PORT_DVX_SERIAL_4           = 4
integer PORT_DVX_SERIAL_5           = 5
integer PORT_DVX_SERIAL_6           = 6
integer PORT_DVX_RELAYS             = 8
integer PORT_DVX_IR_1               = 9
integer PORT_DVX_IR_2               = 10
integer PORT_DVX_IR_3               = 11
integer PORT_DVX_IR_4               = 12
integer PORT_DVX_IR_5               = 13
integer PORT_DVX_IR_6               = 14
integer PORT_DVX_IR_7               = 15
integer PORT_DVX_IR_8               = 16
integer PORT_DVX_IOS                = 17

// Enzo Ports
integer PORT_ENZO_MAIN = 1

// Axlink port - always 1
integer PORT_AXLINK = 1

// System IDs
integer SYS_MASTER  = 0


/*
 * --------------------
 * Device Definitions
 * --------------------
 */

define_device

// Dummy Device - Doesn't actually exist
dvDummy = DEV_ID_DUMMY:1:SYS_MASTER

// Master Controller
dvMaster    = DEV_ID_MASTER:1:SYS_MASTER

// Keypad
dvKeypad1   = DEV_ID_KEYPAD_1:PORT_AXLINK:SYS_MASTER
dvKeypad2   = DEV_ID_KEYPAD_2:PORT_AXLINK:SYS_MASTER

// Touch Panel Ports
dvTpTableMain          = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_MAIN:SYS_MASTER
dvTpTableLighting      = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_LIGHTING:SYS_MASTER
dvTpTableVideo         = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_VIDEO:SYS_MASTER
dvTpTableAudio         = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_AUDIO:SYS_MASTER
dvTpTableBlinds        = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_BLINDS:SYS_MASTER
dvTpTablePower         = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_POWER:SYS_MASTER
dvTpTableCamera        = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_CAMERA:SYS_MASTER
dvTpTableDxlink        = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_DXLINK:SYS_MASTER
dvTpTableDeviceInfo    = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_DEVICE_INFO:SYS_MASTER
dvTpTableOccupancy     = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_OCCUPANCY:SYS_MASTER
dvTpTableEnzo          = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_ENZO:SYS_MASTER
dvTpTableEnzoKeyboard  = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_ENZO_KEYBOARD:SYS_MASTER
dvTpTableBluray        = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_BLURAY:SYS_MASTER
dvTpTableDebug         = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_DEBUG:SYS_MASTER

// drag and drop elements
dvTpTableDragAndDrop = DEV_ID_TOUCH_PANEL_TABLE:PORT_TP_VIDEO:SYS_MASTER


// DXLinx Receiver on Left Monitor
dvRxMonitorLeftMain     = DEV_ID_RX_MONITOR_LEFT:DXLINK_PORT_MAIN:SYS_MASTER
dvRxMonitorLeftSerial   = DEV_ID_RX_MONITOR_LEFT:DXLINK_PORT_SERIAL:SYS_MASTER
dvRxMonitorLeftVidOut   = DEV_ID_RX_MONITOR_LEFT:DXLINK_PORT_VIDEO_OUTPUT:SYS_MASTER
dvRxMonitorLeftAudOut   = DEV_ID_RX_MONITOR_LEFT:DXLINK_PORT_AUDIO_OUTPUT:SYS_MASTER

// DXLinx Receiver on Right Monitor
dvRxMonitorRightMain    = DEV_ID_RX_MONITOR_RIGHT:DXLINK_PORT_MAIN:SYS_MASTER
dvRxMonitorRightSerial  = DEV_ID_RX_MONITOR_RIGHT:DXLINK_PORT_SERIAL:SYS_MASTER
dvRxMonitorRightVidOut  = DEV_ID_RX_MONITOR_RIGHT:DXLINK_PORT_VIDEO_OUTPUT:SYS_MASTER
dvRxMonitorRightAudOut  = DEV_ID_RX_MONITOR_RIGHT:DXLINK_PORT_AUDIO_OUTPUT:SYS_MASTER

// DXLinx Multi-Format Transmit #1 under board room table
dvTxTable1Main          = DEV_ID_TX_1:DXLINK_PORT_MAIN:SYS_MASTER
dvTxTable1VidInDigital  = DEV_ID_TX_1:DXLINK_PORT_VIDEO_INPUT_DIGITAL:SYS_MASTER
dvTxTable1VidInAnalog   = DEV_ID_TX_1:DXLINK_PORT_VIDEO_INPUT_ANALOG:SYS_MASTER
dvTxTable1AudIn         = DEV_ID_TX_1:DXLINK_PORT_AUDIO_INPUT:SYS_MASTER

// DXLinx Multi-Format Transmit #2 under board room table
dvTxTable2Main          = DEV_ID_TX_2:DXLINK_PORT_MAIN:SYS_MASTER
dvTxTable2VidInDigital  = DEV_ID_TX_2:DXLINK_PORT_VIDEO_INPUT_DIGITAL:SYS_MASTER
dvTxTable2VidInAnalog   = DEV_ID_TX_2:DXLINK_PORT_VIDEO_INPUT_ANALOG:SYS_MASTER
dvTxTable2AudIn         = DEV_ID_TX_2:DXLINK_PORT_AUDIO_INPUT:SYS_MASTER

// DXLinx Multi-Format Transmit #3 under board room table
dvTxTable3Main          = DEV_ID_TX_3:DXLINK_PORT_MAIN:SYS_MASTER
dvTxTable3VidInDigital  = DEV_ID_TX_3:DXLINK_PORT_VIDEO_INPUT_DIGITAL:SYS_MASTER
dvTxTable3VidInAnalog   = DEV_ID_TX_3:DXLINK_PORT_VIDEO_INPUT_ANALOG:SYS_MASTER
dvTxTable3AudIn         = DEV_ID_TX_3:DXLINK_PORT_AUDIO_INPUT:SYS_MASTER

// DXLinx Multi-Format Transmit #4 under board room table
dvTxTable4Main          = DEV_ID_TX_4:DXLINK_PORT_MAIN:SYS_MASTER
dvTxTable4VidInDigital  = DEV_ID_TX_4:DXLINK_PORT_VIDEO_INPUT_DIGITAL:SYS_MASTER
dvTxTable4VidInAnalog   = DEV_ID_TX_4:DXLINK_PORT_VIDEO_INPUT_ANALOG:SYS_MASTER
dvTxTable4AudIn         = DEV_ID_TX_4:DXLINK_PORT_AUDIO_INPUT:SYS_MASTER

// DVX Main Port
dvDvxMain   = DEV_ID_DVX_SWITCHER:DVX_PORT_MAIN:SYS_MASTER

// DVX Video Inputs
dvDvxVidIn1     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_1:SYS_MASTER
dvDvxVidIn2     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_2:SYS_MASTER
dvDvxVidIn3     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_3:SYS_MASTER
dvDvxVidIn4     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_4:SYS_MASTER
dvDvxVidIn5     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_5:SYS_MASTER
dvDvxVidIn6     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_6:SYS_MASTER
dvDvxVidIn7     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_7:SYS_MASTER
dvDvxVidIn8     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_8:SYS_MASTER
dvDvxVidIn9     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_9:SYS_MASTER
dvDvxVidIn10    = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_10:SYS_MASTER
// Names ports
dvDvxVidInSignageXpress  = dvDvxVidIn1
dvDvxVidInBluray         = dvDvxVidIn5
dvDvxVidInEnzo           = dvDvxVidIn6
dvDvxVidInPc             = dvDvxVidIn7
dvDvxVidInSignageXpert   = dvDvxVidIn8
dvDvxVidInTx1            = dvDvxVidIn10
dvDvxVidInTx2            = dvDummy
dvDvxVidInTx3            = dvDummy
dvDvxVidInTx4            = dvDummy

// DVX Video Outputs
dvDvxVidOut1    = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_OUT_1:SYS_MASTER
dvDvxVidOut2    = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_OUT_2:SYS_MASTER
dvDvxVidOut3    = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_OUT_3:SYS_MASTER
dvDvxVidOut4    = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_OUT_4:SYS_MASTER
// Named ports
dvDvxVidOutMultiPreview = dvDvxVidOut2
dvDvxVidOutMonitorLeft  = dvDvxVidOut1
dvDvxVidOutMonitorRight = dvDvxVidOut3

// DVX Audio Inputs
dvDvxAudIn1     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_1:SYS_MASTER
dvDvxAudIn2     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_2:SYS_MASTER
dvDvxAudIn3     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_3:SYS_MASTER
dvDvxAudIn4     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_4:SYS_MASTER
dvDvxAudIn5     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_5:SYS_MASTER
dvDvxAudIn6     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_6:SYS_MASTER
dvDvxAudIn7     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_7:SYS_MASTER
dvDvxAudIn8     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_8:SYS_MASTER
dvDvxAudIn9     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_9:SYS_MASTER
dvDvxAudIn10    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_10:SYS_MASTER
dvDvxAudIn11    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_11:SYS_MASTER
dvDvxAudIn12    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_12:SYS_MASTER
dvDvxAudIn13    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_13:SYS_MASTER
dvDvxAudIn14    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_14:SYS_MASTER
// Names ports
dvDvxAudInSignageXpress  = dvDvxAudIn1
dvDvxAudInBluray         = dvDvxAudIn5
dvDvxAudInEnzo           = dvDvxAudIn6
dvDvxAudInPc             = dvDvxAudIn7
dvDvxAudInSignageXpert   = dvDvxAudIn8
dvDvxAudInTx1            = dvDvxAudIn10
dvDvxAudInTx2            = dvDummy
dvDvxAudInTx3            = dvDummy
dvDvxAudInTx4            = dvDummy

// DVX Audio Outputs
dvDvxAudOut1    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_OUT_1:SYS_MASTER
dvDvxAudOut2    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_OUT_2:SYS_MASTER
dvDvxAudOut3    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_OUT_3:SYS_MASTER
dvDvxAudOut4    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_OUT_4:SYS_MASTER
// Namesd ports
dvDvxAudOutSpeakers = dvDvxAudOut1
dvDvxAudOutFoyer    = dvDvxAudOut4

// DVX Controller
dvDvxControllerMain = DEV_ID_DVX_CONTROLLER:PORT_DVX_CONTROLLER_MAIN:SYS_MASTER

// Relays for Blind/Shade Control
dvRelaysDvx     = DEV_ID_DVX_CONTROLLER:PORT_DVX_RELAYS:SYS_MASTER
dvRelaysRelBox  = DEV_ID_RELAY_BOX:PORT_AXLINK:SYS_MASTER

// PTZ Camera
dvPtzCam    = DEV_ID_DVX_CONTROLLER:PORT_DVX_SERIAL_1:SYS_MASTER

// Bluray player
dvBluray = DEV_ID_DVX_CONTROLLER:PORT_DVX_IR_1:SYS_MASTER

// Enzo
dvEnzo = DEV_ID_ENZO:PORT_ENZO_MAIN:SYS_MASTER

// PDU
dvPduMain1  = DEV_ID_PDU_1:PORT_AXLINK:SYS_MASTER
dvPduMain2  = DEV_ID_PDU_2:PORT_AXLINK:SYS_MASTER
// PDU Outlets
dvPduOutlet1    = DEV_ID_PDU_1:PORT_AXLINK:SYS_MASTER
dvPduOutlet2    = DEV_ID_PDU_2:PORT_AXLINK:SYS_MASTER
dvPduOutlet3    = DEV_ID_PDU_3:PORT_AXLINK:SYS_MASTER
dvPduOutlet4    = DEV_ID_PDU_4:PORT_AXLINK:SYS_MASTER
dvPduOutlet5    = DEV_ID_PDU_5:PORT_AXLINK:SYS_MASTER
dvPduOutlet6    = DEV_ID_PDU_6:PORT_AXLINK:SYS_MASTER
dvPduOutlet7    = DEV_ID_PDU_7:PORT_AXLINK:SYS_MASTER
dvPduOutlet8    = DEV_ID_PDU_8:PORT_AXLINK:SYS_MASTER
// Named outlets
dvPduOutletMonitorLeft  = dvPduOutlet1
dvPduOutletMonitorRight = dvPduOutlet2
dvPduOutletPdxl2    = dvPduOutlet3
dvPduOutletMultiPreview = dvPduOutlet4
dvPduOutletPc           = dvPduOutlet5
dvPduOutletDvx          = dvPduOutlet6
dvPduOutletFan1         = dvPduOutlet7
dvPduOutletFan2         = dvPduOutlet8
// PDU Axlink buses
dvPduAxlinkBus1 = DEV_ID_PDU_1:PORT_AXLINK:SYS_MASTER
dvPduAxlinkBus2 = DEV_ID_PDU_2:PORT_AXLINK:SYS_MASTER


// PDXL2 - ???


// DVX IO's (Occupancy sensor connects to DVX IO)
dvDvxIos    = DEV_ID_DVX_CONTROLLER:PORT_DVX_IOS:SYS_MASTER


// Lighting
dvLighting  = DEV_ID_MASTER:PORT_IP_SOCKET_LIGHTING:SYS_MASTER // This device should be used as the physical device by the COMM module
vdvLighting = DEV_ID_DUET_MODULE_VIRTUAL_LIGHTING:PORT_VIRTUAL_MAIN:SYS_MASTER  // The COMM module should use this as its duet device

// IP socket for wake on lan
dvIpSocketWakeOnLan = DEV_ID_MASTER:PORT_IP_SOCKET_WAKE_ON_LAN:SYS_MASTER

// Monitors
dvMonitorLeft   = DEV_ID_MASTER:PORT_IP_SOCKET_MONITOR_LEFT:SYS_MASTER
vdvMonitorLeft  = DEV_ID_DUET_MODULE_VIRTUAL_MONITOR_LEFT:PORT_VIRTUAL_MAIN:SYS_MASTER
dvMonitorRight  = DEV_ID_MASTER:PORT_IP_SOCKET_MONITOR_RIGHT:SYS_MASTER
vdvMonitorRight = DEV_ID_DUET_MODULE_VIRTUAL_MONITOR_RIGHT:PORT_VIRTUAL_MAIN:SYS_MASTER

// RMS
vdvRms  = DEV_ID_DUET_MODULE_VIRTUAL_RMS:PORT_VIRTUAL_MAIN:SYS_MASTER

// drag and drop virtual device
vdvDragAndDropTpTable = DEV_ID_VIRTUAL_DRAG_AND_DROP_TP_TABLE:PORT_VIRTUAL_MAIN:SYS_MASTER

// Multi-Preview
vdvMultiPreview = DEV_ID_VIRTUAL_MULTI_PREVIEW:PORT_VIRTUAL_MAIN:SYS_MASTER

// define virtual device for RMS source usage
vdvRMSSourceUsage   =  DEV_ID_VIRTUAL_RMS_SOURCE_USAGE:PORT_VIRTUAL_MAIN:SYS_MASTER  // RMS Source Usage Monitor

// RMS (non-controlled) Asset Devices
vdvPc            = DEV_ID_VIRTUAL_RMS_ASSET_PC:PORT_VIRTUAL_MAIN:SYS_MASTER
vdvBluray        = DEV_ID_VIRTUAL_RMS_ASSET_BLURAY:PORT_VIRTUAL_MAIN:SYS_MASTER
vdvSignageXpress = DEV_ID_VIRTUAL_RMS_ASSET_SIGNAGE_XPRESS:PORT_VIRTUAL_MAIN:SYS_MASTER
vdvSignageXpert  = DEV_ID_VIRTUAL_RMS_ASSET_SIGNAGE_XPERT:PORT_VIRTUAL_MAIN:SYS_MASTER
vdvLaptop1       = DEV_ID_VIRTUAL_RMS_ASSET_LAPTOP_1:PORT_VIRTUAL_MAIN:SYS_MASTER

 

#end_if