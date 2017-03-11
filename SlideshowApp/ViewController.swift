//
//  ViewController.swift
//  SlideshowApp
//
//  Created by ぽんじゅうす on 2017/03/05.
//  Copyright © 2017年 asa10yoru. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var timer : NSTimer!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var onNext: UIButton!
    @IBOutlet weak var onPrev: UIButton!
    
    @IBAction func startButton(sender: AnyObject) {
        startButton.setTitle("停止", forState: UIControlState.Normal)
        onPrev.enabled = false   // ボタン無効化
        onNext.enabled = false
        
        if self.timer == nil {
            self.timer = NSTimer.scheduledTimerWithTimeInterval( 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        else {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            startButton.setTitle("再生", forState: UIControlState.Normal)
            onPrev.enabled = true   // ボタン有効化
            onNext.enabled = true
        }
    }
    
    func updateTimer(timer: NSTimer) {
        
        // 画像の番号を１つ増やす
        dispImageNo += 1
        // 画像の番号が正常な範囲を指しているかチェック
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
    
    @IBAction func toumeiButton(sender: AnyObject) {
        if self.timer == nil {
            self.timer = NSTimer.scheduledTimerWithTimeInterval( 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        else {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            startButton.setTitle("再生", forState: UIControlState.Normal)
            onPrev.enabled = true   // ボタン有効化
            onNext.enabled = true
        }
    }
    
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
 
    // 画像の名前の配列
    let imageNameArray = [
        "img1",
        "img2",
        "img3"
    ]
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {

        // 画像の番号が正常な範囲を指しているかチェック
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

        // 起動時の画像を設定
        let image = UIImage(named: "img1")
        imageView.image = image

        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultViewController = segue.destinationViewController as! ResultViewController
        resultViewController.resultViewImage = imageNameArray[dispImageNo]

    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }

}

