//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by ぽんじゅうす on 2017/03/09.
//  Copyright © 2017年 asa10yoru. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
//    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var resuViewLabel: UILabel!
    @IBOutlet weak var img2: UIImageView!
    
    var resultViewImage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resuViewLabel.text = resultViewImage
//        let image = UIImage(named: resultViewImage)
 //       let image = UIImage(named: "img1")
  //      imageView.img2 = image
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
