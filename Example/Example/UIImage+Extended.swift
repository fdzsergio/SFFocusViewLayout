/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
 */

import UIKit

extension UIImage {

    static func decompress(with filename: String) -> UIImage {
        guard
            let image = UIImage(named: filename)
        else {
            fatalError()
        }
        UIGraphicsBeginImageContextWithOptions(image.size, true, 0)
        image.draw(at: CGPoint())
        guard
            let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
        else {
            fatalError()
        }
        UIGraphicsEndImageContext()
        return decompressedImage
    }
}
