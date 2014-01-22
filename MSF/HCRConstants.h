//
//  HCRConstants.h
//  UNHCR
//
//  Created by Sean Conrad on 1/20/14.
//  Copyright (c) 2014 Sean Conrad. All rights reserved.
//

#ifndef UNHCR_HCRConstants_h
#define UNHCR_HCRConstants_h

#define HCRNotificationAlertNotificationReceived @"HCRNotificationAlertNotificationReceived"

#ifdef DEBUG
#define HCRENVIRONMENT @"debug"
#else
#ifdef PRODUCTION
#define HCRENVIRONMENT @"production"
#else
#define HCRENVIRONMENT @"testflight"
#endif
#endif

#endif
