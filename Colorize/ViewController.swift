//
//  ViewController.swift
//  Colorize
//
//  Created by aymane hachcham on 4/22/21.
//

import UIKit

class MainViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let screenSize = UIScreen.main.bounds
    
    lazy var openCamera: ColorizeButton = {
        
        var button = ColorizeButton(title: "Open Camera", backColor: .cyan, iconName: "camera")
        button.addTarget(self, action: #selector(handleCameraOpening), for: .touchUpInside)
        return button
    }()
    
    lazy var openGalerie: ColorizeButton = {
        
        var button = ColorizeButton(title: "Open Galerie", backColor: .cyan, iconName: "galerie")
        button.addTarget(self, action: #selector(handleGalerieOpening), for: .touchUpInside)
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
            
        setLayout()
        initConstraints()
    }
    
    fileprivate func setLayout(){
        view.addSubview(openCamera)
        view.addSubview(openGalerie)
    }
    
    fileprivate func initConstraints(){
        
        NSLayoutConstraint.activate([
            openCamera.heightAnchor.constraint(equalToConstant: screenSize.height/14),
            openCamera.widthAnchor.constraint(equalToConstant: screenSize.width*5/6),
            openCamera.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openCamera.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            
            openGalerie.heightAnchor.constraint(equalToConstant: screenSize.height/14),
            openGalerie.widthAnchor.constraint(equalToConstant: screenSize.width*5/6),
            openGalerie.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openGalerie.topAnchor.constraint(equalTo: openCamera.bottomAnchor, constant: 20),
        ])
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            let segmentationController = ImageSegmentationViewController()
            segmentationController.inputImage = image
            dismiss(animated: true, completion: nil)
            self.present(segmentationController, animated: true, completion: nil)
        }
    }
    
    @objc func handleCameraOpening(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: {() -> Void in print("Yes")})
        }
    }
    
    @objc func handleGalerieOpening(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: {() -> Void in print("Yes")})
            
        }
    }

}

