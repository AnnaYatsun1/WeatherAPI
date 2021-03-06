//
//  WetherApI2
//
//  Created by Anna Yatsun on 16/01/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

protocol Synchronizable: class {
    
    func synchronize<Result>(_ execute: () -> Result) -> Result
}

extension Synchronizable {
    
    func synchronize<Result>(_ execute: () -> Result) -> Result {
        return synchronized(with: self, execute: execute)
    }
}

func synchronized<Key: AnyObject, Result>(
    with key: Key,
    execute: () -> Result
)
    -> Result
{
    objc_sync_enter(key)
    defer { objc_sync_exit(key) }
    
    return execute()
}
