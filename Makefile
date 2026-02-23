.PHONY: flutter-linux flutter-web flutter-devices flutter-doctor

flutter-linux:
	cd flutter && flutter run -d linux

flutter-web:
	cd flutter && flutter run -d web-server

flutter-devices:
	cd flutter && flutter devices

flutter-doctor:
	cd flutter && flutter doctor
