//
//  thirdViewController.swift
//  swiftday23multithreding
//
//  Created by Felix ITs 03 on 24/12/18.
//  Copyright © 2018 chaitali. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {
    var operationQueue:OperationQueue=OperationQueue()
    
    @IBOutlet weak var activity2: UIActivityIndicatorView!
    @IBOutlet weak var activity1: UIActivityIndicatorView!
    
    
    @IBOutlet weak var imageview3: UIImageView!
    
    @IBOutlet weak var imageview4: UIImageView!
    
    @IBAction func showingbutton(_ sender: UIButton) {
        let blockOperation1=BlockOperation
        {
            self.downLoadFromWeb1()
        }
        let blockOperation2=BlockOperation
        {
            self.downLoadFromWeb2()
        }
        operationQueue.addOperation(blockOperation1)
        operationQueue.addOperation(blockOperation2)
        blockOperation1.queuePriority = .low
        blockOperation2.queuePriority = .high
    }
    
    func downLoadFromWeb1()
    {
        let str="https://images.pexels.com/photos/256355/pexels-photo-256355.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
        let url = URL(string: str)
        let session=URLSession(configuration:.default)
        let dataTask=session.dataTask(with:url!)
        {
            (data,response,error) in
            if(data != nil)
            {
                self.activity1.startAnimating()
                //print("Operation1 working...")
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageview3.image=image
                    self.activity1.stopAnimating()
                    //print("Operation1 finished...")
                }
                
                
            }
        }
        dataTask.resume()
    }
    func downLoadFromWeb2()
    {
        let str="https://images.pexels.com/photos/53369/flower-red-lein-blossom-bloom-53369.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
       let url = URL(string: str)
        let session=URLSession(configuration: .default)
        let dataTask=session.dataTask(with:url!)
        {
            (data,response,error) in
            if(data != nil)
            {
                self.activity2.startAnimating()
                //print("Operation2 working...")
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageview4.image=image
                    self.activity2.stopAnimating()
                    //print("Operation2 finished...")
                }
                
                
            }
        }
        dataTask.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
