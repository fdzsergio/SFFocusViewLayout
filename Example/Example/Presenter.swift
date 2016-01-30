/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
 */

import Foundation

protocol Presenter {
    typealias Model
    typealias View

    func presentModel(model: Model, inView view: View)
}
