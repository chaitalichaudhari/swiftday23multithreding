//
//  FirstViewController.swift
//  swiftday23multithreding
//
//  Created by Felix ITs 03 on 24/12/18.
//  Copyright © 2018 chaitali. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBAction func downloadbutton(_ sender: UIButton) {
        let thread=Thread(target: self, selector: #selector(downLoadFromWeb), object: nil)
    thread.start()
    }
    @objc
    func downLoadFromWeb()
    {
        let str =  "https://images.pexels.com/photos/87469/rose-blossom-bloom-red-rose-87469.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
        let url = URL(string: str)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url!){
            (data,response,error) in
            if(data != nil)
            {
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageview1.image=image
                }
            }
        }
        dataTask.resume()
    }
    
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

