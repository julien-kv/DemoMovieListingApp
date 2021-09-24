//
//  ViewController.swift
//  DemoMovieListingApp
//
//  Created by Julien on 23/09/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var FirstButton: UIButton!
    @IBOutlet var SecondButton: UIButton!
    @IBOutlet var ThirdButton: UIButton!
    
    func navigateToFirstPage(){
        let storyboard = UIStoryboard(name: "Page1", bundle: nil)
        let vc=storyboard.instantiateViewController(identifier: "page1") as! Page1ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    func navigateToSecondPage(){
        let storyboard = UIStoryboard(name: "Page2", bundle: nil)
        let vc=storyboard.instantiateViewController(identifier: "page2") as! Page2ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    func navigateToThirdPage(){
        let storyboard = UIStoryboard(name: "Page3", bundle: nil)
        let vc=storyboard.instantiateViewController(identifier: "page3") as! Page3ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if sender.tag==1 {
            navigateToFirstPage()
        }
        if sender.tag==2 {
            navigateToSecondPage()
        }
        if sender.tag==3 {
            navigateToThirdPage()
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Do any additional setup after loading the view.
    }


}

