# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-kormoran

CONFIG += sailfishapp_qml

SOURCES +=

OTHER_FILES += qml/harbour-kormoran.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/harbour-kormoran.changes.in \
    rpm/harbour-kormoran.spec \
    rpm/harbour-kormoran.yaml \
    harbour-kormoran.desktop \