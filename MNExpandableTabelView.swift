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
    @IBOutlet weak var tableView: MNTableView!
    @IBOutlet weak var contentView: UIView!
    
    private let nibFileName = "MNExpandableTabelView"
    var arr : [MNExpandableCellUIModel] = []

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed(nibFileName, owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        prepareView()
    }
    
    func prepareView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: MNExpandableCell.MNExpandableCellNibName, bundle: Bundle.main), forCellReuseIdentifier: MNExpandableCell.MNExpandableCellNibName)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 20
        tableView.contentSizeChanged = {[weak self] h in
            self?.tableViewHeightConstraint.constant = h
        }
        tableView.reloadData()
        
        let header: UIView = UIView.init()
        let headerLabel: UILabel = UILabel.init()
        header.addSubview(headerLabel)
        headerLabel.snp.makeConstraints({ m in
            m.edges.equalTo(0)
        })
        headerLabel.text = "dasjfsdbfjk\rsdbfbsdhfbsdhb\rfhdsbfbsdhfbsdhb"
        let body: UIView = UIView.init()
        let bodyLabel: UILabel = UILabel.init()
        body.addSubview(bodyLabel)
        bodyLabel.snp.makeConstraints({ m in
            m.edges.equalTo(0)
        })
        bodyLabel.text = "dasjfsdbfjk\rsdbfbsdhfbsdhb\rfhdsbfbsdhfbsdhbdasjfsdbfjk\rsdbfbsdhfbsdhb\rfhdsbfbsdhfbsdhbdasjfsdbfjk\rsdbfbsdhfbsdhb\rfhdsbfbsdhfbsdhbdasjfsdbfjk\rsdbfbsdhfbsdhb\rfhdsbfbsdhfbsdhbdasjfsdbfjk\rsdbfbsdhfbsdhb\rfhdsbfbsdhfbsdhb"
        arr = [MNExpandableCellUIModel.init(headerView: header, bodyView: body, expandingView: body, expanded: false, expansionCompletetion: nil, expandingTimeInterval: 0.2)
            ,MNExpandableCellUIModel.init(headerView: header, bodyView: body, expandingView: body, expanded: false, expansionCompletetion: nil, expandingTimeInterval: 0.2)
            ,MNExpandableCellUIModel.init(headerView: header, bodyView: body, expandingView: body, expanded: false, expansionCompletetion: nil, expandingTimeInterval: 0.2)
            ,MNExpandableCellUIModel.init(headerView: header, bodyView: body, expandingView: body, expanded: false, expansionCompletetion: nil, expandingTimeInterval: 0.2)
        ]
    }
}



extension MNExpandableTabelView: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: MNExpandableCell.MNExpandableCellNibName) as! MNExpandableCell
        cell.configureCell(uiModel: arr[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        arr[indexPath.row].expanded = true
        tableView.reloadData()
        return indexPath
    }
    
}


public class MNTableView: UITableView {
    var contentSizeChanged : ((CGFloat) -> Void)?
    override public func layoutSubviews() {
        super.layoutSubviews()
        contentSizeChanged?(self.contentSize.height)
        
    }
}
