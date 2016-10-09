//
//  Tests.swift
//  Tests
//
//  Created by Sergio Fernández Durán on 1/30/16.
//  Copyright © 2016 fdzsergio. All rights reserved.
//

import XCTest

@testable import SFFocusViewLayout

class Tests: XCTestCase {

    var focusViewLayout: SFFocusViewLayout!
    var collectionViewController: CollectionViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        focusViewLayout = SFFocusViewLayout()
        collectionViewController = CollectionViewController(collectionViewLayout: focusViewLayout)
        collectionViewController.view.frame = CGRect(x: 0, y: 0, width: 600, height: 600)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFocusViewLayoutHasDefaultValues() {
        XCTAssertEqual(focusViewLayout.standardHeight, 100)
        XCTAssertEqual(focusViewLayout.focusedHeight, 280)
        XCTAssertEqual(focusViewLayout.dragOffset, 180)
    }

    func testLayoutContentViewSizeUsesController() {
        let focusViewLayoutSize = self.focusViewLayout.collectionViewContentSize()
        let collectionViewControllerSize = self.collectionViewController.view.frame.size

        XCTAssertEqual(focusViewLayoutSize.width, collectionViewControllerSize.width)
        XCTAssertEqual(focusViewLayoutSize.height, collectionViewControllerSize.height-self.focusViewLayout.dragOffset)
    }

    func testLayoutHasSmoothScrolling() {
        let proposedOffset = focusViewLayout.targetContentOffsetForProposedContentOffset(CGPoint(), withScrollingVelocity: CGPoint())

        XCTAssertEqual(proposedOffset.x, 0)
        XCTAssertEqual(proposedOffset.y, 0)
    }

    func testLayoutHasCachedLayoutAttributes() {
        collectionViewController.items = [0]

        collectionViewController.view.layoutIfNeeded()

        XCTAssertEqual(focusViewLayout.cached.count, 1);
    }

    func testLayoutAttributeIsCached() {
        collectionViewController.items = [0]

        collectionViewController.view.layoutIfNeeded()

        let attributes = focusViewLayout.layoutAttributesForElementsInRect(CGRect())!
        
        XCTAssertEqual(focusViewLayout.cached, attributes)
    }

    func testLayoutHasLayoutAttributesAtIndexPath() {
        collectionViewController.items = [0, 1, 2]

        collectionViewController.view.layoutIfNeeded()

        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        let attribute = focusViewLayout.layoutAttributesForItemAtIndexPath(indexPath)

        XCTAssertEqual(focusViewLayout.cached[0], attribute)
    }

    func testLayoutShouldInvalidateLayoutForBoundsChange() {
        XCTAssertTrue(focusViewLayout.shouldInvalidateLayoutForBoundsChange(CGRect()))
    }
    
    func testCanPrepareLayoutForCollectionViewWithZeroSections() {
        collectionViewController?.numberOfSectionsToReturn = 0
        focusViewLayout.prepareLayout()
    }

}
