//
//  ViewController.swift
//  SwiftUITestExample
//
//  Created by Umut ŞERİFLER on 27.03.2018.
//  Copyright © 2018 Umut ŞERİFLER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDelegate {

    @IBOutlet weak var _pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSwipeWithDirections()
        _pageControl.numberOfPages = 5
        _pageControl.backgroundColor = UIColor.blue
        _pageControl.addTarget(self, action: #selector(self.valueChanged), for: UIControlEvents.valueChanged)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //The @objc attribute makes your Swift API available in Objective-C and the Objective-C runtime.
    @objc func valueChanged() {
        if ((_pageControl.currentPage % 2) == 0) {
            _pageControl.backgroundColor = UIColor.blue
        } else {
            _pageControl.backgroundColor = UIColor.red
        }
        print("YEEAAHHH You did it.")
    }
    
    func setSwipeWithDirections(){
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(gesture:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(gesture:)))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    
    //The @objc attribute makes your Swift API available in Objective-C and the Objective-C runtime.
    @objc func swiped(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
                
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped Right")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped Left")
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped Up")
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped Down")
                
            default:
                break
            }
        }
    }
    
    
}

