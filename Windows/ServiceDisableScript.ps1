#   Description:
# This script disables unwanted Windows services. If you do not want to disable
# certain services comment out the corresponding lines below.
# In case of issues running the script:
#   1. Make sure powershell is open in admin mode
#   2. If still not working, open powershell in admin mode and run the following command:
#                Set-ExecutionPolicy RemoteSigned
#   3. After Script finishes running, run the command:
#                Set-ExecutionPolicy Restricted

$services = @(
    # Xbox services
    "XblAuthManager"                           # Xbox Live Auth Manager
    "XblGameSave"                              # Xbox Live Game Save Service
    "XboxNetApiSvc"                            # Xbox Live Networking Service
    # Smartcard services for coprporate organizations
    "SCardSvr"                                 # Smart Card
    "ScDeviceEnum"                             # Smart Card Device Enumeration Service
    "SCPolicySvc"                              # Smart Card Removal Policy
    "CertPropSvc"                              # Certificate Propagation
    # Unlikely to use services
    "fax"                                      # Only if you use fax services
    "DiagTrack"                                # Connected User Experiences and Telemetry
    "RemoteRegistry"                           # Remote Registry. Change registry files remotely
    "wisvc"                                    # Windows Insider Service
    "MapsBroker"                               # Downloaded Maps Manager
    "WPDBusEnum"                               # Portable Device Enumerator Service. Making group policy changes for removable drives and to synchronize content for applications
    "RetailDemo"                               # Retail Demo Service. Used during store displays
    "EntAppSvc"                                # Enterprise App Management Service. Management of apps from corporate offices.
    "WMPNetworkSvc"                            # Windows Media Player Network Sharing Service
    "BDESVC"                                   # BitLocker Drive Encryption Service
    "WFDSConMgrSvc"                            # Usedfor connecting to devices with Wifi-direct support
    "icssvc"                                   # Windows Mobile Hotspot Service. Used for turning device into Wifi hotspot
    "SharedAccess"                             # Internet Connection Sharing (ICS). Connected computer share its Internet connection over LAN
    # Keep these services on if necessary
    "AJRouter"                                 # AllJoyn Router Service for connecting to IoT devices
    "WpcMonSvc"                                # Parental Control
    # Services may be useful for laptop devices
    "TabletInputService"                       # Touch Keyboard and Handwriting Panel Service. Do not disable this for touchscreen devices
    "WbioSrvc"                                 # Windows Biometric Service (required for Fingerprint reader / facial detection)
    # Services for tablet devices    
    "SEMgrSvc"                                 # Payments and NFC/SE Manager. Only useful for windows devices with NFC chips
    "dmwappushservice"                         # Device Management Wireless Application Protocol (WAP) Push message Routing Service, serives for windows tablets
    "dmwappushservice"                         # WAP Push Message Routing Service (see known issues)
    # Not recommended for disabling
    #"WlanSvc"                                 # WLAN AutoConfig (Disabling this can cause issues with wifi connectivity)
    #"wscsvc"                                  # Windows Security Center Service
    #"WSearch"                                 # Windows Search
    #"RemoteAccess"                            # Routing and Remote Access
)

foreach ($service in $services) {
    Write-Output "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
}
