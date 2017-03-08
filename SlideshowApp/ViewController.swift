//
//  ViewController.swift
//  SlideshowApp
//
//  Created by ぽんじゅうす on 2017/03/05.
//  Copyright © 2017年 asa10yoru. All rights reserved.
//

import UIKit




class ViewController: UIViewController {


    
    @IBAction func startButton(sender: AnyObject) {

        
    }
    
//    @IBOutlet weak var startButton: UIButton!
    
//    @IBAction func startButton(sender: UIButton) {
 //       startButton.setTitle("停止", forState: UIControlState.Normal)
        
        
//    }
    
//    @IBOutlet weak var startButton: UIButton!

    @IBOutlet weak var imageView: UIImageView!
    

    
//    @IBAction func startButton(sender: UIButton) {
 //       myButton.setTitle("停止", forState: UIControlState.Normal)
//
//    }
    
    
//    @IBAction func startButton(sender: AnyObject) {
        

  //  }
    
  
    @IBAction func onPrev(sender: AnyObject) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func onNext(sender: AnyObject) {
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "img1",
            "img2",
            "img3"
            ]
        // 画像の番号が正常な範囲を指しているかチェック
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "img1")
        imageView.image = image
        
//        startButton.setTitle("再生", forState: UIControlState.Normal)
//        startButton.setTitle("停止", forState: UIControlState.Highlighted)
//        startButton.addTarget(self, action: #selector(ViewController.buttonTapped(sender:)), for: .touchUpInside)
        
        //startButton.enabled = false


        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController = segue.destinationViewController as! ResultViewController
  //      let image = UIImage(named: "img1")
        resultViewController.resultViewImage = "img1"
  //      resultViewController.myName = myText.text
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }

}

