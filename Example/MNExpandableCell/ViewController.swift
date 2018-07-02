//
//  ViewController.swift
//  MNExpandableCell
//
//  Created by markoNazmy on 06/07/2018.
//  Copyright (c) 2018 markoNazmy. All rights reserved.
//

import UIKit
import MNExpandableCell
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var tabelView: MNExpandableTableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        var MNExpandableCellUIModelArray: [MNExpandableCellUIModel] = []
        let header: UIView = UIView.init()
        let headerLabel: UILabel = UILabel.init()
        let uiImageView: UIImageView = UIImageView.init(image: #imageLiteral(resourceName: "arrowRightRed"))
        header.addSubview(uiImageView)
        uiImageView.snp.makeConstraints({ m in
            m.top.equalTo(20)
            m.trailing.equalTo(-10)
            m.width.equalTo(20)
            m.height.equalTo(10)
        })
        header.addSubview(headerLabel)
        headerLabel.snp.makeConstraints({ m in
            m.edges.equalTo(0)
        })
        headerLabel.text = "\rWhat is Lorem Ipsum?\r"
        let body: UIView = UIView.init()
        let bodyLabel: UILabel = UILabel.init()
        body.addSubview(bodyLabel)
        bodyLabel.snp.makeConstraints({ m in
            m.edges.equalTo(0)
        })
        bodyLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        headerLabel.numberOfLines = 0
        bodyLabel.numberOfLines = 0
        
        let header2: UIView = UIView.init()
        let headerLabel2: UILabel = UILabel.init()
        
        let uiImageView2: UIImageView = UIImageView.init(image: #imageLiteral(resourceName: "arrowRightRed"))
        header2.addSubview(uiImageView2)
        uiImageView2.snp.makeConstraints({ m in
            m.top.equalTo(20)
            m.trailing.equalTo(-10)
            m.width.equalTo(20)
            m.height.equalTo(10)
        })
        
        
        header2.addSubview(headerLabel2)
        headerLabel2.snp.makeConstraints({ m in
            m.edges.equalTo(0)
        })
        headerLabel2.text = "\rWhy do we use it?\r"
        let body2: UIView = UIView.init()
        let bodyLabel2: UILabel = UILabel.init()
        body2.addSubview(bodyLabel2)
        bodyLabel2.snp.makeConstraints({ m in
            m.edges.equalTo(0)
        })
        bodyLabel2.text = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
        
        
        
        let header3: UIView = UIView.init()
        let headerLabel3: UILabel = UILabel.init()
        header3.addSubview(headerLabel3)
        
        
        let uiImageView3: UIImageView = UIImageView.init(image: #imageLiteral(resourceName: "arrowRightRed"))
        header3.addSubview(uiImageView3)
        uiImageView3.snp.makeConstraints({ m in
            m.top.equalTo(20)
            m.trailing.equalTo(-10)
            m.width.equalTo(20)
            m.height.equalTo(10)
        })
        
        
        headerLabel3.snp.makeConstraints({ m in
            m.edges.equalTo(0)
        })
        headerLabel3.text = "\rWhere does it come from?\r"
        let body3: UIView = UIView.init()
        let bodyLabel3: UILabel = UILabel.init()
        body3.addSubview(bodyLabel3)
        bodyLabel3.snp.makeConstraints({ m in
            m.edges.equalTo(0)
        })
        bodyLabel3.text = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.\rThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."
        
        
        let header4: UIView = UIView.init()
        let headerLabel4: UILabel = UILabel.init()
        
        
        
        let uiImageView4: UIImageView = UIImageView.init(image: #imageLiteral(resourceName: "arrowRightRed"))
        header4.addSubview(uiImageView4)
        uiImageView4.snp.makeConstraints({ m in
            m.top.equalTo(20)
            m.trailing.equalTo(-10)
            m.width.equalTo(20)
            m.height.equalTo(10)
        })
        
        
        header4.addSubview(headerLabel4)
        headerLabel4.snp.makeConstraints({ m in
            m.edges.equalTo(0)
        })
        headerLabel4.text = "\rWhere can I get some?\r"
        let body4: UIView = UIView.init()
        let bodyLabel4: UILabel = UILabel.init()
        body4.addSubview(bodyLabel4)
        bodyLabel4.snp.makeConstraints({ m in
            m.edges.equalTo(0)
        })
        bodyLabel4.text = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
        
        headerLabel2.numberOfLines = 0
        bodyLabel2.numberOfLines = 0
        headerLabel3.numberOfLines = 0
        bodyLabel3.numberOfLines = 0
        headerLabel4.numberOfLines = 0
        bodyLabel4.numberOfLines = 0
        header.backgroundColor = UIColor.orange
        header2.backgroundColor = UIColor.cyan
        header3.backgroundColor = UIColor.lightGray
        header4.backgroundColor = UIColor.gray
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
        // Do any additional setup after loading the view, typically from a nib.
  
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}




extension UIView {
    func rotateView() {
        self.transform = self.transform.rotated(by: .pi)
    }
}

