# How to connect to 'eduroam' network
1) install frontend for NetworkManager. I use a package named 
'nm-connection-editor'.
2) run nm-connection-editor
3) Create a new wifi connection by clicking the plus button. Fill in the 
following:
-------------------------------------------------------------------------------
TAB               SETTING NAME                        VALUE
Wi-Fi             ssid                            =   "eduroam"
Wi-Fi Security    Security                        =   "WPA & WPA2 Enterprise"
Wi-Fi Security    Authentication                  =   "Protected EAP (PEAP)"
Wi-Fi Security    "No CA certificate is required" =   CHECKED
Wi-Fi Security    PEAP version                    =   Automatic
Wi-Fi Security    Inner Authentication            =   MSCHAPv2
Wi-Fi Security    Username                        =   "YOUR_USERNAME_HERE"
Wi-Fi Security    Password                        =   "YOUR_PASSWORD_HERE"
-------------------------------------------------------------------------------
4) (OPTIONAL) remove 'nm-connection-editor'

This method could be improved, but Oregon State University is ignorant to 
non-soydev Linux distros--that was a joke, but seriously no guides or tutorial 
for doing things from the command line is frustrating. I spent over 2 hours 
trying to connect from the command line. I opted to use the GUI because 
connecting to the network is usually a one-time phenomenon.  
