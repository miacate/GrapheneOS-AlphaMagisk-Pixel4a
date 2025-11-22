# Declare associative arrays and variables
declare -A ADDITIONALS
declare -A AVBROOT
declare -A GRAPHENEOS
declare -A KEYS
declare -A MAGISK
declare -A OUTPUTS
declare -A VERSION

# Build Specifications
ARCH="x86_64-unknown-linux-gnu" # for Linux
# ARCH="universal-apple-darwin" # for macOS
# ARCH="x86_64-pc-windows-msvc" # for Windows

# Initial setup environment variables
CLEANUP="${CLEANUP:-'false'}"                # Clean up after the script finishes
DEVICE_NAME="${DEVICE_NAME:-}"               # Device name, passed from the CI environment
INTERACTIVE_MODE="${INTERACTIVE_MODE:-true}" # Enable interactive mode
WORKDIR=".tmp"

# GitHub variables
DOMAIN="https://github.com"
REPOSITORY="PixeneOS" # GitHub repository name
USER="pixincreate"    # GitHub username
# not worth changing for personal repo since there are updates for the submods that I don't want to manage


# Application version variables
VERSION[AFSR]="${VERSION[AFSR]:-1.0.4}"
#VERSION[ALTERINSTALLER]="${VERSION[ALTERINSTALLER]:-2.0}"
VERSION[AVBROOT]="${VERSION[AVBROOT]:-3.23.2}"
VERSION[AVBROOT_SETUP]="16636c3" # Commit hash
VERSION[BCR]="${VERSION[BCR]:-1.85}"
VERSION[CUSTOTA]="${VERSION[CUSTOTA]:-5.18}"
# seems to cause issues if not present
VERSION[GRAPHENEOS]="${VERSION[GRAPHENEOS]:-}"
VERSION[MAGISK]="${VERSION[MAGISK]:-30400}" # find updated versions in the telegram group
VERSION[MSD]="${VERSION[MSD]:-1.18}"
VERSION[OEMUNLOCKONBOOT]="${VERSION[OEMUNLOCKONBOOT]:-1.3}"

# Magisk
MAGISK[PREINIT]="${MAGISK_PREINIT:-}"
MAGISK[URL]="https://files.catbox.moe/e5nade.apk"
# was using litterbox but had issues resolving for some reason
# more longterm storage could be found at fileditch.com for max 10G or catbox.moe for 200MB
## litterbox has a 1GB max
###
# see here for new apks https://t.me/magiskalpha

# Keys
KEYS[AVB]="${KEYS[AVB]:-avb.key}"
KEYS[AVB_BASE64]="${KEYS[AVB_BASE64]:-''}"
KEYS[CERT_OTA]="${KEYS[CERT_OTA]:-ota.crt}"
KEYS[CERT_OTA_BASE64]="${KEYS[CERT_OTA_BASE64]:-''}"
KEYS[OTA]="${KEYS[OTA]:-ota.key}"
KEYS[OTA_BASE64]="${KEYS[OTA_BASE64]:-''}"
KEYS[PKMD]="${KEYS[PKMD]:-avb_pkmd.bin}"

# GrapheneOS
GRAPHENEOS[OTA_BASE_URL]="https://releases.grapheneos.org"
GRAPHENEOS[UPDATE_CHANNEL]="${GRAPHENEOS_UPDATE_CHANNEL:-stable}"
GRAPHENEOS[UPDATE_TYPE]="${GRAPHENEOS[UPDATE_TYPE]:-ota_update}" # avbroot supports only `ota_update` and not `install` (factory images)
GRAPHENEOS[OTA_URL]="${GRAPHENEOS[OTA_URL]:-}"                   # Will be constructed from the latest version
GRAPHENEOS[OTA_TARGET]="${GRAPHENEOS[OTA_TARGET]:-}"             # Will be constructed from the latest version

# Additionals

# Modules
ADDITIONALS[AFSR]="${ADDITIONALS[AFSR]:-true}"                       # Android File system repack
ADDITIONALS[ALTERINSTALLER]="${ADDITIONALS[ALTERINSTALLER]:-false}"   # Spoof Android package manager installer fields
ADDITIONALS[BCR]="${ADDITIONALS[BCR]:-true}"                         # Basic Call Recorder
ADDITIONALS[CUSTOTA]="${ADDITIONALS[CUSTOTA]:-false}"                 # Custom OTA Updater app
ADDITIONALS[MSD]="${ADDITIONALS[MSD]:-true}"                         # Mass Storage Device on USB
ADDITIONALS[OEMUNLOCKONBOOT]="${ADDITIONALS[OEMUNLOCKONBOOT]:-true}" # toggle OEM unlock button on boot
# Tools
ADDITIONALS[AVBROOT]="${ADDITIONALS[AVBROOT]:-true}"                   # Android Verified Boot Root
ADDITIONALS[CUSTOTA_TOOL]="${ADDITIONALS[CUSTOTA_TOOL]:-false}"         # Custom OTA Tool
ADDITIONALS[MY_AVBROOT_SETUP]="${ADDITIONALS[MY_AVBROOT_SETUP]:-true}" # My AVBRoot setup

ADDITIONALS[ROOT]="${ADDITIONALS_ROOT:-false}"   # Only Magisk is supported
ADDITIONALS[RETRY]="${ADDITIONALS[RETRY]:-true}" # Auto download signatures

# Outputs
OUTPUTS[PATCHED_OTA]="${OUTPUTS[PATCHED_OTA]:-}"
