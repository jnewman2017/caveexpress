#pragma once

#include "engine/common/Config.h"
#include "engine/common/ports/ISystem.h"
#include <SDL_platform.h>

#ifdef __WIN32__
#include "engine/common/ports/Windows.h"
#elif defined __MACOSX__
#include "engine/common/ports/Darwin.h"
#elif defined EMSCRIPTEN
#include "engine/common/ports/HTML5.h"
#else
#include "engine/common/ports/Unix.h"
#endif

inline ISystem& getSystem ()
{
#ifdef __WIN32__
	static Windows _system;
#elif defined __MACOSX__
	static Darwin _system;
#elif defined EMSCRIPTEN
	static HTML5 _system;
#else
	static Unix _system;
#endif
	return _system;
}

#define System getSystem()

#ifdef HAVE_EXECINFO_H
namespace {
	inline void globalSignalHandler (int s) {
		getSystem().signalHandler(s);
	}
}
#endif
