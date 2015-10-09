# SFFocusViewLayout

[![CI Status](http://img.shields.io/travis/fdzsergio/SFFocusViewLayout.svg?style=flat)](https://travis-ci.org/fdzsergio/SFFocusViewLayout)
[![Version](https://img.shields.io/cocoapods/v/SFFocusViewLayout.svg?style=flat)](http://cocoapods.org/pods/SFFocusViewLayout)
[![License](https://img.shields.io/cocoapods/l/SFFocusViewLayout.svg?style=flat)](http://cocoapods.org/pods/SFFocusViewLayout)
[![Platform](https://img.shields.io/cocoapods/p/SFFocusViewLayout.svg?style=flat)](http://cocoapods.org/pods/SFFocusViewLayout)

## Overview
SFFocusViewLayout is a UICollectionViewLayout subclass for displaying focused content on UICollectionView which is the largest cell of all.

<p align="center" >
	<img src="https://camo.githubusercontent.com/06041f1c7b3ecd3dd616dd7ba51e76adb60b7f9e/687474703a2f2f662e636c2e6c792f6974656d732f314b316a3044316d3172317632793042316934372f6578616d706c652e676966" alt="SFFocusViewLayout" title="SFFocusViewLayout">
</p>

## Usage

SFFocusViewLayout contains three properties to customize the interface.

```objc
@property (nonatomic) CGFloat standardHeight;
@property (nonatomic) CGFloat focusedHeight;
@property (nonatomic) CGFloat dragOffset;
```

- _focusedHeight_ is the height cells should be when focused.  Defaults to kSFFocusViewLayoutFocusedHeight
- _standardHeight_ is the height cells should be when collapsed.  Defaults to kSFFocusViewLayoutStandardHeight
- _dragOffset_ is the amount the user needs to scroll before the featured cell changes


## Installation

SFFocusViewLayout is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SFFocusViewLayout"
```

## Upcoming
- Carthage support
- Swift version

## Author

Sergio Fernández, fdz.sergio@gmail.com

## Acknowledgement

This [CocoaPods](https://cocoapods.org/pods/SFFocusViewLayout/) is heavily inspired by the Ultravisual example of [Ray Wenderlich](http://www.raywenderlich.com/99087/swift-expanding-cells-ios-collection-views).

## License

SFFocusViewLayout is available under the MIT license. See the LICENSE file for more info.
