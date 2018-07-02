//
//  MNExpandableCell.swift
//  MNExpandableCell
//
//  Created by marko nazmy on 6/7/18.
//

import Foundation
import UIKit
import SnapKit

public class MNExpandableCell: UITableViewCell {
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var bodyView: UIView!
    
    var uiModel: MNExpandableCellUIModel!
    public static let MNExpandableCellNibName: String = "MNExpandableCell"
    private var animated: Bool = false
    
    public func resetCell() {
        headerView.subviews.map({ v in
            v.removeFromSuperview()
        })
        bodyView.subviews.map({ v in
            v.removeFromSuperview()
        })
    }
    
    public func configureCell(uiModel: MNExpandableCellUIModel) {
        self.uiModel = uiModel
        self.uiModel.expandingView?.addTapGestureRecognizer(action: {[weak self] in
            self?.animated = false
            uiModel.expanded = !uiModel.expanded
            uiModel.tableView?.reloadRows(at: [uiModel.indexPath], with: .none)
        })
        uiModel.headerView.removeFromSuperview()
        self.headerView.addSubview(uiModel.headerView)
        uiModel.headerView.snp.remakeConstraints({ remake in
            remake.edges.equalTo(0)
        })
        if uiModel.expanded {
            expandeCell(uiModel: uiModel)
        }else {
            collapseCell(uiModel: uiModel)
        }
    }
    
    private func expandeCell(uiModel: MNExpandableCellUIModel) {
        CATransaction.begin()
        uiModel.bodyView.alpha = 0
        bodyView.addSubview(uiModel.bodyView)
        uiModel.bodyView.snp.remakeConstraints({ make in
            make.trailing.equalTo(0)
            make.leading.equalTo(0)
            make.bottom.equalTo(0)
            make.top.equalTo(0)
        })
        bodyView.layoutSubviews()
        bodyView.layoutIfNeeded()
        CATransaction.setCompletionBlock({[weak self] in
            let originalFrame = uiModel.bodyView.frame
            let hiddenFrame = CGRect.init(x: originalFrame.origin.x, y: originalFrame.origin.y - originalFrame.size.height, width: originalFrame.size.width, height: originalFrame.size.height)
            uiModel.bodyView.frame = hiddenFrame
            UIView.animate(withDuration: self?.animated == false ? uiModel.expandingTimeInterval : 0, animations: {
                uiModel.expansionAnimationClouser?()
                uiModel.bodyView.alpha = 1
                uiModel.bodyView.frame = originalFrame
            }, completion: {[weak self] finish in
                if finish {
                    if self?.animated == false {
                        uiModel.expandCompletion?()
                    }
                    self?.animated = true
                }
            })
        })
        CATransaction.commit()
    }
    
    private func collapseCell(uiModel: MNExpandableCellUIModel) {
        let originalFrame = uiModel.bodyView.frame
        let hiddenFrame = CGRect.init(x: originalFrame.origin.x, y: originalFrame.origin.y - originalFrame.size.height, width: originalFrame.size.width, height: originalFrame.size.height)
        UIView.animate(withDuration: animated == false ? uiModel.expandingTimeInterval : 0, animations: {
            uiModel.expansionAnimationClouser?()
            uiModel.bodyView.alpha = 0
            uiModel.bodyView.frame = hiddenFrame
        }
            ,completion: {[weak self] finish in
                if finish {
                    uiModel.bodyView.removeFromSuperview()
                    uiModel.bodyView.frame = originalFrame
                    if self?.animated == false {
                        uiModel.collapseCompletion?()
                    }
                    self?.animated = true
                }
        })
    }
    
}

public class MNExpandableCellUIModel {
    public var headerView: UIView
    public var bodyView: UIView
    public var expandingView: UIView?
    public var expanded: Bool
    public var expansionAnimationClouser: (()->())?
    public var expandCompletion: (()->())?
    public var collapseCompletion: (()->())?
    public var expandingTimeInterval: TimeInterval
    var tableView: UITableView?
    var indexPath: IndexPath!
    /**
     Fill the UIModel for cell with data.
     
     - Parameter headerView: UIView this is the headerView for expandable cell
     - Parameter bodyView: UIView this is the view that will be expanded
     - Parameter expandingView: UIView? this an optional view to have the action to expand or collapse the view by default will be the header view
     - Parameter expanded: Bool boolean to set the state of the cell will be expanded or not by default
     - Parameter expansionAnimationClouser: (()->())? this clouser if you want to animate something with the animation of expanding and collapseing the cell
     - Parameter expandCompletion: (()->())? this clouser to be called after finishing the expanding animation
     - Parameter collapseCompletion: (()->())? this clouser to be called after finishing the collapsing animation
     - Parameter expandingTimeInterval: TimeInterval this is duration for each cell animation
     */
    public init( headerView: UIView
    , bodyView: UIView
    , expandingView: UIView?
    , expanded: Bool
    , expansionCompletetion: (()->())?
    , expandingTimeInterval: TimeInterval
    , expandCompletion: (()->())?
    , collapseCompletion: (()->())?) {
        self.headerView = headerView
        self.bodyView = bodyView
        self.expandingView = expandingView ?? headerView
        self.expanded = expanded
        self.expansionAnimationClouser = expansionCompletetion
        self.expandingTimeInterval = expandingTimeInterval
        self.expandCompletion = expandCompletion
        self.collapseCompletion = collapseCompletion
    }
}

