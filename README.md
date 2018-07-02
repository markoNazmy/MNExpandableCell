# MNExpandableTableView

[![CI Status](https://img.shields.io/travis/markoNazmy/MNExpandableCell.svg?style=flat)](https://travis-ci.org/markoNazmy/MNExpandableCell)
[![Version](https://img.shields.io/cocoapods/v/MNExpandableCell.svg?style=flat)](https://cocoapods.org/pods/MNExpandableCell)
[![License](https://img.shields.io/cocoapods/l/MNExpandableCell.svg?style=flat)](https://cocoapods.org/pods/MNExpandableCell)
[![Platform](https://img.shields.io/cocoapods/p/MNExpandableCell.svg?style=flat)](https://cocoapods.org/pods/MNExpandableCell)

## Description

this library for making ExpandableTableView in a very simple way without more effort in calculating heights and tableView expanding issues

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
<br>
<br>
![alt text](https://github.com/markoNazmy/MNExpandableCell/blob/master/ExpandableTableView.gif "sample GIF")
## Installation

MNExpandableCell is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MNExpandableCell'
```
## Usage

### Quick Start
see the Example project usage to understand this code <br>
put the custom view as view in your storyboard or NIB then :
```swift
import MNExpandableCell

MNExpandableCellUIModelArray = [MNExpandableCellUIModel.init(headerView: header, bodyView: body, expandingView: header, expanded: false, expansionCompletetion: {
            uiImageView.rotateView()
        }, expandingTimeInterval: 0.5, expandCompletion: nil, collapseCompletion: nil)
            ,MNExpandableCellUIModel.init(headerView: header2, bodyView: body2, expandingView: header2, expanded: false, expansionCompletetion: {
                uiImageView2.rotateView()
            }, expandingTimeInterval: 0.5, expandCompletion: nil, collapseCompletion: nil)
            ,MNExpandableCellUIModel.init(headerView: header3, bodyView: body3, expandingView: header3, expanded: false, expansionCompletetion: {
                uiImageView3.rotateView()
            }, expandingTimeInterval: 0.5, expandCompletion: nil, collapseCompletion: nil)
            ,MNExpandableCellUIModel.init(headerView: header4, bodyView: body4, expandingView: header4, expanded: false, expansionCompletetion: {
                uiImageView4.rotateView()
            }, expandingTimeInterval: 0.5, expandCompletion: nil, collapseCompletion: nil)
        ]
tabelView.prepareView(MNExpandableCellUIModelArray: MNExpandableCellUIModelArray)
```

## Model Description
```swift
public class MNExpandableCellUIModel {
    public var headerView: UIView
    public var bodyView: UIView
    public var expandingView: UIView?
    public var expanded: Bool
    public var expansionAnimationClouser: (()->())?
    public var expandCompletion: (()->())?
    public var collapseCompletion: (()->())?
    public var expandingTimeInterval: TimeInterval
}
```

     - Parameter headerView: UIView this is the headerView for expandable cell
     - Parameter bodyView: UIView this is the view that will be expanded
     - Parameter expandingView: UIView? this an optional view to have the action to expand or collapse the view by default will be the header view
     - Parameter expanded: Bool boolean to set the state of the cell will be expanded or not by default
     - Parameter expansionAnimationClouser: (()->())? this clouser if you want to animate something with the animation of expanding and collapseing the cell
     - Parameter expandCompletion: (()->())? this clouser to be called after finishing the expanding animation
     - Parameter collapseCompletion: (()->())? this clouser to be called after finishing the collapsing animation
     - Parameter expandingTimeInterval: TimeInterval this is duration for each cell animation

## Author

Marko Nazmy Armya. 
[email me](mailto:marko.nazmy@gmail.com)

## License

MNExpandableCell is available under the MIT license. See the LICENSE file for more info.
