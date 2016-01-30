/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
 */

import Foundation

struct Renderer: Presenter {

    func presentModel(model: Resource, inView view: CollectionViewCellRender) {
        view.setTitle(model.title)
        view.setDescription(model.description)
        view.setBackgroundImage(model.image)
    }
}
