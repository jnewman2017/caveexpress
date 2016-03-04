include(BundleUtilities)

option(HD_VERSION "Build the HD versions of the games" OFF)
set(UNITTESTS OFF)
set(TOOLS OFF)
set(USE_BUILTIN ON)
set(IOS_PROVISIONG_PROFILES_DIR "$ENV{HOME}/Library/MobileDevice/Provisioning Profiles/")

macro(cp_ios_prepare_content TARGET BUNDLED)
	if (EXISTS ${ROOT_DIR}/cmake/${TARGET}.xcscheme)
		configure_file(${ROOT_DIR}/cmake/${TARGET}.xcscheme ${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME}.xcodeproj/xcshareddata/xcschemes/${TARGET}.xcscheme)
	endif()
endmacro()

macro(cp_ios_generate_plist_file TARGET)
	set(PLIST_PATH ${PROJECT_BINARY_DIR}/Info.plist)
	set_target_properties(${TARGET} PROPERTIES MACOSX_BUNDLE_INFO_PLIST ${PLIST_PATH})
	configure_file(${ROOT_DIR}/cmake/iOSBundleInfo.plist.template ${PLIST_PATH} @ONLY)
endmacro()

macro(cp_ios_get_provisioning_profiles PROFILE_NAME PROVISIONG_PROFILES_DIR RESULT)
	file(GLOB FILES ${PROVISIONG_PROFILES_DIR}/*.mobileprovision)
	set(LIST "")
	foreach(FILE ${FILES})
		cp_message("Looking in ${FILE} for the provisioning profile")
		file(STRINGS "${FILE}" NAME REGEX "${PROFILE_NAME}")
		if (NAME)
			list(APPEND LIST ${FILE})
		endif()
	endforeach()
	if (LIST)
		list(APPEND ${RESULT} ${LIST})
	endif()
endmacro()

macro(cp_ios_import_key KEYCHAIN_NAME)
	set(KEYCHAIN_FILE ios-build.keychain)
	# TODO: find_host_program
	set(SECURITY_BIN security)
	# TODO: find_host_program
	set(CODESIGN_BIN /usr/bin/codesign)
	file(MAKE_DIRECTORY ${IOS_PROVISIONG_PROFILES_DIR})
	set(DEVELOPMENT_KEY_PASSWORD "123")
	set(DISTRIBUTION_KEY_PASSWORD "123")
	add_custom_command(TARGET ALL PRE_BUILD
		COMMAND ${SECURITY_BIN} ARGS create-keychain -p ${KEYCHAIN_NAME} ${KEYCHAIN_FILE}
		COMMAND ${SECURITY_BIN} ARGS default-keychain -s ${KEYCHAIN_FILE}
		COMMAND ${SECURITY_BIN} ARGS unlock-keychain -p ${KEYCHAIN_NAME} ${KEYCHAIN_FILE}
		COMMAND ${SECURITY_BIN} ARGS set-keychain-settings -t 3600 -u ${KEYCHAIN_FILE}
		COMMAND ${SECURITY_BIN} ARGS import ./scripts/certs/dist.cer -k ${KEYCHAIN_FILE} -T ${CODESIGN_BIN}
		COMMAND ${SECURITY_BIN} ARGS import ./scripts/certs/dev.cer -k ${KEYCHAIN_FILE} -T ${CODESIGN_BIN}
		COMMAND ${SECURITY_BIN} ARGS import ./scripts/certs/dist.p12 -k ${KEYCHAIN_FILE} -P ${DISTRIBUTION_KEY_PASSWORD} -T ${CODESIGN_BIN}
		COMMAND ${SECURITY_BIN} ARGS import ./scripts/certs/dev.p12 -k ${KEYCHAIN_FILE} -P ${DEVELOPMENT_KEY_PASSWORD} -T ${CODESIGN_BIN}
		COMMAND ${SECURITY_BIN} ARGS list-keychains
		COMMAND ${SECURITY_BIN} ARGS find-identity -p codesigning  ~/Library/Keychains/${KEYCHAIN_FILE}
		COMMENT "Set up the signing keys")
	add_custom_command(TARGET ALL PRE_BUILD
		COMMAND ${CMAKE_COMMAND} ARGS -E copy ./scripts/profiles/iOSTeam_Provisioning_Profile_.mobileprovision ${IOS_PROVISIONG_PROFILES_DIR}
		COMMENT "Copy provision profile")
	add_custom_command(TARGET ALL PRE_BUILD
		COMMAND ${CMAKE_COMMAND} ARGS -E copy ./scripts/profiles/DISTRIBUTION_PROFILE_NAME.mobileprovision ${IOS_PROVISIONG_PROFILES_DIR}
		COMMENT "Copy provision profile")
endmacro()

macro(cp_ios_add_target_properties TARGET VERSION VERSION_CODE)
	cp_message("Set ios parameters")
	cp_set_properties(${TARGET} MACOSX_BUNDLE_LONG_VERSION_STRING "${VERSION}")
	cp_set_properties(${TARGET} MACOSX_BUNDLE_SHORT_VERSION_STRING "${VERSION_CODE}")
	cp_set_properties(${TARGET} MACOSX_BUNDLE_BUNDLE_VERSION "${VERSION_CODE}")
	cp_set_properties(${TARGET} MACOSX_BUNDLE_COPYRIGHT "CaveProductions")
	cp_set_properties(${TARGET} MACOSX_BUNDLE_INFO_STRING "")
	cp_set_properties(${TARGET} MACOSX_BUNDLE_GUI_IDENTIFIER "org.${TARGET}")
	cp_set_properties(${TARGET} MACOSX_BUNDLE_ICON_FILE "${TARGET}.icns")
	cp_set_properties(${TARGET} PROPERTIES XCODE_ATTRIBUTE_INSTALL_PATH "/Applications")
	if (RELEASE)
		set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer: Martin Gerhardy")
	else()
		set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer")
	endif()
	cp_set_properties(${TARGET} XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ${CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY})
	cp_set_properties(${TARGET} XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "1,2")
	if (${CMAKE_GENERATOR} STREQUAL "Xcode")
		cp_set_properties(${TARGET} MACOSX_BUNDLE_EXECUTABLE_NAME \${EXECUTABLE_NAME})
		cp_set_properties(${TARGET} MACOSX_BUNDLE_PRODUCT_NAME \${PRODUCT_NAME})
		cp_set_properties(${TARGET} MACOSX_BUNDLE_BUNDLE_NAME \${PRODUCT_NAME})
	else()
		cp_set_properties(${TARGET} MACOSX_BUNDLE_EXECUTABLE_NAME "${TARGET}")
		cp_set_properties(${TARGET} MACOSX_BUNDLE_PRODUCT_NAME "${TARGET}")
		cp_set_properties(${TARGET} MACOSX_BUNDLE_BUNDLE_NAME "${TARGET}")
	endif()
	#cp_set_properties(${TARGET} MACOSX_BUNDLE TRUE)
	cp_ios_generate_plist_file(${TARGET})
endmacro()
