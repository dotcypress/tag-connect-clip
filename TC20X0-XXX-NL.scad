// Tag-Connect No-Leg Cable Clip
// https://www.tag-connect.com/technical
// 
// Supported cables:
//  - TC2030-CTX-NL 6-pin ARM Cortex Cable with 10-Pin Ribbon Connector (for FTSH-105)
//  - TC2030-IDC-NL 6-Pin No-Legs Tag-Connect Cable with Ribbon Connector
//  - TC2030-MCP-NL 6-Pin No-Legs Cable with RJ12 Modular Plug (for Microchip ICD)
//  - TC2050-IDC-NL 10-Pin No-Legs Cable with Ribbon Connector.
//  - TC2050-IDC-NL-430 10-Pin No Leg Cable for use with MSP430 / FET430
//  - TC2070-IDC-NL 14-Pin No-Legs Cable with Ribbon Connector

$fn = 64;
epsilon = 0.01;

TagConnectRodRadius = 0.495;
TagConnectRodSpacing = 1.016;
TagConnectPinSpacing = 1.27;
TagConnectClipRadius = TagConnectRodRadius + 0.5;

module TagConnectClip(pins, height = 2.2) {
  assert(pins == 6 || pins == 10 || pins == 14);

  rodOffset = (pins / 2 + 1) * TagConnectPinSpacing;

  difference() {
    hull() {
      cylinder(r = TagConnectClipRadius, h = height, center = true);
      cylinder(r = TagConnectClipRadius + 1, h = height/3, center = true);
      translate([rodOffset, TagConnectRodSpacing, 0]) {
        cylinder(r = TagConnectClipRadius, h = height, center = true);
        cylinder(r = TagConnectClipRadius + 1, h = height/3, center = true);
      }
      translate([rodOffset, -TagConnectRodSpacing, 0]) {
        cylinder(r = TagConnectClipRadius, h = height, center = true);
        cylinder(r = TagConnectClipRadius + 1, h = height/3, center = true);
      }
    }
    union() {
      cylinder(r = TagConnectRodRadius, h = height * 2, center = true);
      translate([rodOffset, TagConnectRodSpacing, 0]) 
        cylinder(r = TagConnectRodRadius, h = height * 2, center = true);
      translate([rodOffset, -TagConnectRodSpacing, 0]) 
        cylinder(r = TagConnectRodRadius, h = height * 2, center = true);
    }
  }
}

module Demo() {
  rotate([0, 0, 0]) translate([3, 0, 0]) TagConnectClip(6);
  rotate([0, 0, 120]) translate([3, 0, 0]) TagConnectClip(10);
  rotate([0, 0, 240]) translate([3, 0, 0]) TagConnectClip(14);
}

Demo();