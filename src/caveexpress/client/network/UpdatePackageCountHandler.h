#pragma once

#include "common/network/IProtocolHandler.h"
#include "common/network/messages/UpdatePackageCountMessage.h"
#include "client/ui/UI.h"
#include "client/ui/nodes/UINodeSprite.h"
#include "client/ui/windows/IUIMapWindow.h"

class UpdatePackageCountHandler: public IClientProtocolHandler {
public:
	void execute (const IProtocolMessage& message) override
	{
		const UpdatePackageCountMessage *msg = static_cast<const UpdatePackageCountMessage*>(&message);
		const uint8_t packages = msg->getPackages();
		UINodeSprite* node = UI::get().getNode<UINodeSprite>(UI_WINDOW_MAP, UINODE_PACKAGES);
		if (!node)
			return;
		node->clearSprites();
		const std::string name = SpriteDefinition::get().getSpriteName(EntityTypes::PACKAGE_ROCK,
				Animations::ANIMATION_IDLE);
		const SpritePtr sprite = UI::get().loadSprite(name);
		for (uint8_t i = 0; i < packages; ++i) {
			node->addSprite(sprite);
		}
		node->flash();
	}
};
