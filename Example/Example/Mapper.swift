/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
 */

import Foundation

protocol Mapper {
    associatedtype Input
    associatedtype Output

    static func mapElement(element: Input) -> Output
}
