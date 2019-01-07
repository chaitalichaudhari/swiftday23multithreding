//
//  SecondViewController.swift
//  swiftday23multithreding
//
//  Created by Felix ITs 03 on 24/12/18.
//  Copyright © 2018 chaitali. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidAppear(_ animated:Bool)
    {
        let queue2=DispatchQueue(label: "com.Felix.queue2", qos: .userInitiated, attributes: .concurrent, autoreleaseFrequency: .inherit, target:DispatchQueue.global())
        let queue1=DispatchQueue(label: "com.Felix.queue1", qos: .userInitiated, attributes:.concurrent, autoreleaseFrequency: .inherit, target:DispatchQueue.global())
        
        queue1.async {
            
            for i in 1...10
            {
            print("\(i)👑")
           }
            self.downLoadFromWeb1()
        
    }
    queue2.async
    {
    for i in 11...20
    {
    print("\(i)⛑")
    
    }
        self.downLoadFromWeb2()
    }
    }
    func downLoadFromWeb1()
    {
        let str = "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
        let url=URL(string: str)!
        let session=URLSession(configuration: .default)
        let dataTask=session.dataTask(with: url)
        {
            (data,response,error)in
            if(data != nil)
            {
                print("Operation1 working...")
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageview1.image=image
                    print("Operation1 finished...")
                    
                }
            }
        }
        dataTask.resume()
    }
    func downLoadFromWeb2()
    {
        let str = "https://images.pexels.com/photos/133472/pexels-photo-133472.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
        let url=URL(string: str)!
        let session=URLSession(configuration: .default)
        let dataTask=session.dataTask(with: url)
        {
            (data,response,error)in
            if(data != nil)
            {
                print("Operation2 working...")
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageview2.image=image
                    print("Operation2 finished...")
                    
                }
            }
        }
        dataTask.resume()
    }

    @IBAction func Downloadbutton(_ sender: UIButton) {
        
        
        
        
        
        
    }
    @IBOutlet weak var imageview2: UIImageView!
    @IBOutlet weak var imageview1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

