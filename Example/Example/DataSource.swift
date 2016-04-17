/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
 */

import Foundation

protocol DataSource: class {
    associatedtype Item
    var items: [Item] { get }

    var count: Int { get }
    var hasItems: Bool { get }

    subscript(index: Int) -> Item { get }
}

extension DataSource {

    var count: Int {
        return items.count
    }

    var hasItems: Bool {
        return count > 0
    }

    subscript(index: Int) -> Item {
        return items[index]
    }
}
