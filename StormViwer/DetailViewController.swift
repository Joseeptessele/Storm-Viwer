//
//  DetailViewController.swift
//  StormViwer
//
//  Created by José Eduardo Pedron Tessele on 19/08/19.
//  Copyright © 2019 José P Tessele. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var detailViewControllerTitle: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detailViewControllerTitle = detailViewControllerTitle {
            title = detailViewControllerTitle
        }
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.hidesBarsOnTap = false
    }
}
