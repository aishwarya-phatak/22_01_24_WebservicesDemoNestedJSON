//
//  ViewController.swift
//  22_01_24_WebservicesDemoNestedJSON
//
//  Created by Vishal Jagtap on 13/03/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    var url : URL?
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    var products : [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
    }
    
    func parseJSON(){
        url = URL(string: "https://fakestoreapi.com/products")
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = "GET"
        
        urlSession = URLSession(configuration: .default)
        let dataTask = urlSession?.dataTask(with: urlRequest!){
            data, response, error in
            
            let jsonResponse = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]            //[Product]
            
            for eachProduct in jsonResponse{
                let eachProductId = eachProduct["id"] as! Int
                let eachProductTitle = eachProduct["title"] as! String
                let eachProductPrice = eachProduct["price"] as! Double
                let eachProductDescription = eachProduct["description"] as! String
                let eachProductCategory = eachProduct["category"] as! String
                let eachProductImage = eachProduct["image"] as! String
                let eachProductRating = eachProduct["rating"] as! [String:Any]
                
                //imp
                let eachProductRate = eachProductRating["rate"] as! Double
                let eachProductCount = eachProductRating["count"] as! Int
                
                let newRating = Rating(
                    rate: eachProductRate,
                    count: eachProductCount)
                
                let newProduct = Product(
                    id: eachProductId,
                    title: eachProductTitle,
                    price: eachProductPrice,
                    description: eachProductDescription,
                    category: eachProductCategory,
                    image: eachProductImage,
                    rating: newRating)
                
                self.products.append(newProduct)
                print(self.products)
            }
        }
        dataTask!.resume()
    }

}

