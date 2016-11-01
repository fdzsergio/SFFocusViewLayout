/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
 */

import Foundation

struct Renderer: Presenter {

    func present(model: Resource, in view: CollectionViewCellInterface) {
        view.setTitle(text: model.title)
        view.setDescription(text: model.description)
        view.setBackground(image: model.image)
    }
}
