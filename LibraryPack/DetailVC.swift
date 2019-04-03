//
//  DetailVC.swift
//  LibraryPack
//
//  Created by Anish Kumar on 8/29/18.
//  Copyright  © 2018 Akamai. All rights reserved.
//

import UIKit
import PINRemoteImage
import SDWebImage
import Kingfisher
import Alamofire
import AlamofireImage
import AFNetworking

class DetailVC: UIViewController, URLSessionDelegate, URLSessionDataDelegate, URLSessionTaskDelegate {

    var selectedType = Int()
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var libraryImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tell config to use Mobile Accelerator
        let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
        VocServiceFactory.setupSessionConfiguration(sessionConfig)
        
        switch selectedType
        {
        case 0  : //PINRemoteImage
                self.libraryImageView.pin_setImage(from: URL(string: "https://rawcdn.githack.com/anishpandey/PrePosition/dbac6d30ccab0b88cf8f6aaeeeb4a7d71c66700b/Images/BB2.jpg"))
            
        case 1  : //SDWeb
                SDWebImageDownloader.shared() .createNewSession(with: sessionConfig)
                self.libraryImageView.sd_setImage(with: URL(string: "https://rawcdn.githack.com/anishpandey/PrePosition/dbac6d30ccab0b88cf8f6aaeeeb4a7d71c66700b/Images/BB1.jpg"), placeholderImage: UIImage(named: "placeholder"))
            
        case 2  : //Kingfisher
            let downloader = ImageDownloader(name: "KFDownloader")
            downloader.sessionConfiguration  = sessionConfig
            self.libraryImageView.kf.setImage(with: URL(string: "https://rawcdn.githack.com/anishpandey/PrePosition/dbac6d30ccab0b88cf8f6aaeeeb4a7d71c66700b/Images/Cindrella1.jpg"), options: [.downloader(downloader)])
            
        case 3://Alamofire for API
            let apiURL = URL(string:  "https://cdn.rawgit.com/anishpandey/SampleApp/master/largeJSON.json")!
            let sessionManager = Alamofire.SessionManager(configuration: sessionConfig)
            _ = sessionManager.request(apiURL, method: .get).responseJSON
                {
                    response in
                    let _ = sessionManager// retain
                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                        print("Data: \(utf8Text)")
                        self.textView.text = utf8Text
                    }
            }
            debugPrint(request)
            
        case 4  : //Alamofire Image
            let imageDownloader = ImageDownloader(
                configuration: sessionConfig,    //add MAP session config to the downloader
                downloadPrioritization: .fifo,
                maximumActiveDownloads: 4,
                imageCache: AutoPurgingImageCache()
            )
            let imageURL = URL(string: "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/cc_iStock-478639870_16x9.jpg")!
            let imageURLRequest = URLRequest(url: imageURL)
            imageDownloader.download(imageURLRequest) { response in
                
                //Make sure to keep a strong reference to the ImageDownloader instance, otherwise the completion closure will not be called because the downloader reference will go out of scope before the completion closure can be called.
                let _ = imageDownloader //retain
                var img = UIImage()
                if response.result.value != nil {
                    img = response.result.value!
                    self.libraryImageView.image = img
                }
            }
            
        case 5://AFNETWORKING
            let manager: AFURLSessionManager = AFURLSessionManager.init(sessionConfiguration: sessionConfig)
            let uRLRequest = URLRequest(url: URL(string: "https://gnews.io/api/v2/?q=india&token=4def75e1e153968b4e66b8ab020146af")!)
            
            let task2 = manager.dataTask(with: uRLRequest, uploadProgress: { (Progress)
                in
                
            }, downloadProgress: { (Progress) in
                
            }, completionHandler: { ( data, response, error) in
               print(response ?? "")
            })
            task2.resume()
            
        default :
            print( "default case")
        }
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
