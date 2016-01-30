/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
 */

import UIKit

struct Resource {
    let title: String
    let description: String
    let filename: String
}

extension Resource {
    var image: UIImage {
        return UIImage.decompressedImageFromImageString(filename)
    }
}

extension Resource {

    struct Constant {
        static let Title = "title"
        static let Description = "detail"
        static let Filename = "background"
    }
}
