//
// 
//  WetherApI2
//
//  Created by Anna Yatsun on 16/01/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register(_ cellClass: AnyClass) {
        self.register(UINib(cellClass), forCellReuseIdentifier: toString(cellClass))
    }
    
    func dequeueReusableCell(withCellClass cellClass: AnyClass) -> UITableViewCell? {
        return self.dequeueReusableCell(withIdentifier: toString(cellClass))
    }

    func dequeueReusableCell(withCellClass cellClass: AnyClass, for indexPath: IndexPath) -> UITableViewCell {
       return self.dequeueReusableCell(withIdentifier: toString(cellClass), for: indexPath)

    }
}
