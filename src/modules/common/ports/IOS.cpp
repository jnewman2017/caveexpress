#include "IOS.h"
#include "common/Application.h"
#include "IOSObjc.h"

IOS::IOS () :
		Unix()
{
}

IOS::~IOS ()
{
}

std::string IOS::getHomeDirectory ()
{
	return iosGetHomeDirectory();
}

void IOS::showAds (bool show)
{
	// TODO:
}

int IOS::openURL (const std::string& url, bool) const
{
	return iosOpenURL(url);
}

std::string IOS::getRateURL (const std::string& packageName) const
{
	return "http://itunes.com/apps/" + packageName;
}
