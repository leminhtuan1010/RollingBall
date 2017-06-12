//
//  ViewController.swift
//  VeBongLan
//
//  Created by Minh Tuan on 5/25/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    var bong = UIImageView()
    var radians = CGFloat()
    var bongRadians = CGFloat()
    var quayBong:CGFloat = 0.1
    var mainViewSize = CGSize()
    var bien: Bool = true
    var gocBong:CGFloat = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        veBong()
        let time = Timer.scheduledTimer(timeInterval: 0.02,target: self, selector: #selector(chayBong), userInfo: nil, repeats: true)
       
 
    }
    

    func veBong(){
        mainViewSize = self.view.bounds.size
        bong = UIImageView(image: UIImage(named: "ball.png"))
        bongRadians = 32.0
        bong.center = CGPoint(x: bongRadians, y: mainViewSize.height * 0.5)
        self.view.addSubview(bong)
    }
    func chayXuoi(){
        quayBong = 0.1
        radians = radians + quayBong
        // rotation : hàm xoay tròn
        bong.transform = CGAffineTransform(rotationAngle: radians)
        bong.center = CGPoint(x: bong.center.x + bongRadians * quayBong,y: bong.center.y + bongRadians * quayBong * gocBong)
        if (bong.center.x > mainViewSize.width - bongRadians){
            quayBong = -0.1
            bien = false
        }
    }
    func chayNguoc() {
        quayBong = -0.1
        radians = radians + quayBong
        bong.transform = CGAffineTransform(rotationAngle: radians)
        bong.center = CGPoint(x: bong.center.x + bongRadians * quayBong,y: bong.center.y - bongRadians * quayBong * gocBong)
        if (bong.center.x < bongRadians){
            quayBong = 0.1
            bien = true
        }
    }
    func chayBong() {
        if (bien == true){
            chayXuoi()
            chiaGoc()
        }else{
            chayNguoc()
            chiaGoc()
        }
    }
    func randomGoc() -> CGFloat{
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    }
    func chiaGoc(){
        
        let goc = randomGoc()
        
        if (bong.center.y > mainViewSize.height - bongRadians) {
            gocBong = -4 * goc
            
        }else if (bong.center.y < bongRadians){
            gocBong = 4 * goc
        }
       
    }
    
   
 }

