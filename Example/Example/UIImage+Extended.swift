/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
 */

import UIKit

extension UIImage {

    static func decompressedImageFromImageString(filename: String) -> UIImage {
        let image = UIImage(named: filename)!
        UIGraphicsBeginImageContextWithOptions(image.size, true, 0)
        image.drawAtPoint(CGPoint())
        let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return decompressedImage
    }
}
