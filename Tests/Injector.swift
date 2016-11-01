//
//  Injector.swift
//  SFFocusViewLayout
//
//  Created by sergio on 11/1/16.
//  Copyright © 2016 fdzsergio. All rights reserved.
//

import Foundation

@testable import SFFocusViewLayout

private let collectionViewLayout = SFFocusViewLayout()

protocol FocusViewLayoutDependencies {
    
    static var focusViewLayout: SFFocusViewLayout { get }
    
}

extension FocusViewLayoutDependencies {
    
    static var focusViewLayout: SFFocusViewLayout {
        return collectionViewLayout
    }

}

protocol CollectionViewControllerDependencies: FocusViewLayoutDependencies {
    
    static var collectionViewController: CollectionViewController { get }
    
}

extension CollectionViewControllerDependencies {
    
    static var collectionViewController: CollectionViewController {
        return CollectionViewController(collectionViewLayout: Self.focusViewLayout)
    }
}
