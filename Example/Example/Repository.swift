/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
 */

import Foundation

struct Repository: DataSource {

    let items: [Resource] = Repository.resources
}

private extension Repository {
    
    static var resources: [Resource] {
        guard
            let fileURL = Bundle.main
            .url(forResource: Constant.filename, withExtension: Constant.fileExtension),
            let resources = NSArray(contentsOf: fileURL) as? [[String: String]]
        else {
                fatalError("resource file not found")
        }
        
        return resources.flatMap(Parser.map)
    }

    private struct Constant {
        static let filename = "Resources"
        static let fileExtension = "plist"
    }
}
