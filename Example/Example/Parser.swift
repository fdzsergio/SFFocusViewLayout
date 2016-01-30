/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
 */

import Foundation

struct Parser: Mapper {

    static func mapElement(element: [String: String]) -> Resource {

        guard let title = element[Resource.Constant.Title],
            let description = element[Resource.Constant.Description],
            let filename = element[Resource.Constant.Filename] else {
                fatalError("error with parse elements")
        }

        return Resource(title: title, description: description, filename: filename)
    }
}
