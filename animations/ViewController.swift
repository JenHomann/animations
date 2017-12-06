//
//  ViewController.swift
//  animations
//
//  Created by Jen Homann on 12/6/17.
//  Copyright © 2017 Jen Homann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var button: UIButton!
    var counter = 1
    var isAnimating = false
    var timer = Timer()
    
    @objc func animate() {
        var counterString = "\(counter)"
        
        if counter < 10 {
            counterString = "0\(counter)"
        }
        
        image.image = UIImage(named: "frame_\(counterString)_delay-0.1s.gif")
        counter+=1
        
        if counter == 38 {
            counter = 0
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        if isAnimating {
            isAnimating = false
            timer.invalidate()
            button.setTitle("Start Animation", for: [])
        } else {
            isAnimating = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            button.setTitle("Stop Animation", for: [])
        }
    }
    
    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
    
    @IBAction func slideIn(_ sender: Any) {
        let currentCenter = image.center
        image.center = CGPoint(x: currentCenter.x - 500, y: currentCenter.y)
        UIView.animate(withDuration: 2, animations: {
            self.image.center = CGPoint(x: currentCenter.x, y: currentCenter.y)
        })
    }
    
    @IBAction func grow(_ sender: Any) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1) {
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

