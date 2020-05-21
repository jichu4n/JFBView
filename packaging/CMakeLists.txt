# General CPack settings.
# -----------------------
set(CPACK_GENERATOR "${PACKAGE_FORMAT}")
set(CPACK_PACKAGE_VENDOR "Chuan Ji")
set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
set(
  CPACK_PACKAGE_DESCRIPTION_SUMMARY
  "PDF and image viewer for the Linux framebuffer."
)
set(CPACK_PACKAGE_FILE_NAME "${PACKAGE_FILE_PREFIX}")

# Debian CPack settings.
# ----------------------
set(CPACK_DEBIAN_PACKAGE_SECTION "text")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Chuan Ji <chuan@jichu4n.com>")
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE "https://github.com/jichu4n/jfbview")
set(
  CPACK_DEBIAN_PACKAGE_DEPENDS
  "libncurses5, libimlib2"
)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)

# RPM CPack settings.
# -------------------
set(CPACK_RPM_PACKAGE_LICENSE "Apache v2.0")
set(CPACK_RPM_PACKAGE_GROUP "Applications/Text")
set(CPACK_RPM_PACKAGE_URL "https://github.com/jichu4n/jfbview")
set(
  CPACK_RPM_PACKAGE_REQUIRES
  "ncurses-libs, imlib2"
)

# Enable CPack.
# -------------
include(CPack)
