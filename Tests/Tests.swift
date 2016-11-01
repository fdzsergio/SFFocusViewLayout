//
//  Tests.swift
//  Tests
//
//  Created by Sergio Fernández Durán on 1/30/16.
//  Copyright © 2016 fdzsergio. All rights reserved.
//

import XCTest

@testable import SFFocusViewLayout

final class Tests: XCTestCase, CollectionViewControllerDependencies {

    private let focusViewLayout: SFFocusViewLayout = Tests.focusViewLayout
    private let collectionViewController: CollectionViewController = Tests.collectionViewController

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        let focusViewLayoutSize = self.focusViewLayout.collectionViewContentSize
        let collectionViewControllerSize = self.collectionViewController.view.frame.size

        XCTAssertEqual(focusViewLayoutSize.width, collectionViewControllerSize.width)
        XCTAssertEqual(focusViewLayoutSize.height, collectionViewControllerSize.height-self.focusViewLayout.dragOffset)
    }

    func testLayoutHasSmoothScrolling() {
        let proposedOffset = focusViewLayout.targetContentOffset(forProposedContentOffset: CGPoint(), withScrollingVelocity: CGPoint())

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

        let attributes = focusViewLayout.layoutAttributesForElements(in: CGRect())!
        
        XCTAssertEqual(focusViewLayout.cached, attributes)
    }

    func testLayoutHasLayoutAttributesAtIndexPath() {
        collectionViewController.items = [0, 1, 2]

        collectionViewController.view.layoutIfNeeded()

        let indexPath = IndexPath(item: 0, section: 0)
        let attribute = focusViewLayout.layoutAttributesForItem(at: indexPath)

        XCTAssertEqual(focusViewLayout.cached[0], attribute)
    }

    func testLayoutShouldInvalidateLayoutForBoundsChange() {
        XCTAssertTrue(focusViewLayout.shouldInvalidateLayout(forBoundsChange: CGRect()))
    }
    
    func testCanPrepareLayoutForCollectionViewWithZeroSections() {
        collectionViewController.items = []
        focusViewLayout.prepare()
        
        XCTAssertEqual(focusViewLayout.cached.count, 0);
    }

}
