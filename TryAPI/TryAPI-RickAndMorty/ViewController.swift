//
//  ViewController.swift
//  TryAPI-RickAndMorty
//
//  Created by Noura Alahmadi on 09/04/1443 AH.
//

import UIKit

class InfoRespon : Codable{
    var  payloads : [Info] = []
}
struct Info : Codable{
    var file_type : String
    var file_size : String
}
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        getCharecters()
    }

    func getCharecters(){
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "urlhaus-api.abuse.ch"
        urlComponents.path = "/v1/payloads/recent/limit/3/"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        
        let urlsseion = URLSession.shared
        
        let task = urlsseion.dataTask(with: urlRequest) { (data : Data?, respon : URLResponse?, error : Error?) in
//            print(String(data: data!, encoding: .utf8))
            

            do {
                let jsonDecoder = JSONDecoder()
                let result = try jsonDecoder.decode(InfoRespon.self, from: data!)
                print(result.payloads)
            } catch {
                print(error)
            }//catch

        }.resume()
        
    }//func grtCharecters

}//class

