//
//  SecondViewController.swift
//  22_01_24_WebservicesDemoNestedJSON
//
//  Created by Vishal Jagtap on 13/03/24.
//

import UIKit
import Kingfisher

//MARK : binding image with image view using kingfisher
class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://robohash.org/Terry.png?set=set4")
        imageView.kf.setImage(with:url)
    }
}
