//
//  WetherApI2
//
//  Created by Anna Yatsun on 16/01/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

enum Closure {
    public typealias VoidCompletion = () -> ()
    public typealias VoidExecute = () -> ()
    
    public typealias Completion<Value> = (Value) -> ()
    public typealias Execute<Value> = (Value) -> ()
    

    public typealias SucessCompletion = (Data?) -> ()
    public typealias FailureCompletion = (Error?) -> ()
}
