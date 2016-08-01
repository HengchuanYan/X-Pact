@rem -- set the relevant environment variables ---------------------------------
setx RUNTIMEROOT D:\smsSiemag\X-Pact -m
@set RUNTIMEROOT=D:\smsSiemag\X-Pact
setx CBSDIR %RUNTIMEROOT%\CCS\packages\cbs -m
@set CBSDIR=%RUNTIMEROOT%\CCS\packages\cbs
@rem -- only for smsdtool TelegramDlg.exe --------------------------------------
setx PRJROOT %RUNTIMEROOT%\CCS -m
@rem -- omniORB related variables ----------------------------------------------
setx OMNIDIR %RUNTIMEROOT%\CCS\packages\omniORB -m
@set OMNIDIR=%RUNTIMEROOT%\CCS\packages\omniORB
setx OMNINAMES_LOGDIR %RUNTIMEROOT%\CCS\L2\log\omninames -m
@rem -- oracle related variables -----------------------------------------------
setx NLS_LANG AMERICAN_AMERICA.AL32UTF8 -m
@rem -- IPQS_Slab rel. variables -----------------------------------------------
setx IPQSROOT %RUNTIMEROOT%\IPQS -m
setx IPQS_DLL_ROOT %RUNTIMEROOT%\IPQS\BIN -m
@rem -- only once --------------------------------------------------------------
@rem org.path at 20.07.2011 => C:\oracle\product\10.2.0\db_1\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\system32\WBEM;C:\Program Files\Support Tools\
@rem setx PATH "%PATH%;%RUNTIMEROOT%\CCS\L2\bin;%OMNIDIR%\bin\x86_win32;%CBSDIR%\bin;C:\oracle\product\10.2.0\db_1\jdk\jre\bin\client;%RUNTIMEROOT%\CCS\L2\bin\Shortcuts;%IPQSROOT%\BIN;%IPQSROOT%\BIN\Shortcuts" -m
pause
