/* 
 Copyright 2012 Javier Soto (ios@javisoto.es)
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License. 
 */

#import "WebServiceResponse.h"

@implementation WebServiceResponse

@synthesize code, message, body;

- (id)initWithDictionary:(NSDictionary *)_dictionary {
    
    if ((self = [super init])) 
    {
        if ([[_dictionary valueForKeyPath:@"response.status"] isEqualToString:@"ok"])
        {
            code = WSResponseNoError;
            self.body = [_dictionary valueForKeyPath:@"response.data"];
        }
        else 
        {
            self.code = WSResponseUndefinedError;
        }
    }
    
    return self;
}

- (BOOL)hasError
{
    return (code != WSResponseNoError);
}

- (void)dealloc {
    [message release];
    [body release];
    
    [super dealloc];
}

@end
