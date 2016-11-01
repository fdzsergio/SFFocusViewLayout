/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
*/

import UIKit

/**
 `SFFocusViewLayout` is a subclass of `UICollectionViewLayout`
 for displaying focused content on UICollectionView which is
 the largest cell of all.

 By default, this UICollectionViewLayout has initialize a set
 of properties to work as designed.

 */
open class SFFocusViewLayout: UICollectionViewLayout {

    /**
     Standard height for collapsed cells.

     By default, this property is set to `100`.

     - Parameter standardHeight:     The collapsed height
     - Warning: this property must be smaller than focusedHeight
     */
    @IBInspectable open var standardHeight: CGFloat = 100

    /**
     Featured height for focused cell.

     By default, this property is set to `280`.

     - Parameter focusedHeight:     The expanded height
     - Warning: this property must be greater than standardHeight
     */

    @IBInspectable open var focusedHeight: CGFloat = 280


    /**
     Drag Offset is the amount the user needs to scroll before
     the featured cell changes.

     By default, this property is set to `180`.

     - Parameter dragOffset:    The amount user needs to change cell
     */
    @IBInspectable open var dragOffset: CGFloat = 180

    internal var cached = [UICollectionViewLayoutAttributes]()

    /// Return the size of all the content in the collection view
    override open var collectionViewContentSize : CGSize {
        let contentHeight = CGFloat(numberOfItems) * dragOffset + (height - dragOffset)
        return CGSize(width: width, height: contentHeight)
    }

    /// Return true so that the layout is continuously invalidated as the user scrolls
    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    /// Return the content offset of the nearest cell which achieves the nice snapping effect, similar to a paged UIScrollView
    open override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let proposedItemIndex = round(proposedContentOffset.y / dragOffset)
        let nearestPageOffset = proposedItemIndex * dragOffset
        // Smooth scrolling when user release the touch to focoused cell
        return CGPoint(x: 0, y: nearestPageOffset)
    }

    /// Return all attributes in the cache whose frame intersects with the rect passed to the method
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cached.filter { attributes in
            return attributes.frame.intersects(rect)
        }
    }

    /// Perform whatever calculations are needed to determine the position of the cells and views in the layout
    override open func prepare() {
        cached = [UICollectionViewLayoutAttributes]()

        // last rect will be used to calculate frames past the first one.  We initialize it to a non junk 0 value
        var frame = CGRect()
        var y: CGFloat = 0

        for item in 0..<numberOfItems {
            let indexPath = IndexPath(item: item, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)

            // Important because each cell has to slide over the top of the previous one
            attributes.zIndex = item

            // Initially set the height of the cell to the standard height
            var height = standardHeight

            if indexPath.item == currentFocusedItemIndex {
                // The featured cell
                y = yOffset - standardHeight * nextItemPercentageOffset
                height = focusedHeight
            } else if indexPath.item == (currentFocusedItemIndex + 1) && indexPath.item != numberOfItems {
                // The cell directly below the featured cell, which grows as the user scrolls
                let maxY = y + standardHeight
                height = standardHeight + max((focusedHeight - standardHeight) * nextItemPercentageOffset, 0)
                y = maxY - height
            } else {
                y = frame.origin.y + frame.size.height
            }

            frame = CGRect(x: 0, y: y, width: width, height: height)
            attributes.frame = frame
            cached.append(attributes)
            y = frame.maxY
        }
    }

    /// Returns the layout attributes for the item at the specified index path.
    override open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cached[indexPath.item]
    }
}

private extension UICollectionViewLayout {

    var numberOfItems: Int {
        return collectionView?.numberOfItems(inSection: 0) ?? 0
    }

    var width: CGFloat {
        return collectionView?.frame.width ?? 0
    }

    var height: CGFloat {
        return collectionView?.frame.height ?? 0
    }

    var yOffset: CGFloat {
        return collectionView?.contentOffset.y ?? 0
    }
}

private extension SFFocusViewLayout {

    /// Returns the item index of the currently featured cell
    var currentFocusedItemIndex: Int {
        return max(0, Int(yOffset / dragOffset))
    }

    // Returns a value between 0 and 1 that represents how close the next cell is to becoming the featured cell
    var nextItemPercentageOffset: CGFloat {
        return (yOffset / dragOffset) - CGFloat(currentFocusedItemIndex)
    }
}
