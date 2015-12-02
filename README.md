# SFFocusViewLayout

[![CI Status](http://img.shields.io/travis/fdzsergio/SFFocusViewLayout.svg?style=flat)](https://travis-ci.org/fdzsergio/SFFocusViewLayout)
[![Version](https://img.shields.io/cocoapods/v/SFFocusViewLayout.svg?style=flat)](http://cocoapods.org/pods/SFFocusViewLayout)
[![codecov.io](https://img.shields.io/codecov/c/github/fdzsergio/SFFocusViewLayout.svg)](http://codecov.io/github/fdzsergio/SFFocusViewLayout)
[![License](https://img.shields.io/cocoapods/l/SFFocusViewLayout.svg?style=flat)](http://cocoapods.org/pods/SFFocusViewLayout)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/SFFocusViewLayout.svg?style=flat)](http://cocoapods.org/pods/SFFocusViewLayout)

## Overview
SFFocusViewLayout is a UICollectionViewLayout subclass for displaying focused content on UICollectionView which is the largest cell of all.

<p align="center" >
  
	<img src="./Screenshots/SFFocusViewLayout.gif" alt="SFFocusViewLayout" title="SFFocusViewLayout">

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

### CocoaPods

SFFocusViewLayout is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SFFocusViewLayout"
```
### Carthage

You can also install it via [Carthage](https://github.com/Carthage/Carthage). To do so, add the following to your Cartfile:

```ruby
github "fdzsergio/SFFocusViewLayout"
```

## Upcoming
- [x] Carthage support
- [x] Swift compatible

## Author

Sergio Fernández, fdz.sergio@gmail.com

## Acknowledgement

This [CocoaPod](https://cocoapods.org/pods/SFFocusViewLayout) is heavily inspired by the Ultravisual example of [Ray Wenderlich](http://www.raywenderlich.com/99087/swift-expanding-cells-ios-collection-views).

## License

SFFocusViewLayout is available under the MIT license. See the LICENSE file for more info.
