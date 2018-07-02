//
//  MNExpandableTabelView.swift
//  MNExpandableCell
//
//  Created by marko nazmy on 6/8/18.
//

import Foundation
import UIKit

public class MNExpandableTabelView: UIView {
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet public weak var tableView: MNTableView!
    @IBOutlet weak var contentView: UIView!
    
    private let nibFileName = "MNExpandableTabelView"
    var MNExpandableCellUIModelArray: [MNExpandableCellUIModel] = []

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        MNExpandableTabelViewBundle.bundle()?.loadNibNamed(nibFileName, owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

    }
    
    func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: nibFileName, bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    public func prepareView(MNExpandableCellUIModelArray: [MNExpandableCellUIModel]) {
        self.MNExpandableCellUIModelArray = MNExpandableCellUIModelArray
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: MNExpandableCell.MNExpandableCellNibName, bundle: MNExpandableTabelViewBundle.bundle()), forCellReuseIdentifier: MNExpandableCell.MNExpandableCellNibName)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.contentSizeChanged = {[weak self] h in
            self?.tableViewHeightConstraint.constant = h
        }
        tableView.reloadData()
        tableView.separatorStyle = .none
    }
}

extension MNExpandableTabelView: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MNExpandableCellUIModelArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: MNExpandableCell.MNExpandableCellNibName) as! MNExpandableCell
        cell.resetCell()
        MNExpandableCellUIModelArray[indexPath.row].indexPath = indexPath
        MNExpandableCellUIModelArray[indexPath.row].tableView = tableView
        cell.configureCell(uiModel: MNExpandableCellUIModelArray[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}

public class MNTableView: UITableView {
    var contentSizeChanged : ((CGFloat) -> Void)?
    override public func layoutSubviews() {
        CATransaction.begin()
        super.layoutSubviews()
        CATransaction.setCompletionBlock({[weak self] in
            self?.contentSizeChanged?(self?.contentSize.height ?? 0)
        })
        CATransaction.commit()
    }
}

@objc public class  MNExpandableTabelViewBundle: NSObject {
    private static let bundleName = "MNExpandableCell"
    private static let bundleExtension = "bundle"
    
    private static let bundleIdentifier = "org.cocoapods.MNExpandableCell"
    
    @objc public static func bundle() -> Bundle? {
        let url = Bundle(for: self).url(forResource: bundleName, withExtension: bundleExtension)
        if let url = url {
            return Bundle(url: url)
        }
        return Bundle(identifier: bundleIdentifier)
    }
    @objc public static func customBundle() -> Bundle? {
        guard let bundleString : URL =  MNExpandableTabelViewBundle.bundle()?.url(forResource: "Base", withExtension: "lproj") else {
            return nil
        }
        let bundle = Bundle.init(url: bundleString)
        return bundle
    }
    
}

extension UIView {
    
    // In order to create computed properties for extensions, we need a key to
    // store and access the stored property
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Every time the user taps on the UIImageView, this function gets called,
    // which triggers the closure we stored
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
    
}

