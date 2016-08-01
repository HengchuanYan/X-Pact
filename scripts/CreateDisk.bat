@echo off
############################################
yahc created to prepare handancsp dev environment only for the development station on site
2015-08-20
Set L2 work environment
############################################

if exist V:\nul (
	echo "uninstall the v disk for reinstall it"
	subst v: /d
	subst v: d:\smssiemag\x-pact
) else (
	echo "disk v does not exist, it will be installed now."
	subst v: d:\smssiemag\x-pact
)

 
if exist z:\nul (
	echo "uninstall the z disk for reinstall it"
	subst z: /d
	subst z: d:\smssiemag\x-pact
) else (
	echo "disk z does not exist, it will be installed now."
	subst z: d:\smssiemag\x-pact
)

if exist P:\nul (
	echo "uninstall the P disk for reinstall it"
	subst P: /d
	subst P: d:\smssiemag\x-pact
) else (
	echo "disk z does not exist, it will be installed now."
	subst z: d:\smssiemag\x-pact
)
exit
