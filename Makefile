.PHONY: apk
apk:
	make clean
	flutter build apk --split-per-abi

.PHONY: get
get:
	flutter pub get

.PHONY: clean
clean:
	flutter clean
	make get

.PHONY: abb
abb:
	make clean
	flutter build appbundle

.PHONY: gen
gen:
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs

.PHONY: watch
watch:
	dart run build_runner watch

.PHONY: fix
fix:
	dart fix --apply

.PHONY: splash
splash:
	flutter pub get
	dart run flutter_native_splash:create

.PHONY: adb
adb:
	adb tcpip 5555
	sleep 1
	adb connect 192.168.29.86

.PHONY: env
env:
	make get
	dart run env_reader --input=".env" --key="TodayNews" --output="assets/env/" --model="lib/gen/env_model.dart" --null-safety

.PHONY: web-run
web-run: 
	flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0