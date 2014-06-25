#pragma once

#include "UINodeSelector.h"

class UINodePaymentSelector: public UINodeBackgroundSelector<PaymentEntry> {
public:
	UINodePaymentSelector(IFrontend *frontend, int rows);
	virtual ~UINodePaymentSelector();

	std::string getText (const PaymentEntry& data) const;
	void renderSelectorEntry (int index, const PaymentEntry& data, int x, int y, int colWidth, int rowHeight, float alpha) const override;
	bool onPush () override;
	void reset () override;
	bool onSelect (const PaymentEntry& data) override;
};
