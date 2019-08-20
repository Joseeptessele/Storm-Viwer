//
//  ViewController.swift
//  StormViwer
//
//  Created by José Eduardo Pedron Tessele on 19/08/19.
//  Copyright © 2019 José P Tessele. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm viwer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        var pictureNumbers = [Int]()
        var numberOfPicture: Int = 0
        let pattern = "[^0-9]"
        var picturesAux = [String]()

        for item in items {
            // is a picture
            if item.hasPrefix("nssl"){
                numberOfPicture = Int(item.replacingOccurrences(of: pattern, with: "", options: [.regularExpression]))!
                picturesAux.append(item)
                pictureNumbers.append(numberOfPicture)
            }
        }
        // sort the numbers
        pictureNumbers.sort()
        //  now is time to compare values on pictureNumbers and picturesAux arrays
        //  to add picturesAux value to pictures array
            for i in 0..<pictureNumbers.count {
                let aux = pictureNumbers[i]
                for j in 0..<picturesAux.count {
                    // example: if 'nssl0033.jpg' contain 33 add this element to pictures arr
                    // as the pictureNumbers is already sorted the first time the number is found it will be added to pictures so it will be sorted too
                    if picturesAux[j].contains(String(aux)) {
                       pictures.append(picturesAux[j])
                    }
                }
            }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            vc.detailViewControllerTitle = "Image \(indexPath.row + 1) of \(pictures.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

