//
//  ImageSegmetationViewController.swift
//  Colorize
//
//  Created by aymane hachcham on 4/28/21.
//

import UIKit
import Alamofire

class ImageSegmentationViewController: UIViewController {
    
    var inputImage: UIImage? = nil
    
    lazy var selectedImage: UIImageView = {
      
        var selectedImage = UIImageView()
        selectedImage.translatesAutoresizingMaskIntoConstraints = false
        selectedImage.clipsToBounds = false
        selectedImage.image = inputImage
        
        return selectedImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(selectedImage)
        initConstraints()
    }
    
    fileprivate func initConstraints(){
        
        NSLayoutConstraint.activate([
            
            selectedImage.heightAnchor.constraint(equalToConstant: 200),
            selectedImage.widthAnchor.constraint(equalToConstant: 200),
            selectedImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectedImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func segmentationApiCall(){
        
        
    }
}


