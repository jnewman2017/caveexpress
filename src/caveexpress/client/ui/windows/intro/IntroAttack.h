#pragma once

#include "common/Compiler.h"
#include "client/ui/windows/intro/Intro.h"

class IntroAttack: public Intro {
public:
	IntroAttack (IFrontend* frontend);
protected:
	void addIntroNodes(UINode* parent) override;
};
