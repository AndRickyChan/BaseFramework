//
//  BaseRequestMacro.h
//  BaseFramework
//
//  Created by rickychan on 2017/9/6.
//  Copyright © 2017年 rickychan. All rights reserved.
//

#ifndef BaseRequestMacro_h
#define BaseRequestMacro_h

#if DEBUG

#define url_request_base @"http://192.168.0.29:8686/OA2/"

#else

#define url_request_base @"http://192.168.0.29:8686/OA2/"

#endif

#define url_request_type_login @"login/open/check.action"




#endif /* BaseRequestMacro_h */
