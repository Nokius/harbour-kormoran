Name: harbour-kormoran
Version: 0.1
Release: 1
Summary: A simple and straightforward Twitter client for SailfishOS
Group: Network
URL: https://github.com/hwesselmann/harbour-kormoran
License: MIT
Source0: harbour-kormoran-%{version}.tar.xz
BuildArch: noarch
Requires: libsailfishapp-launcher
Requires: python3-base
Requires: pyotherside-qml-plugin-python3-qt5
Requires: sailfishsilica-qt5

%description
A simple and straightforward Twitter client for SailfishOS

%prep
%setup -n harbour-kormoran

%install
rm -rf %{buildroot}

# Application files
TARGET=%{buildroot}/%{_datadir}/%{name}
mkdir -p $TARGET
cp -rpv kormoran.py $TARGET/
cp -rpv qml $TARGET/qml

# Desktop Entry
TARGET=%{buildroot}/%{_datadir}/applications
mkdir -p $TARGET
cp -rpv %{name}.desktop $TARGET/

# Icon
TARGET=%{buildroot}/%{_datadir}/icons/hicolor/86x86/apps/
mkdir -p $TARGET
cp -rpv harbour-kormoran.png $TARGET/%{name}.png

%files
%doc README COPYING
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
