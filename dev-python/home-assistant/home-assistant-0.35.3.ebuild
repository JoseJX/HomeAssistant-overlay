# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python3_{4,5} )
inherit distutils-r1

DESCRIPTION="Open source home automation platform"
HOMEPAGE="http://home-assistant.io"
if [[ ${PV} = 9999 ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/home-assistant/home-assistant.git"
else
    SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+hue +google +discovery +zeroconf +yahoo +nest +samsung +ifttt
	  +html5 +check_config +xmpp +evdev +conversation +feedparser +gntp
	  +harmony +expect +xml"

### These are the required base depenencies for the Home Assistant core
DEPEND="${PYTHON_DEPS}
	<dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.11[${PYTHON_USEDEP}]
	>=dev-python/pytz-2016.7[${PYTHON_USEDEP}]
	>=dev-python/pip-7[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.8[${PYTHON_USEDEP}]
	=dev-python/voluptuous-0.9.2[${PYTHON_USEDEP}]
	<dev-python/typing-4[${PYTHON_USEDEP}]
	=dev-python/aiohttp-1.1.6[${PYTHON_USEDEP}]
	=dev-python/async_timeout-1.1.0[${PYTHON_USEDEP}]"

### These are the optional dependencies for each of the home assistant 
### components. Note: These are written this way for easier comparison to the
### depend list from Home Assistant

# FIXME: These should be made into a USE_EXPAND
# FIXME: Commented deps need to be added

# homeassistant.components.nuimo_controller
# FIXME: --only-binary=all http://github.com/getSenic/nuimo-linux-python/archive/29fc42987f74d8090d0e2382e8f248ff5990b8c9.zip#nuimo==1.0.0
# DEPEND="${DEPEND} nuimo? ( =dev-python/nuimo-1.0.0[${PYTHON_USEDEP}] )"

# homeassistant.components.isy994
# DEPEND="${DEPEND} isy994? ( =dev-python/pyisy-1.0.7[${PYTHON_USEDEP}] )"

# homeassistant.components.notify.html5
DEPEND="${DEPEND} html5? ( =dev-python/pyjwt-1.4.2[${PYTHON_USEDEP}] )"

# homeassistant.components.arduino
# DEPEND="${DEPEND} arduino? ( =dev-python/pymata-2.13[${PYTHON_USEDEP}] )"

# homeassistant.components.rpi_gpio
# DEPEND="${DEPEND} gpio? ( =dev-python/rpi-gpio-0.6.1[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.sonos
# DEPEND="${DEPEND} sonos? ( =dev-python/soco-0.12[${PYTHON_USEDEP}] )"

# homeassistant.components.notify.twitter
# DEPEND="${DEPEND} twitter? ( =dev-python/TwitterAPI-2.4.2[${PYTHON_USEDEP}] )"

# homeassistant.components.http
# DEPEND="${DEPEND} aiohttp? ( =dev-python/aiohttp_cors-0.5.0[${PYTHON_USEDEP}] )"

# homeassistant.components.camera.amcrest
# DEPEND="${DEPEND} amcrest? ( =dev-python/amcrest-1.0.0[${PYTHON_USEDEP}] )"

# homeassistant.components.apcupsd
# DEPEND="${DEPEND} apcupsd? ( =dev-python/apcaccess-0.0.4[${PYTHON_USEDEP}] )"

# homeassistant.components.notify.apns
# DEPEND="${DEPEND} apns? ( =dev-python/apns2-0.1.1[${PYTHON_USEDEP}] )"

# homeassistant.components.sun
# DEPEND="${DEPEND} sun? ( =dev-python/astral-1.3.3[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.linux_battery
# DEPEND="${DEPEND} battery? ( =dev-python/batinfo-0.4.2[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.hydroquebec
# homeassistant.components.sensor.scrape
# DEPEND="${DEPEND} scrape" ( =dev-python/beautiful-soup-4.5.1[${PYTHON_USEDEP}] )"

# homeassistant.components.light.blinksticklight
# DEPEND="${DEPEND} blinkstick? ( =dev-python/blinkstick-1.1.8[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.bitcoin
# DEPEND="${DEPEND} bitcoin? ( =dev-python/blockchain-1.3.3[${PYTHON_USEDEP}] )"

# homeassistant.components.climate.eq3btsmart
# DEPEND="${DEPEND} eq3btsmart? ( =dev-python/bluepy_devices-0.2.0[${PYTHON_USEDEP}] )"

# homeassistant.components.notify.aws_lambda
# homeassistant.components.notify.aws_sns
# homeassistant.components.notify.aws_sqs
# DEPEND="${DEPEND} aws? ( =dev-python/boto3-1.3.1[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.broadlink
# homeassistant.components.switch.broadlink
# DEPEND="${DEPEND} broadlink? ( =dev-python/broadlink-0.2[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.coinmarketcap
# DEPEND="${DEPEND} coinmarketcap? ( =dev-python/coinmarketcap-2.0.1[${PYTHON_USEDEP}] )"

DEPEND="${DEPEND} check_config? ( <dev-python/colorlog-3[${PYTHON_USEDEP}] )"

# homeassistant.components.alarm_control_panel.concord232
# homeassistant.components.binary_sensor.concord232
# DEPEND="${DEPEND} concord? ( =dev-python/concord232-0.14[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.denonavr
#DEPEND="${DEPEND} denon? ( =dev-python/denonavr-0.2.2[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.directv
#DEPEND="${DEPEND} directtv? ( =dev-python/directpy-0.1[${PYTHON_USEDEP}] )"

# homeassistant.components.updater
# FIXME: I don't think we want this one...
# DEPEND="${DEPEND} distro? ( =dev-python/distro1.0.1[${PYTHON_USEDEP}] )"

# homeassistant.components.switch.digitalloggers
# DEPEND="${DEPEND} digitalloggers? ( =dev-python/dlipower-0.7.165[${PYTHON_USEDEP}] )"

# homeassistant.components.notify.xmpp
#DEPEND="${DEPEND} xmpp? ( =dev-python/dnspython3-1.15.0[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.dovado
#DEPEND="${DEPEND} dovado? ( =dev-python/dovado-0.1.15[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.dsmr
#DEPEND="${DEPEND} dsmr? ( =dev-python/dsmr-0.4[${PYTHON_USEDEP}] )"

# homeassistant.components.dweet
# homeassistant.components.sensor.dweet
#DEPEND="${DEPEND} dweet? ( =dev-python/dweepy-0.2.0[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.eliqonline
#DEPEND="${DEPEND} eliqonline? ( =dev-python/eliqonline-1.0.13[${PYTHON_USEDEP}] )"

# homeassistant.components.enocean
#DEPEND="${DEPEND} enocean? ( =dev-python/enocean-0.31[${PYTHON_USEDEP}] )"

# homeassistant.components.keyboard_remote
DEPEND="${DEPEND} evdev? ( =dev-python/python-evdev-0.6.1[${PYTHON_USEDEP}] )"

# homeassistant.components.climate.honeywell
#DEPEND="${DEPEND} honeywell? ( =dev-python/evohomeclient-0.2.5[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.fastdotcom
#DEPEND="${DEPEND} fastdotcom? ( =dev-python/fastdotcom-0.0.1[${PYTHON_USEDEP}] )"

# homeassistant.components.feedreader
DEPEND="${DEPEND} feedparser? ( =dev-python/feedparser-5.2.1[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.fitbit
#DEPEND="${DEPEND} fitbit? ( =dev-python/fitbit-0.2.3[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.fixer
#DEPEND="${DEPEND} fixer? ( =dev-python/fixerio-0.1.1[${PYTHON_USEDEP}] )"

# homeassistant.components.notify.free_mobile
#DEPEND="${DEPEND} free_mobile? ( =dev-python/free_mobile-0.1.1[${PYTHON_USEDEP}] )"

# homeassistant.components.conversation
DEPEND="${DEPEND} conversation? ( =dev-python/fuzzywuzzy-0.14.0[${PYTHON_USEDEP}] )"

# homeassistant.components.tts.google
DEPEND="${DEPEND} google? ( =dev-python/gTTS-token-1.1.1[${PYTHON_USEDEP}] )"

# homeassistant.components.device_tracker.bluetooth_le_tracker
#DEPEND="${DEPEND} bluetooth? ( =dev-python/gattlib-0.20150805[${PYTHON_USEDEP}] )"

# homeassistant.components.notify.gntp
DEPEND="${DEPEND} gntp? ( =dev-python/gntp-1.0.3[${PYTHON_USEDEP}] )"

# homeassistant.components.google
DEPEND="${DEPEND} google? ( =dev-python/google-api-python-client-1.5.5[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.google_travel_time
#DEPEND="${DEPEND} google? ( =dev-python/googlemaps-2.4.4[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.gpsd
#DEPEND="${DEPEND} gps? ( =sci-geosciences/gps3-0.33.3[${PYTHON_USEDEP}] )"

# homeassistant.components.openalpr
#DEPEND="${DEPEND} openalpr? ( =dev-python/ha-alpr-0.3[${PYTHON_USEDEP}] )"

# homeassistant.components.ffmpeg
#DEPEND="${DEPEND} ffmpeg? ( =dev-python/ha-ffmpeg-0.15[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.philips_js
#DEPEND="${DEPEND} philips? ( =dev-python/ha-philipsjs-0.0.1[${PYTHON_USEDEP}] )"

# homeassistant.components.mqtt.server
#DEPEND="${DEPEND} mqtt? ( =dev-python/hbmqtt-0.8[${PYTHON_USEDEP}] )"

# homeassistant.components.climate.heatmiser
#DEPEND="${DEPEND} heatmiser? ( =dev-python/heatmiserV3-0.9.1[${PYTHON_USEDEP}] )"

# homeassistant.components.switch.hikvisioncam
#DEPEND="${DEPEND} hikvisioncam? ( =dev-python/hikvision-0.4[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.dht
#DEPEND="${DEPEND} dht? ( =dev-python/Adafruit_DHT-1.3.0[${PYTHON_USEDEP}] )"

# homeassistant.components.nest
DEPEND="${DEPEND} nest? ( =dev-python/python-nest-3.0.2[${PYTHON_USEDEP}] )"

# homeassistant.components.light.flux_led
#DEPEND="${DEPEND} flux_led? ( =dev-python/flux_led-0.10[${PYTHON_USEDEP}] )"

# homeassistant.components.switch.tplink
#DEPEND="${DEPEND} tplink? ( =dev-python/pyHS100-0.2.2[${PYTHON_USEDEP}] )"

# homeassistant.components.switch.dlink
#DEPEND="${DEPEND} dlink? ( =dev-python/pyW215-0.3.7[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.webostv
# homeassistant.components.notify.webostv
#DEPEND="${DEPEND} webostv? ( =dev-python/pylgtv-0.1.2[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.thinkingcleaner
# homeassistant.components.switch.thinkingcleaner
#DEPEND="${DEPEND} pythinkingcleaner? ( =dev-python/pythinkingcleaner-0.0.2[${PYTHON_USEDEP}] )"

# homeassistant.components.alarm_control_panel.alarmdotcom
#DEPEND="${DEPEND} alarmdotcom? ( =dev-python/pyalarmdotcom-0.1.1[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.braviatv
#DEPEND="${DEPEND} braviatv? ( =dev-python/braviarc-0.3.6[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.roku
#DEPEND="${DEPEND} roku? ( =dev-python/roku-3.1.2[${PYTHON_USEDEP}] )"

# homeassistant.components.modbus
#DEPEND="${DEPEND} modbus? ( =dev-python/pymodbus-1.2.0[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.onkyo
#DEPEND="${DEPEND} onkyo? ( =dev-python/onkyo-eiscp-0.9.2[${PYTHON_USEDEP}] )"

# homeassistant.components.device_tracker.fritz
#DEPEND="${DEPEND} fritz? ( =dev-python/fritzconnection-0.4.6[${PYTHON_USEDEP}] )"

# homeassistant.components.netatmo
#DEPEND="${DEPEND} netatmo? ( =dev-python/netatmo-api-python-0.8.0[${PYTHON_USEDEP}] )"

# homeassistant.components.neato
#DEPEND="${DEPEND} neato? ( =dev-python/pybotvac-0.0.1[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.sabnzbd
#DEPEND="${DEPEND} sabnzbd? ( =dev-python/python-sabnzbd-0.1[${PYTHON_USEDEP}] )"

# homeassistant.components.qwikswitch
#DEPEND="${DEPEND} qwikswitch? ( =dev-python/pysqikswitch-0.4[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.russound_rnet
#DEPEND="${DEPEND} russound? ( =dev-python/russound-0.1.6[${PYTHON_USEDEP}] )"

# homeassistant.components.switch.anel_pwrctrl
#DEPEND="${DEPEND} anel? ( =dev-python/anel_pwrctrl-0.0.1[${PYTHON_USEDEP}] )"

# homeassistant.components.ecobee
#DEPEND="${DEPEND} ecobee? ( =dev-python/python-ecobee-0.0.6[${PYTHON_USEDEP}] )"

# homeassistant.components.joaoapps_join
# homeassistant.components.notify.joaoapps_join
#DEPEND="${DEPEND} join? ( =dev-python/python-join-api-0.0.1[${PYTHON_USEDEP}] )"

# homeassistant.components.openalpr
#DEPEND="${DEPEND} openalpr? ( =dev-python/openalpr_api-1.0.2[${PYTHON_USEDEP}] )"

# homeassistant.components.switch.edimax
#https://github.com/rkabadi/pyedimax/archive/365301ce3ff26129a7910c501ead09ea625f3700.zip#pyedimax==0.1

# homeassistant.components.sensor.gtfs
#https://github.com/robbiet480/pygtfs/archive/00546724e4bbcb3053110d844ca44e2246267dd8.zip#pygtfs==0.1.3

# homeassistant.components.scene.hunterdouglas_powerview
#https://github.com/sander76/powerviewApi/archive/246e782d60d5c0addcc98d7899a0186f9d5640b0.zip#powerviewApi==0.3.15

# homeassistant.components.binary_sensor.flic
#https://github.com/soldag/pyflic/archive/0.4.zip#pyflic==0.4

# homeassistant.components.light.osramlightify
#https://github.com/tfriedel/python-lightify/archive/d6eadcf311e6e21746182d1480e97b350dda2b3e.zip#lightify==1.0.4

# homeassistant.components.mysensors
#https://github.com/theolind/pymysensors/archive/0b705119389be58332f17753c53167f551254b6c.zip#pymysensors==0.8

# homeassistant.components.alarm_control_panel.simplisafe
#https://github.com/w1ll1am23/simplisafe-python/archive/586fede0e85fd69e56e516aaa8e97eb644ca8866.zip#simplisafe-python==0.0.1

# homeassistant.components.media_player.lg_netcast
#https://github.com/wokar/pylgnetcast/archive/v0.2.0.zip#pylgnetcast==0.2.0

# homeassistant.components.influxdb
# homeassistant.components.sensor.influxdb
#influxdb==3.0.0

# homeassistant.components.insteon_hub
#insteon_hub==0.4.5

# homeassistant.components.media_player.kodi
# homeassistant.components.notify.kodi
#jsonrpc-requests==0.3

# homeassistant.scripts.keyring
#keyring>=9.3,<10.0

# homeassistant.components.knx
#knxip==0.3.3

# homeassistant.components.device_tracker.owntracks
#libnacl==1.5.0

# homeassistant.components.media_player.soundtouch
#libsoundtouch==0.1.0

# homeassistant.components.light.lifx
#liffylights==0.9.4

# homeassistant.components.light.limitlessled
#limitlessled==1.0.2

# homeassistant.components.notify.matrix
#matrix-client==0.0.5

# homeassistant.components.notify.message_bird
#messagebird==1.2.0

# homeassistant.components.sensor.mfi
# homeassistant.components.switch.mfi
#mficlient==0.3.0

# homeassistant.components.sensor.miflora
#miflora==0.1.13

# homeassistant.components.discovery
DEPEND="${DEPEND} discovery? ( =dev-python/netdisco-0.8.1[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.neurio_energy
#neurio==0.2.10

# homeassistant.components.google
DEPEND="${DEPEND} google? ( =dev-python/oauth2client-3.0.0[${PYTHON_USEDEP}] )"

# homeassistant.components.switch.orvibo
#orvibo==1.1.1

# homeassistant.components.mqtt
#DEPEND="${DEPEND} mqtt? ( =dev-python/paho-mqtt-1.2 )"

# homeassistant.components.media_player.panasonic_viera
#panasonic_viera==0.2

# homeassistant.components.media_player.dunehd
#pdunehd==1.3

# homeassistant.components.device_tracker.aruba
# homeassistant.components.device_tracker.asuswrt
# homeassistant.components.device_tracker.cisco_ios
# homeassistant.components.media_player.pandora
DEPEND="${DEPEND} expect? ( =dev-python/pexpect-4.0.1[${PYTHON_USEDEP}] )"

# homeassistant.components.light.hue
DEPEND="${DEPEND} hue? ( =dev-python/phue-0.9[${PYTHON_USEDEP}] )"

# homeassistant.components.pilight
#pilight==0.1.1

# homeassistant.components.media_player.plex
# homeassistant.components.sensor.plex
#plexapi==2.0.2

# homeassistant.components.sensor.mhz19
# homeassistant.components.sensor.serial_pm
#pmsensor==0.3

# homeassistant.components.climate.proliphix
#proliphix==0.4.1

# homeassistant.components.sensor.systemmonitor
#psutil==5.0.0

# homeassistant.components.wink
#pubnubsub-handler==0.0.5

# homeassistant.components.notify.pushbullet
#pushbullet.py==0.10.0

# homeassistant.components.notify.pushetta
#pushetta==1.0.15

# homeassistant.components.sensor.waqi
#pwaqi==1.3

# homeassistant.components.sensor.cpuspeed
#py-cpuinfo==0.2.3

# homeassistant.components.rfxtrx
#pyRFXtrx==0.13.0

# homeassistant.components.notify.xmpp
#pyasn1-modules==0.0.8

# homeassistant.components.notify.xmpp
#pyasn1==0.1.9

# homeassistant.components.device_tracker.bbox
# homeassistant.components.sensor.bbox
#pybbox==0.0.5-alpha

# homeassistant.components.device_tracker.bluetooth_tracker
# pybluez==0.22

# homeassistant.components.media_player.cast
DEPEND="${DEPEND} google? ( =dev-python/pychromecast-0.7.6[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.cmus
#pycmus==0.1.0

# homeassistant.components.sensor.cups
# pycups==1.9.73

# homeassistant.components.envisalink
# homeassistant.components.zwave
# homeassistant.components.binary_sensor.hikvision
#pydispatcher==2.0.5

# homeassistant.components.media_player.emby
#pyemby==0.2

# homeassistant.components.envisalink
#pyenvisalink==1.9

# homeassistant.components.ifttt
DEPEND="${DEPEND} ifttt? ( =dev-python/pyfttt-0.3[${PYTHON_USEDEP}] )"

# homeassistant.components.remote.harmony
DEPEND="${DEPEND} harmony? ( =dev-python/pyharmony-1.0.12[${PYTHON_USEDEP}] )"

# homeassistant.components.binary_sensor.hikvision
#pyhik==0.0.6

# homeassistant.components.homematic
#pyhomematic==0.1.18

# homeassistant.components.device_tracker.icloud
#pyicloud==0.9.1

# homeassistant.components.sensor.lastfm
#pylast==1.6.0

# homeassistant.components.litejet
#pylitejet==0.1

# homeassistant.components.sensor.loopenergy
#pyloopenergy==0.0.15

# homeassistant.components.mochad
#pymochad==0.1.1

# homeassistant.components.device_tracker.netgear
#pynetgear==0.3.3

# homeassistant.components.switch.netio
#pynetio==0.1.6

# homeassistant.components.sensor.nut
#pynut2==2.1.2

# homeassistant.components.alarm_control_panel.nx584
# homeassistant.components.binary_sensor.nx584
#pynx584==0.2

# homeassistant.components.sensor.openweathermap
# homeassistant.components.weather.openweathermap
#pyowm==2.5.0

# homeassistant.components.switch.acer_projector
#pyserial==3.1.1

# homeassistant.components.device_tracker.snmp
# homeassistant.components.sensor.snmp
#pysnmp==4.3.2

# homeassistant.components.digital_ocean
#python-digitalocean==1.10.1

# homeassistant.components.sensor.darksky
#python-forecastio==1.3.5

# homeassistant.components.sensor.hp_ilo
#python-hpilo==3.9

# homeassistant.components.lirc
# python-lirc==1.2.3

# homeassistant.components.media_player.mpd
#python-mpd2==0.5.5

# homeassistant.components.switch.mystrom
#python-mystrom==0.3.6

# homeassistant.components.device_tracker.nmap_tracker
#python-nmap==0.6.1

# homeassistant.components.notify.pushover
#python-pushover==0.2

# homeassistant.components.sensor.synologydsm
#python-synology==0.1.0

# homeassistant.components.notify.telegram
#python-telegram-bot==5.3.0

# homeassistant.components.sensor.twitch
#python-twitch==1.3.0

# homeassistant.components.media_player.vlc
#python-vlc==1.1.2

# homeassistant.components.wink
#python-wink==0.11.0

# homeassistant.components.device_tracker.unifi
#pyunifi==1.3

# homeassistant.components.keyboard
# pyuserinput==0.1.11

# homeassistant.components.vera
#pyvera==0.2.21

# homeassistant.components.notify.html5
#pywebpush==0.6.1

# homeassistant.components.wemo
#pywemo==0.4.7

# homeassistant.components.light.yeelight
#pyyeelight==1.0-beta

# homeassistant.components.climate.radiotherm
#radiotherm==1.2

# homeassistant.components.switch.rpi_rf
# rpi-rf==0.9.5

# homeassistant.components.media_player.yamaha
#rxv==0.4.0

# homeassistant.components.media_player.samsungtv
DEPEND="${DEPEND} samsung? ( =dev-python/samsungctl-0.5.1[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.deutsche_bahn
#schiene==0.18

# homeassistant.components.scsgate
#scsgate==0.1.0

# homeassistant.components.notify.sendgrid
#sendgrid==3.6.3

# homeassistant.components.sensor.sensehat
#sense-hat==2.2.0

# homeassistant.components.media_player.aquostv
#sharp-aquos-rc==0.2

# homeassistant.components.notify.slack
#slacker==0.9.30

# homeassistant.components.notify.xmpp
#sleekxmpp==1.3.1

# homeassistant.components.sleepiq
#sleepyq==0.6

# homeassistant.components.media_player.snapcast
#snapcast==1.2.2

# homeassistant.components.climate.honeywell
#somecomfort==0.3.2

# homeassistant.components.sensor.speedtest
#speedtest-cli==1.0.0

# homeassistant.components.recorder
# homeassistant.scripts.db_migrator
#sqlalchemy==1.1.4

# homeassistant.components.statsd
#statsd==3.2.1

# homeassistant.components.sensor.steam_online
#steamodd==4.21

# homeassistant.components.tellstick
# homeassistant.components.sensor.tellstick
#tellcore-py==1.1.2

# homeassistant.components.tellduslive
#tellduslive==0.1.13

# homeassistant.components.sensor.temper
#temperusb==1.5.1

# homeassistant.components.thingspeak
#thingspeak==0.4.0

# homeassistant.components.sensor.transmission
# homeassistant.components.switch.transmission
#transmissionrpc==0.11

# homeassistant.components.notify.twilio_sms
#twilio==5.4.0

# homeassistant.components.sensor.uber
#uber_rides==0.2.7

# homeassistant.components.device_tracker.unifi
#urllib3

# homeassistant.components.camera.uvc
#uvcclient==0.9.0

# homeassistant.components.device_tracker.volvooncall
#volvooncall==0.1.1

# homeassistant.components.verisure
#vsure==0.11.1

# homeassistant.components.sensor.vasttrafik
#vtjp==0.1.11

# homeassistant.components.media_player.panasonic_viera
# homeassistant.components.media_player.webostv
# homeassistant.components.switch.wake_on_lan
#DEPEND="${DEPEND} wakeonlan? ( =dev-python/wakeonlan-0.2.2[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.gpmdp
#DEPEND="${DEPEND} gpmdp? ( =dev-python/websocket-client-0.37.0[${PYTHON_USEDEP}] )"

# homeassistant.components.media_player.webostv
#DEPEND="${DEPEND} webostv? ( =dev-python/websockets-3.2[${PYTHON_USEDEP}] )"

# homeassistant.components.zigbee
#DEPEND="${DEPEND} xbee ( =xbee-helper-0.0.7[${PYTHON_USEDEP}]  )"

# homeassistant.components.sensor.xbox_live
#DEPEND="${DEPEND} xboxapi? ( =dev-python/xboxapi-0.1.1[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.swiss_hydrological_data
# homeassistant.components.sensor.ted5000
# homeassistant.components.sensor.yr
DEPEND="${DEPEND} xml? ( =dev-python/xmltodict-0.10.2[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.yahoo_finance
DEPEND="${DEPEND} yahoo? ( =dev-python/yahoo-finance-1.4.0[${PYTHON_USEDEP}] )"

# homeassistant.components.sensor.yweather
DEPEND="${DEPEND} yahoo? ( =dev-python/yahooweather-0.8[${PYTHON_USEDEP}] )"

# homeassistant.components.zeroconf
DEPEND="${DEPEND} zeroconf? ( =dev-python/zeroconf-0.17.6[${PYTHON_USEDEP}] )"

RDEPEND="${DEPEND}"
